/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Saves the player's total playtime to the database     │
│                                                                     │
│   Parameters:                                                        │
│   0: BOOLEAN - (Optional) Force saving regardless of timing          │
│                                                                     │
│   Call Example:                                                      │
│   [true] call AST_fnc_savePlaytime;                                 │
└─────────────────────────────────────────────────────────────────────*/

params [["_forceSave", false]];

// Check if inidbi is initialized
if (isNil "inidbi") then {
    inidbi = ["new", "astro_player_data"] call OO_INIDBI;
    diag_log "[AST Playtime] iniDBI initialized";
};

// Ensure session start time is valid
if (isNil "AST_SESSION_START_TIME") then {
    AST_SESSION_START_TIME = time;
    diag_log "[AST Playtime] Session start time was nil, initialized to current time";
};

// Calculate current session playtime
private _currentTime = time;
private _currentSessionTime = _currentTime - AST_SESSION_START_TIME;
diag_log format["[AST Playtime] Current time: %1, Session start: %2, Session duration: %3", 
    _currentTime, AST_SESSION_START_TIME, _currentSessionTime];

// Force reset if invalid
if (_currentSessionTime < 0) then {
    diag_log "[AST Playtime] WARNING: Negative session time detected, resetting session start time";
    AST_SESSION_START_TIME = _currentTime;
    _currentSessionTime = 0;
};

// First get the latest value from database to avoid overwrites
private _uid = getPlayerUID player;
private _savedPlaytime = ["read", [_uid, "total_playtime", 0]] call inidbi;
if (isNil "_savedPlaytime") then { 
    _savedPlaytime = 0; 
    diag_log "[AST Playtime] No saved playtime found in database";
} else {
    diag_log format["[AST Playtime] Loaded playtime from database: %1", _savedPlaytime];
};

// Update total play time
private _totalTime = _savedPlaytime + _currentSessionTime;
diag_log format["[AST Playtime] New total playtime: %1", _totalTime];

// Update the variable for UI display
AST_TOTAL_PLAYTIME = _totalTime;

// Save to database using both methods to ensure it's saved correctly
["write", [_uid, "total_playtime", _totalTime]] call inidbi;
diag_log format["[AST Playtime] Saved new total playtime to database: %1 for player %2", _totalTime, _uid];

// Also use the main database save function to ensure consistency
[player, "total_playtime", _totalTime] remoteExec ["AST_fnc_db_save", 2, false];
diag_log format["[AST Playtime] Also saved via AST_fnc_db_save: %1", _totalTime];

// Reset session start time to avoid double-counting
AST_SESSION_START_TIME = time;
diag_log "[AST Playtime] Reset session start time to prevent double-counting";

// Additional info for debugging if needed
if (_forceSave) then {
    systemChat format ["플레이 시간 저장됨: 총 %1시간 %2분", 
        floor (_totalTime / 3600), 
        floor ((_totalTime mod 3600) / 60)
    ];
};

// Return the saved total time
_totalTime;
