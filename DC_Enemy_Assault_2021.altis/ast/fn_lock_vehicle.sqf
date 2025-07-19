/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Handles vehicle locking system for players           │
│   Call Example:                                                     │
│   [] call AST_fnc_lock_vehicle;                                     │
└─────────────────────────────────────────────────────────────────────*/

player addEventHandler ["GetInMan",{
	_vehicle = vehicle player;
	_owneruid = _vehicle getVariable ["spawner",""];
	_nowowner = _owneruid call BIS_fnc_getUnitByUID;
	_lockcheck = _nowowner getVariable ["ASTLock_Set",0];
	if (_lockcheck == 0) exitWith {diag_log "[ASTRO] Debug Code 05b";};
	if ((_lockcheck == 2) and ((group player) == (group _nowowner))) exitWith {diag_log "[ASTRO] Debug Code 05c";};
	moveOut player;
	hint format ["차량이 잠겨있습니다",_owneruid, _lockcheck, _nowowner];
}];