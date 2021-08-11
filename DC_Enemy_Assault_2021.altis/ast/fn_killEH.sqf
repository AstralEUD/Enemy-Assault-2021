this addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	if (!isPlayer _unit) exitWith {diag_log "[EA2021] AI respawned";};
	_unit addAction ["<t color = '#0080FF' size='1.5'> Rearm (COST 5 points)","ast\fn_rearm.sqf",nil,1.5,true,true,"","player inArea 'ASTRearmArea'",50,false,"",""];
	_unit addAction ["<t color = '#0080FF' size='1.5'> Rearm (COST 5 points)","ast\fn_rearm.sqf",nil,1.5,true,true,"","player inArea 'ASTAirRearm'",50,false,"",""];
}];