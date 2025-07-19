/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: 무기 검색 함수                                         │
│                                                                     │
│   Parameters:                                                        │
│   NONE                                                              │
│                                                                     │
│   Returns:                                                          │
│   NONE                                                              │
└─────────────────────────────────────────────────────────────────────*/

// 현재 활성화된 카테고리 탭의 인덱스 가져오기
private _currentCategory = 0;
private _AST_display = findDisplay 1118;
// Make sure we're using the search control with the updated ID (11170)

for "_i" from 0 to 9 do {
    private _btn = _AST_display displayCtrl (11191 + _i);
    private _btnColor = ctrlBackgroundColor _btn;
    
    // 활성화된 버튼은 다른 색상 (하이라이트 색상)
    if (_btnColor select 1 > 0.3) then {
        _currentCategory = _i;
    };
};

// 현재 카테고리로 다시 필터링 - 검색어가 변경되었으므로
[_currentCategory] call AST_fnc_arsenal_filter;
