[
    [false,""],
    "관리자가 채팅으로 알려준 디버그 키를 입력하세요!",
    {
        if _confirmed then {
            [player, _text] remoteExecCall ["ast_fnc_debugcheck", 2];
        } else {
            systemChat "취소하셨습니다";
        };
    },
    "실행",
    ""
] call CAU_UserInputMenus_fnc_text;