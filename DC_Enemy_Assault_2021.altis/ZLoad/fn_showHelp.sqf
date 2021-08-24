disableSerialization;
//_mainDisplay 
createDialog "zlo_HelpDialog";
waitUntil{!isnull (findDisplay 456964);};
_mainDisplay = findDisplay 456964;
_ctrl = _mainDisplay displayCtrl (1101);
_ctrl ctrlSetStructuredText parseText format["<t size='0.7' shadow='1' shadowColor='#4F4F4F' align='left'></a></t>"];

_ctrl = _mainDisplay displayCtrl (1100);
_ctrl ctrlSetStructuredText parseText format["<t shadow='1' shadowColor='#4F4F4F' align='left'>%1</t>",localize "zlo_helptext_text"];

