/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Sets vehicle lock settings for a player              │
│   Call Example:                                                     │
│   [_setting, player] call AST_fnc_lockset;                          │
└─────────────────────────────────────────────────────────────────────*/

params ["_set","_player"];
_player setVariable ["ASTLock_Set", _set, true];
hint "차량 잠금 설정 완료!";