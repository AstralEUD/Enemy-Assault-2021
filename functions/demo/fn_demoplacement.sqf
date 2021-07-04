//create specified charge on object
//Based off of NeoArmageddon At Mod, modified by: Ghost
//_satchel = ["SatchelCharge_Remote_Ammo_Scripted","SatchelCharge_Remote_Mag"] call ghst_fnc_bombplace;
//_c4 = ["DemoCharge_Remote_Ammo_Scripted","DemoCharge_Remote_Mag"] call ghst_fnc_bombplace;
private ["_explosive","_typecharge","_chargearray","_typemagazine","_expname","_obj","_unit","_curpos","_terrain","_stepsize","_range","_view_target","_eye_pos","_view_vec","_view_vec_length","_norm_view_vec","_steps","_i","_new_end_point","_objdir","_unitdir","_magcount","_dist","_trgt_name","_exppos"];
_chargearray = _this select 0;
	_typecharge = _chargearray select 0;
	_typemagazine = _chargearray select 1;
_expname = _this select 1;
_obj = cursorObject;//cursorTarget;
_unit = player;

_stepsize = 0.05;
_range = 3;
_view_target = ATLtoASL(screenToWorld [0.5,0.5]);
_eye_pos = eyePos _unit;

_view_vec = [(_view_target select 0) - (_eye_pos select 0),(_view_target select 1) - (_eye_pos select 1),(_view_target select 2) - (_eye_pos select 2)];
_view_vec_length = sqrt((_view_vec select 0)*(_view_vec select 0)+(_view_vec select 1)*(_view_vec select 1)+(_view_vec select 2)*(_view_vec select 2));
_norm_view_vec = [((_view_vec select 0) / _view_vec_length),((_view_vec select 1) / _view_vec_length),((_view_vec select 2) / _view_vec_length)];
_steps = _range/_stepsize;

_curpos = _eye_pos;
_terrain = false;
for[{_i=0},{_i<_steps},{_i=_i+1}] do {
	_new_end_point = [(_curpos select 0)+_stepsize*(_norm_view_vec select 0),(_curpos select 1)+_stepsize*(_norm_view_vec select 1),(_curpos select 2)+_stepsize*(_norm_view_vec select 2)];
	if(terrainIntersectASL[(_curpos),(_new_end_point)]) exitwith {_terrain = true;};
	if(lineIntersects[_curpos,_new_end_point,_unit]) exitwith {};
	_curpos = _new_end_point;
};

	if (surfaceIsWater getposasl _obj) then {
		_exppos = _unit modelToWorld [0,1.5,1.2];
		_explosive = createVehicle [_typecharge, _exppos , [], 0, "NONE"];
		_explosive attachTo [player,[-0.1,0.1,0.1],"lefthand"];
		//_explosive setVectorDirandUP [[0,0,1],[0,-1,0]];
		detach _explosive;
		_dist = (_unit distance2d _curpos);//2;
	} else {
		_curpos = ASLtoATL(_curpos);
		_explosive = createVehicle [_typecharge, _curpos, [], 0, "NONE"];
		_dist = (_unit distance2d _curpos);//2;
	};
	
if (!(_terrain) and (_dist <= _range)) then {
	_trgt_name = (configFile >> "cfgVehicles" >> (typeof _obj) >> "displayName") call bis_fnc_getcfgdata;
	if (isnil "_trgt_name") then {_trgt_name = "object";};
	_explosive attachto [_obj];
	hint format ["%1 placed on %2", _expname, _trgt_name];
	//_explosive setdir getdir _unit;
	//_explosive setVectorDir [0,1,0];
	//VectorDir _unit
	//Vectorup _obj
	_explosive setVectorDirandUP [VectorDir _unit,[0,0,0]];//[[0,0,1],[0,-1,0]];
	_magcount = {_x == _typemagazine} count magazines _unit;
	//diag_log format ["TEST %1 %2 Count %3", _unit, _typemagazine, _magcount];
	_unit removeMagazines _typemagazine;
	if (_magcount > 1) then {
		_unit addMagazines [_typemagazine, (_magcount - 1)];
	};
} else {
	deletevehicle _explosive;
	_explosive = objnull;
};
_explosive