private ["_grp","_wppos","_patrol_mark","_radarray","_markunitsarray","_markwps","_mcolor","_waypoint_params","_behave","_speed","_form","_wppos","_w","_marktext","_marker"];

_grp = _this select 0;
_patrol_mark = _this select 1;
_wppos = _this select 2;
_radarray = _this select 3;
_markunitsarray = [_this, 4, [], [[]],[2]] call BIS_fnc_param;
	_markwps = [_markunitsarray, 0, false,[true]] call BIS_fnc_param;
	_mcolor = [_markunitsarray, 1, "ColorRed", [""]] call BIS_fnc_param;
_waypoint_params = [_this, 5, [], [[]],[1,2,3]] call BIS_fnc_param;
	_behave = [_waypoint_params, 0, "COMBAT", [""]] call BIS_fnc_param;
	_speed = [_waypoint_params, 1, "NORMAL", [""]] call BIS_fnc_param;
	_form = [_waypoint_params, 2, "STAG COLUMN", [""]] call BIS_fnc_param;

for "_w" from 1 to (5) do {

	if ((_w != 1) or (count _wppos < 2)) then {
	_wppos = [_patrol_mark,_radarray] call ghst_fnc_rand_position;
	};

	_grp addwaypoint [_wppos, 10];
	[_grp, _w] setWPPos _wppos;
		if (_w == 1) then {
			[_grp, _w] setWaypointType "UNLOAD";
			[_grp, _w] setWaypointBehaviour "SAFE";
			//[_grp, _w] setWaypointStatements ["true","unassignVehicle (driver vehicle this);"];
		};
		if !((_w == 1) or (_w == 5)) then {
			[_grp, _w] setWaypointType "SAD";
			[_grp, _w] setWaypointBehaviour _behave;
			[_grp, _w] setWaypointSpeed _speed;
			[_grp, _w] setWaypointFormation _form;
			[_grp, _w] setWaypointTimeout [10, 30, 60];
			[_grp, _w] setWaypointCompletionRadius 25;
		};
		if (_w == 5) then {
			[_grp, _w] setWaypointType "CYCLE";
		};
	//sleep 0.1;
	
	//create markers for waypoints
	if (_markwps) then {
		_marktext = format ["%1 Waypoint: %2 Type: %3",_grp, _w, waypointType [_grp,_w]];
		_marker = [_wppos,_mcolor,_marktext] call ghst_fnc_mark_point;
	};
};