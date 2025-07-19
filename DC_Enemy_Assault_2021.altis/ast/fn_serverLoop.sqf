/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Main server loop handling time acceleration,          │
│   player reporting to Discord, and cleanup                           │
│   Call Example:                                                     │
│   [] spawn AST_fnc_serverLoop;                                      │
└─────────────────────────────────────────────────────────────────────*/

sleep 60;
["serverOn"] call DiscordEmbedBuilder_fnc_buildCfg;

while {true} do {
	sleep 450;
	_countAllPlayer = [count allPlayers];
	_nowtime = dayTime;
	_hours = floor _nowtime;
	if ((_hours > 6) && (_hours < 18)) then {
		setTimeMultiplier 4;
	} else {
		setTimeMultiplier 12;
	};
	if (count allPlayers != 0) then {
		_nameAllPlayer = "";
		{
			_nameAllPlayer = (name _x) + " , "+ _nameAllPlayer;
		} forEach allPlayers;
		_AllPlayer = _countAllPlayer + [_nameAllPlayer];
		["Player",_AllPlayer] call DiscordEmbedBuilder_fnc_buildCfg;
		if (count ASTAirArray > 1) then {
			ASTAirArray deleteAt (ASTAirArray findIf {!alive _x});
		};
	};
	sleep 450;
	{ deleteVehicle _x } forEach allDead;
};
