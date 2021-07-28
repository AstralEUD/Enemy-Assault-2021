private ["_grp","_patrol_mark","_radarray","_markunitsarray","_markwps","_mcolor","_waypoint_params","_behave","_speed","_form","_wateronly","_underwater","_wppos","_w","_marktext","_marker","_randomz","_wpposasl"];

_grp = _this select 0;
_patrol_mark = _this select 1;
_radarray = _this select 2;
_markunitsarray = [_this, 3, [], [[]],[2]] call BIS_fnc_param;
	_markwps = [_markunitsarray, 0, false,[true]] call BIS_fnc_param;
	_mcolor = [_markunitsarray, 1, "ColorRed", [""]] call BIS_fnc_param;
_waypoint_params = [_this, 4, [], [[]],[1,2,3]] call BIS_fnc_param;
	_behave = [_waypoint_params, 0, "AWARE", [""]] call BIS_fnc_param;
	_speed = [_waypoint_params, 1, "NORMAL", [""]] call BIS_fnc_param;
	_form = [_waypoint_params, 2, "STAG COLUMN", [""]] call BIS_fnc_param;
_wateronly = [_this, 5, false,[true]] call BIS_fnc_param;
_underwater = [_this, 6, false,[true]] call BIS_fnc_param;

for "_w" from 0 to (3) do {

	_wppos = [_patrol_mark,_radarray,_wateronly] call ghst_fnc_rand_position;
	
	if (_wateronly and _underwater) then {
		_wpposasl = ATLtoASL _wppos;
		_randomz = random (_wpposasl select 2);
		_wppos = [_wpposasl select 0, _wpposasl select 1, _randomz];
	};
		
	_grp addwaypoint [_wppos, 10];
	[_grp, _w] setWPPos _wppos;
		if (_w == 3) then {
			[_grp, _w] setWaypointType "CYCLE";
		} else {
			[_grp, _w] setWaypointType "SAD";
		};
	[_grp, _w] setWaypointSpeed _speed;
	[_grp, _w] setWaypointBehaviour _behave;
	[_grp, _w] setWaypointFormation _form;
	[_grp, _w] setWaypointTimeout [10, 30, 60];
	[_grp, _w] setWaypointCompletionRadius 25;
	//sleep 0.1;

	//create markers for waypoints
	if (_markwps) then {
		_marktext = format ["%1 Waypoint %2",_grp, _w];
		_marker = [_wppos,_mcolor,_marktext] call ghst_fnc_mark_point;
	};
};