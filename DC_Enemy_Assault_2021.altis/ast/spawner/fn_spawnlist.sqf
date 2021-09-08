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
	["B_G_Offroad_01_armed_F",10],
	["B_G_Offroad_01_AT_F",25],
	["B_T_LSV_01_AT_F",30],
	["B_APC_Wheeled_01_cannon_F",30],
	["B_APC_Tracked_01_rcws_F",40],
	["B_APC_Tracked_01_AA_F",35],
	//적성장비 보너스
	["I_Truck_02_ammo_F",30],
	["O_Truck_02_Ammo_F",30],
	["O_Truck_03_ammo_F",30],
	["B_MBT_01_TUSK_F",60]];

ASTvehiclesR = ["B_Quadbike_01_F",
	"B_Truck_01_mover_F",
	"B_MRAP_01_F",
	"B_MRAP_01_hmg_F",
	"B_MRAP_01_gmg_F",
	"B_G_Offroad_01_armed_F",
	"B_G_Offroad_01_AT_F",
	"B_T_LSV_01_AT_F",
	"B_APC_Wheeled_01_cannon_F",
	"B_APC_Tracked_01_rcws_F",
	"B_APC_Tracked_01_AA_F",
	//적성장비 보너스
	"I_Truck_02_ammo_F",
	"O_Truck_02_Ammo_F",
	"O_Truck_03_ammo_F",
	"B_MBT_01_TUSK_F"];

ASTvehicles = [["B_Quadbike_01_F",5],
	["B_Truck_01_mover_F",15],
	["B_MRAP_01_F",15],
	["B_MRAP_01_hmg_F",30],
	["B_MRAP_01_gmg_F",50],
	["B_G_Offroad_01_armed_F",20],
	["B_G_Offroad_01_AT_F",50],
	["B_T_LSV_01_AT_F",60],
	["B_APC_Wheeled_01_cannon_F",90],
	["B_APC_Tracked_01_rcws_F",120],
	["B_APC_Tracked_01_AA_F",100],
	["B_MBT_01_TUSK_F",180]];

// ASTAirListRP = 환불가격
// ASTAirList = 스폰가격
// ASTAirListR = 확인용

ASTAirList = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",60],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",90],
	["B_T_VTOL_01_vehicle_F",100],
	["B_T_VTOL_01_infantry_F",100],
	["B_Plane_Fighter_01_F",280],
	["B_Plane_CAS_01_dynamicLoadout_F",320]];

ASTAirListRP = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",20],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",20],
	["B_T_VTOL_01_vehicle_F",80],
	["B_T_VTOL_01_infantry_F",100],
	["B_Plane_Fighter_01_F",140],
	["B_Plane_CAS_01_dynamicLoadout_F",160]];

ASTAirListR = ["B_Heli_Light_01_F",
    "B_Heli_Light_01_dynamicLoadout_F",
    "B_Heli_Transport_01_F",
    "B_Heli_Transport_03_unarmed_F",
	"I_Heli_light_03_dynamicLoadout_F",
	"B_T_VTOL_01_vehicle_F",
	"B_T_VTOL_01_infantry_F",
    "B_Plane_Fighter_01_F",
    "B_Plane_CAS_01_dynamicLoadout_F"];

ASTAirSpawnList = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",60],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",90],
	["B_T_VTOL_01_vehicle_F",100],
	["B_T_VTOL_01_infantry_F",100],
	["B_Plane_Fighter_01_F",280],
	["B_Plane_CAS_01_dynamicLoadout_F",320]
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
	["B_G_Offroad_01_armed_F",20],
	["B_G_Offroad_01_AT_F",50],
	["B_T_LSV_01_AT_F",60],
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
publicVariable "ASTvehiclesRP";
publicVariable "ASTAirSpawnList";
publicVariable "ASTAirList";
publicVariable "ASTAirListR";
publicVariable "ASTAirListRP";