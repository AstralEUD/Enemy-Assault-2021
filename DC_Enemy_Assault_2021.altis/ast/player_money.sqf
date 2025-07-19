/*──────────────────────────────────────────────────────┐
│   Author: lululala22                                  │
│                                                       │
│   Description: Time-based reward (15m)                │
└──────────────────────────────────────────────────────*/
// Initialize SEED BONUS status variable
if (isNil "AST_SEED_BONUS_ACTIVE") then {
    AST_SEED_BONUS_ACTIVE = false;
};

[] spawn {
	while {true} do {
		sleep 900;
		if ((count allPlayers) > 7) then {
			AST_kill_score = AST_kill_score + 15;
			[15] call AST_fnc_hud_plus;
			systemChat "15분동안 플레이하여 접속 보상이 지급되었습니다.";
			AST_SEED_BONUS_ACTIVE = false;
		} else {
			AST_kill_score = AST_kill_score + 30;
			[30] call AST_fnc_hud_plus;
			systemChat "[SEED BONUS] 15분동안 플레이하여 접속 보상이 지급되었습니다.";
			
			// Activate SEED BONUS status for 15 minutes (900 seconds)
			AST_SEED_BONUS_ACTIVE = true;
			[] spawn {
				sleep 900; // 15 minutes
				AST_SEED_BONUS_ACTIVE = false;
			};
		};
		[player, "kill_score", AST_kill_score] remoteExec ["AST_fnc_db_save", 2, false];
	};
};