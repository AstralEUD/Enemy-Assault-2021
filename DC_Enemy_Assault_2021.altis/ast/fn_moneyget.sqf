private ["_money", "_randomMoney", "_subtext"];
_money = nearestObject [position player, 'Land_money_F'];
_randomMoney = _money getVariable ["randomMoney", 1];
AST_kill_score = AST_kill_score + _randomMoney;
_subtext = formattext ["%1원을 획득하였습니다.",_randomMoney];
['전리품 획득 보고',_subtext] spawn BIS_fnc_showSubtitle;
deleteVehicle _money;