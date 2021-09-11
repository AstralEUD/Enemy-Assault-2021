// [_killer] call ast_fnc_missionReward;

params ["_callerpos","_point"];
if (isServer) exitWith {};
_mypos = getPosATL player;
_distance = _callerpos distance2D _mypos;
if (_distance < 200) then {
	AST_kill_score = AST_kill_score + _point;
	systemChat "미션 수행 보상이 지급되었습니다!";
	[_point] call AST_fnc_hud_plus;
};
