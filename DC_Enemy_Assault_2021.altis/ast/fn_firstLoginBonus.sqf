/*────────────────────────────────────────────────────────────────────┐
│   Author: Copilot                                                   │
│                                                                     │
│   Description: Checks if this is the player's first login and       │
│   awards 50 points if it is                                         │
│                                                                     │
│   Call Example:                                                     │
│   [] call AST_fnc_firstLoginBonus;                                  │
└─────────────────────────────────────────────────────────────────────*/

// Wait until the player's money is initialized
waitUntil {!isNil "AST_kill_score"};
diag_log format["[AST FirstLogin] Player money initialized: %1", AST_kill_score];

// Check if inidbi is initialized
if (isNil "inidbi") then {
    inidbi = ["new", "MainDB"] call OO_INIDBI;
    diag_log "[AST FirstLogin] iniDBI initialized";
};

// Get player UID
private _uid = getPlayerUID player;

// Check if this player has received the first login bonus
private _hasReceivedBonus = ["read", [_uid, "first_login_bonus", false]] call inidbi;
diag_log format["[AST FirstLogin] Checking first login bonus for %1: %2", _uid, _hasReceivedBonus];

// If no data found or explicitly set to false, this is their first login
if (isNil "_hasReceivedBonus" || {_hasReceivedBonus isEqualTo false}) then {
    // Award 50 points to the player
    AST_kill_score = AST_kill_score + 50;;
    
    // Save the updated score to database
    [player, "kill_score", AST_kill_score] remoteExec ["AST_fnc_db_save", 2, false];
    
    // Mark that this player has received the bonus
    ["write", [_uid, "first_login_bonus", true]] call inidbi;
    
    // Notify the player
    systemChat "최초 접속 보너스 50 포인트가 지급되었습니다!";
    [50] call AST_fnc_hud_plus;
    
    hint "첫 접속을 환영합니다! 50 포인트가 지급되었습니다.";
    
    diag_log format["[AST FirstLogin] First login bonus of 50 points awarded to player %1 (%2)", name player, _uid];
} else {
    diag_log format["[AST FirstLogin] Player %1 (%2) has already received first login bonus", name player, _uid];
};

// Return true to indicate function completed
true
