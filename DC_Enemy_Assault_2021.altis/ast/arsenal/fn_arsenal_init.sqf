disableSerialization;
_AST_display = findDisplay 1118;
_ctrlList = _AST_display displayCtrl 11181; 
{
	_cfgName = _x call AST_fnc_getConfigClass;
	_displayName = getText (_cfgName >> "displayName");
	_ctrlList lbAdd _displayName;
	_ctrlList lbSetToolTip [_foreachindex, _x];
	_ctrlList lbSetPicture [_foreachindex, getText (_cfgName >> "editorPreview")];
	_index = AST_weaponlist find _x;
	_price = (AST_weaponPrice select _index) select 1;
	_ctrlList lbSetTextRight [_foreachindex,str _price];
	if (_price > AST_kill_score) then {
		_ctrlList lbSetSelectColorRight [_foreachindex, [186, 13, 13, 1]];
	} else {
		_ctrlList lbSetSelectColorRight [_foreachindex, [82, 242, 64, 1]];
	};
	_ctrlList lbSetValue [_foreachindex, _price];
} forEach AST_weaponlist;

_ctrlMainTitle = _AST_display displayCtrl 11182;
_ctrlMainTitle ctrlSetStructuredText parseText
"<t align = 'center'> EA2021 아스널 언락 상점 </t>";
_ctrlPtsTitle = _AST_display displayCtrl 11183;
_ctrlPtsTitle ctrlSetStructuredText formatText ["%1 pts",AST_kill_score];

_ctrlSelectedName = _AST_display displayCtrl 11185;
_ctrlSelectedPic = _AST_display displayCtrl 11184;
_ctrlSelecetedDesc = _AST_display displayCtrl 11186;
_ctrlButton = _AST_display displayCtrl 11187;

_ctrlButton ctrlEnable false;

addMissionEventHandler ["EachFrame", {
	_AST_display = findDisplay 1118;
	_ctrlSelectedName = _AST_display displayCtrl 11185;
	_ctrlSelectedPic = _AST_display displayCtrl 11184;
	_ctrlSelecetedDesc = _AST_display displayCtrl 11186;
	_ctrlButton = _AST_display displayCtrl 11187;
	_ctrlList = _AST_display displayCtrl 11181; 
	//_tempSelected = (lbSelection _ctrlList) select 0;
	if (count (lbSelection _ctrlList) == 0) then {
		_listSelected = 0;
	};
	_listSelected = (lbSelection _ctrlList) select 0;
	_listSelectedClass = AST_weaponlist select _listSelected;
	_Higherclass = ["srifle_GM6_F","srifle_GM6_camo_F","srifle_GM6_ghex_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F"];
	player setVariable ["ast_listselected", _listSelectedClass, false];
	_selectedindex = AST_weaponlist find _listSelectedClass;
	_selectedPrice = (AST_weaponPrice select _selectedindex) select 1;
	_SelectedcfgName = _listSelectedClass call AST_fnc_getConfigClass;
	_SelecteddisplayName = getText (_SelectedcfgName >> "displayName");
	_SelectedPicture = getText (_SelectedcfgName >> "picture");
	_ctrlSelectedName ctrlSetText format ["%1 [%2 Points]",_SelecteddisplayName,_SelectedPrice];
	_ctrlSelectedPic ctrlSetText _SelectedPicture;
	if ((AST_purchased find _listSelectedClass) > 0) then {
		_ctrlButton ctrlEnable false;
		_ctrlButton ctrlSetTooltip "이미 구매한 무기입니다.";
	} else {
		if ((_Higherclass find _listSelectedClass) != -1) then{
			if (count AST_purchased < 8) then {
				_ctrlButton ctrlSetToolTip "8개 이상의 아이템을 언락해야 구매할 수 있는 고급 아이템입니다.";
				_ctrlButton ctrlEnable false;
			} else {
				if (_selectedPrice < AST_kill_score) then {
					_ctrlButton ctrlEnable true;
					_ctrlButton ctrlSetTooltip "구매 버튼입니다.";
				} else {
					_ctrlButton ctrlSetToolTip "판매 가격이 현재 플레이어의 가격보다 비싸 구매할 수 없습니다.";
					_ctrlButton ctrlEnable false;
				};
			};
		} else {
			if (_selectedPrice < AST_kill_score) then {
				_ctrlButton ctrlEnable true;
				_ctrlButton ctrlSetTooltip "구매 버튼입니다.";
			} else {
				_ctrlButton ctrlSetToolTip "판매 가격이 현재 플레이어의 가격보다 비싸 구매할 수 없습니다.";
				_ctrlButton ctrlEnable false;
			};
		};
	};
	if (!dialog) then {
		removeMissionEventHandler ["EachFrame", _thisEventHandler];
	};
}];

