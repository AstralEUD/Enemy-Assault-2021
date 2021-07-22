//V1.4.2 Script by: Ghost - Random weather every 20-40 mins
//execvm "scripts\ghst_weather.sqf";
private ["_PARAM_Rain","_randomnum","_rain","_winddir","_windstr","_overcast"];

_PARAM_Rain = "PARAM_Rain" call BIS_fnc_getParamValue;
_randomnum = (random 10) / 10;

//initial weather setting
switch (_PARAM_Rain) do
	{   
		case 0:
		{
			//random weather and no rain
			_overcast = _randomnum;
			_rain = 0;
		};
		case 1:
		{
			//random weather and rain
			_overcast = _randomnum;
			if ((_overcast > 0.7) and (random 10) > 7) then {
				_rain = _randomnum;
			} else {
				_rain = 0;
			};
		};
		case 90:
		{
			//stormy heavy rain
			_overcast = 1;
			_rain = 1;
		};
		case 99:
		{
			//stormy no rain
			_overcast = 1;
			_rain = 0;
		};
		default
		{
			//set rain random weather
			_overcast = _randomnum;
			if (_overcast > 0.7) then {
				_rain = _PARAM_Rain / 10;
			} else {
				_rain = 0;
			};
		};
	};


_winddir = round(random 360);
_windstr = floor(random 6) / 10;

//diag_log format ["OVERCAST %1: RAIN %2: WINDDIR %3: WINDSTR %4", _overcast, _rain, _winddir, _windstr];

//send weather info to clients
missionNamespace setVariable ["ghst_weather", [_overcast, _rain, _winddir, _windstr]];
publicvariable "ghst_weather";

_delay = 86400;
skipTime -24;
[_delay] call ghst_fnc_UpdateWeather;
skipTime 24;

sleep 1;

simulWeatherSync;

//looping dynamic weather
while {true} do {
	private ["_ghst_weather","_overcastnext","_rainnext","_winddirnext","_windstrnext","_rain","_winddir","_windstr","_overcast"];

	sleep 1200 + round(random 1200);
		
	_ghst_weather = missionNamespace getvariable "ghst_weather";

	_overcast = _ghst_weather select 0;
	_rain = _ghst_weather select 1;
	_winddir = _ghst_weather select 2;
	_windstr = _ghst_weather select 3;
	
	//get random weather
	_overcastnext = (_overcast + (round((random(0.2)-0.1) * 100)) / 100);
	if (_overcastnext > 1) then {_overcastnext = 1;};
	if (_overcastnext < 0.2) then {_overcastnext = 0.2;};
	if ((_overcastnext > 0.7) and (random 10) > 7) then {
		_rainnext = (_rain + (round((random(0.2)-0.1) * 100)) / 100);
	} else {
		_rainnext = 0;
	};
	if (_rainnext > 1) then {_rainnext = 1;};
	if (_rainnext < 0) then {_rainnext = 0;};
	if ((_PARAM_Rain == 0) or (_PARAM_Rain == 99)) then {_rainnext = 0;};
	_winddirnext = _winddir;
	_windstrnext = (_windstr + (round((random(0.2)-0.1) * 100)) / 100);
	if (_windstrnext > 0.7) then {_windstrnext = 0.7;};
	if (_windstrnext < 0) then {_windstrnext = 0;};

	//diag_log format ["OVERCAST %1: RAIN %2: WINDDIR %3: WINDSTR %4", _overcastnext, _rainnext, _winddirnext, _windstrnext];
	//send weather info to clients
	missionNamespace setVariable ["ghst_weather", [_overcastnext, _rainnext, _winddirnext, _windstrnext]];
	publicvariable "ghst_weather";
	
	sleep 10;
	
	[900] remoteExec ["ghst_fnc_UpdateWeather"];
	
};