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
	["B_MBT_01_TUSK_F",60],
	["I_Truck_02_ammo_F",30],
	["O_Truck_02_Ammo_F",30],
	["O_Truck_03_ammo_F",30]];

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

ASTDropVehicles = [["B_Quadbike_01_F",25],
	["B_MRAP_01_F",45],
	["B_MRAP_01_hmg_F",80],
	["B_G_Offroad_01_armed_F",60],
	["B_G_Offroad_01_AT_F",90],
	["B_APC_Wheeled_01_cannon_F",140],
	["B_APC_Tracked_01_rcws_F",170]];

ASTFOBvehicles = [["B_Quadbike_01_F",5],
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
	["B_MBT_01_TUSK_F",180],
	["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",50],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",60]];

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
	["B_MBT_01_TUSK_F",60],
	["I_Truck_02_ammo_F",30],
	["O_Truck_02_Ammo_F",30],
	["O_Truck_03_ammo_F",30],
	["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",20],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",20]];

ASTvehiclesR = ASTvehicles apply {_x select 0};
ASTFOBvehiclesR = ASTFOBvehicles apply {_x select 0};
ASTvehiclesR append ["I_Truck_02_ammo_F","O_Truck_02_Ammo_F","O_Truck_03_ammo_F"];

// ASTAirListRP = 환불가격
// ASTAirList = 스폰가격
// ASTAirListR = 확인용

ASTAirList = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",50],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",60],
	["B_T_VTOL_01_vehicle_F",100],
	["B_T_VTOL_01_infantry_F",100]];
	//["B_Plane_Fighter_01_Stealth_F",240],
	//["I_Plane_Fighter_04_F",280],
	//["I_Plane_Fighter_03_dynamicLoadout_F",240]];

ASTAirListRP = [["B_Heli_Light_01_F",15],
	["B_Heli_Light_01_dynamicLoadout_F",20],
	["B_Heli_Transport_01_F",25],
	["B_Heli_Transport_03_unarmed_F",40],
	["I_Heli_light_03_dynamicLoadout_F",20],
	["B_T_VTOL_01_vehicle_F",80],
	["B_T_VTOL_01_infantry_F",100]];
	//["B_Plane_Fighter_01_Stealth_F",140],
	//["I_Plane_Fighter_04_F",140],
	//["I_Plane_Fighter_03_dynamicLoadout_F",140]

ASTAirListR = ASTairlist apply {_x select 0};

ASTAirSpawnList = ASTAirList apply {
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

ASTvehiclesSpawnList = ASTvehicles apply {
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

ASTdropSpawnList = ASTDropVehicles apply {
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

ASTFOBSpawnList = ASTFOBVehicles apply {
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
publicVariable "ASTFOBvehicles";
publicVariable "ASTFOBvehiclesR";
publicVariable "ASTFOBvehiclesRP";
publicVariable "ASTAirSpawnList";
publicVariable "ASTAirList";
publicVariable "ASTAirListR";
publicVariable "ASTAirListRP";
publicVariable "ASTDropVehicles";
publicVariable "ASTdropSpawnList";
publicVariable "ASTFOBSpawnList";
