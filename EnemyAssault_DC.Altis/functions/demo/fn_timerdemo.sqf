//sets attached demo timer
_array = _this select 3;
	_explosive = _array select 0;
	_cn = _array select 1;
	_cvar = _array select 2;
	_expmag = _array select 3;
	_expname = _array select 4;
private ["_timedelay"];
//player removeAction (_this select 2);
	if !(isnull _explosive) then {
		if ((player distance2d _explosive > 3) and !(isnull _explosive)) exitwith {hint format ["Too far away to set timer on %1", _expname]};
		player playActionNow "PutDown";
		player action ["SetTimer", player, _explosive];
		_timedelay = time + 45;
		hint format ["%1 %2 Timer Set +40 seconds", _expname, (_cn + 1)];
		ghst_demo_array deleteAt _cn;
		_actionVariable = player getVariable _cvar;
		{player removeAction _x;} foreach _actionVariable;
		player setVariable [format["%1", _explosive], nil];
		
		waituntil { time > _timedelay};
		
		if !(isnull _explosive) then {
			_explosive setdamage 1;
		};
	} else {
		ghst_demo_array = ghst_demo_array - [objnull];
		//player removeAction (_this select 2);
		_actionVariable = player getVariable _cvar;
		{player removeAction _x;} foreach _actionVariable;
	};