addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner"];
	//_score = ["read", [_uid, "kill_score", 30]] call inidbi;
	//[_score] remoteExec ["ast_fnc_addMoney", _owner];
	private _SystemLimited = ["B_Respawn_sleeping_bag_blue_F","B_Respawn_sleeping_bag_brown_F","B_Respawn_TentDome_F","B_Patrol_Respawn_bag_F","B_Respawn_TentA_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F","O_Mortar_01_support_F","O_Mortar_01_weapon_F","I_Mortar_01_support_F","I_Mortar_01_weapon_F","I_E_Mortar_01_support_F","I_E_Mortar_01_weapon_F"];

	AST_limitedItems = _SystemLimited;
	_owner publicVariableClient "AST_limitedItems";
}];


