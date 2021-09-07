_update = [] spawn {
	disableSerialization;
	AST_wait_UPDATE = false;
	AST_HUD_ongoing = true; 
	_AST_GUI_WAIT = 0;
	_AST_HUD = uiNamespace getVariable ["AST_HUD_GUI", displayNull];
	_AST_HUD_ALERT = _AST_HUD displayCtrl 110182;
	_AST_HUD_ALERT ctrlShow true;
	if ((parseNumber AST_HUD_STATUS) > 0) then {
		_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#009900' shadow='2'>%1 $</t>",AST_HUD_STATUS];
	} else {
		_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#d51d36' shadow='2'>%1 $</t>",AST_HUD_STATUS];
	};
	_update = 0;
	while {AST_HUD_ongoing == true} do {
		sleep 0.1;
		_update = _update + 0.1;
		if (AST_wait_UPDATE == true) then {terminate _update};
		if (_update == 0.8) then {_AST_HUD_ALERT ctrlShow false; AST_HUD_ongoing = false;};
	};
};