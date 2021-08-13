sleep 60;
["serverOn"] call DiscordEmbedBuilder_fnc_buildCfg;
while {true} do {
	_countAllPlayer = count allPlayers;
	["Player",_countAllPlayer] call DiscordEmbedBuilder_fnc_buildCfg;
	sleep 900;
};
