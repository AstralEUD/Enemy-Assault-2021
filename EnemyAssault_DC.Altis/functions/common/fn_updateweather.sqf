private ["_delay","_ghst_weather","_overcast","_rain","_winddir","_windstr","_delay"];

_delay = _this select 0;//delay in seconds for transition
//set weather
_ghst_weather = missionNamespace getvariable "ghst_weather";

_overcast = _ghst_weather select 0;
_rain = _ghst_weather select 1;
_winddir = _ghst_weather select 2;
_windstr = _ghst_weather select 3;

_delay setFog [0.1, 0.125, 0];
_delay setOvercast _overcast;
_delay setrain _rain;
_delay setWindDir _winddir;
_delay setWindStr _windstr;