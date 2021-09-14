params ["_point"];
if (isServer) exitWith {};
AST_kill_score = AST_kill_score + _point;
[_point] call AST_fnc_hud_plus;
systemchat "적 차량/항공기를 파괴시켜 추가 포인트를 획득하였습니다.";

