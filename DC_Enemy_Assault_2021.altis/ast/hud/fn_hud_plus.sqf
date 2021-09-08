// [숫자] call AST_fnc_hud_plus;
params ["_input"];
AST_HUD_STATUS = "+" + str(_input);
if (AST_HUD_ongoing == true) then {
	AST_wait_UPDATE = true;
	if (canSuspend == true) then {sleep 0.11;};
};
//[] call ast_fnc_hud_update;
