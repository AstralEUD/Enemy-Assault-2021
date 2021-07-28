/*params[ "_player", "_didJIP" ];
waitUntil {getClientStateNumber >= 10};//BRIEFING READ

if (_player iskindof "VirtualCurator_F") then {
	[ _player ] remoteExec[ "ghst_fnc_addzeus", 2 ];
};
*/
waituntil {! isnull player};

//Detect ACE
if (isClass(configFile >> "cfgPatches" >> "ace_main")) then {
	ghst_acemod = true;
} else {
	ghst_acemod = false;
};
//RHS Escalation Detect
_PARAM_RHS = "PARAM_RHS" call BIS_fnc_getParamValue;
_PARAM_FIRAIR = "PARAM_FIRAIR" call BIS_fnc_getParamValue;
if ((isClass(configFile >> "CfgPatches" >> "rhs_main")) and (_PARAM_RHS == 1)) then {
	ghst_rhsmod = true;
	ghst_attackplane = ["RHS_A10","rhsusf_f22","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F"];
	ghst_gunship = "B_T_VTOL_01_armed_F";
	ghst_attachhelo = ["RHS_AH64D_wd","RHS_MELB_AH6M","RHS_UH1Y","RHS_AH1Z_wd","rhs_uh1h_hidf_gunship","B_Heli_Light_01_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F"];
	ghst_transportheli = ["RHS_CH_47F","RHS_UH60M","RHS_UH60M_MEV2","RHS_MELB_H6M","RHS_MELB_MH6M","RHS_UH1Y_UNARMED","rhsusf_CH53E_USMC","rhsusf_CH53E_USMC_GAU21_D","rhs_uh1h_hidf","B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Transport_03_F","B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F"];
	ghst_airliftheli = "rhsusf_CH53E_USMC";
	ghst_escortheli = ["RHS_AH64D_wd_AA", "RHS_AH64D_wd_AA"];
	ghst_escortheli2 = ["RHS_MELB_AH6M", "RHS_AH64D_wd_AA"];
	ghst_inflist = ["rhsusf_airforce_jetpilot","rhsusf_army_ocp_helipilot","rhsusf_army_ocp_helicrew","rhsusf_army_ocp_riflemanat","rhsusf_army_ocp_medic"];
} else {
	ghst_rhsmod = false;
	ghst_attackplane = ["B_Plane_CAS_01_F","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F"];
	ghst_gunship = "B_T_VTOL_01_armed_F";
	ghst_attachhelo = ["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Attack_01_dynamicLoadout_F"];
	ghst_transportheli = ["B_Heli_Transport_01_F","B_Heli_Light_01_F","B_Heli_Transport_03_F","B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F"];
	ghst_airliftheli = "B_Heli_Transport_03_F";
	ghst_escortheli = ["B_Heli_Attack_01_F"];
	ghst_escortheli2 = ["B_Heli_Light_01_dynamicLoadout_F"];
	ghst_inflist = ["B_Pilot_F","B_crew_F","B_helicrew_F","B_Soldier_F","B_medic_F"];
};

	if !(worldName == "Enoch") then {
		ghst_baseaa = [aa1,aa2,aa3,aa4,aa5,aa6,aa7,aa8,aa9,aa10];
	} else {
		ghst_baseaa = [];
	};

if (_PARAM_FIRAIR == 1) then {
	ghst_attackplane append ["FIR_F15C_AIM7","FIR_F15E","FIR_F16C_Makos"];
};

PARAM_Cooldowns = "PARAM_Cooldowns" call BIS_fnc_getParamValue;
PARAM_MAX_GRP_NUM = "PARAM_MAX_GRP_NUM" call BIS_fnc_getParamValue;

call compile preprocessfile "comm_menusub.sqf";

//West Cargo Aircraft type
ghst_air_cargo = "B_T_VTOL_01_vehicle_F";//"B_Heli_Transport_03_F";
if ghst_rhsmod then {ghst_air_cargo = "RHS_C130J";};

if ghst_rhsmod then {
	//call ghst_fnc_rhs_infantrylist;
	call ghst_fnc_rhs_vehiclelist;
	call ghst_fnc_rhs_aircraftlist;
	call ghst_fnc_rhs_boatlist;
} else {
	//call ghst_fnc_infantrylist;
	call ghst_fnc_vehiclelist;
	call ghst_fnc_aircraftlist;
	call ghst_fnc_boatlist;
};

#include "addnotes.sqf"

if (player iskindof "B_recon_JTAC_F") then {
[player,"CAS"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cassup", 0];
player setVariable ["ghst_helosup", 0];
player setVariable ["ghst_helosup2", 0];

[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_remotedes", 0];

[player,"Gunship"] call BIS_fnc_addCommMenuItem;
};
_gunshipvar = (player getVariable "ghst_gunship");
if (isnil "_gunshipvar") then {
	player setVariable ["ghst_gunship", 0];
} else {
	player setVariable ["ghst_gunship", _gunshipvar];
};

if (player iskindof "B_soldier_UAV_F") then {
[player,"UAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_uavsup", 0];
player setVariable ["ghst_ugvsup", [0,0]];
player setVariable ["ghst_puavsup", 0];

[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_remotedes", 0];
};

if (player iskindof "B_Soldier_SL_F") then {
[player,"AMMO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_ammodrop", 0];

[player,"PUAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_puavsup", 0];

[player,"RESPAWNTENT"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_respawntent", 0];
};

[player,"CARGO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cargodrop", 0];

[player,"Transport"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_transport", 0];
player setVariable ["ghst_airlift", 0];

[player,"Group"] call BIS_fnc_addCommMenuItem;
[player,"Settings"] call BIS_fnc_addCommMenuItem;

waituntil { !(isnil "ghst_carlist")};

//addactions for halo and vehspawn. Should ensure them showing even with jip
airspawn1 addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Armor</t> <img size='3' color='#FFA000' shadow='2' image='\A3\armor_f_gamma\MBT_01\Data\UI\Slammer_M2A1_Base_ca.paa'/>", "call ghst_fnc_spawnveh", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_armorlist], 6, true, true, "","alive _target"];
airspawn1 addAction ["<t size='1.5' shadow='2' color='#ff634d'>Spawn Car</t> <img size='3' color='#ff634d' shadow='2' image='\A3\Soft_F_Exp\LSV_01\Data\UI\LSV_01_base_CA.paa'/>", "call ghst_fnc_spawnveh", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_carlist], 6, true, true, "","alive _target"];
airspawn1 addAction ["<t size='1.5' shadow='2' color='#9af2ff'>Spawn Static</t> <img size='3' color='#9af2ff' shadow='2' image='\A3\Static_f_gamma\data\ui\gear_StaticTurret_MG_CA.paa'/>", "call ghst_fnc_spawnveh", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_staticvehlist], 6, true, true, "","alive _target"];

halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];

halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>Group HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [true,1000,60,false], 4, true, true, "","alive _target and (leader group _this == _this)"];

//halo setObjectTexture [0, "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa"];

if (player iskindof "B_Soldier_SL_F") then {
	infostand addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Respawn Tents</t>", "call ghst_fnc_clear_respawn_tents", [], 1, false, false, "","alive _target"];
};	

if (player iskindof "B_soldier_UAV_F") then {
	infostand addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Pelter UGVs</t>", "call ghst_fnc_clear_ugv", [], 1, false, false, "","alive _target"];
};	

if (worldName == "Enoch") then {

	infostand addaction ["<t size='1.4' shadow='2' color='#00FF00'>Spawn Infantry</t>", "call ghst_fnc_spawninf", [(getpos base),PARAM_MAX_GRP_NUM], 1, false, false, "","alive _target and (leader group _this == _this)"];

	airspawn1 addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Helicopters</t> <img size='3' color='#FFA000' shadow='2' image='\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa'/>", "call ghst_fnc_spawnair", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_helolist], 6, true, true, "","alive _target"];
	airspawn1 setObjectTexture [0, "\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa"];

} else {
	
	infostand addaction ["<t size='1.4' shadow='2' color='#00FF00'>Spawn Infantry</t>", "call ghst_fnc_spawninf", [(getposasl base),PARAM_MAX_GRP_NUM], 1, false, false, "","alive _target and (leader group _this == _this)"];

	airspawn1 addAction ["<t size='1.5' shadow='2' color='#0055ff'>Spawn Aircraft</t> <img size='3' color='#0055ff' shadow='2' image='\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa'/>", "call ghst_fnc_spawnair", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_aircraftlist], 6, true, true, "","alive _target"];
	airspawn1 setObjectTexture [0, "\A3\Air_F_EPC\Plane_CAS_01\Data\UI\Plane_CAS_01_CA.paa"];

	airspawn2 addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Helicopters</t> <img size='3' color='#FFA000' shadow='2' image='\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa'/>", "call ghst_fnc_spawnair", [(getposatl air_spawn2),(markerDir "air_spawn2"),ghst_helolist], 6, true, true, "","alive _target"];
	airspawn2 setObjectTexture [0, "\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa"];

	airspawn2 addAction ["<t size='1.5' shadow='2' color='#4863A0'>Move to USS Freedom</t>", {player setposasl (getposasl base);}, [], 5, true, true, "","alive _target"];

	boatspawn addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Boat</t> <img size='3' color='#FFA000' shadow='2' image='\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa'/>", "call ghst_fnc_spawnboat", ["boat_spawn",(markerDir "boat_spawn")], 6, true, true, "","alive _target"];
	boatspawn setObjectTexture [0, "\A3\boat_f_beta\SDV_01\data\ui\portrait_SDV_ca.paa"];

	infostand addAction ["<t size='1.5' shadow='2' color='#4863A0'>Move to USS Liberty</t>", {player setdir (getdir spawn_LIBERTY); player setposasl (getposasl spawn_LIBERTY);}, [], 5, true, true, "","alive _target"];
	
	freedomladder1 addAction ["<t size='1.5' shadow='2' color='#4863A0'>Move to USS Freedom</t>", {player setposasl (getposasl base);}, [], 5, true, true, "","alive _target"];

};

if (ghst_acemod) then {
	medic_point addAction ["<t color='#5dff00'>Full ACE Heal</t> <img size='2' color='#5dff00' shadow='2' image='\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca'/>", "call ghst_fnc_aceheal", [], 6, true, true, "","alive _target"];
} else {
	private _action = medic_point addAction ["<t color='#5dff00'>Full Heal</t> <img size='2' color='#5dff00' shadow='2' image='\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca'/>", { hint format ["Player damage was %1 Percent", round (damage medic_point * 100)]; player setdamage 0; }, [], 6, true, true, "","alive _target"];
};

repair_point addAction ["<t color='#FF0000'>Rearm</t>", "call ghst_fnc_reload",[10], 6, true, true, "","alive _target and !(vehicle _this == _this)"];
/*
airspawn1 addAction ["Open Garage",{

	//Create empty helipad at the position and save it in the global variable BIS_fnc_garage_center
	BIS_fnc_garage_center = createVehicle [ "Land_HelipadEmpty_F", (getposasl air_spawn1), [], 0, "CAN_COLLIDE" ]; 

	[ "Open", true ] call BIS_fnc_garage; 
}];

if (ghst_rhsmod) then {
	[ammostand,0] call RHS_fnc_VirtualAmmoBoxUSA;
	//[ammostand,0] call RHS_fnc_virtualAmmoBoxRus;
	//[ammostand,0] call RHS_fnc_virtualAmmoBoxSAF;
	//[ammostand,0] call RHS_fnc_virtualAmmoBoxGREF;
};
*/
ghst_local_vehicles = [];
ghst_players = ["p1","p2","p3","p4","p5","p6","p7","p8","p9","p10","p11","p12","p13","p14","p15","p16","p17","p18","p19","p20","p21","p22","p23","p24","p25","p26","p27","p28","p29","p30","p31","p32","p33","p34"];
ghst_vehicles = ["vas1","vas2"];

player addEventHandler ["Respawn", {call ghst_fnc_playeraddactions}];  
call ghst_fnc_playeraddactions;
//player addEventHandler ["HandleDamage", {call ghst_fnc_savegear}];
if ("PARAM_Fatigue" call BIS_fnc_getParamValue == 0) then {
	call ghst_fnc_stamina;
	player addEventHandler ["Respawn", {call ghst_fnc_stamina}];
};
if !("PARAM_AimSway" call BIS_fnc_getParamValue == 100) then {
	call ghst_fnc_aimsway;
	player addEventHandler ["Respawn", {call ghst_fnc_aimsway}];
};
if ("PARAM_PIFF" call BIS_fnc_getParamValue == 1) then {
	[playableunits] call BIS_fnc_EXP_camp_IFF;//allplayers
};
//[] call BIS_fnc_groupIndicator;

//disable revive for ace
if (ghst_acemod) then {

	player addEventHandler ["Respawn", {[player] call bis_fnc_disableRevive}]; 
	[player] call bis_fnc_disableRevive;

};

//player addEventHandler ["Killed", {call ghst_fnc_remrandomspawn}];  
//call ghst_fnc_remrandomspawn;
//systemChat "Saving initial loadout";

//call ghst_fnc_setrespawninventory;

//Save loadout whenever player exits arsenal and disable ship defense access
[ missionNamespace, "arsenalClosed", {
	systemChat "Arsenal Loadout Saved";
	player setVariable ["GHST_Current_Gear",getUnitLoadout player];
	{player disableUAVConnectability [_x,true];} forEach ghst_baseaa;
}] call BIS_fnc_addScriptedEventHandler;

/*
//set weather
_delay = 86400;
waituntil {! isNil {missionNamespace getvariable "ghst_weather"}};

skipTime -24;
[_delay] call ghst_fnc_UpdateWeather;
skipTime 24;

sleep 1;

simulWeatherSync;
*/
[] spawn ghst_fnc_vehicle_actioninit;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
["RegisterGroup", [group player,leader group player,[nil, "Skull Squad", false]]] call BIS_fnc_dynamicGroups;

ASTvehSpawner addAction ["<t color='#d000ff' size='2.0'> Vehicle Spawner","ast\fn_vehicle_spawner.sqf"];
ASTvehSpawner addAction ["<t color='#6666FF' size='2.0'> Vehicle Refund","ast\fn_vehicle_refund.sqf"];
ASTRearmPos addAction ["<t color = '#0080FF' size='2.0'> Rearm (COST 5 points)","ast\fn_air_spawner.sqf","nil","1.5","true","true","player inArea ASTRearmArea"];

[] call compileFinal preprocessFileLineNumbers "ast\player_money.sqf";

[] spawn ghst_fnc_ptracker;

sleep 30;

// Info text
[str("Enemy Assault") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("By Ghost")] spawn BIS_fnc_infoText;
