/*
V2 By: Ghost - tells helicopter where to go and land
ghst_dest_transport = _air1 addAction ["<t size='1.5' shadow='2' color='#00FF00'>Helicopter Destination</t> <img size='3' color='#00ff00'", "call ghst_fnc_dest_transport", [mappos,_air1,_flyheight,_escortgrp,player], 5, false, true, "","alive _target"];
[_pos,_air1,_flyheight,_escortgrp,name _pname] remoteExec ["ghst_fnc_dest_transport",2];
*/
_pos = _this select 0;
_air1 = _this select 1;
_flyheight = _this select 2;
_escortgrp = _this select 3;
_pname = _this select 4;//player name that called it
_transportgrp = group _air1;

if (fuel _air1 < 0.25) exitwith {
	_msg = format ["%1 Transport Fuel low need to rtb", _pname];
	[_air1, _msg] remoteExec ["sideChat"];
};

//if (surfaceiswater _pos) exitwith {[_air1, "Cannot land in water"] remoteExec ["sideChat"];};

_lzpad = "Land_HelipadEmpty_F" createVehicle _pos;
_lzpad_mark = [_pos,"ColorGreen","Drop Off","mil_end"] call ghst_fnc_mark_point;

//_transportgrp setGroupOwner clientOwner;
//_escortgrp setGroupOwner clientOwner;

_transportgrp move _pos;
_escortgrp move [(_pos select 0) + 150, (_pos select 1) - 150, _flyheight + 100];

_air1 flyInHeight _flyheight;

_msg = format ["%1 Transport Moving to new location", _pname];
[_air1, _msg] remoteExec ["sideChat"];

waituntil { (_pos distance2D _air1 < 100) or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))}};

_air1 land "LAND";
//_air1 flyInHeight 0;

waituntil { ((getposatl _air1) select 2 < 1) or {(isTouchingGround _air1)} or {(unitReady _air1)} or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))} };	
_air1 flyInHeight 0;
_air1 setDamage 0;
deletevehicle _lzpad;
deletemarker _lzpad_mark;

	if (!(alive _air1) or {!(canmove _air1)} or {!(alive (driver _air1))}) then {
		_msg = format ["We lost %1 transport helicopter.", _pname];
		[[WEST,"AirBase"], _msg] remoteExec ["sideChat"];

		{if !(isnil "_x") then {deletevehicle _x;};} foreach units _transportgrp;
		{if !(isnil "_x") then {_x setfuel 0.2;};} foreach units _escortgrp;
		deletevehicle _air1;
		_transportgrp deleteGroupWhenEmpty true;
	} else {
		_air1 engineOn false;
		_air1 action ["WheelsBrakeOn", 1];
		_msg = format ["%1 Transport Awaiting orders", _pname];
		[_air1, _msg] remoteExec ["sideChat"];

	};