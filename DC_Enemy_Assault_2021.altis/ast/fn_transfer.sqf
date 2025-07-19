/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Creates an interface for transferring points to      │
│   other players                                                     │
│   Call Example:                                                     │
│   [] call AST_fnc_transfer;                                         │
└─────────────────────────────────────────────────────────────────────*/

params ["_PlayerList","_PlayerNameList","_TransferList","_Money","_value"];
PlayerList = call BIS_fnc_listPlayers;
_PlayerNameList = PlayerList apply {
	[
		[name _x],
		[],
		[],
		[],
		name _x
	]
};

[
	[
		_PlayerNameList,
		0, // Selects the quadbike by default
		false // Multi select disabled
	],
	"ASTRO 송금",
	{
		/*systemchat format["_confirmed: %1",_confirmed];
		systemchat format["_index: %1",_index];
		systemchat format["_data: %1",_data];
		systemchat format["_value: %1",_value];*/
		if (_confirmed == True) then {
			AST_selected = PlayerList select _index;
			[
				[false,""],
				"얼마를 송금하시겠습니까?",
				{
					if _confirmed then {
						_Moneycheck1 = [".", _Money, false] call BIS_fnc_inString;
						_Moneycheck2 = ["-", _Money, false] call BIS_fnc_inString;
						if ((_Moneycheck1 == true) or (_Moneycheck2 == true)) exitWith {systemChat "취약점 방지";};
						_Money = parseNumber _text;
						if (AST_kill_score < _Money) exitWith {systemchat "송금할려는 돈이 가지고 있는 돈보다 많습니다. 다시 확인하세요.";};
						if (_Money < 0) exitWith {systemChat "입력이 잘못되었습니다. 다시 확인하세요.";};
						if (AST_selected == Player) exitWith {systemChat "송금할려는 대상과 본인이 같습니다.";};
						AST_kill_score = AST_kill_score - _Money;
						[_Money] call AST_fnc_hud_minus;
						[_Money] remoteExec ["ast_fnc_addMoney",AST_selected];
						[player, 'kill_score', AST_kill_score] remoteExec ['AST_fnc_db_save', 2, false];
						_sendername = name player;
						_textformat = format ["[송금알림]%1 님이 %2 포인트를 송금하셨습니다.",str _sendername, str _Money];
						[_Money] remoteExecCall ["AST_fnc_hud_plus",AST_selected];
						[_textformat] remoteExec ["systemChat", AST_selected];
						_arraytext = [_sendername, _Money,name AST_selected];
						["transfer",_arraytext] remoteExecCall ["DiscordEmbedBuilder_fnc_buildCfg",2];
						systemChat "송금 완료!";
					};
				},
				"송금",
				""
			] call CAU_UserInputMenus_fnc_text;
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;