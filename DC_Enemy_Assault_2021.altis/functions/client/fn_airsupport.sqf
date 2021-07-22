//V1.5 Script by: Ghost - calls in a support aircraft until fuel is low or out of ammo then leaves
//
private ["_spawnmark","_type","_tos","_radaltarray","_rad","_flyheight","_delay","_markunitsarray","_markunits","_mcolor","_supportvar","_veh_name","_dir","_pos","_chute1","_air1_array","_air1","_wGrp"];
#include "..\dlg\def_VEHsel.hpp"
_spawnmark = _this select 0;// spawn point where aircraft spawns and deletes
_objselectlist = _this select 1;// type of air array to spawn i.e. ["B_Heli_Attack_01_F","B_Plane_CAS_01_F"]
_tos = (_this select 2) * 60;// time on station
_radaltarray = _this select 3;// radius and altitude array
	_rad = _radaltarray select 0;// radius aircraft will search
	_flyheight = _radaltarray select 1;// altitude aircraft will fly
_delay = (_this select 4) * 60;// time before air support can be called again
_markunitsarray = _this select 5;//marks waypoints of aircraft
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
_supportvar = _this select 6;//variable in string format to check if support is available or not

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

_timedelay = (player getVariable _supportvar);
if (Time < _timedelay) exitwith {hint format ["%2 Support will be available in %1",((_timedelay - Time) call ghst_fnc_timer), _veh_name];};

openMap true;

hint format ["Left click on the map where you want the %1 to go or press escape to cancel", _veh_name];

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "Air Support Ready";
	};
	
_pos = [clickpos select 0, clickpos select 1, _flyheight];

sleep 1;

openMap false;

_wGrp = createGroup (side player);
_dir = _spawnmark getdir _pos;

_air1_array = [_spawnmark, _dir, _objselected, _wGrp] call BIS_fnc_spawnVehicle;
_air1 = _air1_array select 0;
_air1 setpos [getpos _air1 select 0, getpos _air1 select 1, _flyheight];
_air1 setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];
[_air1, "ColorGrey", "mil_DOT", _veh_name] spawn ghst_fnc_tracker;
player setVariable [_supportvar, Time + _delay];

sleep 1;

_air1 flyinheight _flyheight;
_air1 setSpeedMode "Normal";
//set combat mode
_wGrp setCombatMode "RED";

_air1 sidechat format ["%1 inbound", _veh_name];

[_wGrp,_pos, [_rad,_rad],_markunitsarray,["COMBAT", "NORMAL", "WEDGE"]] call ghst_fnc_waypoints;
	
_t = time;//current time

While {time < (_t + _tos) and (fuel _air1 > 0.25)} do {
if (!(alive _air1) or {!(canMove _air1)}) exitwith {player groupChat format ["Shit we lost %1 support.", _veh_name];};
if !(someAmmo _air1) exitwith {player groupchat "Out of ammo";};
sleep 10;
};

if ((alive _air1) and (canMove _air1)) then {

_wGrp addwaypoint [_spawnmark, 0];
[_wGrp, 4] setWPPos _spawnmark;
[_wGrp, 4] setWaypointType "MOVE";
[_wGrp, 4] setWaypointBehaviour "CARELESS";
_wGrp setCurrentWaypoint [_wGrp, 4];
		if (_markunits) then {
		_mtext = format ["%1 Waypoint %2",_wGrp, _w];
		[_spawnmark,_mcolor,_mtext] call ghst_fnc_mark_point;
		};

_air1 sidechat "Need to resupply heading home";

waituntil {((getpos _air1) distance _spawnmark) < (_flyheight * 2)};
{deletevehicle _x} foreach crew _air1;
deletevehicle _air1;

} else {

{deletevehicle _x} foreach crew _air1;
//deletevehicle _air1;

};
sleep 20;
deletegroup _wGrp;
/*
sleep _delay;

hint format ["%1 Support Ready", _veh_name];

player setVariable [_supportvar, false];

if (true) exitwith {};
*/