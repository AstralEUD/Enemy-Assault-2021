if (AST_gotcha_ticket < 1) exitWith {systemChat "갓챠 티켓이 부족합니다. 전리품에서 랜덤으로 얻을 수 있습니다."};
if (AST_kill_score < 500) exitWith {systemChat "돈이 부족합니다."};
[
	["1회당 250포인트가 소모되며, 확률은 게시판 내 사진을 참고하세요. 뽑기시, 플레이어한테 롱 액션이 생성됩니다. 한번에 여러개를 뽑지 마세요!"],
	"EA2021 뽑기",
	{
		if _confirmed then {
			AST_gotcha_ticket = AST_gotcha_ticket - 1;
			systemchat format ["%1개의 티켓이 남아있습니다.",AST_gotcha_ticket];
			AST_kill_score = AST_kill_score - 250;
			[250] call AST_fnc_hud_minus;
			[player,"갓챠 오픈!","\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa","\a3\missions_f_oldman\data\img\holdactions\holdAction_box_ca.paa","_this distance _target <3", "_caller distance _target < 3", {}, {}, {
				params ["_target, _caller, _actionId", "_a0"];
				[_target, _caller, _actionId, _a0] call ast_fnc_open_gotcha;		
			},{}, [_player], 5, 0, true, false] call BIS_fnc_holdActionAdd;
		} else {
			systemchat "#";
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;