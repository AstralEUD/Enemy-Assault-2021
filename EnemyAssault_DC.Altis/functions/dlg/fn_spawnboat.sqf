/*
V2.2 Script by: Ghost (Original dialog from Kronzky) create a marker and name itand put this in the object initline - ghst_spawnveh = station1 addAction ["Spawn Vehicle", "spawn ghst_fnc_spawnboat", ["spawnmarker",dir], 6, true, true, "","alive _target"];
*/

#include "def_VEHsel.hpp"

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_paramarray = _this select 3;
_spawn = _paramarray select 0;
_dir = _paramarray select 1;
_spawn = getmarkerpos _spawn;
_check_radius = 10;//radius for vehicle spawn pad check and delete

if (not alive _host) exitwith {
hint "Vehicle Spawn Closed";

_host removeaction _id;
};

if (isnil "ghst_boatlist") exitwith {hint "Spawn list not ready yet";};
_vehiclelist = ghst_boatlist;
_PARAM_PlayerVehicles = "PARAM_PlayerVehicles" call BIS_fnc_getParamValue;

{if (count crew _x == 0) then {deletevehicle _x};} foreach (nearestObjects [_spawn, ["AllVehicles"], _check_radius]);
{deletevehicle _x;} foreach (nearestObjects [_spawn, ["Slingload_01_Base_F"], _check_radius]);
{deletevehicle _x;} foreach nearestObjects [_spawn,["CraterLong_small","CraterLong","WeaponHolder","GroundWeaponHolder"], _check_radius];

{if (!(alive _x) or (! canmove _x and count crew _x == 0)) then {
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

for "_i" from 0 to (count _vehicleList)-1 do {
	_vehicle = _vehicleList select _i;
	lbAdd [DLG_VEH_LIST,format["%1",_vehicle select 1]];
	lbSetPicture [DLG_VEH_LIST, _i, _vehicle select 2];
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

_VEHidx = lbValue [DLG_VEH_LIST, _index];
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
				_VEHidx=lbValue [DLG_VEH_LIST, _index];
				closeDialog DLG_VEH_IDD;
			};
			if (_posidx == -1) then {
				_posidx = _index;
			};
			if (_lstpos != _posidx) then {
				_lbidx = lbValue [DLG_VEH_LIST, _posidx];
				_wDName = (_vehicleList select _lbidx) select 1;
				_wPic = (_vehicleList select _lbidx) select 2;
				_wDesc = (_vehicleList select _lbidx) select 3;
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_VEHsel=(_vehicleList select _VEHidx) select 0;

	if (isnil "ghst_vehsel") exitwith {_caller groupchat "Nothing Spawned";};
	if (ghst_vehsel != "none" && DLG_VEH_SELECTED) then {
	_veh_name = getText (configFile >> "cfgVehicles" >> (_vehsel) >> "displayName");
	//_spawnpos = _spawn findEmptyPosition[ 2 , 10 , _vehsel ];
	//if (isnil "_spawnpos" or count _spawnpos < 2) exitwith {_caller groupchat "Spawn Pad not clear";};
	_padempty = nearestObjects [_spawn, ["LandVehicle","Air"], _check_radius];
	if (count _padempty > 0) exitwith {titleText "Spawn Pad not clear";};
	_veh1 = createVehicle [_vehsel,_spawn, [], 0, "NONE"];
	_veh1 setPosASL [_spawn select 0, _spawn select 1, 0];
	_veh1 setvelocity [0,0,0];
	ghst_local_vehicles pushback _veh1;
	
	_veh1 setdir _dir;
	//_veh1 addEventHandler ["killed", {_this execvm "scripts\ghst_vehdelete.sqf"}];
	[_veh1, "ColorGrey", "mil_DOT", _veh_name] spawn ghst_fnc_tracker;
	//cutText [Format ["%1 Spawned", _veh_name],"PLAIN",2];
	//hint format ["%1 Spawned", _veh_name];
	titleText [format ["%1 Spawned", _veh_name], "PLAIN DOWN"]; titleFadeOut 5;
} else {titleText ["Nothing Spawned", "PLAIN DOWN"];};