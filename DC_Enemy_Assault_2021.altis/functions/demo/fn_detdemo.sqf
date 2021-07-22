//detonate demo that was attached
_array = _this select 3;
	_explosive = _array select 0;
	_cn = _array select 1;
	_cvar = _array select 2;

	if !(isnull _explosive) then {
		//player action ["TouchOff", player];
		detach _explosive;
		_explosive setDamage 1;
		ghst_demo_array deleteAt _cn;
		_actionVariable = player getVariable _cvar;
		{player removeAction _x;} foreach _actionVariable;
		player setVariable [format["%1", _explosive], nil];
	} else {
		ghst_demo_array = ghst_demo_array - [objnull];
		//player removeAction (_this select 2);
		_actionVariable = player getVariable _cvar;
		{player removeAction _x;} foreach _actionVariable;
	};