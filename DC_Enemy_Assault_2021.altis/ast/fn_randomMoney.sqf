params ["_killedpos"];
_randomMoney = selectRandom [1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,3,5,5,5,8,15];
_money = "Land_money_F" createVehicle _killedpos;
_money addAction ["시체에서 나온 돈 루팅",{
	params ["_target", "_caller", "_actionId", "_arguments"];
	_randomMoney = _this select 3 select 0;
	AST_kill_score = AST_kill_score + _randomMoney;
	_subtext = format ["%1원을 획득하였습니다.",_randomMoney];
	[_subtext] spawn BIS_fnc_showSubtitle;
},[_randomMoney]];
AST_money_array pushBack _money;
