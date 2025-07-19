/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Teleports player to FOB for a fee of 5 points        │
│   Call Example:                                                     │
│   [] call AST_fnc_fobTeleport;                                      │
└─────────────────────────────────────────────────────────────────────*/

[
	["FOB로 이동하시겠습니까? 5포인트가 소모되며, FOB에서는 지상장비를 스폰할 수 있습니다."],
	"FOB Teleport Manager",
	{
		if _confirmed then {
			if (AST_kill_score < 5) exitWith {systemchat "돈 부족";};
			AST_kill_score = AST_kill_score - 5;
			player setPos getMarkerPos "FOBmarker";
			[5] call AST_fnc_hud_minus;
		} else {
			systemchat "#";
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;