player addEventHandler ["GetIn",{
	params ["_vehicle","_role","_unit","_turret"];
	if (_role != "cargo") exitWith {diag_log "[EA2021] Debug Code 03a";};
	TransDrvier = driver _vehicle;
	TransStartPos = getPosATL player;
	_ownerID = owner player;
	_ownerID publicVariableClient "TransDriver";
	_ownerID publicVariableClient "TransStartPos";
}];

player addEventHandler ["GetOut", {
	params ["_vehicle", "_role", "_unit", "_turret"];
	if (_role != "cargo") exitWith {diag_log "[EA2021] Debug Code 03b";};
	if ((isNil TransDriver) or (isNil TransStartPos)) exitWith {diag_log "[EA2021] Debug Code 03g";};
	private _NowDriver = driver _vehicle; 
	if (TransDrvier != _NowDriver) exitWith {diag_log "[EA2021] Debug Code 03c";};
	private _NowPOS = getPosATL player;
	private _distance = TransStartPos distance2D _NowPOS;
	if (isNil AST_op_pos) exitWith {diag_log "[EA2021] Debug Code 03f";};
	private _OPdis = _NowPOS distance2D AST_op_pos;
	private _BasePos = getMarkerPos "AstAirRearm";
	private _RTBdis = _NowPOS distance2D _BasePos;
	if ((_distance == "1e10") or (_distance <= 1500)) exitWith {diag_log "[EA2021] Debug Code 03d";};
	if ((_OPdis == "1e10") or (_OPdis >= 800) or (_RTBdis == "1e10") or (_RTBdis >= 300)) exitWith {diag_log "[EA2021] Debug Code 03e";};
	_driverID = owner _NowDriver;
	[_NowDriver] remoteExec ["AST_fnc_db_fetch_another", 2, false];
	private _tobe = AST_ano_score + 20;
	[_NowDriver, "kill_score", _tobe] remoteExec ["AST_fnc_db_save", 2, false];
	"[수송보너스] 성공적으로 수송하여 20포인트가 추가되었습니다. 수고하셨습니다!" remoteExec ["systemChat", _driverID];
}];