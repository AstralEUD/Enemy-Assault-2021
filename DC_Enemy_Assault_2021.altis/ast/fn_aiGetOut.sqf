/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Makes AI units get out of the player's vehicle       │
│   Call Example:                                                     │
│   [] call AST_fnc_aiGetOut;                                         │
└─────────────────────────────────────────────────────────────────────*/

private _list = fullCrew (vehicle player);
_seclist = [];
{
	if (!isPlayer (_x select 0)) then {
		_seclist pushBack (_x select 0);
	};
} forEach _list;
if (count _seclist == 0) exitWith {hint "AI가 탑승하고 있지 않습니다. 다시 확인해 주세요!";};
{
	moveOut _x;
} forEach _seclist;
hint "AI를 내리도록 하였습니다!";
