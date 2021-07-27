/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For spawn list (vehicles)              │
└──────────────────────────────────────────────────────*/

ASTvehicles = [["C_Hatchback_01_sport_F",5],
	["C_Kart_01_F",5],
	["C_Offroad_02_unarmed_F",10],
	["C_Offroad_01_F",10],
	["C_Quadbike_01_F",10],
	["C_SUV_01_F",10],
	["C_Van_01_box_F",5]];

ASTvehiclesR = ["C_Hatchback_01_sport_F",
	"C_Kart_01_F",
	"C_Offroad_02_unarmed_F",
	"C_Offroad_01_F",
	"C_Quadbike_01_F",
	"C_SUV_01_F",
	"C_Van_01_box_F"];

ASTvehiclesSpawnList = [["C_Hatchback_01_sport_F",5],
	["C_Kart_01_F",5],
	["C_Offroad_02_unarmed_F",10],
	["C_Offroad_01_F",10],
	["C_Quadbike_01_F",10],
	["C_SUV_01_F",10],
	["C_Van_01_box_F",5]
	] apply {
	[
		[getText(configFile >> "CfgVehicles" >> _x select 0 >> "displayName")],
		[format ["Points: %1",_x select 1]],
		[getText(configFile >> "CfgVehicles" >> _x select 0 >> "picture")],
		[],
		//[getText(configFile >> "CfgVehicles" >> _x select 0 >> "icon"),[random 1,random 1,random 1,1]],
		getText(configFile >> "CfgVehicles" >> _x select 0 >> "displayName"),
		format ["%1", _x select 0],
		getNumber(configFile >> "CfgVehicles" >> _x select 0 >> "scope")	
	]
};


publicVariable "ASTvehiclesSpawnList";
publicVariable "ASTvehicles";
publicVariable "ASTvehiclesR";