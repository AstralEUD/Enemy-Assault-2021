sleep 60;
["serverOn"] call DiscordEmbedBuilder_fnc_buildCfg;

ASTRewardArray = [];

while {true} do {
	_countAllPlayer = [count allPlayers];
	if (count allPlayers != 0) then {
		["Player",_countAllPlayer] call DiscordEmbedBuilder_fnc_buildCfg;
		if (count ASTAirArray > 1) then {
			ASTAirArray deleteAt (ASTAirArray findIf {!alive _x});
		};
	};
	sleep 900;
};
