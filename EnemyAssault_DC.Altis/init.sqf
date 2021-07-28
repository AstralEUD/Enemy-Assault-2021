// Create a mission entry for the server and client RPT file, easier to debug when you know what mission created the error
diag_log text ""; 
diag_log text format["|=============================   %1   =============================|", missionName]; // stamp mission name
diag_log text "";

//Detect ACE
if (isClass(configFile >> "cfgPatches" >> "ace_main")) then {
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

enableSaving [false, false];

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

//------------- DCinside Arma m.gall Server ------------------//

//3Dmarkers//
[] execVM "scripts\3Dmarkers.sqf";

//BaseFire//
[] execVM "scripts\safebase.sqf";

//notice
[] execVM "scripts\s_Welcome_Rule.sqf";

//earplug
[] execVM "scripts\NRE_earplugs.sqf";

//advancedSlingLoad
[] execVM "scripts\fn_advancedSlingLoadingInit.sqf";

//compass
[] execVM "scripts\fn_voyagerCompass.sqf";

//advancedRappellingInit
[] execVM "scripts\fn_advancedRappellingInit.sqf";

//advancedUrbanRappellingInit
[] execVM "scripts\fn_advancedUrbanRappellingInit.sqf";

//advancedTowingInit
[] execVM "scripts\fn_advancedTowingInit.sqf";

//DayMessages
[] execVM "scripts\DayMessages.sqf";

//Wa VAM
[] execVM "VAM_GUI\VAM_GUI_init.sqf";

//Wa PPAP Sans Papyrus undertale
[] execVM "PPAP\PPAP_init.sqf";

//tc
[] execVM "Trait_Changer\TC_init.sqf";

//CRS real
null=[]execVM"CRS\init.sqf";

//igiload
_igiload = execVM "IgiLoad\IgiLoadInit.sqf";

// The years flow
[] execVM "etc\acc_time_server.sqf";

// flip
[] execVM "scripts\fn_flipVeh.sqf";

// nt
[] execVM "NameTags.sqf";

//Strobe//
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};
if (!isDedicated) then {waitUntil {!isNull player && isPlayer player};};
[] execVM "strobe\strobe.sqf";
player addMPEventHandler ["MPRespawn", {Null = _this execVM "strobe\strobe.sqf";}];