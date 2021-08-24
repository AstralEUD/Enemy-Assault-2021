/*
V3 Script by: Ghost - creates a dialog with list of infantry to choose from. Spawn AI are grouped to callers group
*/

#include "..\dlg\def_VEHsel.hpp"

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_vararray = _this select 3;
_spawn = _vararray select 0;
_Max_grpnum = _vararray select 1;

_grpnbr = count units _caller;
if (AST_kill_score < 5) exitWith {hint "Not enough minerals.";};
if (_grpnbr > _Max_grpnum) exitwith {_caller sidechat format ["%1 you cannot command %2 units, only %3 units", name _caller, _grpnbr, _Max_grpnum];};

_objselectlist = ghst_inflist;

#ifndef VBS
 disableSerialization;
#endif

// fill dialog with vehicle names
createDialog "UseSelectedVehicle";
sleep 0.1;
ctrlSetText [DLG_USE_BTN, "Spawn Infantry"];
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

_westgrp = group _caller;
AST_kill_score = AST_kill_score - 5;
[player, "kill_score", _tobe] remoteExecCall ["AST_fnc_db_save", 2, false];	
_man = _westgrp createUnit [_objselected,_spawn, [], 0, "NONE"];
_caller groupchat format ["%1 Spawned", _veh_name];
doStop _man;

sleep 1;
/*
for "_s" from 0 to (_VEHselqty)-1 do {
_westgrp = group _caller;
_man = _westgrp createUnit [_objselected,_spawn, [], 0, "NONE"];
//[_man] joinsilent _caller;
_caller groupchat format ["%1 Spawned", _veh_name];
sleep 1;
};
*/

if (true) Exitwith {};