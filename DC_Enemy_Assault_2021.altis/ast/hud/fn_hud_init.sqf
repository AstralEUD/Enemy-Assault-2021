disableSerialization;
_AST_HUD = uiNamespace getVariable ["AST_HUD_GUI", displayNull];
_AST_HUD_INFO = _AST_HUD displayCtrl 110181;
_AST_HUD_ALERT = _AST_HUD displayCtrl 110182;
_AST_HUD_ALERT ctrlSetFont "LCD14";
_AST_HUD_INFO ctrlSetFont "LCD14";
[] spawn {
	while {true} do {
		disableSerialization;
		_AST_GUI_WAIT = 0;
		_AST_HUD = uiNamespace getVariable ["AST_HUD_GUI", displayNull];
		_AST_HUD_INFO = _AST_HUD displayCtrl 110181;
		_AST_HUD_INFO ctrlSetStructuredText parseText format ["<t align='center' shadow='2'>%1 $</t>",AST_kill_score];
		sleep 0.2;
	};
};