/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: 무기 카테고리 필터링 함수                             │
│                                                                     │
│   Parameters:                                                        │
│   0: NUMBER - 선택된 카테고리 인덱스 (0: 전체, 1: 돌격소총, 등)      │
│                                                                     │
│   Returns:                                                          │
│   NONE                                                              │
└─────────────────────────────────────────────────────────────────────*/

params [["_categoryIndex", 0, [0]]];

// 탭 버튼 컨트롤 가져오기
private _AST_display = findDisplay 1118;
private _categoryButtons = [];
for "_i" from 0 to 9 do {
    _categoryButtons pushBack (_AST_display displayCtrl (11191 + _i));
};

// 검색 필드 컨트롤
private _ctrlSearch = _AST_display displayCtrl 11170; // Updated to match new control ID

// 모든 버튼 기본 색상으로 초기화
{
    _x ctrlSetBackgroundColor [0.2, 0.2, 0.2, 1];
} forEach _categoryButtons;

// 선택된 버튼 하이라이트
if (_categoryIndex >= 0 && _categoryIndex < count _categoryButtons) then {
    (_categoryButtons select _categoryIndex) ctrlSetBackgroundColor [0.2, 0.4, 0.6, 1];
};

// 리스트 초기화
private _ctrlList = _AST_display displayCtrl 11181;
lbClear _ctrlList;

// 검색어 가져오기
private _searchText = toLower (ctrlText _ctrlSearch);

// 필터링된 무기 목록
private _filteredList = [];

// 카테고리별 필터링
switch (_categoryIndex) do {
    case 0: { // 전체
        _filteredList = AST_weaponlist;
    };
    case 1: { // 돌격소총
        _filteredList = AST_weaponlist select {
            _x find "arifle_" == 0 && {!(_x find "GL" > 0)}
        };
    };
    case 2: { // 정밀사격소총
        _filteredList = AST_weaponlist select {
            _x find "srifle_DMR_" >= 0 || _x find "arifle_SPAR_03_" >= 0
        };
    };
    case 3: { // 저격소총
        _filteredList = AST_weaponlist select {
            _x find "srifle_LRR_" >= 0 || _x find "srifle_GM6_" >= 0
        };
    };
    case 4: { // 기관단총
        _filteredList = AST_weaponlist select {
            _x find "SMG_" == 0 || _x find "hgun_PDW2000_F" >= 0
        };
    };
    case 5: { // 기관총
        _filteredList = AST_weaponlist select {
            _x find "LMG_" == 0 || _x find "MMG_" == 0 || _x find "arifle_RPK12_" >= 0
        };
    };
    case 6: { // 권총
        _filteredList = AST_weaponlist select {
            _x find "hgun_" == 0 && {!(_x find "PDW" > 0)}
        };
    };
    case 7: { // 폭발물
        _filteredList = AST_weaponlist select {
            _x find "launch_" == 0 || 
            _x == "SatchelCharge_Remote_Mag" || 
            _x == "DemoCharge_Remote_Mag" || 
            _x find "Mine_" > 0
        };
    };
    case 8: { // 악세사리
        _filteredList = AST_weaponlist select {
            _x find "optic_" == 0 || 
            _x find "acc_" == 0 || 
            _x find "bipod_" == 0 || 
            _x find "muzzle_" == 0
        };
    };
    case 9: { // 기타
        _filteredList = AST_weaponlist select {
            !(_x find "arifle_" == 0 || 
              _x find "srifle_" == 0 || 
              _x find "SMG_" == 0 || 
              _x find "hgun_" == 0 || 
              _x find "launch_" == 0 || 
              _x find "optic_" == 0 || 
              _x find "acc_" == 0 || 
              _x find "bipod_" == 0 || 
              _x find "muzzle_" == 0 || 
              _x find "LMG_" == 0 || 
              _x find "MMG_" == 0)
        };
    };
    default {
        _filteredList = AST_weaponlist;
    };
};

// 검색어로 추가 필터링
if (_searchText != "") then {
    _filteredList = _filteredList select {
        private _weaponName = toLower (getText ((configFile >> "CfgWeapons" >> _x) >> "displayName"));
        if (_weaponName == "") then {
            _weaponName = toLower (getText ((configFile >> "CfgMagazines" >> _x) >> "displayName"));
        };
        if (_weaponName == "") then {
            _weaponName = toLower _x;
        };
        _weaponName find _searchText > -1
    };
};

// 필터링된 목록으로 리스트 채우기
{
    private _className = _x;
    private _cfgName = _className call AST_fnc_getConfigClass;
    private _displayName = getText (_cfgName >> "displayName");
    private _picture = getText (_cfgName >> "picture");
    private _index = AST_weaponlist find _className;
    private _price = (AST_weaponPrice select _index) select 1;
    
    private _lbIndex = _ctrlList lbAdd _displayName;
    _ctrlList lbSetTooltip [_lbIndex, _displayName];
    _ctrlList lbSetPicture [_lbIndex, _picture];
    _ctrlList lbSetTextRight [_lbIndex, str _price];
    
    if (_price > AST_kill_score) then {
        _ctrlList lbSetSelectColorRight [_lbIndex, [1, 0.2, 0.2, 1]];
        _ctrlList lbSetColorRight [_lbIndex, [1, 0.2, 0.2, 1]];
    } else {
        _ctrlList lbSetSelectColorRight [_lbIndex, [0.3, 1, 0.3, 1]];
        _ctrlList lbSetColorRight [_lbIndex, [0.3, 1, 0.3, 1]];
    };
    
    // 이미 구매한 아이템은 다른 색으로 표시
    if ((AST_purchased find _className) > 0) then {
        _ctrlList lbSetColor [_lbIndex, [0.5, 0.5, 1, 1]];
    };
    
    _ctrlList lbSetValue [_lbIndex, _price];
    _ctrlList lbSetData [_lbIndex, _className];
} forEach _filteredList;

// 정렬 드롭다운 선택에 따라 목록 정렬
private _ctrlSort = _AST_display displayCtrl 11193;
private _selectedSort = lbCurSel _ctrlSort;
if (_selectedSort != -1) then {
    [] call AST_fnc_arsenal_sort;
};

// 첫 번째 아이템 선택
if (lbSize _ctrlList > 0) then {
    _ctrlList lbSetCurSel 0;
};
