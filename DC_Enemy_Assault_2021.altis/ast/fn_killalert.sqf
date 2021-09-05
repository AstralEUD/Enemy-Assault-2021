params ["_reason","_killer"];
if (_reason == "civ") exitWith {
	systemChat "시민을 사살하여 패널티가 주어졌습니다. 주의하세요!";
	AST_kill_score = AST_kill_score - 5;
	[5] call AST_fnc_hud_minus;
};
if (_reason == "teamkill") exitWith {
	private _fo = format ["%1님이 아군을 사살하셨습니다. 주의하세요!",name _killer];
	[_fo] remoteExec ["hint",0];
	AST_kill_score = AST_kill_score - 7;
	[7] call AST_fnc_hud_minus;
};
if (_reason == "tank") exitWith {
	systemChat "적 궤도차량을 파괴시켜 추가 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 6;
	[6] call AST_fnc_hud_plus;
};
if (_reason == "helicopter") exitWith {
	systemChat "적 회전익을 파괴시켜 추가 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 6;
	[6] call AST_fnc_hud_plus;
};
if (_reason == "plane") exitWith {
	systemChat "적 항공기를 파괴시켜 추가 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 9;
	[9] call AST_fnc_hud_plus;
};
if (_reason == "rescue") exitWith {
	systemChat "아군 인질을 무사히 후송하여 포인트를 획득하였습니다!";
	AST_kill_score = AST_kill_score + 15;
	[15] call AST_fnc_hud_plus;
};


