/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Awards proximity bonus based on distance to kill     │
│   Call Example:                                                     │
│   [_position] call AST_fnc_probonus;                                │
└─────────────────────────────────────────────────────────────────────*/

params ["_killedpos"];
if (isServer) exitWith {};
private _mypos = position player;
private _dist = _killedpos distance2D _mypos;
if (_dist < 200) then {
	[3] call AST_fnc_hud_plus;
	AST_kill_score = AST_kill_score + 1;
} else {
	[2] call AST_fnc_hud_plus;
};