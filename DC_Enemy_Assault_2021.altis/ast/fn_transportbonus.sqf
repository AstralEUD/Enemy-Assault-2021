/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Tracks and rewards transportation services based on  │
│   distance traveled                                                 │
│   Call Example:                                                     │
│   [] call AST_fnc_transportbonus;                                   │
└─────────────────────────────────────────────────────────────────────*/

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
		_drivern = name _driver;
		_distance = _pos distance (getPos player);
		if ((_distance > 1000) && (vehicle player == player) && (driver _vehicle == _driver)) then {
			_reward = round (_distance / 300);
			[_drivern, _reward] remoteExec ["ast_fnc_serbonus",2];
			//[_reward] remoteExec ["ast_fnc_addMoney", 2];
			//[_reward] remoteExecCall ["AST_fnc_hud_plus",2];
		    //["[수송보너스] 성공적으로 수송하여 " + str _reward + "포인트가 추가되었습니다. 수고하셨습니다!"] remoteExec ["systemChat", _driver];
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
