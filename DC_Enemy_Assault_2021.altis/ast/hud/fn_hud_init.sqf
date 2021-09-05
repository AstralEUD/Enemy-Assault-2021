disableSerialization;
AST_HUD = findDisplay 11018;
AST_HUD_INFO = AST_HUD displayCtrl 110181;
AST_HUD_ALERT = AST_HUD displayCtrl 110182;
AST_HUD_ALERT ctrlSetFade 1;
[] spawn {
	while {true} do {
		AST_HUD_INFO ctrlSetStructuredText formatText ["<t align='center'>%1</t>",AST_kill_score];
		if (isNull AST_HUD_STATUS) then {
			_first = AST_HUD_STATUS + str(accTime);
			if ((parseNumber AST_HUD_STATUS) > 0) then {
				AST_HUD_ALERT ctrlSetStructuredText formatText ["<t align='center' color='#009900' shadow='1'>%1</t>",AST_HUD_STATUS];
			} else {
				AST_HUD_ALERT ctrlSetStructuredText formatText ["<t align='center' color='#d51d36' shadow='1'>%1</t>",AST_HUD_STATUS];
			};
			AST_HUD_ALERT ctrlSetFade 0.1;
			AST_HUD_ALERT ctrlShow true;
			sleep 1;
			_now = AST_HUD_STATUS + str(accTime);
			if (_now == _first) then {
				AST_HUD_ALERT ctrlSetFade 1.5;
				AST_HUD_ALERT ctrlShow false;
			};
		};
	};
};