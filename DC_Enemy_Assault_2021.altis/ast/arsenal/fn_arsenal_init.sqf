waitUntil {count AST_remain > 0};
disableSerialization;
_AST_display = findDisplay 1118;
_ctrlList = _AST_display displayCtrl 11181; 
{
	_cfgName = _x call AST_fnc_getConfigClass;
	_displayName = getText (_cfgName >> "displayName");
	_ctrlList lbAdd _displayName;
	_ctrlList lbSetToolTip [_foreachindex, _x];
	_ctrlList lbSetPicture [_foreachindex, getText (_cfgName >> "picture")];
	_price = (AST_weaponPrice find _x) select 1;
	_ctrlList lbSetTextRight [_foreachindex,_price];
	if (_price > AST_kill_score) then {
		_ctrlList lbSetSelectColorRight [_foreachindex, [186, 13, 13, 1]];
	} else {
		_ctrlList lbSetSelectColorRight [_foreachindex, [82, 242, 64, 1]];
	};
	_ctrlList lbSetValue [_foreachindex, _price];
	lbSortByValue _ctrlList;
} forEach AST_remain;

_ctrlMainTitle = _AST_display displayCtrl 11182;
_ctrlMainTitle ctrlSetStructuredText parseText
"<t align = 'center'> EA2021 아스널 언락 상점 </t>";
_ctrlPtsTitle = _AST_display displayCtrl 11183;
_ctrlPtsTitle ctrlSetStructuredText formatText ["%1 pts",AST_kill_score];

_ctrlSelectedName = _AST_display displayCtrl 11185;
_ctrlSelectedPic = _AST_display displayCtrl 11184;
_ctrlSelecetedDesc = _AST_display displayCtrl 11186;

addMissionEventHandler ["EachFrame", {
	_listSelected = lbSelection _ctrlList;
	_listSelectedClass = AST_remain select _listSelected;
	_selectedPrice = (AST_weaponPrice find _listSelectedClass) select 1;
	_SelectedcfgName = _listSelectedClass call AST_fnc_getConfigClass;
	_SelecteddisplayName = getText (_SelectedcfgName >> "displayName");
	_SelectedPicture = getText (_SelectedcfgName >> "picture");
	_ctrlSelectedName ctrlSetText format ["%1 [%2 Points]",_SelecteddisplayName,_SelectedPrice];
	_ctrlSelectedPic ctrlSetText _SelectedPicture;
	if (!dialog) then {
		removeMissionEventHandler ["EachFame", _thisEventHandler];
	};
}];

