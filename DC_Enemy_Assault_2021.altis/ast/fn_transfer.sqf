params ["_PlayerList","_PlayerNameList","_TransferList","_Money"];
_PlayerList = call BIS_fnc_listPlayers;
_PlayerNameList = _PlayerList;
_PlayerNameList apply {name _x};
[player] remoteExec ["AST_fnc_fetch_money", 2, false];
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
						if (AST_kill_score < _Money) exitWith {systemchat "송금할려는 돈이 가지고 있는 돈보다 많습니다. 다시 확인하세요.";};
						if (_text == "0") exitWith {systemChat "입력이 잘못되었습니다. 다시 확인하세요."};
						_Target = _PlayerList select _index;
						_tobe = AST_kill_score - _Money;
						[
							[
								5,"a3\ui_f\data\gui\cfg\notifications\tridentenemy_ca.paa",
								true, // Overlay mode
								stance player,
								{stance player == _this}, // Abort if player changes stance
								{systemchat format["onProgress %1",diag_tickTime]}
							],
							"진행중, 취소할려면 자세를 바꾸세요",
							{
								systemchat (["취소됨","송금 완료"] select _completed)
								[player, "kill_score", _tobe] remoteExecCall ["AST_fnc_db_save", 2, false];
								[_Target] remoteExec ["AST_fnc_fetch_another", 2, false];
								_tobe2 = AST_ano_score + _Money;
								[_Target, "kill_score", _tobe2] remoteExecCall ["AST_fnc_db_save", 2, false];

							},
							findDisplay 12 // Create this progress bar on the map display
						] call CAU_UserInputMenus_fnc_progressBar;

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