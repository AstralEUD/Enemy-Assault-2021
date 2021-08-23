_listselected = player getVariable ["ast_listselected",ObjNull];
_index = AST_weaponlist find _listselected;
_price = (AST_weaponPrice select _index) select 1;
if (AST_kill_score > _price) then {
	AST_kill_score = AST_kill_score - _price;
	_cfgName = _listSelected call AST_fnc_getConfigClass;
	_displayName = getText (_cfgName >> "displayName");
	_hintformat = format ["%1님이 %2구매에 성공하셨습니다!",name player, _displayName];
	["아스널 언락 축하 알림",_hintformat] remoteExec ["BIS_fnc_showSubtitle",0];
	AST_remain = AST_remain - [_listselected];
	AST_purchased pushBackUnique _listselected;
	[player, "weaponlist", AST_purchased] remoteExec ['AST_fnc_db_save', 2, false];
	AST_limitedItems = AST_limitedItems - [_listselected];
	[] execVM "ast\arsenal\arsenal_Search.sqf";
} else {
	systemchat "Some error occured: Report to admin";
};
closeDialog 0;