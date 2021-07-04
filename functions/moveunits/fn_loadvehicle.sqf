/*V1.1 By Ghost - allows player to load dragged unit into vehicle
ghst_action_loadvehicle = this addaction ["<t size='1.2' shadow='2' color='#0000FF'>load Unit</t>", { call ghst_fnc_release; }, [injured], 1, false, false, "","alive _target and _this == _target"];
*/
private ["_host","_caller","_id","_obj","_unit","_carryunit","_nearvehs","_nearveh","_vehseat"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_args = _this select 3;
_unit = _args select 0;
_carryunit = _args select 1;
_vehseat = _args select 2;//what position in vehicle (driver,cargo,gunner)

_nearvehs = nearestObjects [_caller, ["air","car","truck","tank","StaticWeapon"], 10];
if (isnil "_nearvehs") exitwith {hint "No vehicles near by";};
_nearveh = _nearvehs select 0;
if (isnil "_nearveh") exitwith {hint "No vehicles near by";};
switch (_vehseat) do {
		case "cargo": {
		if (_nearveh emptyPositions "Cargo" > 0) then {
			_host removeaction _id;
			detach _unit;
			_unit assignAsCargo _nearveh;
			//_unit moveincargo _nearveh;
			_unit action ["GetInCargo", _nearveh];
			ghst_dragunit = false;
			_caller addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
			if !(isnil "ghst_action_release") then {
				_host removeAction ghst_action_release;
			};
			if !(isnil "ghst_action_loadvehiclecargo") then {
				_host removeAction ghst_action_loadvehiclecargo;
			};
			if !(isnil "ghst_action_loadvehicledriver") then {
				_host removeAction ghst_action_loadvehicledriver;
			};
			if !(isnil "ghst_action_loadvehiclegunner") then {
				_host removeAction ghst_action_loadvehiclegunner;
			};
			if !(isnil "ghst_action_loadvehicleturret") then {
				_host removeAction ghst_action_loadvehicleturret;
			};
			
		} else {hint "No cargo space available";};
	};
		case "driver": {
		if (_nearveh emptyPositions "Driver" > 0) then {
			_host removeaction _id;
			detach _unit;
			_unit assignAsDriver _nearveh;
			_unit action ["GetInDriver", _nearveh];
			ghst_dragunit = false;
			_caller addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
			if !(isnil "ghst_action_release") then {
				_host removeAction ghst_action_release;
			};
			if !(isnil "ghst_action_loadvehiclecargo") then {
				_host removeAction ghst_action_loadvehiclecargo;
			};
			if !(isnil "ghst_action_loadvehicledriver") then {
				_host removeAction ghst_action_loadvehicledriver;
			};
			if !(isnil "ghst_action_loadvehiclegunner") then {
				_host removeAction ghst_action_loadvehiclegunner;
			};
			if !(isnil "ghst_action_loadvehicleturret") then {
				_host removeAction ghst_action_loadvehicleturret;
			};
		} else {hint "No driver space available";};
	};
		case "gunner": {
		if (_nearveh emptyPositions "Gunner" > 0) then {
			_host removeaction _id;
			detach _unit;
			_unit assignAsGunner _nearveh;
			_unit action ["GetInGunner", _nearveh];
			ghst_dragunit = false;
			_caller addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
			if !(isnil "ghst_action_release") then {
				_host removeAction ghst_action_release;
			};
			if !(isnil "ghst_action_loadvehiclecargo") then {
				_host removeAction ghst_action_loadvehiclecargo;
			};
			if !(isnil "ghst_action_loadvehicledriver") then {
				_host removeAction ghst_action_loadvehicledriver;
			};
			if !(isnil "ghst_action_loadvehiclegunner") then {
				_host removeAction ghst_action_loadvehiclegunner;
			};
			if !(isnil "ghst_action_loadvehicleturret") then {
				_host removeAction ghst_action_loadvehicleturret;
			};
		} else {hint "No gunner space available";};
	};
		case "turret": {
		_allturrets= fullCrew [_nearveh, "Turret", true];
		_crewturrets = fullCrew [_nearveh, "Turret", false];
		_onlyemptyturrets = _allturrets - _crewturrets;
		if (count _onlyemptyturrets > 0) then {
			_host removeaction _id;
			detach _unit;
			_selturret = (_onlyemptyturrets select 0) select 3;
			_unit assignAsTurret [_nearveh, _selturret];
			_unit action ["GetInTurret", _nearveh, _selturret];
			ghst_dragunit = false;
			_caller addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
			if !(isnil "ghst_action_release") then {
				_host removeAction ghst_action_release;
			};
			if !(isnil "ghst_action_loadvehiclecargo") then {
				_host removeAction ghst_action_loadvehiclecargo;
			};
			if !(isnil "ghst_action_loadvehicledriver") then {
				_host removeAction ghst_action_loadvehicledriver;
			};
			if !(isnil "ghst_action_loadvehiclegunner") then {
				_host removeAction ghst_action_loadvehiclegunner;
			};
			if !(isnil "ghst_action_loadvehicleturret") then {
				_host removeAction ghst_action_loadvehicleturret;
			};
		} else {hint "No turret space available";};
	};
};

