//V1.1 - By: Ghost - List of different units for spawning scripts
//[side_type] execvm "unit_list.sqf";
private ["_PARAM_Enemy"];

//RHS Escalation Units
_PARAM_RHS = "PARAM_RHS" call BIS_fnc_getParamValue;
_PARAM_FIRAIR = "PARAM_FIRAIR" call BIS_fnc_getParamValue;
if ((isClass(configFile >> "CfgPatches" >> "rhs_main")) and (_PARAM_RHS == 1)) then {

	ghst_powarray = ["C_scientist_F","rhsusf_army_ocp_officer","rhsusf_army_ucp_officer","rhsusf_usmc_marpat_wd_officer","rhsusf_usmc_marpat_d_officer","rhsusf_airforce_jetpilot","rhsusf_airforce_pilot"];
	
	ghst_vehcivlist = ["C_Offroad_01_F","C_Quadbike_01_F","C_SUV_01_F","C_Hatchback_01_f","C_Hatchback_01_sport_f","C_Van_01_box_f","C_Van_01_transport_f","RHS_Ural_Civ_01","RHS_Ural_Open_Civ_01","RHS_Ural_Civ_03","RHS_UAZ_MSV_01","RHS_Ural_Open_Civ_03","RHS_Ural_Civ_02","RHS_Ural_Open_Civ_02","RHS_Civ_Truck_02_covered_F","C_Truck_02_covered_F"];
	
	ghst_friendlybase_def = ["B_AAA_System_01_F"];//"B_SAM_System_02_F","B_SAM_System_01_F",
	ghst_friendlybase_arty = "RHS_M119_WD";//"rhsusf_m109_usarmy";
	
	ghst_civlist = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_euro","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_3_F_afro","C_man_polo_3_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_w_worker_F","C_man_hunter_1_F","C_man_p_shorts_1_F","C_man_p_shorts_1_F_afro","C_man_p_shorts_1_F_euro","C_man_p_shorts_1_F_asia","C_man_shorts_1_F","C_man_shorts_1_F_afro","C_man_shorts_1_F_euro","C_man_shorts_1_F_asia","C_man_shorts_2_F","C_man_shorts_2_F_afro","C_man_shorts_2_F_euro","C_man_shorts_2_F_asia","C_man_shorts_3_F","C_man_shorts_3_F_afro","C_man_shorts_3_F_euro","C_man_shorts_3_F_asia","C_man_shorts_4_F","C_man_shorts_4_F_afro","C_man_shorts_4_F_euro","C_man_shorts_4_F_asia"];
	
	_PARAM_Enemy = floor(random 2);
	
	switch _PARAM_Enemy do {

	case 0: {

		///////////
		//Russian Flora UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ["rhs_msv_rifleman","rhs_msv_efreitor","rhs_msv_grenadier","rhs_msv_machinegunner","rhs_msv_rifleman","rhs_msv_machinegunner_assistant","rhs_msv_rifleman","rhs_msv_at","rhs_msv_aa","rhs_msv_strelok_rpg_assist","rhs_msv_marksman","rhs_msv_rifleman","rhs_msv_sergeant","rhs_msv_junior_sergeant","rhs_msv_engineer","rhs_msv_medic","rhs_msv_LAT","rhs_msv_rifleman","rhs_msv_RShG2"];
		
		ghst_paralist = ["rhs_vdv_mflora_rifleman","rhs_vdv_mflora_efreitor","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_mflora_strelok_rpg_assist","rhs_vdv_mflora_marksman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_engineer","rhs_vdv_mflora_medic","rhs_vdv_mflora_LAT","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_RShG2"];

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ["rhs_vdv_mflora_rifleman","rhs_vdv_mflora_efreitor","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_mflora_strelok_rpg_assist","rhs_vdv_mflora_marksman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_engineer","rhs_vdv_mflora_medic","rhs_vdv_mflora_LAT","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_RShG2"];

		ghst_crewmenlist = ["rhs_msv_officer_armored","rhs_msv_driver_armored","rhs_msv_driver","rhs_msv_crew","rhs_msv_crew_commander","rhs_msv_armoredcrew","rhs_msv_combatcrew"];
		
		ghst_patrolvehlist = ["rhs_btr60_msv","rhs_btr70_msv","rhs_D30_msv","rhs_tigr_sts_vv","rhs_tigr_sts_3camo_vv","rhs_tigr_m_vv","rhs_tigr_m_3camo_vv","rhs_tigr_3camo_msv","rhs_t72bd_tv","rhs_zsu234_aa","rhs_gaz66_zu23_vdv","","RHS_Ural_Zu23_VDV_01","rhs_btr80_msv","rhs_btr80a_msv","rhs_t90a_tv","rhs_t80um","rhs_btr80a_msv","rhs_bmp2_tv","rhs_bmp1_tv"];

		ghst_convoyvehlist = ["rhs_tigr_msv","rhs_tigr_3camo_msv","rhs_tigr_sts_vv","rhs_tigr_sts_3camo_vv","rhs_tigr_m_vv","rhs_tigr_m_3camo_vv","rhs_tigr_3camo_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_ffv_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","RHS_Ural_Open_MSV_01","RHS_Ural_MSV_01","rhs_tigr_sts_3camo_msv","rhs_gaz66o_msv","rhs_gaz66_msv","RHS_Ural_MSV_01","RHS_Ural_Open_MSV_01"];

		ghst_staticlist = ["rhs_NSV_TriPod_MSV","rhs_KORD_high_MSV"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = "RHS_Mi8MTV3_vdv";
		
		ghst_attack_heli_list = ["RHS_Mi24V_FAB_vdv","RHS_Mi24P_vdv","RHS_Ka52_vvsc","rhs_mi28n_vvsc","rhs_mi28n_s13_vvsc"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["RHS_Su25SM_KH29_vvsc","RHS_Su25SM_vvsc","FIR_F16C_ENEMY_TYPE_A","RHS_T50_vvs_generic"];
		} else {
			ghst_patrol_air_list = ["RHS_Su25SM_KH29_vvsc","RHS_Su25SM_vvsc","RHS_T50_vvs_generic"];
		};
		
		ghst_commanderlist = ["rhs_msv_officer","rhs_msv_officer_armored"];
		
		ghst_ammobox_list = ["Box_FIA_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_CSAT_Equip_F","Box_IND_AmmoOrd_F","Box_East_AmmoOrd_F","Box_AAF_Equip_F"];//"Box_East_Ammo_F";
		
		ghst_aa_list = ["rhs_zsu234_aa","rhs_prv13","rhs_p37","RHS_ZU23_VDV","rhs_gaz66_zu23_vdv","","RHS_Ural_Zu23_VDV_01"];
		
		ghst_arty_list = ["rhs_2s3_tv","RHS_BM21_MSV_01","rhs_9k79_B","rhs_D30_msv"];
		
		};

	case 1: {

		///////////
		//Russian EMR UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ["rhs_msv_emr_rifleman","rhs_msv_emr_efreitor","rhs_msv_emr_grenadier","rhs_msv_emr_machinegunner","rhs_msv_emr_rifleman","rhs_msv_emr_machinegunner_assistant","rhs_msv_emr_rifleman","rhs_msv_emr_at","rhs_msv_emr_aa","rhs_msv_emr_strelok_rpg_assist","rhs_msv_emr_marksman","rhs_msv_emr_rifleman","rhs_msv_emr_sergeant","rhs_msv_emr_junior_sergeant","rhs_msv_emr_engineer","rhs_msv_emr_medic","rhs_msv_emr_LAT","rhs_msv_emr_rifleman","rhs_msv_emr_RShG2"];
		
		ghst_paralist = ["rhs_vdv_mflora_rifleman","rhs_vdv_mflora_efreitor","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_mflora_strelok_rpg_assist","rhs_vdv_mflora_marksman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_engineer","rhs_vdv_mflora_medic","rhs_vdv_mflora_LAT","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_RShG2"];

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ["rhs_vdv_mflora_rifleman","rhs_vdv_mflora_efreitor","rhs_vdv_mflora_grenadier","rhs_vdv_mflora_machinegunner","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_machinegunner_assistant","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_at","rhs_vdv_mflora_aa","rhs_vdv_mflora_strelok_rpg_assist","rhs_vdv_mflora_marksman","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_sergeant","rhs_vdv_mflora_junior_sergeant","rhs_vdv_mflora_engineer","rhs_vdv_mflora_medic","rhs_vdv_mflora_LAT","rhs_vdv_mflora_rifleman","rhs_vdv_mflora_RShG2"];

		ghst_crewmenlist = ["rhs_msv_emr_officer_armored","rhs_msv_emr_driver_armored","rhs_msv_emr_driver","rhs_msv_emr_crew","rhs_msv_emr_crew_commander","rhs_msv_emr_armoredcrew","rhs_msv_emr_combatcrew"];
		
		ghst_patrolvehlist = ["rhs_btr60_msv","rhs_btr70_msv","rhs_D30_msv","rhs_tigr_sts_vv","rhs_tigr_sts_3camo_vv","rhs_tigr_m_vv","rhs_tigr_m_3camo_vv","rhs_tigr_3camo_msv","rhs_t72bd_tv","rhs_zsu234_aa","rhs_gaz66_zu23_vdv","","RHS_Ural_Zu23_VDV_01","rhs_btr80_msv","rhs_btr80a_msv","rhs_t90a_tv","rhs_t80um","rhs_btr80a_msv","rhs_bmp2_tv","rhs_bmp1_tv"];

		ghst_convoyvehlist = ["rhs_tigr_msv","rhs_tigr_sts_3camo_msv","rhs_tigr_sts_vv","rhs_tigr_sts_3camo_vv","rhs_tigr_m_vv","rhs_tigr_m_3camo_vv","rhs_tigr_3camo_msv","rhs_tigr_sts_msv","rhs_tigr_ffv_3camo_msv","rhs_tigr_ffv_msv","RHS_UAZ_MSV_01","rhs_uaz_open_MSV_01","RHS_Ural_Open_MSV_01","RHS_Ural_MSV_01","rhs_gaz66o_msv","rhs_gaz66_msv","RHS_Ural_MSV_01","RHS_Ural_Open_MSV_01"];

		ghst_staticlist = ["rhs_NSV_TriPod_MSV","rhs_KORD_high_MSV"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = "RHS_Mi8MTV3_vdv";
		
		ghst_attack_heli_list = ["RHS_Mi24V_FAB_vdv","RHS_Mi24P_vdv","RHS_Ka52_vvsc","rhs_mi28n_vvsc","rhs_mi28n_s13_vvsc"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["RHS_Su25SM_KH29_vvsc","RHS_Su25SM_vvsc","FIR_F16C_ENEMY_TYPE_A","RHS_T50_vvs_generic"];
		} else {
			ghst_patrol_air_list = ["RHS_Su25SM_KH29_vvsc","RHS_Su25SM_vvsc","RHS_T50_vvs_generic"];
		};
		
		ghst_commanderlist = ["rhs_msv_emr_officer","rhs_msv_emr_officer_armored"];
		
		ghst_ammobox_list = ["Box_FIA_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_CSAT_Equip_F","Box_IND_AmmoOrd_F","Box_East_AmmoOrd_F","Box_AAF_Equip_F"];//"Box_East_Ammo_F";

		ghst_aa_list = ["rhs_zsu234_aa","rhs_prv13","rhs_p37","RHS_ZU23_VDV","rhs_gaz66_zu23_vdv","","RHS_Ural_Zu23_VDV_01"];
		
		ghst_arty_list = ["rhs_2s3_tv","RHS_BM21_MSV_01","rhs_9k79_B","rhs_D30_msv"];
		
		};
		
	};

//Default Game units with option mods
} else {

	ghst_powarray = ["C_scientist_F","B_Helipilot_F","B_officer_F","B_Pilot_F"];
	
	ghst_vehcivlist = ["C_Offroad_01_F","C_Quadbike_01_F","C_SUV_01_F","C_Hatchback_01_f","C_Hatchback_01_sport_f","C_Van_01_box_f","C_Van_01_transport_f"];
	
	ghst_friendlybase_def = ["B_AAA_System_01_F"];//"B_SAM_System_02_F","B_SAM_System_01_F",
	ghst_friendlybase_arty = "B_MBT_01_arty_F";
	
	ghst_civlist = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_polo_1_F","C_man_polo_1_F_afro","C_man_polo_1_F_euro","C_man_polo_1_F_asia","C_man_polo_2_F","C_man_polo_2_F_afro","C_man_polo_2_F_euro","C_man_polo_2_F_asia","C_man_polo_3_F","C_man_polo_3_F_afro","C_man_polo_3_F_euro","C_man_polo_3_F_asia","C_man_polo_4_F","C_man_polo_4_F_afro","C_man_polo_4_F_euro","C_man_polo_4_F_asia","C_man_polo_5_F","C_man_polo_5_F_afro","C_man_polo_5_F_euro","C_man_polo_5_F_asia","C_man_polo_6_F","C_man_polo_6_F_afro","C_man_polo_6_F_euro","C_man_polo_6_F_asia","C_man_p_fugitive_F","C_man_p_fugitive_F_afro","C_man_p_fugitive_F_euro","C_man_p_fugitive_F_asia","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_beggar_F_euro","C_man_p_beggar_F_asia","C_man_w_worker_F","C_man_hunter_1_F","C_man_p_shorts_1_F","C_man_p_shorts_1_F_afro","C_man_p_shorts_1_F_euro","C_man_p_shorts_1_F_asia","C_man_shorts_1_F","C_man_shorts_1_F_afro","C_man_shorts_1_F_euro","C_man_shorts_1_F_asia","C_man_shorts_2_F","C_man_shorts_2_F_afro","C_man_shorts_2_F_euro","C_man_shorts_2_F_asia","C_man_shorts_3_F","C_man_shorts_3_F_afro","C_man_shorts_3_F_euro","C_man_shorts_3_F_asia","C_man_shorts_4_F","C_man_shorts_4_F_afro","C_man_shorts_4_F_euro","C_man_shorts_4_F_asia"];	

	_PARAM_Enemy = floor(random 3);
	switch _PARAM_Enemy do {

	case 0: {

		///////////
		//Iranian UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ["O_soldier_F","O_Soldier_lite_F","O_soldier_AT_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_exp_F","O_soldier_F","O_soldier_AR_F","O_soldier_repair_F","O_soldier_LAT_F","O_soldier_AR_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AA_F","O_soldier_F","O_soldier_TL_F","O_medic_F","O_soldier_GL_F","O_soldier_F"];
		
		ghst_paralist = ["O_soldierU_F","O_soldierU_lite_F","O_soldierU_AT_F","O_soldierU_GL_F","O_soldierU_LAT_F","O_soldierU_exp_F","O_soldierU_F","O_soldierU_AR_F","O_soldierU_repair_F","O_soldierU_LAT_F","O_soldierU_AR_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_AA_F","O_soldierU_F","O_soldierU_TL_F","O_medic_F","O_soldierU_GL_F","O_soldierU_F"];

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ["O_recon_f","O_recon_exp_f","O_recon_f","O_recon_M_f","O_recon_medic_f","O_recon_f","O_recon_exp_f","O_recon_LAT_f","O_recon_TL_f","O_recon_f"];

		ghst_crewmenlist = ["O_crew_F"];
		
		ghst_patrolvehlist = ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_MBT_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F"];

		ghst_convoyvehlist = ["O_Truck_02_transport_F","O_Truck_03_transport_F","O_MRAP_02_gmg_F","O_Truck_02_covered_F","O_MRAP_02_hmg_F","O_MRAP_02_F","O_Truck_02_transport_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_Truck_02_covered_F","O_MRAP_02_hmg_F","O_MRAP_02_F"];

		ghst_staticlist = ["O_HMG_01_high_F","O_GMG_01_high_F","O_static_AT_F","O_static_AA_F"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = "O_Heli_Transport_04_covered_F";
		
		ghst_attack_heli_list = ["O_Heli_Attack_02_black_F", "O_Heli_Attack_02_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["O_Plane_CAS_02_F","FIR_F16C_ENEMY_TYPE_A","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"];
		} else {
			ghst_patrol_air_list = ["O_Plane_CAS_02_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"];
		};
				
		ghst_commanderlist = ["O_Story_Colonel_F","O_Story_CEO_F","O_officer_F"];
		
		ghst_ammobox_list = ["Box_FIA_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_CSAT_Equip_F","Box_IND_AmmoOrd_F","Box_East_AmmoOrd_F","Box_AAF_Equip_F"];//"Box_East_Ammo_F";
		
		ghst_aa_list = ["O_APC_Tracked_02_AA_F"];
		
		ghst_arty_list = ["O_MBT_02_arty_F"];
		
		};
		
	case 1: {
		
		///////////
		//Iranian UNITS Jungle
		///////////
		
		ghst_side = east;

		ghst_menlist = ["O_soldier_F","O_Soldier_lite_F","O_soldier_AT_F","O_soldier_GL_F","O_soldier_LAT_F","O_soldier_exp_F","O_soldier_F","O_soldier_AR_F","O_soldier_repair_F","O_soldier_LAT_F","O_soldier_AR_F","O_soldier_M_F","O_soldier_AT_F","O_soldier_AA_F","O_soldier_F","O_soldier_TL_F","O_medic_F","O_soldier_GL_F","O_soldier_F"];
		
		ghst_paralist = ["O_soldierU_F","O_soldierU_lite_F","O_soldierU_AT_F","O_soldierU_GL_F","O_soldierU_LAT_F","O_soldierU_exp_F","O_soldierU_F","O_soldierU_AR_F","O_soldierU_repair_F","O_soldierU_LAT_F","O_soldierU_AR_F","O_soldierU_M_F","O_soldierU_AT_F","O_soldierU_AA_F","O_soldierU_F","O_soldierU_TL_F","O_medic_F","O_soldierU_GL_F","O_soldierU_F"];

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ["O_recon_f","O_recon_exp_f","O_recon_f","O_recon_M_f","O_recon_medic_f","O_recon_f","O_recon_exp_f","O_recon_LAT_f","O_recon_TL_f","O_recon_f"];

		ghst_crewmenlist = ["O_crew_F"];
		
		ghst_patrolvehlist = ["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_MBT_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_MRAP_02_hmg_F"];

		ghst_convoyvehlist = ["O_Truck_02_transport_F","O_Truck_03_transport_F","O_MRAP_02_gmg_F","O_Truck_02_covered_F","O_MRAP_02_hmg_F","O_MRAP_02_F","O_Truck_02_transport_F","O_MRAP_02_gmg_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_Truck_02_covered_F","O_MRAP_02_hmg_F","O_MRAP_02_F"];

		ghst_staticlist = ["O_HMG_01_high_F","O_GMG_01_high_F","O_static_AT_F","O_static_AA_F"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = "O_Heli_Transport_04_covered_F";
		
		ghst_attack_heli_list = ["O_Heli_Attack_02_black_F", "O_Heli_Attack_02_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["O_Plane_CAS_02_F","FIR_F16C_ENEMY_TYPE_A","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"];
		} else {
			ghst_patrol_air_list = ["O_Plane_CAS_02_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"];
		};
				
		ghst_commanderlist = ["O_Story_Colonel_F","O_Story_CEO_F","O_officer_F"];
		
		ghst_ammobox_list = ["Box_FIA_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_CSAT_Equip_F","Box_IND_AmmoOrd_F","Box_East_AmmoOrd_F","Box_AAF_Equip_F"];//"Box_East_Ammo_F";
		
		ghst_aa_list = ["O_APC_Tracked_02_AA_F"];
		
		ghst_arty_list = ["O_MBT_02_arty_F"];
		
		};

	case 2: {

		///////////
		//Greek UNITS
		///////////
		
		ghst_side = independent;

		ghst_menlist = ["I_soldier_F","I_Soldier_lite_F","I_soldier_AT_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_exp_F","I_soldier_F","I_soldier_AR_F","I_soldier_repair_F","I_soldier_LAT_F","I_soldier_AR_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AA_F","I_soldier_F","I_soldier_TL_F","I_medic_F","I_soldier_GL_F","I_soldier_F"];

		ghst_paralist = ["I_soldier_F","I_Soldier_lite_F","I_soldier_AT_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_exp_F","I_soldier_F","I_soldier_AR_F","I_soldier_repair_F","I_soldier_LAT_F","I_soldier_AR_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AA_F","I_soldier_F","I_soldier_TL_F","I_medic_F","I_soldier_GL_F","I_soldier_F"];
		
		ghst_diverlist = ["I_diver_f","I_diver_exp_f","I_diver_TL_f","I_diver_f","I_diver_exp_f","I_diver_f"];
		
		ghst_specopslist = ["I_soldier_F","I_Soldier_lite_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_TL_F","I_medic_F","I_soldier_AR_F"];

		ghst_crewmenlist = ["I_crew_F"];
		
		ghst_patrolvehlist = ["I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F","I_APC_Wheeled_03_cannon_F"];

		ghst_convoyvehlist = ["I_Truck_02_transport_F","I_MRAP_03_gmg_F","I_Truck_02_covered_F","I_APC_Wheeled_03_cannon_F","I_Truck_02_covered_F","I_MRAP_03_hmg_F","I_MRAP_03_F","I_Truck_02_transport_F"];

		ghst_staticlist = ["I_HMG_01_high_F","I_GMG_01_high_F","I_static_AT_F","I_static_AA_F"];
		
		ghst_patrolboatlist = ["I_Boat_Armed_01_minigun_F"];
		
		ghst_transport_heli_list = "I_Heli_Transport_02_F";
		
		ghst_attack_heli_list = ["I_Heli_light_03_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F","FIR_F16C_ENEMY_TYPE_A","I_Plane_Fighter_04_F"];
		} else {
			ghst_patrol_air_list = ["I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_04_F"];
		};
		
		ghst_commanderlist = ["I_officer_F","I_Story_Colonel_F"];
		
		ghst_ammobox_list = ["Box_FIA_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_CSAT_Equip_F","Box_IND_AmmoOrd_F","Box_East_AmmoOrd_F","Box_AAF_Equip_F"];//"Box_IND_Ammo_F";
		
		ghst_aa_list = ["O_APC_Tracked_02_AA_F"];
		
		ghst_arty_list = ["O_MBT_02_arty_F"];
		
		};
		
	};
};