//TC Info Display
disableSerialization;
_TC_display = findDisplay 5900;
_list_trait = _TC_display displayCtrl 5910;
_trait_info_text = _TC_display displayCtrl 5920;

_list_selection = lbCurSel _list_trait;
_trait_info = TC_trait_names # _list_selection;
if !(_list_selection isEqualTo -1) then {
	_trait_info = _trait_info + "_INFO";
	_trait_info = localize _trait_info;
};

//Measure text box size and put array to text box. And resize with text height
_trait_info_text ctrlSetStructuredText parseText _trait_info;
_text_input_height = (ctrlTextHeight _trait_info_text) + 0.01;
_trait_info_text ctrlSetPositionH _text_input_height;
_trait_info_text ctrlCommit 0;