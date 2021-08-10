_objlist = _this select 0;
_output = [];
#ifndef VBS
 disableSerialization;
#endif

// fill dialog with vehicle names
createDialog "Selectvehicle";
sleep 0.1;
_ctrlList = findDisplay DLG_VEH_IDD displayCtrl DLG_VEH_LIST;

private ["_index","_lstidx","_lstpos""_i"];

for "_i" from 0 to (count _objlist)-1 do {
	_cargoicle = _objlist select _i;
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
				_wDName = (_objlist select _lbidx) select 1;
				_wPic = (_objlist select _lbidx) select 2;
				_wDesc = (_objlist select _lbidx) select 3;
				_ctrlPic ctrlSetText _wPic;
				_ctrlName ctrlSetText _wDName;
				_ctrlDesc ctrlSetStructuredText parseText (_wDesc);
				_lstpos=_posidx;
			};
			sleep 0.1;
		};
	if (_lstidx == _index) exitWith {};
	_objsel=(_objlist select _cargoidx) select 0;

if (isnil "ghst_vehsel") exitwith {player groupchat "Nothing Spawned";};
if (ghst_vehsel != "none" && DLG_VEH_SELECTED) then {
_cargo_name = (configFile >> "cfgVehicles" >> (_objsel) >> "displayName") call bis_fnc_getcfgdata;
_output = [_objsel,_cargo_name];};

