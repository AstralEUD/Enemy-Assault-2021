addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner"];
	//_score = ["read", [_uid, "kill_score", 30]] call inidbi;
	//[_score] remoteExec ["ast_fnc_addMoney", _owner];
	private _SystemLimited = ["B_Respawn_sleeping_bag_blue_F","B_Respawn_sleeping_bag_brown_F","B_Respawn_TentDome_F","B_Patrol_Respawn_bag_F","B_Respawn_TentA_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F","O_Mortar_01_support_F","O_Mortar_01_weapon_F","I_Mortar_01_support_F","I_Mortar_01_weapon_F","I_E_Mortar_01_support_F","I_E_Mortar_01_weapon_F"];
	AST_weaponlist = ["optic_Nightstalker","optic_NVS","optic_tws","optic_tws_mg","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_DMR_05_blk_F","srifle_DMR_05_hex_F","srifle_DMR_05_tan_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F","srifle_DMR_03_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","srifle_EBR_F","srifle_DMR_06_camo_F","srifle_DMR_06_olive_F","srifle_DMR_06_hunter_F","srifle_GM6_F","srifle_GM6_camo_F","srifle_GM6_ghex_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F","MMG_01_hex_F","MMG_01_tan_F","MMG_02_camo_F","MMG_02_black_F","MMG_02_sand_F"];
	AST_purchased = ["read", [_uid, "weaponlist", []]] call inidbi;
	AST_limitedItems = _SystemLimited + AST_weaponlist;
	AST_limitedItems = AST_limitedItems - AST_purchased;
	CHECK_ARSENAL = true;
	_owner publicVariableClient "AST_limitedItems";
	_owner publicVariableClient "AST_purchased";
	_owner publicVariableClient "AST_weaponlist";
	_owner publicVariableClient "CHECK_ARSENAL";
}];

AST_weaponPrice = [["optic_Nightstalker",2000],
["optic_NVS",2000],
["optic_tws",2000],
["optic_tws_mg",2000],
["srifle_DMR_02_F",2500],["srifle_DMR_02_camo_F",3000],["srifle_DMR_02_sniper_F",3000],
["srifle_DMR_05_blk_F",2500],["srifle_DMR_05_hex_F",3000],["srifle_DMR_05_tan_F",3000],
["srifle_DMR_04_F",1500],["srifle_DMR_04_Tan_F",2000],
["srifle_DMR_03_F",2000],["srifle_DMR_03_khaki_F",2500],["srifle_DMR_03_tan_F",2500],["srifle_DMR_03_multicam_F",2500],["srifle_DMR_03_woodland_F",2500],
["arifle_SPAR_03_blk_F",2000],["arifle_SPAR_03_khk_F",2500],["arifle_SPAR_03_snd_F",2500],
["srifle_EBR_F",1800],
["srifle_DMR_06_camo_F",1700],["srifle_DMR_06_olive_F",2200],["srifle_DMR_06_hunter_F",2200],
["srifle_GM6_F",5000],["srifle_GM6_camo_F",6000],["srifle_GM6_ghex_F",6000],
["srifle_LRR_F",3500],["srifle_LRR_camo_F",4500],["srifle_LRR_tna_F",4500],
["MMG_01_hex_F",7500],["MMG_01_tan_F",9500],
["MMG_02_camo_F",7500],["MMG_02_black_F",9500],["MMG_02_sand_F",9500]];

publicVariable "AST_weaponPrice";
// Server-side Function to get Specific Weapon / Attachment's purchased information

