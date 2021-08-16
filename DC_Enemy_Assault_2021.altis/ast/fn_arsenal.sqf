params ["_object"];
[_object,true,true,true] call BIS_fnc_addVirtualBackpackCargo;
[_object,true,true,true] call BIS_fnc_addVirtualItemCargo;
[_object,true,true,true] call BIS_fnc_addVirtualMagazineCargo;
[_object,true,true,true] call BIS_fnc_addVirtualWeaponCargo;
_BackpackRemove = [
	//RespawnTent
	"B_Respawn_sleeping_bag_blue_F","B_Respawn_sleeping_bag_brown_F","B_Respawn_TentDome_F","B_Patrol_Respawn_bag_F","B_Respawn_TentA_F",
	//Mortar Backpack
	"B_Mortar_01_support_F","B_Mortar_01_weapon_F","O_Mortar_01_support_F","O_Mortar_01_weapon_F","I_Mortar_01_support_F","I_Mortar_01_weapon_F","I_E_Mortar_01_support_F","I_E_Mortar_01_weapon_F"];
[_object, _BackpackRemove, true] call BIS_fnc_removeVirtualBackpackCargo;