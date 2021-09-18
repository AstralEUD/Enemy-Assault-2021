// [_killer] call ast_fnc_missionReward;

params ["_callerpos","_point"];
if (isServer) exitWith {};
_mypos = getPosATL player;
_distance = _callerpos distance2D _mypos;
if (_distance < 200) then {
	AST_kill_score = AST_kill_score + _point;
	//systemChat "미션 수행 보상이 지급되었습니다!";
	SAKY_Reward = SAKY_Reward + 1;
	systemChat "과업 수행 보상을 획득하였습니다. 재배치나 사망 없이 베이스로 복귀에 성공하면 추가 자원을 획득합니다.";
	[_point] call AST_fnc_hud_plus;
};
