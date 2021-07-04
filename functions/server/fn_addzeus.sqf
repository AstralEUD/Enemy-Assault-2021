//Function called by client to request zeus
if !( isServer ) exitWith {};

params[ "_player" ];

_player assignCurator ghst_zeus;
ghst_zeus setVariable[ "curatorUnitOwner", owner _player ];
//call ghst_fnc_addzeusobjs;
/*
nul = [] spawn {
	while {true} do {
		call ghst_fnc_addzeusobjs;
		sleep 10;
	};
};
*/