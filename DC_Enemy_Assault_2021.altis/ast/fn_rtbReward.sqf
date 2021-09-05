if (isServer) exitWith {};
_mypos = getPosATL player;
_mkrpos = getMarkerPos base;
_distance = _mypos distance2D _mkrpos;
if (_mkrpos > 300) then {
	systemChat "미션을 성공적으로 완수하여 보상이 지급되었습니다. 베이스로 복귀하세요!";
	AST_kill_score = AST_kill_score + 30;
	[30] call AST_fnc_hud_plus;
};