[player] remoteExec ["AST_fnc_fetch_money", 2, false];
if (player getVariable "infSpAt" == 1) exitWith {systemchat "이미 구매하셨습니다.";};
sleep 0.3;
[
	["아군 보병 스폰권한은 15포인트가 소모됩니다. 이 권한은 재접속시 다시 구매하여야 하며, 이 권한을 구매할 경우, 총 3명을 스폰할 수 있습니다. 또한, 차량 승무원 스폰 권한또한 이 구매에 포함됩니다."],
	"Inf Spawn",
	{
		if _confirmed then {
			if (AST_kill_score < 15) exitWith {hint "Not enough minerals.";};
			_tobe = AST_kill_score - 15;
			[player, "kill_score", _tobe] remoteExecCall ["AST_fnc_db_save", 2, false];	
			//SAKY's tankboy
			[] execVM "external\tankboy.sqf";
			infostand addaction ["<t size='1.4' shadow='2' color='#00FF00'>Spawn Infantry</t>", "call ghst_fnc_spawninf", [(getpos base),PARAM_MAX_GRP_NUM], 1, false, false, "","alive _target and (leader group _this == _this)"];
			player setVariable ["infSpAt",1];
		} else {
			systemchat "거절하셨습니다";
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;