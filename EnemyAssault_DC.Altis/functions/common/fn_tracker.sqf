/*
V1.4 By: Ghost
Creates a marker that stays with a vehicle until its dead. ghst_tracker = [veh, "color", "type", "name", always show marker true/false,global(true) default false] spawn ghst_fnc_tracker.sqf";
*/

_veh = _this select 0;
_mcolor = param [1, "colorBLUFOR", [""]];
_mtype = param [2, "mil_DOT", [""]];
_veh_name = param [3, (typeof _veh), [""]];
_always_show = param [4, false,[true]];//always show marker even with crew
_global = param [5, false,[true]];//show marker globally default false

_vehpos = getpos _veh;

_mtext = format ["%1", _veh_name];
_markname = "ghst_mark" + _veh_name + str (random 999);
_markertext = "";

if _global then {

	_mark1 = [_vehpos,_mcolor,_markname,_mtext,_mtype] call ghst_fnc_mark_global;

	while {alive _veh} do {
		_cargoPositions = _veh emptyPositions "cargo";
		if ((_cargoPositions == 0) or _always_show) then {
			_mark1 setMarkerAlpha 1;
			_mark1 setMarkerText _veh_name;//
		} else {
			_markertext = format ["%1 [+%2]", (configFile >> "cfgVehicles" >> (typeOf _veh) >> "displayName") call BIS_fnc_getCfgData, count (crew _veh) - 1];
			_mark1 setMarkerText _markertext;
			_mark1 setMarkerAlpha 0;
		};
		_mark1 setmarkerpos (getpos _veh);
		if (isnil "_veh") exitwith {};
		sleep 1;
	};
	deletemarker _mark1;

} else {

	_mark1 = [_vehpos,_mcolor,_markname,_mtext,_mtype] call ghst_fnc_mark_local;

	while {alive _veh} do {
		_cargoPositions = _veh emptyPositions "cargo";
		if ((_cargoPositions == 0) or _always_show) then {
			_mark1 setMarkerAlphaLocal 1;
			_mark1 setMarkerTextLocal _veh_name;//
		} else {
			_markertext = format ["%1 [+%2]", (configFile >> "cfgVehicles" >> (typeOf _veh) >> "displayName") call BIS_fnc_getCfgData, count (crew _veh) - 1];
			_mark1 setMarkerTextLocal _markertext;
			_mark1 setMarkerAlphaLocal 0;
		};
		_mark1 setmarkerposlocal (getpos _veh);
		if (isnil "_veh") exitwith {};
		sleep 1;
	};
	deletemarkerlocal _mark1;
	
};