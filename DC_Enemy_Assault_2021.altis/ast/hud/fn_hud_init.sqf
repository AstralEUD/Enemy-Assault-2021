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
		_AST_HUD_ALERT = _AST_HUD displayCtrl 110182;
		_AST_HUD_ALERT ctrlShow true;
		_AST_HUD_INFO ctrlSetStructuredText parseText format ["<t align='center' shadow='2'>%1 $</t>",AST_kill_score];
		_first = AST_HUD_STATUS;
		if ((parseNumber AST_HUD_STATUS) > 0) then {
			_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#009900' shadow='2'>%1 $</t>",AST_HUD_STATUS];
		} else {
			_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#d51d36' shadow='2'>%1 $</t>",AST_HUD_STATUS];
		};
		waitUntil {
			sleep 0.1;
			_AST_GUI_WAIT = _AST_GUI_WAIT + 1;
			if (_AST_GUI_WAIT == 5) then {_AST_HUD_ALERT ctrlShow false; AST_HUD_STATUS = "";};
			((_first != AST_HUD_STATUS) && (AST_HUD_STATUS != ""))
		};
	};
};