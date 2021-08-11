/*────────────────────────────────────────────────────────────────────┐
│   Author: lululala22                                                │
│                                                                     │
│   Description: For read money from DB                               │
│   Call Example:                                                     │
│        [player] remoteExec ["AST_fnc_db_fetch_money", 2, false];    │
│        Use 'AST_kill_score' variable                                │
└─────────────────────────────────────────────────────────────────────*/

params ["_player"];
_id = owner _player;
_uid = getPlayerUID _player;
AST_kill_score = ["read", [_uid, "kill_score", 0]] call inidbi;
_id publicVariableClient "AST_kill_score";
