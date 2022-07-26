[
	["5포인트를 사용하여 수송기를 호출하시겠습니까?"],
	"안개 제거",
	{
		if _confirmed then {
			AST_kill_score = AST_kill_score - 5;
			[5] call AST_fnc_hud_minus;
			ghst_transport = [ghst_helotranslist,ghst_heloattacklist,(getposasl helortb),50,PARAM_Cooldowns] spawn ghst_fnc_init_transport;
		} else {
			diag_log "EA2021 Transport Request Cancel Selection Debug"
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;