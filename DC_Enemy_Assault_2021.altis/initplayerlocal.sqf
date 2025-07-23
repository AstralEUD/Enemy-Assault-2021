/*params[ "_player", "_didJIP" ];
waitUntil {getClientStateNumber >= 10};//BRIEFING READ

if (_player iskindof "VirtualCurator_F") then {
	[ _player ] remoteExec[ "ghst_fnc_addzeus", 2 ];
};
*/
waituntil {! isnull player};
//Detect ACE
ghst_acemod = false;
/*if (isClass(configFile >> "cfgPatches" >> "ace_main")) then {
	ghst_acemod = true;
} else {
	ghst_acemod = false;
};*/
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
		ghst_baseaa = [aa1,aa2,aa3,aa4];
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

AST_HUD_LIST = [];
AST_HUD_ongoing = false;
if (player iskindof "B_recon_JTAC_F") then {
//[player,"CAS"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cassup", 0];
player setVariable ["ghst_helosup", 0];
player setVariable ["ghst_helosup2", 0];

[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_remotedes", 0];

//[player,"Gunship"] call BIS_fnc_addCommMenuItem;
};
_gunshipvar = (player getVariable "ghst_gunship");
if (isnil "_gunshipvar") then {
	player setVariable ["ghst_gunship", 0];
} else {
	player setVariable ["ghst_gunship", _gunshipvar];
};

if (player iskindof "B_soldier_UAV_F") then {
//[player,"UAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_uavsup", 0];
player setVariable ["ghst_ugvsup", [0,0]];
player setVariable ["ghst_puavsup", 0];

[player,"RemoteDesignator"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_remotedes", 0];
};

if (player iskindof "B_Soldier_SL_F") then {
//[player,"AMMO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_ammodrop", 0];

[player,"PUAV"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_puavsup", 0];

[player,"RESPAWNTENT"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_respawntent", 0];
};

//[player,"CARGO"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_cargodrop", 0];

[player,"Transport"] call BIS_fnc_addCommMenuItem;
player setVariable ["ghst_transport", 0];
player setVariable ["ghst_airlift", 0];

[player,"Group"] call BIS_fnc_addCommMenuItem;
[player,"Settings"] call BIS_fnc_addCommMenuItem;

[player,"Lock"] call BIS_fnc_addCommMenuItem;

[player,"ETC"] call BIS_fnc_addCommMenuItem;

waituntil { !(isnil "ghst_carlist")};
/*
//addactions for halo and vehspawn. Should ensure them showing even with jip
airspawn1 addAction ["<t size='1.5' shadow='2' color='#FFA000'>Spawn Armor</t> <img size='3' color='#FFA000' shadow='2' image='\A3\armor_f_gamma\MBT_01\Data\UI\Slammer_M2A1_Base_ca.paa'/>", "call ghst_fnc_spawnveh", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_armorlist], 6, true, true, "","alive _target"];
airspawn1 addAction ["<t size='1.5' shadow='2' color='#ff634d'>Spawn Car</t> <img size='3' color='#ff634d' shadow='2' image='\A3\Soft_F_Exp\LSV_01\Data\UI\LSV_01_base_CA.paa'/>", "call ghst_fnc_spawnveh", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_carlist], 6, true, true, "","alive _target"];
airspawn1 addAction ["<t size='1.5' shadow='2' color='#9af2ff'>Spawn Static</t> <img size='3' color='#9af2ff' shadow='2' image='\A3\Static_f_gamma\data\ui\gear_StaticTurret_MG_CA.paa'/>", "call ghst_fnc_spawnveh", [(getposatl air_spawn1),(markerDir "air_spawn1"),ghst_staticvehlist], 6, true, true, "","alive _target"];
*/

//halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>Group HALO</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [true,1000,60,false], 4, true, true, "","alive _target and (leader group _this == _this)"];

//halo setObjectTexture [0, "\A3\Characters_F\data\ui\icon_b_parachute_ca.paa"];

if (player iskindof "B_Soldier_SL_F") then {
	infostand addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Respawn Tents</t>", "call ghst_fnc_clear_respawn_tents", [], 1, false, false, "","alive _target"];
};	

if (player iskindof "B_soldier_UAV_F") then {
	infostand addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Pelter UGVs</t>", "call ghst_fnc_clear_ugv", [], 1, false, false, "","alive _target"];
};	
/*
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
*/
if (ghst_acemod) then {
	medic_point addAction ["<t color='#5dff00'>Full ACE Heal</t> <img size='2' color='#5dff00' shadow='2' image='\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca'/>", "call ghst_fnc_aceheal", [], 6, true, true, "","alive _target"];
} else {
	private _action = medic_point addAction ["<t color='#5dff00'>Full Heal</t> <img size='2' color='#5dff00' shadow='2' image='\a3\ui_f\data\IGUI\Cfg\Actions\heal_ca'/>", { hint format ["Player damage was %1 Percent", round (damage medic_point * 100)]; player setdamage 0; }, [], 6, true, true, "","alive _target"];
};
/*
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
ghst_vehicles = [];

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

if (ghst_acemod) then {

	player addEventHandler ["Respawn", {[player] call bis_fnc_disableRevive}]; 
	[player] call bis_fnc_disableRevive;

};

[] spawn ast_fnc_escInterupt;
//[] call ast_fnc_spawnlist;



[ missionNamespace, "arsenalClosed", {
	systemChat "Arsenal Loadout Saved";
	player setVariable ["GHST_Current_Gear",getUnitLoadout player];
	{player disableUAVConnectability [_x,true];} forEach ghst_baseaa;
}] call BIS_fnc_addScriptedEventHandler;
[] spawn ghst_fnc_vehicle_actioninit;

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;
["RegisterGroup", [group player,leader group player,[nil, "Skull Squad", false]]] call BIS_fnc_dynamicGroups;

"AST_LAYER1" cutRsc ["AST_HUD_GUI","PLAIN"];

ASTvehSpawner addAction ["<t color='#d000ff' size='1.5'> Vehicle Spawner","call ast_fnc_vehicle_spawner"];
ASTAirSpawner addAction ["<t color='#d000ff' size='1.5'> Aircraft Spawner","call ast_fnc_air_spawner"];
ASTvehSpawner addAction ["<t color='#6666FF' size='1.5'> Vehicle Refund","call ast_fnc_vehicle_refund"];
ASTAirSpawner addAction ["<t color='#6666FF' size='1.5'> Aircraft Refund","call ast_fnc_air_refund"];

infostand addAction ["<t color='#33CCFF' size='1.0'>총기 구매기</t>","0 = createDialog 'AST_arsenal_GUI'"];

infostand addAction ["<t color='#000080' size='1.0'> 관리자에게 제보/신고/건의","call ast_fnc_report"];

infostand addAction ["<t color='#6937a1' size='1.0'> 안개 제거 (30pts)","call ast_fnc_Ihatefog"];

infostand addAction ["<t color='#01DF3A' size='1.0'> FOB로 이동","call ast_fnc_fobTeleport"];

gotcha_board addAction ["<t color='#ffb229' size='2.0'> 무기 갓챠","call ast_fnc_request_gotcha"];

FOB_RTB addAction ["<t color='#33CCFF' size='1.0'> 베이스로 이동","player setPos getMarkerPos 'Respawn_west';"];
ASTfobSpawner addAction ["<t color='#6666FF' size='1.5'> Vehicle Refund","call ast_fnc_fob_refund"];
ASTfobSpawner addAction ["<t color='#d000ff' size='1.5'> Vehicle Spawner","call ast_fnc_fob_spawner"];

ATM_01 addAction ["<t color='#E8C25D' size='1.5'> 송금","call ast_fnc_transfer"];
ATM_02 addAction ["<t color='#E8C25D' size='1.5'> 송금","call ast_fnc_transfer"];
ATM_03 addAction ["<t color='#E8C25D' size='1.5'> 송금","call ast_fnc_transfer"];

player addAction ["<t color = '#0080FF' size='1.5'> 재정비 </t>","call ast_fnc_reloadCheck;",nil,1.5,true,true,"","player inArea 'VAM_service_area_0' && driver (vehicle player) == player",50,false,"",""];
halo addAction ["<t size='1.5' shadow='2' color='#00ffff'>HALO (3 PTS)</t> <img size='3' color='#00ffff' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", "call ghst_fnc_halo", [false,1000,60,false], 5, true, true, "","alive _target"];
infostand addaction ["<t size='1.4' shadow='2' color='#00FF00'>아군 AI 보병 스폰 (5pts)</t>", "call ghst_fnc_spawninf", [(getpos base),PARAM_MAX_GRP_NUM], 1, false, false, "","alive _target and (leader group _this == _this)"];
FOB_RTB addaction ["<t size='1.4' shadow='2' color='#00FF00'>아군 AI 보병 스폰 (5pts)</t>", "call ghst_fnc_spawninf", [(getMarkerpos "FOB_spawn_marker"),PARAM_MAX_GRP_NUM], 1, false, false, "","alive _target and (leader group _this == _this)"];

player addAction ["<t color='#f89b00'>차량에 있는 AI 하차명령","call ast_fnc_aiGetOut",nil,1.5,true,true,"","((vehicle player) != player) && ((driver (vehicle player)) == player)"];

[] execVM "Trait_Changer\TC_init.sqf";

//[] execVM "external\fn_flipVeh.sqf";
//notice
[] execVM "external\Auto_running.sqf";

[] execVM "ast\fn_rtbReward.sqf";
//Rearm for Aircraft
//[player,"marker_46",500] spawn zlo_fnc_CreateZone;//[PLAYER,MARKERNAME,RADIUS]

AST_gotcha_ticket = 0;

player addAction ["<t size='1.2'> 전리품 획득","call ast_fnc_moneyget",nil,1.5,true,true,"","((player distance2D (nearestObject [position player, 'Land_money_F'])) < 10) && (vehicle player == player)"];
// Spawn the Vehicle Unflip Script Loop.
[] spawn KS_fnc_unflipVehicleAddAction;

player addEventHandler ["Respawn", {
	[] execVM "external\Auto_running.sqf";
	[] spawn KS_fnc_unflipVehicleAddAction;
	player addAction ["<t color = '#0080FF' size='1.5'> 재정비 </t>","call ast_fnc_reloadCheck;",nil,1.5,true,true,"","player inArea 'VAM_service_area_0' && driver (vehicle player) == player",50,false,"",""];
	player addAction ["<t size='1.2'> 전리품 획득","call ast_fnc_moneyget",nil,1.5,true,true,"","((player distance2D (nearestObject [position player, 'Land_money_F'])) < 10) && (vehicle player == player)"];
	player addAction ["<t color='#f89b00'>차량에 있는 AI 하차명령","call ast_fnc_aiGetOut",nil,1.5,true,true,"","((vehicle player) != player) && ((driver (vehicle player)) == player)"];
	//[player,"marker_46",500] spawn zlo_fnc_CreateZone;//[PLAYER,MARKERNAME,RADIUS]
}];

//invEH
[] execVM "ast\fn_invEH.sqf";

//Vehicle Lock System
[] execVM "ast\fn_lock_vehicle.sqf";                                       
//playerMarker
//0 = [] execVM "external\player_markers.sqf";
//[] execVM "external\tankboy.sqf";
//Transport Bonus
[] execVM "ast\fn_transportbonus.sqf";
[] execVM "ast\arsenal\fn_arsenal_limit.sqf";

[] execVM "external\s_Welcome_Rule.sqf";
//notice
[] execVM "external\s_Chobo_Guide.sqf";

[] execVM "ast\repack\fn_init.sqf";

[] call ast_fnc_hud_init;

diag_log "ASTRO Loading Completed!!";

[] call compileFinal preprocessFileLineNumbers "ast\player_money.sqf";
[] spawn ghst_fnc_ptracker;

/*
[] spawn {
    for "_i" from 0 to 1 step 0 do {
        waitUntil {!isNull (findDisplay 49)}; // Check if ESC dialogs are open
        (findDisplay 49) closeDisplay 2; // Close ESC dialog
    };
};
*/
sleep 30;

// Initialize inidbi for player data tracking
if (isNil "inidbi") then {
    inidbi = ["new", "astro_player_data"] call OO_INIDBI;
    diag_log "[AST] iniDBI initialized";
};

// Initialize session tracking with current mission time
AST_SESSION_START_TIME = time;
diag_log format["[AST] Session start time set to: %1 (current time: %2)", AST_SESSION_START_TIME, time];

// Store session start time on player unit for server access during disconnect
player setVariable ["AST_SESSION_START_TIME", AST_SESSION_START_TIME, true];

// Add a public variable event handler to ensure the session time is updated
if (isNil "AST_TIME_MONITOR_RUNNING") then {
    AST_TIME_MONITOR_RUNNING = true;
    [] spawn {
        while {true} do {
            // Log every 60 seconds to monitor time progression
            diag_log format["[AST Time Monitor] Current time: %1, Session start: %2, Elapsed: %3", 
                time, AST_SESSION_START_TIME, (time - AST_SESSION_START_TIME)];
            sleep 60;
        };
    };
};

// Fetch saved playtime from database
_uid = getPlayerUID player;
AST_TOTAL_PLAYTIME = ["read", [_uid, "total_playtime", 0]] call inidbi;
if (isNil "AST_TOTAL_PLAYTIME" || {AST_TOTAL_PLAYTIME isEqualTo 0}) then {
    AST_TOTAL_PLAYTIME = 0;
    diag_log "[AST] No saved playtime found, initializing to 0";
} else {
    diag_log format["[AST] Loaded total playtime: %1", AST_TOTAL_PLAYTIME];
};

// Info text
[str("ASTRO") , str(date select 1) + "." + str(date select 2) + "." + str(date select 0), str("By ArmA Gallery")] spawn BIS_fnc_infoText;

// Check for first login bonus
[] spawn {
    sleep 3; // Wait a few seconds for the player data to be fully loaded
    [] call AST_fnc_firstLoginBonus;
    diag_log "[AST] First login bonus check completed";
};

// Final check to ensure session time variables are properly set
[] spawn {
    sleep 5; // Wait a few seconds for everything to initialize
    if (isNil "AST_SESSION_START_TIME") then {
        AST_SESSION_START_TIME = time;
        diag_log "[AST Final Check] Session start time was nil, initialized now";
    };
    
    diag_log format["[AST Final Check] Current time: %1, Session start time: %2, Elapsed: %3", 
        time, AST_SESSION_START_TIME, (time - AST_SESSION_START_TIME)];
};

// Set up disconnect event handler to save playtime
player addEventHandler ["Killed", {
    diag_log "[AST Events] Player killed, saving playtime";
    [true] call AST_fnc_savePlaytime;
}];

// Add event handler for mission end
addMissionEventHandler ["Ended", {
    diag_log "[AST Events] Mission ended, saving playtime";
    [true] call AST_fnc_savePlaytime;
}];

// Add periodic saving every 5 minutes
[] spawn {
    while {true} do {
        sleep 300; // 5 minutes
        diag_log "[AST Events] Periodic 5-minute save";
        [false] call AST_fnc_savePlaytime;
    };
};
};
