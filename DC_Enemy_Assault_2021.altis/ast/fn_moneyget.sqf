private ["_money", "_randomMoney", "_subtext"];
_money = nearestObject [position player, 'Land_money_F'];
_randomMoney = _money getVariable ["randomMoney", 1];
AST_kill_score = AST_kill_score + _randomMoney;
[_randomMoney] call AST_fnc_hud_plus;
deleteVehicle _money;