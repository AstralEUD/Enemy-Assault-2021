_liftObject = _this select 0;
_spawnmark = _this select 1;
_airtype = _this select 2;
_flyheight = _this select 3;
_p = _this select 4;//player that called it
_dest = _this select 5;//designated destination

_liftobj_name = (configFile >> "cfgVehicles" >> (typeof _liftObject) >> "displayName") call bis_fnc_getcfgdata;

_airliftgrp = createGroup (side _p);

private ["_pos"];
_pos = getposatl _liftObject;
if (surfaceiswater _pos) then {
_pos = getposasl _liftObject;
};
_dir = [_spawnmark, _pos] call BIS_fnc_dirTo;

//airlift helicopter
_air1_array = [_spawnmark, _dir, _airtype, _airliftgrp] call BIS_fnc_spawnVehicle;
_air1 = _air1_array select 0;
_air1 setpos [getpos _air1 select 0, getpos _air1 select 1, _flyheight];
_air1 setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];
_air1 flyInHeight _flyheight;
_air1 lockDriver true;
_air1 lockCargo true;
{_air1 lockTurret [_x, true];} foreach allTurrets _air1;
	if (_air1 isKindOf "rhs_uh1h_base") then {
		[
			_air1,
			["us_army",1], 
			true
		] call BIS_fnc_initVehicle;
	};

	if !(_air1 canSlingLoad _liftObject) exitwith {
		_msg = format ["Cannot sling load %1", _liftobj_name];
		_msg remoteExec ["hint"];
		deletevehicle _air1;
		{if !(isnil "_x") then {deletevehicle _x;};} foreach units _airliftgrp;
		_airliftgrp deleteGroupWhenEmpty true;
		
		_p setVariable ["ghst_airlift", 0, true];
	};

_airliftgrp setBehaviour "CARELESS";

_wp = [_airliftgrp,_pos, 5, "HOOK", "CARELESS", "NORMAL", "WEDGE"] call ghst_fnc_createwaypoint;
_wp waypointAttachObject _liftObject;

_msg = format ["I am inbound to your location to sling load %1", _liftobj_name];
[_air1, _msg] remoteExec ["sideChat"];

_liftpad_mark = [_pos,"ColorGreen","Airlift Sling Load","mil_start"] call ghst_fnc_mark_point;
_liftpad_mark2 = [_dest,"ColorGreen","Airlift Sling Load Drop Off","mil_end"] call ghst_fnc_mark_point;

//tracking Marker
_trackname = format ["%1 Airlift", name _p];
[_air1, "colorBLUFOR", "b_air", _trackname, true, true] spawn ghst_fnc_tracker;

//_liftObjectmass = getMass _liftObject;
while { (alive _air1) and {canmove _air1} and {alive (driver _air1)} } do {
	
	//waituntil { ((_pos distance2D _air1 < 400) and ((getpos _air1) select 2 < 45)) };
	
	_liftObject disableCollisionWith _air1;
	//if (_liftObjectmass > 1000) then {_liftObject setMass 1000;};
	
	waituntil { (getSlingLoad _air1 == _liftObject) or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))}};
	if (!(alive _air1) or {!(canmove _air1)} or {!(alive (driver _air1))}) exitwith {};
	
	_air1 allowdamage false;
	[_liftObject, "ColorGrey", "mil_box", _liftobj_name, true, true] spawn ghst_fnc_tracker;
	_msg = format ["Sling loading %1", _liftobj_name];
	[_air1, _msg] remoteExec ["sideChat"];
	
	[_airliftgrp,_dest, 5, "UNHOOK", "CARELESS", "NORMAL", "WEDGE"] call ghst_fnc_createwaypoint;
	_air1 flyInHeight _flyheight;
	_msg = format ["Moving to Drop off %1", _liftobj_name];
	[_air1, _msg] remoteExec ["sideChat"];
	deletemarker _liftpad_mark;

	waituntil { (_dest distance2D _air1 < 100) and {!(getSlingLoad _air1 == _liftObject)} or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))}};
	if (!(alive _air1) or {!(canmove _air1)} or {!(alive (driver _air1))}) exitwith {};
	
	_air1 allowdamage true;
	
	_msg = format ["Dropped off %1", _liftobj_name];
	[_air1, _msg] remoteExec ["sideChat"];
	deletemarker _liftpad_mark2;
	
	sleep 5;

	detach _liftObject;
	//_liftObject setMass _liftObjectmass;

	_air1 domove _spawnmark;

	if true exitwith {};
};

	if (!(alive _air1) or {!(canmove _air1)} or {!(alive (driver _air1))}) then {
		_msg = "We lost our airlift helicopter.";
		[[WEST,"AirBase"], _msg] remoteExec ["sideChat"];
		detach _liftObject;
		//_liftObject setMass _liftObjectmass;
		deletemarker _liftpad_mark;
		deletemarker _liftpad_mark2;
	};

waituntil { (_spawnmark distance2D _air1 < 100) or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))}};

deletevehicle _air1;
{if !(isnil "_x") then {deletevehicle _x;};} foreach units _airliftgrp;
_airliftgrp deleteGroupWhenEmpty true;