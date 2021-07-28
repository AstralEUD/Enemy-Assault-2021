//V1.2 Script by: Ghost - calls in a support UGV until dead
//
private ["_spawnmark","_objselected","_max_num","_delay","_veh_name","_dir","_pos","_chute1","_ugv1_array","_ugv1","_wGrp","_ugv_num"];
#include "..\dlg\def_VEHsel.hpp"
_spawnmark = _this select 0;// spawn point where ugv spawns
_objselectlist = _this select 1;// type of ugv to spawn i.e. ["B_UGV_01_rcws_F"]
_max_num = _this select 2;//max number of ugvs allowed per player
_delay = (_this select 3) * 60;// time before ugv support can be called again

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

_ugv_vararray = (player getVariable "ghst_ugvsup");
_ugv_num = _ugv_vararray select 0;
_ugv_delay = _ugv_vararray select 1;
if (_ugv_num == _max_num) exitwith {hint format ["%2 support at max number of %1", _max_num, _veh_name];};
if ((Time < _ugv_delay) and !(_ugv_num == _max_num)) exitwith {hint format ["%1 Support will be available in %2", _veh_name,((_ugv_delay - Time) call ghst_fnc_timer)];};

openMap true;

hint format ["Left click on the map where you want the %1 to go or press escape to cancel", _veh_name];

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "UGV Support Ready";
	};
	
_pos = clickpos;

sleep 1;

openMap false;

_dir = _spawnmark getdir _pos;

_chute1 = createVehicle ["B_Parachute_02_F",[0,0,0], [], 0, "FLY"];
_chute1 setpos [(_pos select 0), (_pos select 1), 150]; 

_ugv1_array = [_spawnmark, _dir, _objselected, (side player)] call BIS_fnc_spawnVehicle;

_ugv1 = _ugv1_array select 0;

createVehicleCrew _ugv1;

_wGrp = (group (crew _ugv1 select 0));

_ugv1 attachTo [_chute1,[0,0,1]];

_ugv_num = _ugv_num + 1;
if (_ugv_num == _max_num) then {
	player setVariable ["ghst_ugvsup", [_ugv_num, Time + _delay]];
} else {
	player setVariable ["ghst_ugvsup", [_ugv_num, 0]];
};

waituntil {(getposatl _ugv1 select 2) < 1.5}; 
detach _ugv1;
_ugv1 setPosATL [getPosATL _ugv1 select 0,getPosATL _ugv1 select 1,0];

//connect player to ugv
player connectTerminalToUav _ugv1;

_wGrp setBehaviour "COMBAT";
_wGrp setSpeedMode "Normal";
_wGrp setCombatMode "RED";

_ugv1 sidechat "UGV inbound";

_ugv1 doMove _pos;
/*
_wGrp addwaypoint [_pos, 300];
[_wGrp, 0] setWPPos _pos;
[_wGrp, 0] setWaypointType "LOITER";
*/
While {true} do {
if (!(alive _ugv1) or {!(canMove _ugv1)}) exitwith {player groupchat format ["Shit we lost %1 support. Another one will be available in %2 minutes", _veh_name, _delay / 60];};
if (fuel _ugv1 < 0.2) then {_ugv1 sidechat "Fuel getting low. Need to refuel soon";};
sleep 10;
};

sleep 30;

{deletevehicle _x} foreach crew _ugv1;
deletevehicle _ugv1;

sleep 20;
deletegroup _wGrp;

_ugv_vararray = (player getVariable "ghst_ugvsup");
_ugv_num = _ugv_vararray select 0;
_ugv_delay = _ugv_vararray select 1;
_ugv_num = _ugv_num - 1;
player setVariable ["ghst_ugvsup", [_ugv_num, _ugv_delay]];
/*
sleep _delay;

hint format ["%1 Support Ready", _veh_name];

_ugv_num = player getVariable "ghst_ugvsup";
_ugv_num = _ugv_num - 1;
player setVariable ["ghst_ugvsup", _ugv_num];

if (true) exitwith {};
*/