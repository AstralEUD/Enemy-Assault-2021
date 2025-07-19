/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Rewards players for successful transport operations  │
│   Call Example:                                                     │
│   [_driverName, _rewardAmount] call AST_fnc_serbonus;               │
└─────────────────────────────────────────────────────────────────────*/

params["_drivern","_reward"];
_listplayer = call BIS_fnc_listPlayers;
_namelist = _listplayer apply {name _x};
_indexinfo = _listplayer select (_namelist find _drivern);
[_reward] remoteExec ["ast_fnc_addMoney", _indexinfo];
["[수송보너스] 성공적으로 수송하여 " + str _reward + "포인트가 추가되었습니다. 수고하셨습니다!"] remoteExec ["systemChat", "_indexinfo"];
