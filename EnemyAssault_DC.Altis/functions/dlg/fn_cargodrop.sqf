/*
V1.4 script by: Ghost - Creates an aircraft and flys to point on map specified by left click and drops selected vehicle.
ghst_drop = [player,"spawnmarker",_airtype,[array of vehicles],300,30] spawn ghst_fnc_cargodrop;
*/
//if (!isserver) exitwith {};
private ["_airtype"];
#include "def_vehsel.hpp"

_host = _this select 0;
_spawnmark = _this select 1;
_airtype = _this select 2;// type of air to spawn i.e. "C130J_Cargo" or "I_Heli_Transport_02_F"
_cargolist = _this select 3;//list of available vehicles
_flyheight = _this select 4;
_delay = (_this select 5) * 60;// time before cargo drop support can be called again

_timedelay = (player getVariable "ghst_cargodrop");
if (Time < _timedelay) exitwith {hint format ["Cargo Drop will be available in %1",((_timedelay - Time) call ghst_fnc_timer)];};

//_cargolist = ghst_cargoiclelist2;
_PARAM_PlayerVehicles = "PARAM_PlayerVehicles" call BIS_fnc_getParamValue;

{if !(alive _x) then {//{if (!(alive _x) or (! canmove _x and count crew _x == 0)) then {
	deletevehicle _x;
	ghst_local_vehicles = ghst_local_vehicles - [_x];
};} foreach ghst_local_vehicles;

if (count ghst_local_vehicles == _PARAM_PlayerVehicles) exitwith {hint format ["You can only spawn %1 vehicles", _PARAM_PlayerVehicles];};

#ifndef VBS
 disableSerialization;
#endif

// fill dialog with vehicle names
createDialog "Selectvehicle";
sleep 0.1;
_ctrlList = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _cargolist)-1 do {
	_cargoicle = _cargolist select _i;
	lbAdd [DLG_VEH_LIST,format["%1",_cargoicle select 1]];
	lbSetPicture [DLG_VEH_LIST, _i, _cargoicle select 2];
	lbSetValue [DLG_VEH_LIST, _i, _i];
};
lbSort (findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST); 

// put the selection somewhat in the middle of the displayed listing
_index = -1;
_i=(_index -9) max 0;
lbSetCurSel [DLG_VEH_LIST, _i];
lbSetCurSel [DLG_VEH_LIST, _index];

// preview controls
_ctrlPic = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_PIC;
_ctrlName = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_NAME;
_ctrlDesc = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_DESC;

_cargoidx = lbValue [DLG_VEH_LIST, _index];
_lstidx = _index;
_lstpos = -1;
DLG_VEH_SELECTED = false;

		while {ctrlVisible DLG_VEH_LIST} do {
			_index = lbCurSel DLG_VEH_LIST;
			_posidx = _index;
		#ifdef VBS	
			if !(isNil "DLG_VEH_SEL") then {
				if (DLG_VEH_SEL select 3) then {
					_posidx = _ctrlList lbPosIndex [DLG_VEH_SEL select 1,DLG_VEH_SEL select 2];
				};
			};
		#endif	
			if (DLG_VEH_SELECTED) then {
				_cargoidx=lbValue [DLG_VEH_LIST, _index];
				closeDialog DLG_VEH_IDD;
			};
			if (_posidx == -1) then {
				_posidx = _index;
			};
			if (_lstpos != _posidx) then {
				_lbidx = lbValue [DLG_VEH_LIST, _posidx];
				_wDName = (_cargolist select _lbidx) select 1;
				_wPic = (_cargolist select _lbidx) select 2;
				_wDesc = (_cargolist select _lbidx) select 3;
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_cargosel=(_cargolist select _cargoidx) select 0;

if (isnil "ghst_vehsel") exitwith {player groupchat "Nothing Spawned";};
if (ghst_vehsel != "none" && DLG_VEH_SELECTED) then {
_cargo_name = (configFile >> "cfgVehicles" >> (_cargosel) >> "displayName") call bis_fnc_getcfgdata;

openMap true;

_host groupchat format ["Left click on the map where you want %1 drop", _cargo_name];

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "Air Drop Ready";
	};
_pos = [clickpos select 0, clickpos select 1, _flyheight];

sleep 1;

openMap false;

//ghst_dropcargo = false;

//hint format ["%1", _pos];

_airgrp = createGroup (side player);

_dir = _spawnmark getdir _pos;

_air_array = [_spawnmark, _dir, _airtype, _airgrp] call BIS_fnc_spawnVehicle;
_air = _air_array select 0;
_air setpos [getpos _air select 0, getpos _air select 1, _flyheight];
_air setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];

_air sidechat "I am inbound with cargo";

player setVariable ["ghst_cargodrop", Time + _delay];

_air flyinheight _flyheight;
_airgrp setbehaviour "CARELESS";

_wpdrop = _airgrp addWaypoint [_pos, 0];
//_wpdrop setWaypointStatements ["true", "ghst_dropcargo = true;"];
_wpdrop setWaypointSpeed "Normal";
_wpdrop setWaypointBehaviour "CARELESS";

//tracking Marker
_trackname = format ["%1 Cargo Drop", name player];
[_air, "ColorGreen", "mil_DOT",_trackname, true] spawn ghst_fnc_tracker;

// Delete the crew and planes once they hit the egress point.
_wphome = _airgrp addWaypoint [_spawnmark, 0];
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

//if (!(alive _air) or {!(canMove _air)} or {(time >= (_time_delay))}) then {player groupChat "Shit we lost air support";} else {
if (!(alive _air) or {!(canMove _air)}) then {player groupChat "Shit we lost air support";} else {

_dir = getdir _air;
_chute = createVehicle ["B_Parachute_02_F",[0,0,0], [], 0, "FLY"];
_chute setdir _dir;
_chute setpos [(getpos _air select 0) - 20 * sin(_dir),(getpos _air select 1) - 20 * cos(_dir),(getpos _air select 2) - 10];

_ghst_drop = createVehicle [_cargosel,position _chute, [], 0, "none"];
ghst_local_vehicles pushback _ghst_drop;
_ghst_drop attachTo [_chute,[0,0,0]];

	[_ghst_drop,_cargo_name,_chute] spawn { 
				private ["_cargo","_cargo_name","_smoke","_chute"];
				_cargo = _this select 0;
				_cargo_name = _this select 1;
				_chute = _this select 2;
				
				waituntil {(getposatl _cargo select 2) < 1 or isNull _chute}; 
				detach _cargo;
				_chute setVelocity [0,5,0];
				_cargo setvelocity [0,0,0];
				//_cargo setposatl [(getposatl _cargo select 0),(getposatl _cargo select 1) + 5,0.2];		
				[_cargo, "ColorGrey", "mil_DOT", _cargo_name] call ghst_fnc_tracker;
				//_smoke = "SmokeShellGreen" createVehicle (getPosatl _cargo);
			};

_air sidechat "Air drop complete heading home";

//_air domove _spawnmark;

};

_air setfuel 0.2;

//sleep 120;
waituntil {(_air distance2D _pos) >= 1500 or (_air distance2D _spawnmark) <= 500};

{deletevehicle _x} foreach crew _air;
deletevehicle _air;
sleep 20;
deletegroup _airgrp;

//sleep _delay;
};
/*
hint "Air Drop Ready";

player setVariable ["ghst_cargodrop", false];

if (true) exitwith {};
*/