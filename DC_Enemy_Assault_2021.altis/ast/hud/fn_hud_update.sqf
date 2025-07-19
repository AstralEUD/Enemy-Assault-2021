/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Updates the HUD with current value and creates       │
│   a 3-second display with fade-out effect                           │
│   Call Example:                                                     │
│   [] call AST_fnc_hud_update;                                       │
└─────────────────────────────────────────────────────────────────────*/
[] spawn {
	disableSerialization;
	if (isNil "AST_HUD_STATUS") then {
		AST_HUD_STATUS = "+0";
	};
	AST_HUD_ongoing = true; 
	_first = AST_HUD_STATUS;
	_AST_HUD = uiNamespace getVariable ["AST_HUD_GUI", displayNull];
	_AST_HUD_ALERT = _AST_HUD displayCtrl 110182;
	_AST_HUD_ALERT_BACK = _AST_HUD displayCtrl 110184;
	
	// Format with comma separators if needed
	_value = parseNumber AST_HUD_STATUS;
	_absValue = abs _value;
	_formattedValue = if (_absValue >= 1000) then {
		private _str = str _absValue;
		private _arr = [];
		private _formatted = "";
		
		for "_i" from (count _str - 1) to 0 step -1 do {
			_arr pushBack (_str select [_i, 1]);
			if ((_i > 0) && (((count _str) - _i) % 3 == 0)) then {
				_arr pushBack ",";
			};
		};
		
		for "_i" from (count _arr - 1) to 0 step -1 do {
			_formatted = _formatted + (_arr select _i);
		};
		
		if (_value < 0) then { "-" + _formatted } else { "+" + _formatted }
	} else {
		AST_HUD_STATUS
	};
	
	// Show the alert background with fade in
	_AST_HUD_ALERT_BACK ctrlShow true;
	_AST_HUD_ALERT ctrlShow true;
	
	// Animation for alert appearing (slide in from right)
	_originalPosX = (safeZoneX + safeZoneW * 0.878);
	_originalPosY = (safeZoneY + safeZoneH * 0.905);
	_startPosX = _originalPosX + (safeZoneW * 0.12);
	
	_AST_HUD_ALERT ctrlSetPosition [_startPosX, _originalPosY, safeZoneW * 0.115, safeZoneH * 0.05];
	_AST_HUD_ALERT ctrlCommit 0;
	
	_AST_HUD_ALERT ctrlSetPosition [_originalPosX, _originalPosY, safeZoneW * 0.115, safeZoneH * 0.05];
	_AST_HUD_ALERT ctrlCommit 0.2;
	
	// Set the text with appropriate styling
	if (_value > 0) then {
		_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#00BB00' shadow='1'>%1 ₩</t>", _formattedValue];
		_AST_HUD_ALERT_BACK ctrlSetBackgroundColor [0, 0.4, 0, 0.4]; // Green background for positive
	} else {
		_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#FF4444' shadow='1'>%1 ₩</t>", _formattedValue];
		_AST_HUD_ALERT_BACK ctrlSetBackgroundColor [0.4, 0, 0, 0.4]; // Red background for negative
	};
	
	// Add a sound effect based on positive or negative value
	if (_value > 0) then {
		playSound "FD_CP_Clear_F"; // Positive sound
	} else {
		playSound "FD_CP_Not_Clear_F"; // Negative sound
	};
	
	// Wait for 3 seconds and then fade out
	sleep 3;
	
	// Start fade-out effect
	_fadeTime = 1; // 1 second for fade out effect
	_steps = 20;   // Number of fade steps
	_alphaStep = 1 / _steps;
	
	// Slide out to the right while fading
	for "_i" from 1 to _steps do {
		_alpha = 1 - (_i * _alphaStep);
		_currentPosX = _originalPosX + (_i * (safeZoneW * 0.12) / _steps);
		
		if (_value > 0) then {
			_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#00BB00' shadow='1' alpha='%1'>%2 ₩</t>", _alpha, _formattedValue];
		} else {
			_AST_HUD_ALERT ctrlSetStructuredText parseText format ["<t align='center' color='#FF4444' shadow='1' alpha='%1'>%2 ₩</t>", _alpha, _formattedValue];
		};
		
		// Fade the background as well
		if (_value > 0) then {
			_AST_HUD_ALERT_BACK ctrlSetBackgroundColor [0, 0.4, 0, 0.4 * _alpha];
		} else {
			_AST_HUD_ALERT_BACK ctrlSetBackgroundColor [0.4, 0, 0, 0.4 * _alpha];
		};
		
		_AST_HUD_ALERT ctrlSetPosition [_currentPosX, _originalPosY, safeZoneW * 0.115, safeZoneH * 0.05];
		_AST_HUD_ALERT ctrlCommit (_fadeTime / _steps);
		
		sleep (_fadeTime / _steps);
	};
	
	// Finally hide the controls
	_AST_HUD_ALERT_BACK ctrlShow false;
	_AST_HUD_ALERT ctrlShow false; 
	AST_HUD_ongoing = false;
};