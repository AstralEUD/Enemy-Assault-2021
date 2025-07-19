/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Initializes the HUD system and starts the            │
│   continuous display updating                                       │
│   Call Example:                                                     │
│   [] call AST_fnc_hud_init;                                         │
└─────────────────────────────────────────────────────────────────────*/
disableSerialization;
_AST_HUD = uiNamespace getVariable ["AST_HUD_GUI", displayNull];
_AST_HUD_INFO = _AST_HUD displayCtrl 110181;
_AST_HUD_ALERT = _AST_HUD displayCtrl 110182;
_AST_HUD_ALERT_BACK = _AST_HUD displayCtrl 110184;
_AST_HUD_PLAYER_INFO = _AST_HUD displayCtrl 110187;

// Check if inidbi is initialized
if (isNil "inidbi") then {
    inidbi = ["new", "astro_player_data"] call OO_INIDBI;
};

// Set session start time
if (isNil "AST_SESSION_START_TIME") then {
    AST_SESSION_START_TIME = time;
    diag_log format["[AST HUD] Session start time initialized: %1", AST_SESSION_START_TIME];
};

// Store the session start time on the player object so server can access it during disconnect
player setVariable ["AST_SESSION_START_TIME", AST_SESSION_START_TIME, true];

// Initialize or retrieve total play time
if (isNil "AST_TOTAL_PLAYTIME") then {
    _uid = getPlayerUID player;
    
    // First try to read from database
    AST_TOTAL_PLAYTIME = ["read", [_uid, "total_playtime", 0]] call inidbi;
    
    // Check if the read was successful
    if (isNil "AST_TOTAL_PLAYTIME" || {AST_TOTAL_PLAYTIME isEqualTo 0}) then {
        AST_TOTAL_PLAYTIME = 0;
        diag_log "[AST HUD] Total playtime initialized to 0";
    } else {
        diag_log format["[AST HUD] Total playtime loaded from database: %1", AST_TOTAL_PLAYTIME];
    };
};

// Hide alert background initially
_AST_HUD_ALERT_BACK ctrlShow false;

// Add event handler to save playtime when player disconnects
player addEventHandler ["Killed", {
    [true] call AST_fnc_savePlaytime;
}];

// Save playtime on mission end
addMissionEventHandler ["Ended", {
    [true] call AST_fnc_savePlaytime;
}];

[] spawn {
	while {true} do {
		disableSerialization;
		_AST_HUD = uiNamespace getVariable ["AST_HUD_GUI", displayNull];
		_AST_HUD_INFO = _AST_HUD displayCtrl 110181;
		_AST_HUD_PLAYER_INFO = _AST_HUD displayCtrl 110187;
		
		// Format with comma separators for thousands
		_formattedScore = [AST_kill_score] call {
			private ["_num", "_str", "_arr", "_formattedNum"];
			_num = _this select 0;
			_str = str _num;
			_arr = [];
			_formattedNum = "";
			
			for "_i" from (count _str - 1) to 0 step -1 do {
				_arr pushBack (_str select [_i, 1]);
				if ((_i > 0) && (((count _str) - _i) % 3 == 0)) then {
					_arr pushBack ",";
				};
			};
			
			for "_i" from (count _arr - 1) to 0 step -1 do {
				_formattedNum = _formattedNum + (_arr select _i);
			};
			
			_formattedNum
		};
		
		_AST_HUD_INFO ctrlSetStructuredText parseText format ["<t align='right' shadow='1'>%1 ₩</t>", _formattedScore];
		
		// Calculate current session play time
		if (isNil "AST_SESSION_START_TIME") then {
			AST_SESSION_START_TIME = time;
			diag_log "[AST HUD Update] Session start time was nil, initialized now";
		};
		
		// Explicitly update time to ensure it advances every second
		_currentSessionTime = time - AST_SESSION_START_TIME;
		_sessionHours = floor (_currentSessionTime / 3600);
		_sessionMinutes = floor ((_currentSessionTime mod 3600) / 60);
		_sessionSeconds = floor (_currentSessionTime mod 60);
		
		// Debug log
		if (_sessionSeconds == 0 || _sessionSeconds == 30) then {
			diag_log format["[AST HUD Update] Current session time: %1 (%2:%3:%4)", 
				_currentSessionTime, _sessionHours, _sessionMinutes, _sessionSeconds];
			diag_log format["[AST HUD Update] Game time: %1", time];
		};
		
		// Calculate total play time (stored + current session)
		if (isNil "AST_TOTAL_PLAYTIME") then {
			AST_TOTAL_PLAYTIME = 0;
			diag_log "[AST HUD Update] Total playtime was nil, initialized to 0";
		};
		
		_totalTime = AST_TOTAL_PLAYTIME + _currentSessionTime;
		_totalHours = floor (_totalTime / 3600);
		_totalMinutes = floor ((_totalTime mod 3600) / 60);
		
		// Determine color for session time based on SEED BONUS status
		private _sessionTimeColor = if ((!isNil "AST_SEED_BONUS_ACTIVE") && {AST_SEED_BONUS_ACTIVE}) then {
			"#00FF00" // Green color for SEED BONUS active
		} else {
			"#A3E0FF" // Default blue color
		};
		
		// Format session time with leading zeros for more elegant display - including seconds
		private _formattedSessionTime = format["%1:%2:%3", 
			if (_sessionHours < 10) then {"0" + str _sessionHours} else {str _sessionHours},
			if (_sessionMinutes < 10) then {"0" + str _sessionMinutes} else {str _sessionMinutes},
			if (_sessionSeconds < 10) then {"0" + str _sessionSeconds} else {str _sessionSeconds}
		];
		
		private _formattedTotalTime = format["%1:%2", 
			if (_totalHours < 10) then {"0" + str _totalHours} else {str _totalHours},
			if (_totalMinutes < 10) then {"0" + str _totalMinutes} else {str _totalMinutes}
		];
		
		// Format player info - keep original labels but smaller size
		_playerInfo = format [
			"<t size='0.8' color='#A3E0FF'>%1</t><br/>" +
			"<t size='0.75'><t color='#D0D0D0'>세션:</t><t color='%3'> %2</t></t><br/>" +
			"<t size='0.75'><t color='#D0D0D0'>총 플레이:</t><t color='#A3E0FF'> %4</t></t>",
			name player,
			_formattedSessionTime,
			_sessionTimeColor,
			_formattedTotalTime
		];
		
		_AST_HUD_PLAYER_INFO ctrlSetStructuredText parseText _playerInfo;
		
		// Save total play time every 5 minutes
		if (_sessionSeconds == 0 && _sessionMinutes mod 5 == 0) then {
			diag_log format["[AST HUD Update] Auto-saving playtime at %1:%2:%3", _sessionHours, _sessionMinutes, _sessionSeconds];
			[false] call AST_fnc_savePlaytime;
		};
		
		// Update the HUD more frequently for smoother display
		sleep 1.0; // Update every second to show seconds counting
	};
};