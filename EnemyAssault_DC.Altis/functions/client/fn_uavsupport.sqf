//V1.2 Script by: Ghost - calls in a support UAV until dead
//
private ["_spawnmark","_objselected","_alt","_delay","_veh_name","_dir","_pos","_air1_array","_air1","_wGrp"];
#include "..\dlg\def_VEHsel.hpp"
_spawnmark = _this select 0;// spawn point where uav spawns and deletes
_objselectlist = _this select 1;// type of uav to spawn i.e. ["B_UAV_02_F"]
_alt = _this select 2;// alt uav will fly
_delay = (_this select 3) * 60;// time before uav support can be called again

#ifndef VBS
 disableSerialization;
#endif

// fill dialog with vehicle names
createDialog "UseSelectedVehicle";
sleep 0.1;
_ctrlList = findDisplay DLG_USE_IDD displayCtrl DLG_USE_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _objselectList)-1 do {
	_objsel = _objselectlist select _i;
	_obj_name = (configFile >> "cfgVehicles" >> _objsel >> "displayName") call bis_fnc_getcfgdata;
	lbAdd [DLG_USE_LIST,format["%1",_obj_name]];
	lbSetValue [DLG_USE_LIST, _i, _i];
};
lbSort (findDisplay DLG_USE_IDD displayCtrl DLG_USE_LIST); 

// put the selection somewhat in the middle of the displayed listing
_index = -1;
_i=(_index -9) max 0;
lbSetCurSel [DLG_USE_LIST, _i];
lbSetCurSel [DLG_USE_LIST, _index];

_VEHidx = lbValue [DLG_USE_LIST, _index];
_lstidx = _index;
_lstpos = -1;
DLG_USE_SELECTED = false;

		while {ctrlVisible DLG_USE_LIST} do {
			_index = lbCurSel DLG_USE_LIST;
			_posidx = _index;
		#ifdef VBS	
			if !(isNil "DLG_VEH_USE_SEL") then {
				if (DLG_VEH_USE_SEL select 3) then {
					_posidx = _ctrlList lbPosIndex [DLG_VEH_USE_SEL select 1,DLG_VEH_USE_SEL select 2];
				};
			};
		#endif	
			if (DLG_USE_SELECTED) then {
				_VEHidx=lbValue [DLG_USE_LIST, _index];
				closeDialog DLG_USE_IDD;
			};
			if (_posidx == -1) then {
				_posidx = _index;
			};
			if (_lstpos != _posidx) then {
				_lbidx = lbValue [DLG_USE_LIST, _posidx];
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_objselected = (_objselectlist select _VEHidx);

if ((isnil "ghst_vehsel") or ! DLG_USE_SELECTED) exitwith {hint "Nothing Selected";};

_veh_name = (configFile >> "cfgVehicles" >> _objselected >> "displayName") call bis_fnc_getcfgdata;

_timedelay = (player getVariable "ghst_uavsup");
if (Time < _timedelay) exitwith {hint format ["%2 Support will be available in %1",((_timedelay - Time) call ghst_fnc_timer), _veh_name];};

openMap true;

hint format ["Left click on the map where you want the %1 to go or press escape to cancel", _veh_name];

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "UAV Support Ready";
	};
	
_pos = [clickpos select 0, clickpos select 1, _alt];

sleep 1;

openMap false;

_dir = _spawnmark getdir _pos;

_air1_array = [_spawnmark, _dir, _objselected, (side player)] call BIS_fnc_spawnVehicle;

_air1 = _air1_array select 0;
_wGrp = _air1_array select 2;

createVehicleCrew _air1;

if (surfaceIsWater _spawnmark) then {
	_air1 setPosASL [getPosASL _air1 select 0, getPosASL _air1 select 1, (getPosASL _air1 select 2) + _alt];
} else {
	_air1 setPosATL [getPosATL _air1 select 0, getPosATL _air1 select 1, (getPosATL _air1 select 2) + _alt];
};
_air1 setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];

player setVariable ["ghst_uavsup", Time + _delay];

sleep 1;

//connect player to uav
player connectTerminalToUav _air1;

_air1 flyinheight _alt;
_air1 setSpeedMode "Normal";
//set combat mode
//_wGrp setCombatMode "RED";

_air1 sidechat format ["%1 inbound", _veh_name];

_air1 doMove _pos;

/*
_wGrp addwaypoint [_pos, 300];
[_wGrp, 0] setWPPos _pos;
[_wGrp, 0] setWaypointType "LOITER";
*/
While {true} do {
if !(alive _air1) exitwith {player groupChat "Shit we lost UAV support";};
if (fuel _air1 < 0.2) then {_air1 sidechat "Fuel getting low. Need to refuel soon";};
sleep 10;
};

sleep 30;

{deletevehicle _x} foreach crew _air1;
deletevehicle _air1;

sleep 20;
deletegroup _wGrp;
/*
sleep _delay;

hint format ["%1 Support Ready", _veh_name];

player setVariable ["ghst_uavsup", false];

if (true) exitwith {};
*/