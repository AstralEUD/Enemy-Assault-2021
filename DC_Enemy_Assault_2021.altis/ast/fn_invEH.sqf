/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Displays player points in inventory screen           │
│   Call Example:                                                     │
│   [] call AST_fnc_invEH;                                            │
└─────────────────────────────────────────────────────────────────────*/

player addEventHandler ["InventoryOpened", {
[] spawn {
waitUntil {!isNull (findDisplay 602)}; // Wait until the right dialog is really open
player addEventHandler ["InventoryClosed", {
removeMissionEventHandler ["Draw3D", missionNamespace getVariable "WGP_UI_redraw"];
}];
_whileopen = addMissionEventHandler ["Draw3D", {
(findDisplay 602 displayCtrl 111) ctrlSetText (name player + " [ 현재 포인트 : " + str(round(AST_kill_score))+ "pts ]");
}];
missionNamespace setVariable ["WGP_UI_redraw", _whileopen];

};
}];