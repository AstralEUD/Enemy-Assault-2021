private _transbonus = {
	{
		params ["_vehicle", "_driver", "_pos"];
		player addEventHandler ["Killed", {
			terminate _transbonus;
			player removeEventHandler ["Killed", _thisEventHandler];
		}];
		while {(vehicle player == _vehicle)} do {
			sleep 1;
		};
		_distance = _pos distance (getPos player);
		if ((_distance > 1000) && (vehicle player == player) && (driver _vehicle == _driver)) then {
			_reward = round (_distance / 300);
			[_reward] remoteExec ["ast_fnc_addMoney", _driver];
			[_reward] remoteExecCall ["AST_fnc_hud_plus",_driver];
		    ["[수송보너스] 성공적으로 수송하여 " + str _reward + "포인트가 추가되었습니다. 수고하셨습니다!"] remoteExec ["systemChat", _driver];
		};
	};
};

player addEventHandler ["GetInMan",{
	params ["_unit", "_role", "_vehicle"];
	if ((_role == "driver") && (!isPlayer (driver _vehicle))) exitWith {};
	_pos = getPos player;
	_driver = driver _vehicle;
	[_vehicle, _driver, _pos] spawn _transbonus;
}];
