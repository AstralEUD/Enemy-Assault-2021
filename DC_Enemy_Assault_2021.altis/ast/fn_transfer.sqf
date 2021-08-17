params ["_PlayerList","_PlayerNameList","_TransferList","_Money","_Target"];
_PlayerList = call BIS_fnc_listPlayers;
_PlayerNameList = _PlayerList;
_PlayerNameList apply {name _x};
_PlayerNameList apply {
	[
		[_x],
		[],
		[],
		[],
		_x,
		_x
	]
};

[
	[
		_PlayerNameList,
		0, // Selects the quadbike by default
		false // Multi select disabled
	],
	"EA2021 송금",
	{
		/*systemchat format["_confirmed: %1",_confirmed];
		systemchat format["_index: %1",_index];
		systemchat format["_data: %1",_data];
		systemchat format["_value: %1",_value];*/
		if (_confirmed == True) then {
			// Disable cancel option
			[
				[false,""],
				"얼마를 송금하시겠습니까?",
				{
					if _confirmed then {
						_Money = parseNumber _text;
						if (_Target == Player) exitWith {systemChat "송금할려는 대상과 본인이 같습니다.";};
						if (!isNil _Money) exitWith {diag_log "[EA2021] Debug (Transfer Error #1)";};
						if (AST_kill_score < _Money) exitWith {systemchat "송금할려는 돈이 가지고 있는 돈보다 많습니다. 다시 확인하세요.";};
						if (_Money < 0) exitWith {systemChat "입력이 잘못되었습니다. 다시 확인하세요.";};
						_Target = _PlayerList select _index;
						[_Target] remoteExec ["AST_fnc_db_fetch_another", 2, false];
						AST_kill_score = AST_kill_score - _Money;
						[_Money] remoteExec ["ast_fnc_addMoney",_Target];
						[player, "kill_score", AST_kill_score] remoteExecCall ast_fnc_db_save;
					};
				},
				"송금"
				""
			] call CAU_UserInputMenus_fnc_text;
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;