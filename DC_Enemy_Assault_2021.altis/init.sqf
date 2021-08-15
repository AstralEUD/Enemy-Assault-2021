// Create a mission entry for the server and client RPT file, easier to debug when you know what mission created the error
diag_log text ""; 
diag_log text format["|=============================   %1   =============================|", missionName]; // stamp mission name
diag_log text "";

//Detect ACE
ghst_acemod = false;
/*if (isClass(configFile >> "cfgPatches" >> "ace_main")) then {
	ghst_acemod = true;
} else {
	ghst_acemod = false;
};

_PARAM_RHS = "PARAM_RHS" call BIS_fnc_getParamValue;
if ((isClass(configFile >> "CfgPatches" >> "rhs_main")) and (_PARAM_RHS == 1)) then {
	ghst_rhsmod = true;
} else {
	ghst_rhsmod = false;
};
*/

enableSaving [false, false];

if !(worldName == "Enoch") then {
	_mrkr = getPosATL base;
	"respawn_west" setMarkerPosLocal [_mrkr select 0, _mrkr select 1,  _mrkr select 2];
} else {
	_mrkr = getPosASL base;
	"respawn_west" setMarkerPosLocal [_mrkr select 0, _mrkr select 1,  (_mrkr select 2) + 0.2];
};

CIVILIAN setFriend [WEST, 1];
WEST setFriend [CIVILIAN, 1];
EAST setFriend [CIVILIAN, 1];
INDEPENDENT setFriend [CIVILIAN, 1];

//Create new locations in areas that have none
switch (worldName) do {
	case "Altis": {
		//Create Village on SW Area and Ghost Hotel
		ghst_ghost_hotel = createLocation [ "NameLocal" , [21883.5,20980.5,0], 800, 800];
		ghst_ghost_hotel setText "Ghost Hotel";

		ghst_Farmland = createLocation [ "NameLocal" , [10300.5,9399.63,0], 1500, 1500];
		ghst_Farmland setText "Farmland";
		};

	case "Malden": {
		//Create Military base on SE island East end and North abandoned military area 
		ghst_milbase1 = createLocation [ "NameLocal" , [11629,4456.28,0], 800, 800];
		ghst_milbase1 setText "Military Base";
		
		ghst_milbase2 = createLocation [ "NameLocal" , [6098.17,10759.2,0], 500, 500];
		ghst_milbase2 setText "Military Base";
	};
};



// Wait until player is initialized
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};

tf_no_auto_long_range_radio = true;

//["Preload"] call BIS_fnc_arsenal;
