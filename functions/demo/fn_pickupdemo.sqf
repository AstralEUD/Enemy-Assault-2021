//pick up demo that was attached
_array = _this select 3;
	_explosive = _array select 0;
	_cn = _array select 1;
	_cvar = _array select 2;
	_expmag = _array select 3;
	_expname = _array select 4;

	if !(isnull _explosive) then {
		if ((player distance2d _explosive > 3) and !(isnull _explosive)) exitwith {hint format ["Too far away to pickup %1", _expname]};
		player playActionNow "PutDown";
		detach _explosive;
		//player action ["deactivate", player, _explosive];
		deletevehicle _explosive;
		player addMagazine _expmag;
		ghst_demo_array deleteAt _cn;
		hint format ["%1 picked up", _expname];
		_actionVariable = player getVariable _cvar;
		{player removeAction _x;} foreach _actionVariable;
		player setVariable [format["%1", _explosive], nil];
	} else {
		ghst_demo_array = ghst_demo_array - [objnull];
		//player removeAction (_this select 2);
		_actionVariable = player getVariable _cvar;
		{player removeAction _x;} foreach _actionVariable;
	};