/*
V2 By: Ghost - creates helicopter to pickup caller
ghst_transport = ["typeofhelicopter","typeofhelicopter for escort in array []","spawn pos",50 alt, 30 min delay] spawn ghst_fnc_init_transport;
*/
#include "..\dlg\def_VEHsel.hpp"
private ["_pos"];
_airtypelist = _this select 0;//transport type list
_escortlist = _this select 1;//escort type array
_spawnmark = _this select 2;//spawning location
_flyheight = _this select 3;//fly height
_delay = (_this select 4) * 60;// time before Transport can be called again

_timedelay = (player getVariable "ghst_transport");
if (Time < _timedelay) exitwith {hint format ["Transport Helicopter will be available in %1",((_timedelay - Time) call ghst_fnc_timer)];};

/*hint "Choose type of Transport";

#ifndef VBS
 disableSerialization;
#endif

//Select Transport type
// fill dialog with vehicle names
createDialog "Selectvehicle";
sleep 0.1;

ctrlSetText [DLG_VEH_BTN, "Select Transport"];
_ctrlList = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _airtypelist)-1 do {
	_airsel = _airtypelist select _i;
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
				_wDName = (_airtypelist select _lbidx) select 1;
				_wPic = (_airtypelist select _lbidx) select 2;
				_wDesc = format ["%1",(_airtypelist select _lbidx) select 3];
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_airtype=(_airtypelist select _cargoidx) select 0;

if ((isnil "ghst_vehsel") or ! DLG_VEH_SELECTED) exitwith {hint "Nothing Selected Helicopter Transport Ready";};*/

/*hint "Choose type of Escort";
//select escort type
// fill dialog with vehicle names
createDialog "Selectvehicle";
sleep 0.1;

ctrlSetText [DLG_VEH_BTN, "Select Escort"];
_ctrlList = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _escortlist)-1 do {
	_airsel = _escortlist select _i;
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
				_wDName = (_escortlist select _lbidx) select 1;
				_wPic = (_escortlist select _lbidx) select 2;
				_wDesc = format ["%1",(_escortlist select _lbidx)];
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_escorttype=(_escortlist select _cargoidx) select 0;

if ((isnil "ghst_vehsel") or ! DLG_VEH_SELECTED) exitwith {hint "Nothing Selected Helicopter Transport Ready";};
*/
private ["_lzpad","_lzpad2","_lzpad_mark","_lzpad2_mark","_wpgetout","_destact","_destrtb"];

openMap true;

hint "탑승하실 장소를 선택하세요";

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "수송 헬리콥터 대기중";
	};
_pos = [clickpos select 0, clickpos select 1, (getposatl player) select 2];
if (surfaceiswater clickpos) then {
_pos = [clickpos select 0, clickpos select 1, (getposasl player) select 2];
};	
/*
_pos = _clickpos findEmptyPosition[ 10 , 100 , _airtype ];
if (count _pos < 2) then {
_pos = clickpos;
};
*/
sleep 1;

openMap false;
//if (surfaceiswater _pos) exitwith {hint "Helicopter cannot land in water";};

player setVariable ["ghst_transport", Time + _delay];

_airtype = "B_Heli_Light_01_F";
_escorttype = "B_Heli_Light_01_dynamicLoadout_F";

[_spawnmark,_pos,_airtype,_flyheight,_escorttype,player] remoteExec ["ghst_fnc_transportserver",2];