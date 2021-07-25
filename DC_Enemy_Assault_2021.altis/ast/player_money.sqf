/*──────────────────────────────────────────────────────┐
│   Author: lululala22                                  │
│                                                       │
│   Description: Time-based reward (15m)                │
└──────────────────────────────────────────────────────*/

[player] remoteExec ["AST_fnc_db_fetch_money", 2, false];

while {true} do {
	sleep 900;
	AST_kill_score = AST_kill_score + 2;
	[player, "kill_score", AST_kill_score] remoteExec ["AST_fnc_db_save", 2, false];
};