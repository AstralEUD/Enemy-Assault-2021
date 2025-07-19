/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Removes fog from the mission area for a fee          │
│   Call Example:                                                     │
│   [] call AST_fnc_Ihatefog;                                         │
└─────────────────────────────────────────────────────────────────────*/

[
	["30포인트를 사용하여 안개를 제거하시겠습니까?"],
	"안개 제거",
	{
		if _confirmed then {
			[10,[0.01,0,0]] remoteExec ["setFog",2];
			_format = format ["%1님이 안개를 제거하셨습니다!", name player];
			_format remoteExec ["systemChat", 0];
			AST_kill_score = AST_kill_score - 30;
			[30] call AST_fnc_hud_minus;
		} else {
			diag_log "ASTRO Fog Clear Selection Debug"
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;