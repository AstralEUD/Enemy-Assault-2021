params ["_reason","_killer"];
if (_reason == "civ") exitWith {
	systemChat "시민을 사살하여 패널티가 주어졌습니다. 주의하세요!";
	AST_kill_score = AST_kill_score - 5;
};
if (_reason == "teamkill") exitWith {
	hint format ["%1님이 아군을 사살하셨습니다. 주의하세요!",name _killer];
	AST_kill_score = AST_kill_score - 7;
};
if (_reason == "tank") exitWith {
	systemChat "적 궤도차량을 파괴시켜 추가 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 6;
};
if (_reason == "helicopter") exitWith {
	systemChat "적 회전익을 파괴시켜 추가 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 6;
};
if (_reason == "plane") exitWith {
	systemChat "적 항공기를 파괴시켜 추가 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 9;
};

