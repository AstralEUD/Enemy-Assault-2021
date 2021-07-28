disableSerialization;
_TC_display = findDisplay 5900;
_current_trait_text = _TC_display displayCtrl 5950;
_list_trait = _TC_display displayCtrl 5910;
_current_trait = missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"];
_list_selection = lbCurSel _list_trait;
_trait_name = TC_trait_names # _list_selection;
_options = TC_trait_options # _list_selection;
if (missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"] isEqualTo _trait_name) exitWith {
	hint format [localize "STR_TC_DONE_ALREADY", localize _trait_name];
};
if (TC_trait_limit) then {
	TC_trait_check_server = [clientOwner, _trait_name, missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"]],
	publicVariableServer "TC_trait_check_server";
	TC_result_client_changed = false;
	waitUntil {TC_result_client_changed};
	if (TC_result_client # 0) then {
		[_trait_name, _options, false] call fnc_TC_apply_1;
		_current_trait = missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"];
		_current_trait_text ctrlSetText localize _current_trait;
	} else {
		hint format [localize "STR_TC_LIMIT", localize _trait_name, TC_result_client # 1];
	};
} else {
	[_trait_name, _options, false] call fnc_TC_apply_1;
	_current_trait = missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"];
	_current_trait_text ctrlSetText localize _current_trait;
}