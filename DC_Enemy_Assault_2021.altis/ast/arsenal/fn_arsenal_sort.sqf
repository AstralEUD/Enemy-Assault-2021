/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: 무기 정렬 함수                                         │
│                                                                     │
│   Parameters:                                                        │
│   NONE                                                              │
│                                                                     │
│   Returns:                                                          │
│   NONE                                                              │
└─────────────────────────────────────────────────────────────────────*/

private _AST_display = findDisplay 1118;
private _ctrlList = _AST_display displayCtrl 11181;
private _ctrlSort = _AST_display displayCtrl 11193;

private _selectedIndex = lbCurSel _ctrlSort;

if (_selectedIndex == -1) exitWith {};

// 현재 목록의 모든 아이템을 배열로 저장
private _items = [];
for "_i" from 0 to (lbSize _ctrlList) - 1 do {
    _items pushBack [
        _ctrlList lbText _i,
        _ctrlList lbValue _i,
        _ctrlList lbData _i,
        _ctrlList lbPicture _i,
        _ctrlList lbColor _i,
        _ctrlList lbColorRight _i
    ];
};

// 정렬 방식에 따라 정렬
switch (_selectedIndex) do {
    case 0: { // 알파벳순
        _items sort true; // 이름 기준 오름차순
    };
    case 1: { // 가격 낮은순
        _items = [_items, [], {_x select 1}, "ASCEND"] call BIS_fnc_sortBy;
    };
    case 2: { // 가격 높은순
        _items = [_items, [], {_x select 1}, "DESCEND"] call BIS_fnc_sortBy;
    };
    case 3: { // 구매 가능 먼저
        _items = [_items, [], {if (_x select 1 <= AST_kill_score) then {0} else {1}}, "ASCEND"] call BIS_fnc_sortBy;
    };
};

// 리스트 초기화 후 정렬된 아이템들 다시 추가
lbClear _ctrlList;

{
    _x params ["_name", "_value", "_data", "_picture", "_color", "_colorRight"];
    
    private _index = _ctrlList lbAdd _name;
    _ctrlList lbSetValue [_index, _value];
    _ctrlList lbSetData [_index, _data];
    _ctrlList lbSetPicture [_index, _picture];
    _ctrlList lbSetColor [_index, _color];
    _ctrlList lbSetColorRight [_index, _colorRight];
    _ctrlList lbSetTextRight [_index, str _value];
    
    if (_value > AST_kill_score) then {
        _ctrlList lbSetSelectColorRight [_index, [1, 0.2, 0.2, 1]];
    } else {
        _ctrlList lbSetSelectColorRight [_index, [0.3, 1, 0.3, 1]];
    };
} forEach _items;

// 원래 선택한 아이템 유지 시도
if (lbSize _ctrlList > 0) then {
    _ctrlList lbSetCurSel 0;
};
