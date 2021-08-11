params ["_target", "_caller", "_actionId", "_arguments"];
[
	["HALO는 15포인트가 소모됩니다. 계속 하시겠습니까? (단, 플레이어가 5명 이하면 감소하지 않습니다.)"],
	"HALO selections",
	{
		if _confirmed then {
			if ((count allPlayers) > 5) then {
				//params ["_target", "_caller", "_actionId", "_arguments"];
				[player] remoteExec ["AST_fnc_fetch_money", 2, false];
				if (AST_kill_score < 15) exitWith {hint "Not enough minerals";};
				private _tobe = AST_kill_score - 15;
				[player, "kill_score", _tobe] remoteExecCall ["AST_fnc_db_save", 2, false];
			};
				[_target, _caller, _actionId, _arguments] spawn ghst_fnc_halo;

		} else {
			diag_log "[EA2021] Debug Code 07a";
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;