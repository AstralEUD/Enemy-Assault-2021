disableSerialization;
_AST_display = findDisplay 1118;
_ctrlList = _AST_display displayCtrl 11181;
_ctrlSort = _AST_display displayCtrl 11193;

// 정렬 옵션 초기화
_ctrlSort lbAdd "이름순";
_ctrlSort lbAdd "가격 낮은순";
_ctrlSort lbAdd "가격 높은순";
_ctrlSort lbAdd "구매 가능순";
_ctrlSort lbSetCurSel 0;

// 초기 카테고리 필터 (전체)
[0] call AST_fnc_arsenal_filter;

_ctrlMainTitle = _AST_display displayCtrl 11182;
_ctrlMainTitle ctrlSetStructuredText parseText
"<t align = 'center' size='1.2'><img image='\a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa' size='1.2'/> ASTRO 아스널 언락 상점 </t>";
_ctrlPtsTitle = _AST_display displayCtrl 11183;
_ctrlPtsTitle ctrlSetStructuredText parseText format ["<t align='right' color='#A3E0FF' size='1.2'>%1 ₩</t>", AST_kill_score];_ctrlSelectedName = _AST_display displayCtrl 11185;
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
	private _listSelected = -1;
	if (count (lbSelection _ctrlList) == 0) then {
		_listSelected = 0;
	} else {
		_listSelected = (lbSelection _ctrlList) select 0;
	};
	
	// 올바른 항목을 가져오기 위해 수정
	private _listSelectedClass = _ctrlList lbData _listSelected;
	private _Higherclass = ["srifle_GM6_F","srifle_GM6_camo_F","srifle_GM6_ghex_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F"];
	player setVariable ["ast_listselected", _listSelectedClass, false];
	private _selectedindex = AST_weaponlist find _listSelectedClass;
	private _selectedPrice = (AST_weaponPrice select _selectedindex) select 1;
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

