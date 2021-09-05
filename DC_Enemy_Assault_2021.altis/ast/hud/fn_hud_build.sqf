// 변수명 = ["메세지",포인트] call AST_fnc_hud_build;

params ["_message","_point"];
if (_point > 1) then {
	_ast_hud_build = formatText ["<t color='#ffffff' shadow='2'>%1 </t><t color='#009900' shadow='2'>%2 points</t>",_message,_point];
} else {
	if (_point == 0) then {
		_ast_hud_build = formatText ["<t color='#ffffff' shadow='2'>%1 </t>",_message];
	} else {
		_ast_hud_build = formatText ["<t color='#ffffff' shadow='2'>%1 </t><t color='#d51d36' shadow='2'>%2 points</t>",_message,_point];
	};
};
AST_HUD_LIST pushBack _ast_hud_build;
