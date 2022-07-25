addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner"];
	//_score = ["read", [_uid, "kill_score", 30]] call inidbi;
	//[_score] remoteExec ["ast_fnc_addMoney", _owner];
	private _SystemLimited = ["B_HMG_01_support_grn_F","I_E_HMG_01_support_high_F","I_E_HMG_01_support_F","I_E_UGV_02_Demining_backpack_F","I_UGV_02_Demining_backpack_F","I_E_UGV_02_Science_backpack_F","I_UGV_02_Science_backpack_F","O_UGV_02_Science_backpack_F","O_UGV_02_Demining_backpack_F","I_E_UAV_06_medical_backpack_F","I_UAV_06_medical_backpack_F","O_UAV_06_medical_backpack_F","O_UAV_06_backpack_F","I_UAV_06_backpack_F","I_E_UAV_06_backpack_F","O_UAV_01_backpack_F","I_UAV_01_backpack_F","I_E_UAV_01_backpack_F","srifle_DMR_05_tan_f","B_HMG_01_support_F","O_HMG_01_support_F","I_HMG_01_support_F","B_HMG_01_support_high_F","O_HMG_01_support_high_F","I_HMG_01_support_high_F","B_Respawn_Sleeping_bag_F","B_Respawn_Sleeping_bag_brown_F","B_Respawn_Sleeping_blue_F","B_Respawn_Sleeping_bag_blue_F","B_Respawn_sleeping_bag_brown_F","B_Respawn_TentDome_F","B_Patrol_Respawn_bag_F","B_Respawn_TentA_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F","O_Mortar_01_support_F","O_Mortar_01_weapon_F","I_Mortar_01_support_F","I_Mortar_01_weapon_F","I_E_Mortar_01_support_F","I_E_Mortar_01_weapon_F"];
	AST_weaponlist = ["optic_tws_mg","optic_NVS","optic_tws","optic_Nightstalker","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","srifle_GM6_F","srifle_GM6_camo_F","srifle_GM6_ghex_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F","5Rnd_127x108_APDS_Mag","H_HelmetO_ViperSP_hex_F","H_HelmetO_ViperSP_ghex_F","NVGogglesB_gry_F","NVGogglesB_grn_F","NVGogglesB_blk_F","arifle_AK12_F","arifle_AK12_arid_F","arifle_AK12_lush_F","arifle_AK12U_F","arifle_AK12U_arid_F","arifle_AK12U_lush_F","arifle_AK12_GL_F","arifle_AK12_GL_arid_F","arifle_AK12_GL_lush_F","arifle_RPK12_F","arifle_RPK12_arid_F","arifle_RPK12_lush_F","B_Bergen_dgtl_F","B_Bergen_hex_F","B_Bergen_mcamo_F","B_Bergen_tna_F"];
	AST_gotchalimited = ["launch_MRAWS_green_F","launch_MRAWS_olive_F","launch_MRAWS_sand_F","launch_O_Vorona_green_F","launch_O_Vorona_brown_F","launch_O_Titan_short_F","launch_O_Titan_short_ghex_F","launch_I_Titan_short_F","launch_B_Titan_short_F","launch_B_Titan_short_tna_F","3Rnd_HE_Grenade_shell","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareYellow_F","3Rnd_UGL_FlareCIR_F","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell"];
	AST_purchased = ["read", [_uid, "weaponlist", []]] call inidbi;
	_SystemLimited append AST_weaponlist;
	_SystemLimited append AST_gotchalimited;
	AST_limitedItems = _SystemLimited;
	AST_limitedItems = AST_limitedItems - AST_purchased;
	CHECK_ARSENAL = true;
	_owner publicVariableClient "AST_limitedItems";
	_owner publicVariableClient "AST_purchased";
	_owner publicVariableClient "AST_weaponlist";
	_owner publicVariableClient "CHECK_ARSENAL";
	[AST_limitedItems] remoteExecCall ["ast_fnc_arsenal_search", _owner];
}];

AST_weaponPrice = [["optic_tws_mg",2000],
["optic_NVS",2000],
["optic_tws",2000],
["optic_Nightstalker",2500],
["srifle_DMR_02_F",2750],["srifle_DMR_02_camo_F",2750],["srifle_DMR_02_sniper_F",2750],
["srifle_DMR_05_blk_F",2750],["srifle_DMR_05_hex_F",2750],
["srifle_DMR_03_F",2250],["srifle_DMR_03_khaki_F",2250],["srifle_DMR_03_tan_F",2250],["srifle_DMR_03_multicam_F",2250],["srifle_DMR_03_woodland_F",2250],
["arifle_SPAR_03_blk_F",2250],["arifle_SPAR_03_khk_F",2250],["arifle_SPAR_03_snd_F",2250],
["srifle_GM6_F",4500],["srifle_GM6_camo_F",4500],["srifle_GM6_ghex_F",4500],
["srifle_LRR_F",4000],["srifle_LRR_camo_F",4000],["srifle_LRR_tna_F",4000],
["MMG_01_hex_F",8500],["MMG_01_tan_F",8500],
["MMG_02_camo_F",8500],["MMG_02_black_F",8500],["MMG_02_sand_F",8500],
["5Rnd_127x108_APDS_Mag",2500],
["H_HelmetO_ViperSP_hex_F",3000],["H_HelmetO_ViperSP_ghex_F",3000],
["NVGogglesB_gry_F",2000],["NVGogglesB_grn_F",2000],["NVGogglesB_blk_F",2000],
["arifle_AK12_F",500],["arifle_AK12_arid_F",500],["arifle_AK12_lush_F",500],
["arifle_AK12_GL_F",500],["arifle_AK12_GL_arid_F",500],["arifle_AK12_GL_lush_F",500],
["arifle_AK12U_F",500],["arifle_AK12U_arid_F",500],["arifle_AK12U_lush_F",500],
["arifle_RPK12_F",750],["arifle_RPK12_arid_F",750],["arifle_RPK12_lush_F",750],
["B_Bergen_dgtl_F",1000],["B_Bergen_hex_F",1000],["B_Bergen_mcamo_F",1000],["B_Bergen_tna_F",1000]];

publicVariable "AST_weaponPrice";
// Server-side Function to get Specific Weapon / Attachment's purchased information

