// [_caller] call 

params ["_caller"];
_list = _caller nearEntities ["Man", 100];
_list deleteAt (_list findIf {!isPlayer _x});
{
	[_x] remoteExec ["AST_fnc_fetch_money", 2, false];
	sleep 0.3;
	_tobe = AST_kill_score + 15;
	[_x, "kill_score", _tobe] remoteExecCall ["AST_fnc_db_save", 2, false];
} forEach _list;