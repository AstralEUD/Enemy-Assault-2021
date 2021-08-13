sleep 60;
["serverOn"] call DiscordEmbedBuilder_fnc_buildCfg;

while {true} do {
	_countAllPlayer = [count allPlayers];
	["Player",_countAllPlayer] call DiscordEmbedBuilder_fnc_buildCfg;
	if (count ASTAirArray > 1) then {
		ASTAirArray deleteAt (ASTAirArray findIf {!alive _x});
	};
	sleep 900;
};
