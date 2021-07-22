//V2 by Ghost, rearm vehicle
private ["_object","_reload_time","_type","_Object_name","_fuelstore","_removed","_f"];

_object = vehicle (_this select 1);//object to rearm
_params = _this select 3;
_reload_time = [_params, 0, 10,[0]] call BIS_fnc_param;//how long it takes to rearm

_type = typeof _object;

if ((_object isKindOf "ParachuteBase") or (_object isKindOf "Man")) exitWith {};

_fuelstore = fuel _object;
_object setFuel 0;

_Object_name = (configFile >> "cfgVehicles" >> (_type) >> "displayName") call bis_fnc_getcfgdata;

_object vehicleChat format ["Servicing %1... Please stand by...", _Object_name];

While {alive _object} do {
	_object vehicleChat "Rearming...";
	sleep _reload_time;
	_object setVehicleAmmo 1;

	_object vehicleChat "Repairing...";
	sleep _reload_time;
	_object setDamage 0;

	_object vehicleChat "Refueling...";
	sleep _reload_time;
	_f = 0.01;
	while {fuel _object < 0.99} do {
		_object setFuel _fuelstore + _f;
		sleep 0.2;
		_f = _f + 0.01;
	};
	_object vehicleChat format ["%1 is ready...", _Object_name];
	if (true) exitWith {};
};
