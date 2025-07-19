/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Handles money pickup from objects with chance for    │
│   bonus Gotcha ticket                                               │
│   Call Example:                                                     │
│   [] call AST_fnc_moneyget;                                         │
└─────────────────────────────────────────────────────────────────────*/

private ["_money", "_randomMoney", "_subtext"];
if (isServer) exitWith {};
_money = nearestObject [position player, 'Land_money_F'];
_randomMoney = _money getVariable ["randomMoney", 1];
AST_kill_score = AST_kill_score + _randomMoney;
[_randomMoney] call AST_fnc_hud_plus;
if ((random 1) < 0.3) then {
	AST_gotcha_ticket = AST_gotcha_ticket + 1;
	private _text = format ["%1원과 갓챠 티켓을 획득하였습니다.",_randomMoney];
} else {
	private _text = format ["%1원을 획득하였습니다.",_randomMoney];
};
//["전리품 알림",_text] spawn BIS_fnc_showSubtitle;
deleteVehicle _money;