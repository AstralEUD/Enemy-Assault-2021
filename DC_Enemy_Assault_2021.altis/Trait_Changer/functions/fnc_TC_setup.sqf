//TC Setup
disableSerialization;
_TC_display = findDisplay 5900;
_current_trait = missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"];
_current_trait_text = _TC_display displayCtrl 5950;
_current_trait_text ctrlSetText localize _current_trait;
_list_trait = _TC_display displayCtrl 5910;
_apply = _TC_display displayCtrl 5940;

//Put traits in list
{_list_trait lbAdd localize _x} forEach TC_trait_names;

//Check current applied trait
{
	if (_current_trait isEqualTo _x) then {
		_list_trait lbSetCurSel _forEachIndex;
	};
} forEach TC_trait_names;

[] spawn fnc_TC_info;

//Add UIEH
_apply ctrlAddEventHandler ["ButtonClick", {[] spawn fnc_TC_apply_0;}];
_list_trait ctrlAddEventHandler ["LBSelChanged", {[] spawn fnc_TC_info;}];