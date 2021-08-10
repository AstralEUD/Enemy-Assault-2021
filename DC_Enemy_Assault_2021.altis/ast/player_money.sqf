/*──────────────────────────────────────────────────────┐
│   Author: lululala22                                  │
│                                                       │
│   Description: Time-based reward (15m)                │
└──────────────────────────────────────────────────────*/

[player] remoteExec ["AST_fnc_db_fetch_money", 2, false];

while {true} do {
	sleep 900;
	[player] remoteExec ["AST_fnc_db_fetch_money", 2, false];
	_score = AST_kill_score + 15;
	systemChat "15분동안 플레이하여 접속 보상이 지급되었습니다.";
	[player, "kill_score", _score] remoteExec ["AST_fnc_db_save", 2, false];
};