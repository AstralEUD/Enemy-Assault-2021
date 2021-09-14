//V1.1 - By: Ghost - List of different units for spawning scripts
//[side_type] execvm "unit_list.sqf";
private ["_PARAM_Enemy"];

//RHS Escalation Units
_PARAM_RHS = "PARAM_RHS" call BIS_fnc_getParamValue;
//Firewill Aircraft
_PARAM_FIRAIR = "PARAM_FIRAIR" call BIS_fnc_getParamValue;
//Regular Unit type selection
_PARAM_EnemyType = "PARAM_EnemyType" call BIS_fnc_getParamValue;
//RHS Unit type selection
_PARAM_EnemyTypeRHS = "PARAM_EnemyTypeRHS" call BIS_fnc_getParamValue;

if ((isClass(configFile >> "CfgPatches" >> "rhs_main")) and (_PARAM_RHS == 1)) then {

	ghst_attackplane = ["RHS_A10","rhsusf_f22","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F"];

	ghst_powarray = ["C_scientist_F","rhsusf_army_ocp_officer","rhsusf_army_ucp_officer","rhsusf_usmc_marpat_wd_officer","rhsusf_usmc_marpat_d_officer","rhsusf_airforce_jetpilot","rhsusf_airforce_pilot"];
	
	ghst_vehcivlist = ghst_rhsvehcivList;
	
	ghst_helicivlist = ghst_rhsaircivList;
	
	ghst_friendlybase_def = ["B_AAA_System_01_F"];//"B_SAM_System_02_F","B_SAM_System_01_F",
	ghst_friendlybase_arty = "rhsusf_m109_usarmy";//"rhsusf_M142_usarmy_D";//"RHS_M119_WD";//"rhsusf_m109d_usarmy";
	
	ghst_civlist = ghst_rhsmencivList;
	
	_PARAM_Enemy = switch _PARAM_EnemyTypeRHS do {
		case 99: {floor(random 3)};
		Default {_PARAM_EnemyTypeRHS;};
	};
	
	switch _PARAM_Enemy do {

	case 0: {

		///////////
		//Russian Flora UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ghst_floraList;
		
		ghst_menhouselist = ghst_floraList;		
		
		ghst_paralist = ghst_reconList;

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ghst_mfloralist;

		ghst_crewmenlist = ghst_floradList;
		
		ghst_patrolvehlist = ghst_rhstankList;

		ghst_convoyvehlist = ghst_rhscarList;

		ghst_staticlist = ["rhs_NSV_TriPod_VDV","RHS_AGS30_TriPod_VDV","rhs_KORD_high_VDV"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = ghst_rhstheloList;
		
		ghst_attack_heli_list = ghst_rhsaheloList;
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ghst_rhsplaneList + ["FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ghst_rhsplaneList;
		};
		
		ghst_commanderlist = ["rhs_msv_officer","rhs_msv_officer_armored"];
		
		ghst_ammobox_list = ["Box_CSAT_Equip_F","Box_IED_Exp_F","Box_East_Grenades_F","Box_East_Wps_F","Box_East_Ammo_F"];
		
		ghst_aa_list = ghst_rhsaaList + ["O_Radar_System_02_F","O_SAM_System_04_F"];//"rhs_prv13",
		
		ghst_arty_list = ghst_rhsartyList;
		
		};

	case 1: {

		///////////
		//Russian EMR UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ghst_emrList;
		
		ghst_menhouselist = ghst_emrList;		
		
		ghst_paralist = ghst_reconList;

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ghst_mfloralist;

		ghst_crewmenlist = ghst_emrdList;
		
		ghst_patrolvehlist = ghst_rhstankList;

		ghst_convoyvehlist = ghst_rhscarList;

		ghst_staticlist = ["rhs_NSV_TriPod_VDV","RHS_AGS30_TriPod_VDV","rhs_KORD_high_VDV"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = ghst_rhstheloList;
		
		ghst_attack_heli_list = ghst_rhsaheloList;
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ghst_rhsplaneList + ["FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ghst_rhsplaneList;
		};
		
		ghst_commanderlist = ["rhs_msv_officer","rhs_msv_officer_armored"];
		
		ghst_ammobox_list = ["Box_CSAT_Equip_F","Box_IED_Exp_F","Box_East_Grenades_F","Box_East_Wps_F","Box_East_Ammo_F"];
		
		ghst_aa_list = ghst_rhsaaList + ["O_Radar_System_02_F","O_SAM_System_04_F"];//"rhs_prv13",
		
		ghst_arty_list = ghst_rhsartyList;
		
		};
		
	case 2: {

		///////////
		//Russian EMR Desert UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ghst_emrdesList;
		
		ghst_menhouselist = ghst_emrdesList;		
		
		ghst_paralist = ghst_reconList;

		ghst_diverlist = ["O_diver_f","O_diver_exp_f","O_diver_TL_f","O_diver_f","O_diver_exp_f","O_diver_f"];
		
		ghst_specopslist = ghst_mfloralist;

		ghst_crewmenlist = ghst_emrdesdList;
		
		ghst_patrolvehlist = ghst_rhstankList;

		ghst_convoyvehlist = ghst_rhscarList;

		ghst_staticlist = ["rhs_NSV_TriPod_VDV","RHS_AGS30_TriPod_VDV","rhs_KORD_high_VDV"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = ghst_rhstheloList;
		
		ghst_attack_heli_list = ghst_rhsaheloList;
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ghst_rhsplaneList + ["FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ghst_rhsplaneList;
		};
		
		ghst_commanderlist = ["rhs_msv_officer","rhs_msv_officer_armored"];
		
		ghst_ammobox_list = ["Box_CSAT_Equip_F","Box_IED_Exp_F","Box_East_Grenades_F","Box_East_Wps_F","Box_East_Ammo_F"];
		
		ghst_aa_list = ghst_rhsaaList + ["O_Radar_System_02_F","O_SAM_System_04_F"];//"rhs_prv13",
		
		ghst_arty_list = ghst_rhsartyList;
		
		};
		
	};

//Default Game units with option mods
} else {

	ghst_attackplane = ["B_Plane_CAS_01_F","B_Plane_CAS_01_F","B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F"];
	
	ghst_powarray = ["C_scientist_F","B_Helipilot_F","B_officer_F"];
	
	ghst_vehcivlist = ghst_civvehList;
	
	ghst_helicivlist = ghst_aircivList;
	
	ghst_friendlybase_def = ["B_AAA_System_01_F"];//"B_SAM_System_02_F","B_SAM_System_01_F",
	ghst_friendlybase_arty = "B_T_MBT_01_arty_F";//"B_MBT_01_mlrs_F";//"B_MBT_01_arty_F";
	
	ghst_civlist = ghst_mencivList;	

	_PARAM_Enemy = switch _PARAM_EnemyType do {
		case 99: {floor(random 4)};
		Default {_PARAM_EnemyType;};
	};
	
	switch _PARAM_Enemy do {

	case 0: {

		///////////
		//Iranian UNITS
		///////////
		
		ghst_side = east;

		ghst_menlist = ghst_oList;
		
		ghst_menhouselist = ghst_ourbanList;
		
		ghst_paralist = ghst_oreconList;

		ghst_diverlist = ghst_odiverlist;
		
		ghst_specopslist = ghst_oviperList;

		ghst_crewmenlist = ghst_odList;
		
		ghst_patrolvehlist = ghst_tankList;

		ghst_convoyvehlist = ghst_ocarList;

		ghst_staticlist = ["O_HMG_01_high_F","O_GMG_01_high_F","O_static_AT_F","O_static_AA_F"];
		
		ghst_patrolboatlist = ["O_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = ["O_Heli_Transport_04_covered_F","O_T_VTOL_02_infantry_dynamicLoadout_F","O_Heli_Light_02_unarmed_F","O_T_VTOL_02_infantry_dynamicLoadout_F"];
		
		ghst_attack_heli_list = ["O_Heli_Light_02_dynamicLoadout_F", "O_Heli_Attack_02_dynamicLoadout_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"];
		};
				
		ghst_commanderlist = ["O_Story_Colonel_F","O_Story_CEO_F","O_officer_F"];
		
		ghst_ammobox_list = ["Box_CSAT_Equip_F","Box_IED_Exp_F","Box_East_Grenades_F","Box_East_Wps_F","Box_East_Ammo_F"];
		
		ghst_aa_list = ghst_aaList + ["O_Radar_System_02_F","O_SAM_System_04_F"];//["O_APC_Tracked_02_AA_F"];
		
		ghst_arty_list = ghst_artyList;//["O_MBT_02_arty_F"];ghst_artyList
		
		};
		
	case 1: {
		
		///////////
		//Iranian UNITS Jungle
		///////////
		
		ghst_side = east;

		ghst_menlist = ghst_otList;
		
		ghst_menhouselist = ghst_ourbanList;
		
		ghst_paralist = ghst_otreconList;

		ghst_diverlist = ghst_otdiverlist;
		
		ghst_specopslist = ghst_otviperList;

		ghst_crewmenlist = ghst_otdList;
		
		ghst_patrolvehlist = ghst_ttankList;

		ghst_convoyvehlist = ghst_tcarList;

		ghst_staticlist = ["O_HMG_01_high_F","O_GMG_01_high_F","O_static_AT_F","O_static_AA_F"];
		
		ghst_patrolboatlist = ["O_T_Boat_Armed_01_hmg_F"];
		
		ghst_transport_heli_list = ["O_Heli_Transport_04_covered_F","O_T_VTOL_02_infantry_dynamicLoadout_F","O_Heli_Light_02_unarmed_F","O_T_VTOL_02_infantry_dynamicLoadout_F"];
		
		ghst_attack_heli_list = ["O_Heli_Light_02_dynamicLoadout_F", "O_Heli_Attack_02_dynamicLoadout_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ["O_Plane_CAS_02_dynamicLoadout_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F"];
		};
				
		ghst_commanderlist = ["O_Story_Colonel_F","O_Story_CEO_F","O_officer_F"];
		
		ghst_ammobox_list = ["Box_CSAT_Equip_F","Box_IED_Exp_F","Box_East_Grenades_F","Box_T_East_Wps_F","Box_T_East_Ammo_F"];

		ghst_aa_list = ghst_taaList + ["O_Radar_System_02_F","O_SAM_System_04_F"];//["O_T_APC_Tracked_02_AA_ghex_F"];
		
		ghst_arty_list = ghst_tartyList;//["O_T_MBT_02_arty_ghex_F"];

		};

	case 2: {

		///////////
		//Greek UNITS
		///////////
		
		ghst_side = independent;

		ghst_menlist = ghst_iList;

		ghst_menhouselist = ghst_iList;		

		ghst_paralist = ghst_iList;
		
		ghst_diverlist = ghst_idiverlist;
		
		ghst_specopslist = ghst_iList;

		ghst_crewmenlist = ghst_idList;
		
		ghst_patrolvehlist = ghst_itankList;

		ghst_convoyvehlist = ghst_icarList;

		ghst_staticlist = ["I_HMG_01_high_F","I_GMG_01_high_F","I_static_AT_F","I_static_AA_F"];
		
		ghst_patrolboatlist = ["I_Boat_Armed_01_minigun_F"];
		
		ghst_transport_heli_list = ["I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F"];

		ghst_attack_heli_list = ["I_Heli_light_03_dynamicLoadout_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["I_Plane_Fighter_04_F","I_Plane_Fighter_03_dynamicLoadout_F","FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ["I_Plane_Fighter_03_dynamicLoadout_F","I_Plane_Fighter_04_F"];
		};
		
		ghst_commanderlist = ["I_officer_F","I_Story_Colonel_F"];
		
		ghst_ammobox_list = ["Box_IED_Exp_F","Box_IND_Grenades_F","Box_IND_AmmoOrd_F","Box_AAF_Equip_F","Box_IND_Wps_F"];
		
		ghst_aa_list = ghst_taaList + ["O_Radar_System_02_F","O_SAM_System_04_F"];//["O_T_APC_Tracked_02_AA_ghex_F"];
		
		ghst_arty_list = ghst_tartyList;//["O_T_MBT_02_arty_ghex_F"];
		
		};
	case 3: {

		///////////
		// LDF UNITS
		///////////
		
		ghst_side = independent;

		ghst_menlist = ghst_lList;

		ghst_menhouselist = ghst_lList;		

		ghst_paralist = ghst_lList;
		
		ghst_diverlist = ghst_idiverlist;
		
		ghst_specopslist = ghst_lList;

		ghst_crewmenlist = ghst_ldList;
		
		ghst_patrolvehlist = ghst_ltankList + ["I_mbt_03_cannon_F"];

		ghst_convoyvehlist = ghst_lcarList;

		ghst_staticlist = ["I_E_HMG_01_high_F","I_E_GMG_01_high_F","I_E_static_AT_F","I_E_static_AA_F"];
		
		ghst_patrolboatlist = ["I_Boat_Armed_01_minigun_F"];
		
		ghst_transport_heli_list = ["I_E_Heli_light_03_unarmed_F"];

		ghst_attack_heli_list = ["I_E_Heli_light_03_dynamicLoadout_F"];
		
		if (_PARAM_FIRAIR == 1) then {
			ghst_patrol_air_list = ["I_Plane_Fighter_04_F","I_Plane_Fighter_03_dynamicLoadout_F","FIR_F16C_ENEMY_TYPE_A"];
		} else {
			ghst_patrol_air_list = ["I_Plane_Fighter_03_dynamicLoadout_F","I_Plane_Fighter_04_F"];
		};
		
		ghst_commanderlist = ["I_E_officer_F","I_E_officer_parade_F"];
		
		ghst_ammobox_list = ["Box_IED_Exp_F","Box_IND_Grenades_F","Box_IND_AmmoOrd_F","Box_AAF_Equip_F","Box_IND_Wps_F"];
		
		ghst_aa_list = ghst_taaList + ["I_E_Radar_System_01_F","I_E_SAM_System_03_F"];//["O_T_APC_Tracked_02_AA_ghex_F"];
		
		ghst_arty_list = ghst_tartyList + ["I_E_Truck_02_MRL_F"];//["O_T_MBT_02_arty_ghex_F"];
		
		};
		
	};
	
};

/*
defaults
O_MBT_02_arty_F

O_APC_Tracked_02_AA_F

O_Heli_Transport_04_covered_F

O_Plane_CAS_02_dynamicLoadout_F
O_Plane_Fighter_02_F

O_Boat_Armed_01_hmg_F

O_SAM_System_04_F
O_Radar_System_02_F

O_T_APC_Tracked_02_AA_ghex_F

O_T_MBT_02_arty_ghex_F

O_T_VTOL_02_infantry_dynamicLoadout_F

O_T_Boat_Armed_01_hmg_F
*/