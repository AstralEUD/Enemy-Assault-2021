// [_killer] call ast_fnc_missionReward;

params ["_caller"];
_list = _caller nearEntities ["Man", 100];
_list deleteAt (_list findIf {!isPlayer _x});
{
	[15] remoteExec ["ast_fnc_addMoney", owner _x];
} forEach _list;