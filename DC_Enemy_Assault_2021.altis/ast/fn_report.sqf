/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Opens a dialog to send reports to admin via Discord  │
│   Call Example:                                                     │
│   [] call AST_fnc_report;                                           │
└─────────────────────────────────────────────────────────────────────*/

[
    [true,""],
    "어드민에게 디스코드로 알림보내기 (제보/신고)",
    {
        if _confirmed then {
            systemchat "어드민에게 디스코드로 알림을 보냈습니다.";
			_arraytext = [_text, name player];
			["report",_arraytext] remoteExecCall ["DiscordEmbedBuilder_fnc_buildCfg",2];
        } else {
            systemchat "취소하셨습니다.";
        };
    },
    "Send",
    ""  // reverts to default
] call CAU_UserInputMenus_fnc_text;