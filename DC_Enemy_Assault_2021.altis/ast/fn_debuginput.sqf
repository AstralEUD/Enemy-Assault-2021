[
    [true,""],
    "관리자가 채팅으로 알려준 디버그 키를 입력하세요!",
    {
        [player, _text] remoteExecCall ["ast_fnc_debugcheck", 2];
    },
    "실행"
] call CAU_UserInputMenus_fnc_text;