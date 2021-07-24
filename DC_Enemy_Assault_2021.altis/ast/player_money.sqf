
[player] remoteExec ["AST_fnc_db_fetch", 2, false];
if (isNil "AST_kill_score") then {
	AST_kill_score = 0;
};

while {true} do {
	sleep 900;
	AST_kill_score = AST_kill_score + 2;
	[player, "kill_score", AST_kill_score] remoteExec ["AST_fnc_db_save", 2, false];
};