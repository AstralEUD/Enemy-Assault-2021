/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For spawn list (vehicles)              │
└──────────────────────────────────────────────────────*/

//ASTvehiclesRP = 환불가격
//ASTvehiclesR = 환불차량 확인용
//ASTvehicles = 스폰가격
//ASTvehiclesSpawnList = 스폰가격 리스트
ASTvehiclesRP = [["B_Quadbike_01_F",5],
	["B_Truck_01_mover_F",15],
	["B_MRAP_01_F",15],
	["B_MRAP_01_hmg_F",15],
	["B_MRAP_01_gmg_F",25],
	["B_APC_Wheeled_01_cannon_F",30],
	["B_APC_Tracked_01_rcws_F",40],
	["B_APC_Tracked_01_AA_F",35],
	["B_MBT_01_TUSK_F",60]];

ASTvehiclesR = ["B_Quadbike_01_F",
	"B_Truck_01_mover_F",
	"B_MRAP_01_F",
	"B_MRAP_01_hmg_F",
	"B_MRAP_01_gmg_F",
	"B_APC_Wheeled_01_cannon_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Tracked_01_AA_F",
	"B_MBT_01_TUSK_F"];

ASTvehicles = [["B_Quadbike_01_F",5],
	["B_Truck_01_mover_F",15],
	["B_MRAP_01_F",15],
	["B_MRAP_01_hmg_F",30],
	["B_MRAP_01_gmg_F",50],
	["B_APC_Wheeled_01_cannon_F",90],
	["B_APC_Tracked_01_rcws_F",120],
	["B_APC_Tracked_01_AA_F",100],
	["B_MBT_01_TUSK_F",180]];

// ASTAirListRP = 환불가격
// ASTAirList = 스폰가격
// ASTAirListR = 확인용

ASTAirList = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_armed_F",50],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["B_Heli_Attack_01_dynamicLoadout_F",150],
	["B_Plane_Fighter_01_F",180],
	["B_Plane_CAS_01_dynamicLoadout_F",250]];

ASTAirListRP = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_armed_F",20],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["B_Heli_Attack_01_dynamicLoadout_F",50],
	["B_Plane_Fighter_01_F",60],
	["B_Plane_CAS_01_dynamicLoadout_F",80]];

ASTAirListR = ["B_Heli_Light_01_F",
    "B_Heli_Light_01_armed_F",
    "B_Heli_Transport_01_F",
    "B_Heli_Transport_03_unarmed_F",
    "B_Heli_Attack_01_dynamicLoadout_F",
    "B_Plane_Fighter_01_F",
    "B_Plane_CAS_01_dynamicLoadout_F"];

ASTAirSpawnList = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_armed_F",50],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["B_Heli_Attack_01_dynamicLoadout_F",150],
	["B_Plane_Fighter_01_F",180],
	["B_Plane_CAS_01_dynamicLoadout_F",250]
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

ASTvehiclesSpawnList = [["B_Quadbike_01_F",5],
	["B_Truck_01_mover_F",15],
	["B_MRAP_01_F",15],
	["B_MRAP_01_hmg_F",30],
	["B_MRAP_01_gmg_F",50],
	["B_APC_Wheeled_01_cannon_F",90],
	["B_APC_Tracked_01_rcws_F",120],
	["B_APC_Tracked_01_AA_F",100],
	["B_MBT_01_TUSK_F",180]
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
publicVariable "ASTAirSpawnList";
publicVariable "ASTAirList";
publicVariable "ASTAirListR";
publicVariable "ASTAirListRP";