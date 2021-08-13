/*
V1.3 By: Ghost - creates helicopter to pickup cargo
ghst_airlift = ["typeofhelicopter","spawn pos drop point",50 alt, 30 min delay] spawn ghst_fnc_init_airlift;
*/

#include "..\dlg\def_VEHsel.hpp"
_temphelolist = _this select 0;//list of transport helicopters
_spawnmark = _this select 1;
_dropmark = _this select 2;
_flyheight = _this select 3;
_delay = (_this select 4) * 60;// time before Airlift can be called again
_dest = param [5, false, [true]];//true to use cargo lift to transport specified cargo to a designated destination

_timedelay = (player getVariable "ghst_airlift");
if (Time < _timedelay) exitwith {hint format ["Airlift Helicopter will be available in %1",((_timedelay - Time) call ghst_fnc_timer)];};

private ["_liftpos","_liftObject","_liftobj_name","_setdest","_helocargolist"];
_setdest = _dropmark;
_helocargolist = [];

#ifndef VBS
 disableSerialization;
#endif

openMap true;
mapclick = false;
hint "슬링할 물체/차량이 있는 곳을 클릭하세요";

_mapEH = addMissionEventHandler ["MapSingleClick", {clickpos = _this select 1; mapclick = true;}];
waitUntil {!visibleMap or mapclick}; // Wait until map is closed, either by ESC/M or map click
removeMissionEventHandler ["MapSingleClick",_mapEH]; // removes eventhandler so it doesn´t stack and spawn more than one vehicle

if (!visibleMap) exitwith {
	hint "Helicopter airlift Ready";
	};
	
_liftpos = [clickpos select 0, clickpos select 1, 0];//(getposatl player) select 2];

sleep 1;

openMap false;

	_liftObjectList = nearestObjects [_liftpos, ["Cargo_base_F","ThingX","Air","Tank","Car","Ship","StaticWeapon","Land_Device_slingloadable_F","Slingload_base_F"], 50];

	// fill dialog with vehicle names
	createDialog "UseSelectedVehicle";
	sleep 0.1;
	ctrlSetText [DLG_USE_BTN, "Select Slingload"];
	_ctrlList = findDisplay DLG_USE_IDD displayCtrl DLG_USE_LIST;

	private ["_index","_lstidx","_lstpos""_i"];

	for "_i" from 0 to (count _liftObjectList)-1 do {
		_liftObj = _liftObjectlist select _i;
		_liftobj_name = (configFile >> "cfgVehicles" >> (typeof _liftObj) >> "displayName") call bis_fnc_getcfgdata;
		lbAdd [DLG_USE_LIST,format["%1 Mass %2 Lbs",_liftobj_name, getMass _liftObj]];
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
		_liftobj_name = (configFile >> "cfgVehicles" >> (typeof _liftObject) >> "displayName") call bis_fnc_getcfgdata;
		_selcargomass = getMass _liftObject;//get lift object mass

	if ((isnil "ghst_vehsel") or ! DLG_USE_SELECTED) exitwith {hint "Nothing Selected Helicopter Airlift Ready";};

//Sort list by usable helicopters
for "_i" from 0 to (count _temphelolist)-1 do {
	_sel = (_temphelolist select _i);
	_maxcargomass = (configFile >> "cfgVehicles" >> (_sel select 0) >> "slingLoadMaxCargoMass") call bis_fnc_getcfgdata;
	if (_maxcargomass > _selcargomass) then {
		_helocargolist pushback _sel;
	};
};
// fill dialog with vehicle names
createDialog "Selectvehicle";
sleep 0.1;
ctrlSetText [DLG_VEH_BTN, "Select Transport"];
_ctrlList = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _helocargolist)-1 do {
	_airsel = _helocargolist select _i;
	lbAdd [DLG_VEH_LIST,format["%1",_airsel select 1]];
	lbSetPicture [DLG_VEH_LIST, _i, _airsel select 2];
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
				_wDName = (_helocargolist select _lbidx) select 1;
				_wPic = (_helocargolist select _lbidx) select 2;
				_maxcargomass = (configFile >> "cfgVehicles" >> ((_helocargolist select _lbidx) select 0) >> "slingLoadMaxCargoMass") call bis_fnc_getcfgdata;
				_wDesc = format ["%1 Max Cargo Lift %2 Lbs",(_helocargolist select _lbidx) select 3,_maxcargomass];
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_airtype=(_helocargolist select _cargoidx) select 0;

if ((isnil "ghst_vehsel") or ! DLG_VEH_SELECTED) exitwith {hint "Nothing Selected Helicopter Airlift Ready";};
_airtypename = (configFile >> "cfgVehicles" >> (_airtype) >> "displayName") call bis_fnc_getcfgdata;
	
if (_dest) then {
	//set destination for cargo lift
	openMap true;
	mapclick2 = false;
	hint "목적지를 선택하세요";

	_mapEH = addMissionEventHandler ["MapSingleClick", {clickpos2 = _this select 1; mapclick2 = true;}];
	waitUntil {!visibleMap or mapclick2}; // Wait until map is closed, either by ESC/M or map click
	removeMissionEventHandler ["MapSingleClick",_mapEH]; // removes eventhandler so it doesn´t stack and spawn more than one vehicle

	if (!visibleMap) exitwith {
		hint "Helicopter airlift Ready";
		};
		
	_setdest = [clickpos2 select 0, clickpos2 select 1, 0];// (getposatl player) select 2];
	
	sleep 1;

	openMap false;
};
	
_maxcargomass = (configFile >> "cfgVehicles" >> (_airtype) >> "slingLoadMaxCargoMass") call bis_fnc_getcfgdata;

if (_maxcargomass < _selcargomass) exitwith {hint format ["%1 weighs %2 Lbs. %3 can only carry %4 Lbs. Helicopter Airlift Ready",_liftobj_name,_selcargomass,_airtypename,_maxcargomass];};

player setVariable ["ghst_airlift", Time + _delay];

[_liftObject,_spawnmark,_airtype,_flyheight,player,_setdest] remoteExec ["ghst_fnc_airliftserver",2];