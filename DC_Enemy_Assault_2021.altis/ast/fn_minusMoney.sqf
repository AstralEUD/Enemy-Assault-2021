/*────────────────────────────────────────────────────────────────────┐
│   Author: lululala22                                                │
│                                                                     │
│   Description: For read money from DB                               │
│   Call Example:                                                     │
│   [player] remoteExecCall ["AST_fnc_fetch_money", 2, false];        │
│        Use 'AST_kill_score' variable                                │
└─────────────────────────────────────────────────────────────────────*/

params ["_remove"];
if (isNil "AST_kill_score") then {
	AST_kill_score = 0;
};
AST_kill_score = AST_kill_score - _remove;
