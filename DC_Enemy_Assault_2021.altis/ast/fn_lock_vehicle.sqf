player addEventHandler ["GetInMan",{
	params ["_vehicle","_role","_unit","_turret"];
	_owneruid = _vehicle getVariable ["spawner",""];
	_uid = getPlayerUID player;
	if (_uid == _owneruid) exitWith {diag_log "[EA2021] Debug Code 05a";};
	_nowowner = _owneruid call BIS_fnc_getUnitByUID;
	_lockcheck = _nowowner getVariable ["ASTLock_Set",0];
	if (_lockcheck == 0) exitWith {diag_log "[EA2021] Debug Code 05b";};
	if ((_lockcheck == 2) and ((group player) == (group _nowowner))) exitWith {diag_log "[EA2021] Debug Code 05c";};
	doGetOut player;
	hint format ["Failed %1 %2",_owneruid, _lockcheck, _nowowner];
}];