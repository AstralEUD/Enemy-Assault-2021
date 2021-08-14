// [_killer] call ast_fnc_missionReward;

params ["_caller"];
_list = _caller nearEntities ["Man", 100];
_list deleteAt (_list findIf {!isPlayer _x});
{
	[_x] remoteExec ["AST_fnc_fetch_money", 2, false];
	AST_kill_score = AST_kill_score + 15;
	[_x, "kill_score", AST_kill_score] remoteExecCall ["AST_fnc_db_save", 2, false];
} forEach _list;