/*
V1.1 By: Ghost - creates helicopter to pickup cargo
ghst_airlift = ["typeofhelicopter","spawn pos drop point",50 alt, 30 min delay] spawn ghst_fnc_init_airlift;
*/

#include "..\dlg\def_VEHsel.hpp"
private ["_pos"];
_airtype = _this select 0;
_spawnmark = _this select 1;
_flyheight = _this select 2;
_delay = (_this select 3) * 60;// time before Airlift can be called again

_timedelay = (player getVariable "ghst_airlift");
if (Time < _timedelay) exitwith {hint format ["Airlift Helicopter will be available in %1",((_timedelay - Time) call ghst_fnc_timer)];};

private ["_liftpad_mark","_liftRope","_liftObject","_liftobj_name"];

openMap true;

hint "Left click on the map where you want sling load";

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "Helicopter airlift Ready";
	};
	
_pos = [clickpos select 0, clickpos select 1, (getposatl player) select 2];

sleep 1;

openMap false;
		
	_liftObjectList = nearestObjects [_pos, ["Cargo_base_F","ThingX","Air","Tank","Car","Ship","StaticWeapon"], 50];

	#ifndef VBS
	 disableSerialization;
	#endif

	// fill dialog with vehicle names
	createDialog "UseSelectedVehicle";
	sleep 0.1;
	_ctrlList = findDisplay DLG_USE_IDD displayCtrl DLG_USE_LIST;

	private ["_index","_lstidx","_lstpos""_i"];

	for "_i" from 0 to (count _liftObjectList)-1 do {
		_liftObj = _liftObjectlist select _i;
		_liftobj_name = (configFile >> "cfgVehicles" >> (typeof _liftObj) >> "displayName") call bis_fnc_getcfgdata;
		lbAdd [DLG_USE_LIST,format["%1",_liftobj_name]];
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
		_liftObject = (_liftObjectlist select _VEHidx);

	if ((isnil "ghst_vehsel") or ! DLG_USE_SELECTED) exitwith {hint "Nothing Selected";};
	
player setVariable ["ghst_airlift", Time + _delay];

[_liftObject,_spawnmark,_airtype,_flyheight,player] remoteExec ["ghst_fnc_airliftserver",2];