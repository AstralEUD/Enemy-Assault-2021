/*private _BackpackRemove = ["B_Respawn_sleeping_bag_blue_F","B_Respawn_sleeping_bag_brown_F","B_Respawn_TentDome_F","B_Patrol_Respawn_bag_F","B_Respawn_TentA_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F","O_Mortar_01_support_F","O_Mortar_01_weapon_F","I_Mortar_01_support_F","I_Mortar_01_weapon_F","I_E_Mortar_01_support_F","I_E_Mortar_01_weapon_F"];
//[AmmoBox01, _BackpackRemove, true] call BIS_fnc_removeVirtualBackpackCargo;
private _all = ["%ALL"] - _BackpackRemove;

["AmmoBoxInit", AmmoBox01, false, {true}] call BIS_fnc_arsenal;

[AmmoBox01,_all,true,false] call BIS_fnc_addVirtualBackpackCargo;
[AmmoBox01,true,true,false] call BIS_fnc_addVirtualItemCargo;
[AmmoBox01,true,true,false] call BIS_fnc_addVirtualMagazineCargo;
[AmmoBox01,true,true,false] call BIS_fnc_addVirtualWeaponCargo;

[AmmoBox01, _BackpackRemove, true] call BIS_fnc_removeVirtualBackpackCargo;*/

["AmmoBoxInit", AmmoBox01, true, {true}] call BIS_fnc_arsenal;
["AmmoBoxInit", AmmoBox02, true, {true}] call BIS_fnc_arsenal;