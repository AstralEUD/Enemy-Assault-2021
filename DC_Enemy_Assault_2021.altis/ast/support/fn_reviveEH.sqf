AST_fnc_awardRevive = {
	params[ "_unit" ];
	private _bonus = selectRandom [5,10,15];
	hint format[ " %1을 소생시켜, %2포인트를 얻었습니다.", name _unit, _bonus];
	AST_kill_score += _bonus;
	[_bonus] call AST_HUD_plus;
	};
[missionNamespace, "reviveRevived", {
	params [ "_unit", "_revivor" ];
	if !( isNull _revivor ) then {
		[_unit] remoteExec ["AST_fnc_awardRevive", _revivor];
};
}] call BIS_fnc_addScriptedEventHandler;