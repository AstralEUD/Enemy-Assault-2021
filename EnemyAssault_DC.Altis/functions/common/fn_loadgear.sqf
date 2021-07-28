/*
private ["_ppack"];
_ppack = unitBackpack player;
if !(isnil "_ppack") then {
	removeBackpackGlobal player;
};*/
//[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_loadInventory;
player setUnitLoadout (player getVariable ["GHST_Current_Gear",[]]);
if (player hasweapon "laserdesignator") then {
	player addmagazine "laserbatteries";
};

{player disableUAVConnectability [_x,true];} forEach [aa1,art1,art2];