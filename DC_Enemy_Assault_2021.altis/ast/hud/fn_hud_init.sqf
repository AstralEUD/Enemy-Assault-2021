disableSerialization;
AST_HUD = findDisplay 11018;
AST_HUD_INFO = AST_HUD displayCtrl 110181;
//AST_HUD_ALERT = AST_HUD displayCtrl 110182;
//for "_i" from 1 to 7 do {AST_HUD_ALERT lbAdd "";};
[] spawn {
	while {true} do {
		AST_HUD_INFO ctrlSetStructuredText formatText ["<t align='center'>%1</t>",AST_kill_score];
		/*if ((count AST_HUD_LIST) > 0) then {
			{
				_indexto = 6 - (AST_HUD_ALERT find _x);
				AST_HUD_ALERT lbSetTextRight [_indexto,_x];
			} forEach AST_HUD_LIST;*/
	};
};