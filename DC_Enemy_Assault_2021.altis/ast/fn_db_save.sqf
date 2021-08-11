/*────────────────────────────────────────────────────────────────────────────────────────┐
│   Author: lululala22                                                                    │
│                                                                                         │
│   Description: For write money to DB                                                    │
│   Call Example:                                                                         │
│     [player, "kill_score", score] remoteExecCall ast_fnc_db_save;                       │
│        write number or variable at score                                                │
└─────────────────────────────────────────────────────────────────────────────────────────*/

params ["_player", "_data", "_value"];
_uid = getPlayeruiD _player;
["write", [_uid, _data, _value]] call inidbi;