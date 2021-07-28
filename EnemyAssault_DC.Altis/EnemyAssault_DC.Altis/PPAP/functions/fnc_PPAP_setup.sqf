//PPAP Setup
disableSerialization;
private _PPAP_display = findDisplay 8900;
private _vehicleclass = typeof PPAP_targetvehicle;
private _vehiclename = getText (configFile >> "CfgVehicles" >> _vehicleclass >> "displayName");
private _currentvehicletext = _PPAP_display displayCtrl 8950;
_currentvehicletext ctrlSetText _vehiclename;
private _list_preset = _PPAP_display displayCtrl 8910;
private _apply = _PPAP_display displayCtrl 8940;

//Get all Dynamic Loadout presets
private _pylon_path = "true" configClasses (configfile >> "CfgVehicles" >> _vehicleclass >> "Components" >> "TransportPylonsComponent" >> "Pylons");
private _preset_path = "true" configClasses (configfile >> "CfgVehicles" >> _vehicleclass >> "Components" >> "TransportPylonsComponent" >> "Presets");
PPAP_pylon_names = [];
PPAP_preset_display_names = [];
PPAP_preset_contents = [];
{_class = configName _x; PPAP_pylon_names pushBack _class;} forEach _pylon_path;
{_name = getText (_x >> "DisplayName"); PPAP_preset_display_names pushBack _name;} forEach _preset_path;
{_array = getArray (_x >> "attachment"); PPAP_preset_contents pushBack _array;} forEach _preset_path;

//Make empty preset
private _empty_preset = [];
{
	_empty_preset pushBack "";
} forEach PPAP_pylon_names;
{
	if (_x isEqualTo []) then {
		PPAP_preset_contents set [_forEachIndex, _empty_preset];
	};
} forEach PPAP_preset_contents;

//Put custom presets in list
{
	_custom = _x;
	if (_vehicleclass in _custom) then {
		{
			if (_forEachIndex > 0) then {
				_custom_preset = _custom select _forEachIndex;
				_custom_preset_name = _custom_preset select 0;
				_custom_preset_content = _custom_preset select 1;
				PPAP_preset_display_names pushBack _custom_preset_name;
				PPAP_preset_contents pushBack _custom_preset_content;
			};
		} forEach _custom;
	};
} forEach PPAP_custom_presets;

//Fix wrong preset setting on Black Wasp, etc.
{
	_individual_preset = _x;
	_total_preset_number = count _individual_preset;
	_total_pylon_number = count PPAP_pylon_names;
//Remove extra elements from excessive elements(array)
	if (_total_preset_number > _total_pylon_number) then {
		_individual_preset deleteRange [_total_pylon_number, _total_preset_number];
		PPAP_preset_contents set [_forEachIndex, _individual_preset];
	};
//Fill insufficient elements(array) with empty elements
	if (_total_preset_number < _total_pylon_number) then {
		{
			if !(_total_preset_number isEqualTo _total_pylon_number) then {
				_individual_preset pushBack "";
			};
		} forEach _individual_preset;
		PPAP_preset_contents set [_forEachIndex, _individual_preset];
	};
} forEach PPAP_preset_contents;

//Put presets in list
if (_preset_path isEqualTo []) then {
	_list_preset lbAdd localize "STR_PPAP_NO_PRESET";
} else {
	{_list_preset lbAdd _x} forEach PPAP_preset_display_names;
};

//Check current applied preset
private _current_pylon = getPylonMagazines PPAP_targetvehicle;
{
	if (_current_pylon isEqualTo _x) then {
		_list_preset lbSetCurSel _forEachIndex;
	};
} forEach PPAP_preset_contents;

//Spawn check script to check current preset's contents.
[] spawn fnc_PPAP_check_preset_contents;

//Add UIEH
if !(PPAP_preset_display_names isEqualTo []) then {
	_apply ctrlAddEventHandler ["ButtonClick", {[] spawn fnc_PPAP_apply;}];
};
if !(PPAP_preset_display_names isEqualTo []) then {
	_list_preset ctrlAddEventHandler ["LBSelChanged", {[] spawn fnc_PPAP_check_preset_contents;}];
};