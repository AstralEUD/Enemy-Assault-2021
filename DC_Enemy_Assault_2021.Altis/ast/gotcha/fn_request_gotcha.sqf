if (AST_gotcha_ticket < 1) exitWith {systemChat "갓챠 티켓이 부족합니다. 미션을 완수후 복귀하면 얻을 수 있습니다."};
[
	["1회당 500포인트가 소모되며, 확률은 게시판 내 사진을 참고하세요. 뽑기시, 뽑기 물품을 실은 V-44가 베이스로 접근하며, 베이스 뒷편에 뽑기 물품이 낙하합니다. 작전지 사정에 따라, 비행기가 파괴될 수 있으며, 배상하지 않습니다, 한번에 여러개를 뽑지 마세요!"],
	"EA2021 뽑기",
	{
		if _confirmed then {
			AST_gotcha_ticket = AST_gotcha_ticket - 1;
			systemchat format ["맵을 열어 확인하세요. %1개의 티켓이 남아있습니다.",AST_gotcha_ticket];
			AST_kill_score = AST_kill_score - 500;
			[500] call AST_fnc_hud_minus;
			[] spawn ast_fnc_air_gotcha;
		} else {
			systemchat "#";
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;