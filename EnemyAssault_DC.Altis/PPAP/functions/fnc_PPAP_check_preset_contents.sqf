//PPAP Check Preset Contents
disableSerialization;
private _PPAP_display = findDisplay 8900;
private _vehicleclass = typeof PPAP_targetvehicle;
private _list_preset = _PPAP_display displayCtrl 8910;
private _preset_contents_text = _PPAP_display displayCtrl 8920;

private _list_selection = lbCurSel _list_preset;
private _preset_contents = "<t>";
if !(_list_selection isEqualTo -1) then {
//Make string to put in text box
	private _current_preset = PPAP_preset_contents select _list_selection; 
	{
		_name = getText (configfile >> "CfgMagazines" >> _x >> "DisplayName");
		_pylon_name_long = toUpper (PPAP_pylon_names select _forEachIndex);
		_pylon_name_short = _pylon_name_long select [5];
		_input = _pylon_name_short + " : " + _name;
		_preset_contents = _preset_contents + _input;
		if !(count _preset_contents isEqualTo _forEachIndex) then {
			_preset_contents = _preset_contents + "<br/>";
		};
		if (count _preset_contents isEqualTo _forEachIndex) then {
			_preset_contents = _preset_contents + "</t>";
		};
	} forEach _current_preset;
} else {
//Display this when current setup isn't in presets
	_preset_contents = "<t>Not in Preset</t>"; 
};

//Measure text box size and put array to text box. And resize with text height
_preset_contents_text ctrlSetStructuredText parseText _preset_contents;
private _text_input_height = (ctrlTextHeight _preset_contents_text) + 0.01;
_preset_contents_text ctrlSetPositionH _text_input_height;
_preset_contents_text ctrlCommit 0;