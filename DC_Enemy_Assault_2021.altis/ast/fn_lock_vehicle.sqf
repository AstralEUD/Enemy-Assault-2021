player addEventHandler ["GetIn",{
	params ["_vehicle","_role","_unit","_turret"];
	_owneruid = _vehicle getVariable ["spawner",nil];
	_uid = getPlayerUID player;
	if (_uid == _owneruid) exitWith {diag_log "[EA2021] Debug Code 05a";};
	_nowowner = _owneruid call BIS_fnc_getUnitByUID;
	_lockcheck = _nowowner getVariable ["LockSet",0];
	if (_lockcheck == 0) exitWith {diag_log "[EA2021] Debug Code 05b";};
	doGetOut player;
	hint "차 주인이 차를 잠궈놨습니다";
}];