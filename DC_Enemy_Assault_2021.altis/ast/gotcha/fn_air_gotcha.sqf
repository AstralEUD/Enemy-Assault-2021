_airgrp = createGroup (side player);

_spawnmark = getMarkerPos "gotcha_spawn";

_airtype = "B_T_VTOL_01_vehicle_F";

_flyheight = 200;

_destiselect = selectRandom ["gotcha_lz1","gotcha_lz2","gotcha_lz3","gotcha_lz4","gotcha_lz5","gotcha_lz6"];
_destpos = getMarkerPos _destiselect;

_pos = [_destpos select 0, _destpos select 1, _flyheight];

_dir = _spawnmark getdir _pos;

_air_array = [_spawnmark, _dir, _airtype, _airgrp] call BIS_fnc_spawnVehicle;
_air = _air_array select 0;
_air setpos [getpos _air select 0, getpos _air select 1, _flyheight];
_air setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];

_air sidechat "GOTCHA cargo is inbound";

_air flyinheight _flyheight;
_airgrp setbehaviour "CARELESS";

_wpdrop = _airgrp addWaypoint [_pos, 0];
//[_airgrp, 1] setWaypointStatements ["true", "ghst_dropammo = true;"];
[_airgrp, 1] setWaypointSpeed "Normal";
[_airgrp, 1] setWaypointBehaviour "CARELESS";

// Delete the crew and planes once they hit the egress point.
_wphome = _airgrp addWaypoint [_spawnmark, 0];

//tracking Marker
_trackname = format ["%1 Gotcha drop", name player];
[_air, "colorBLUFOR", "b_support", _trackname, true] spawn ghst_fnc_tracker;
/*
_time_delay = time + 600;
While {(alive _air) and {canmove _air}} do {// and (_air distance _pos) > 50

	sleep 1;
	if ((_air distance2D _pos) < 100) exitwith {};
	//if (ghst_dropammo and ((_air distance _pos) < (_flyheight + 100))) exitwith {};
	if (time >= (_time_delay)) exitwith {};
};
*/
private _oldDist = _air distance2D _pos;

while {_oldDist >= _air distance2D _pos} do {
	_oldDist = _air distance2D _pos;
	sleep 0.1;
};

_crate = "B_supplyCrate_F";
_dir = getdir _air;
_chute = createVehicle ["B_Parachute_02_F",[0,0,0], [], 0, "FLY"];
_chute setdir _dir;
_chute setpos [(getpos _air select 0) - 20 * sin(_dir),(getpos _air select 1) - 20 * cos(_dir),(getpos _air select 2) - 10];

_ghst_drop = createVehicle [_crate,position _chute, [], 0, "none"];
_ghst_drop attachTo [_chute,[0,0,0]];

[_ghst_drop,"B_supplyCrate_F",_chute, player] spawn {
	private ["_crate","_crateammo","_chem","_crate_name","_smoke","_chute"];
	_crate = _this select 0;
	_crateammo = _this select 1;
	_chute = _this select 2;
	_player = _this select 3;
	_crate allowDamage false;
	
	waituntil {(getpos _crate select 2) < 2 or isNull _chute}; 
	detach _crate;
	_chute setVelocity [0,5,0];
	//_crate setPosATL [getPosATL _crate select 0,getPosATL _crate select 1,(getPosATL _crate select 2) + 0.2];
	_cratepos = getPosATL _crate;
	_crate setposatl _cratepos;
	_crate setVectorUP (surfaceNormal [_cratepos select 0,_cratepos select 1]);
	//_crate_name = "Ammo Box";//getText (configFile >> "cfgVehicles" >> (_droptype) >> "displayName");
	//[_crate, "ColorBlack", "mil_box", _crate_name] spawn ghst_fnc_tracker;
	//_VarName = "ghst_ammo" + str((count ghst_vehicles) + 1);
	//missionNamespace setVariable [_VarName,_crate];
	//ghst_vehicles pushBack _VarName;
	//_crate call ghst_fnc_magazines;
	_chem = createMine ["placed_chemlight_green", (position _crate), [], 0];
	sleep 3;
	_chem attachto [_crate,[0,0,0.1]];
	_smoke = "SmokeShellPurple" createVehicle (getPosatl _crate);
	[_crate,"갓챠 오픈!","\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa","\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa","_this distance _target <3", "_caller distance _target < 3", {}, {}, {
		params ["_target, _caller, _actionId", "_a0"];
		[_target, _caller, _actionId, _a0] call ast_fnc_open_gotcha;		
	},{}, [_player], 5, 0, false, false] call BIS_fnc_holdActionAdd;
	/*
	switch (_crateammo) do {
		case "mags": {_crate call ghst_fnc_mags;};
		//case "meds": {_crate call ghst_fnc_meds;};
		default {_crate call ghst_fnc_arsenal;};
	};*/
};

_air sidechat "Gotcha drop complete heading home";

//sleep 120;
waituntil {(_air distance2D _pos) >= 1500 or (_air distance2D _spawnmark) <= 500};

{deletevehicle _x} foreach crew _air;
deletevehicle _air;
sleep 5;
deletegroup _airgrp;
/*
sleep _delay;

hint "Ammo Drop Ready";

player setVariable ["ghst_ammodrop", false];

if (true) exitwith {};
*/