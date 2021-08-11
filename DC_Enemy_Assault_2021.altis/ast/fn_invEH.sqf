player addEventHandler ["InventoryOpened", {
[] spawn {
waitUntil {!isNull (findDisplay 602)}; // Wait until the right dialog is really open
player addEventHandler ["InventoryClosed", {
removeMissionEventHandler ["Draw3D", missionNamespace getVariable "WGP_UI_redraw"];
}];
_whileopen = addMissionEventHandler ["Draw3D", {
[player] remoteExec ["AST_fnc_db_fetch_money", 2, false]; 
(findDisplay 602 displayCtrl 111) ctrlSetText (name player + " [ 현재 포인트 : " + str(AST_kill_score)+ "pts ]");
}];
missionNamespace setVariable ["WGP_UI_redraw", _whileopen];

};
}];