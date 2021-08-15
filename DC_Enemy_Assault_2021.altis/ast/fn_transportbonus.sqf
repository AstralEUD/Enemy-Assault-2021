player addEventHandler ["GetInMan",{
	params ["_unit", "_role", "_vehicle"];
	if ((_role == "driver") && (!isPlayer (driver _vehicle))) exitWith {};
	_pos = getPos player;
	_driver = driver _vehicle;
	[_vehicle, _driver, _pos] spawn {
		params ["_vehicle", "_driver", "_pos"];
		while {(vehicle player == _vehicle)} do {
			sleep 1;
		};
		_distance = _pos distance (getPos player);
		if ((_distance > 1000) && (vehicle player == player) && (driver _vehicle == _driver)) then {
			_reward = round (_distance / 500);
			[_reward] remoteExec ["ast_fnc_addMoney", owner _driver];
		    ["[수송보너스] 성공적으로 수송하여 " + str _reward + "포인트가 추가되었습니다. 수고하셨습니다!"] remoteExec ["systemChat", owner _driver];
		};
	};
}];