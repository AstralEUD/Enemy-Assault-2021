/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Rewards players for rescuing POWs                    │
│   Call Example:                                                     │
│   [_rescuedUnit] call AST_fnc_rescueReward;                         │
└─────────────────────────────────────────────────────────────────────*/

params ["_pow"];
_group = group _pow;
_units = units _group;
{
	["rescue"] remoteExec ["ast_fnc_killalert", owner _x];
} forEach _units;