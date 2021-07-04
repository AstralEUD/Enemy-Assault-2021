//Create one waypoint
//[grp,wppos, rad, "MOVE", "CARELESS", "NORMAL", "WEDGE"] call ghst_fnc_createwaypoint;
private ["_grp","_wppos","_rad","_type","_behave","_speed","_form","_wppos","_wp"];
_grp = _this select 0;
_wppos = _this select 1;
_rad = param [2, 10, [0]];
_type = param [3, "MOVE", [""]];
_behave = param [4, "CARELESS", [""]];
_speed = param [5, "NORMAL", [""]];
_form = param [6, "WEDGE", [""]];
	
_wp =_grp addwaypoint [_wppos, _rad];
_wp setWPPos _wppos;
_wp setWaypointType _type;
_wp setWaypointBehaviour _behave;
_wp setWaypointSpeed _speed;
_wp setWaypointFormation _form;
//_wp setWaypointCompletionRadius _rad;

_wp