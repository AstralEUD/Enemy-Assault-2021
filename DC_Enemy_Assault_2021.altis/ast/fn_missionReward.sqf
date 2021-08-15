// [_killer] call ast_fnc_missionReward;

params ["_caller"];
_list = _caller nearEntities ["Man", 100];
_list deleteAt (_list findIf {!isPlayer _x});
{
	private _uid = getPlayerUID _caller;
	ASTRewardArray pushBack _uid;
	publicVariable ASTRewardArray;
} forEach _list;