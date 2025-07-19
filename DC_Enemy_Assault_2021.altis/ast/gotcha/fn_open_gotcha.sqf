/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Opens the Gotcha (gacha) system and randomizes       │
│   rewards based on probability                                      │
│   Call Example:                                                     │
│   [_target, _caller, _actionId, _args] call AST_fnc_open_gotcha;    │
└─────────────────────────────────────────────────────────────────────*/

params ["_target","_caller","_actionId","_a0"];
_randomn = random [0, 50, 100];
if (_randomn > 97) then {
	["vorona"] call ast_fnc_unlock_gotcha;
} else {
	if (_randomn > 92) then {
		["MRPL"] call ast_fnc_unlock_gotcha;
	} else {
		if (_randomn > 87) then {
			["MAAWS"] call ast_fnc_unlock_gotcha;
		} else {
			if (_randomn > 79) then {
				["3GLHE"] call ast_fnc_unlock_gotcha;
			} else {
				if (_randomn > 64) then {
					["3GLMISC"] call ast_fnc_unlock_gotcha;
				} else {
					if (_randomn > 49) then {
						["SPEED"] call ast_fnc_unlock_gotcha;
					} else {
						if (_randomn > 40) then {
							["MONEY"] call ast_fnc_unlock_gotcha;
						} else {
							if (_randomn > 0) then{
								["GGWANG"] call ast_fnc_unlock_gotcha;
							};
						};
					};
				};
			};
		};
	};
};
sleep 2;
deleteVehicle _target;