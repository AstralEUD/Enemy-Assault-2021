/*
V2 By: Ghost - tells helicopter when to rtb
ghst_rtb_transport = _air1 addAction ["<t size='1.5' shadow='2' color='#00FFFF'>Helicopter RTB<</t> <img size='3' color='#00ff00'", "call ghst_fnc_rtb_transport", [_air1,_flyheight,_spawnmark,_escortgrp,[_air1,_air2,_air3],_pname], 5, false, true, "","alive _target"];
*/
_args = _this select 3;
_air1 = _args select 0;//transport helo
_flyheight = _args select 1;//fly height
_spawnmark = _args select 2;//spawning location
_escortgrp = _args select 3;//escort helo group
_heloarray = _args select 4;//helicopter array
_pname = _args select 5;//player name that called it
_transportgrp = group _air1;

_transportgrp move _spawnmark;
_escortgrp move [(_spawnmark select 0) + 150, (_spawnmark select 1) - 150, _flyheight + 100];
_air1 flyInHeight _flyheight;
_msg = format ["%1 Transport Returning to Base", _pname];
[_air1, _msg] remoteExec ["sideChat"];

waituntil { (_spawnmark distance2D _air1 < 100) or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))}};

_air1 land "LAND";

waituntil { (unitReady _air1) or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))}};	

_air1 flyInHeight 0;
_air1 setDamage 0;
	if (!(alive _air1) or {!(canmove _air1)} or {!(alive (driver _air1))}) then {
		_msg = format ["We lost %1 transport helicopter.", _pname];
		[[WEST,"AirBase"], _msg] remoteExec ["sideChat"];
	} else {
		_msg = format ["%1 Transport Helicopter at Base", _pname];
		[[WEST,"AirBase"], _msg] remoteExec ["sideChat"];
	};
/*	
	{
		unassignvehicle _x;
		_x action ["EJECT", _air1];
	} foreach ((crew _air1) select 4);
*/

sleep 5;

{if !(isnil "_x") then {deletevehicle _x;};} foreach units _transportgrp;
{if !(isnil "_x") then {deletevehicle _x;};} foreach units _escortgrp;
{if !(isnil "_x") then {deletevehicle _x;};} foreach _heloarray;
deletevehicle _air1;
_transportgrp deleteGroupWhenEmpty true;
_escortgrp deleteGroupWhenEmpty true;