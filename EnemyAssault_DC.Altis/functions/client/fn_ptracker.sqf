/*
V1.2 By: Ghost
Creates markers that stay with the players until nil.
*/
//if (!isserver) exitwith {};
//private ["_color","_marker"];
ghst_player_markers = [];
_PARAM_PMARKERS = "PARAM_PMARKERS" call BIS_fnc_getParamValue;
/*\
if (_PARAM_PMARKERS == 1) then {
	{
		_color = _x call ghstMarkerplayers_color;
		_marker = [[0,0],_color,(str _x),"","mil_triangle",[0.3,0.6]] call ghst_fnc_mark_local;
		ghst_player_markers = ghst_player_markers + [_marker];
		sleep 0.01;
	} forEach ghst_players;
};
*/
if (true) then {
	{
		[[0,0],"ColorGrey",_x] call ghst_fnc_mark_local;
		sleep 0.01;
	} forEach ghst_vehicles;
};

sleep 1;
while {true} do {
	if (_PARAM_PMARKERS == 1) then {
		[] spawn ghst_fnc_pmarkers;
	};
	[] spawn ghst_fnc_vehmarkers;
	sleep 1;
};