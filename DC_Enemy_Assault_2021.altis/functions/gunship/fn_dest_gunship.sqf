/*
V1.1 By: Ghost - tells gunship to move to new position
ghst_dest_gunship = _air1 addAction ["<t size='1.5' shadow='2' color='#00FF00'>Gunship Destination</t> <img size='3' color='#009933'", "call ghst_fnc_dest_gunship", [_air1,_grp,_rad], 5, false, true, "","alive _target"];
*/
private ["_pos"];
_args = _this select 3;
_air1 = _args select 0;
_grp = _args select 1;
_rad = _args select 2;

openMap true;

player groupChat "Left click on the map where you want the gunship to move to";

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};

	if !(visibleMap) exitwith {
		player groupchat "New destination request cancelled";
	};
	
_pos = [clickpos select 0, clickpos select 1, (getposatl player) select 2];

sleep 1;

openMap false;

_air1 sidechat "Moving to new location";

_air1 move _pos;
_air1 setSpeedMode "Normal";
//_wp = [_grp,_pos, _rad, "MOVE", "CARELESS", "NORMAL"] call ghst_fnc_createwaypoint;
//_grp setCurrentWaypoint _wp;

while {(count (waypoints _grp)) > 0} do
{
deleteWaypoint ((waypoints _grp) select 0);
};

waituntil { (_pos distance2D _air1 < _rad + 300) or {!(alive _air1)} or {!(canmove _air1)} or {!(alive (driver _air1))} };

_wp =_grp addwaypoint [_pos, _rad];
_wp setWPPos _pos;
_wp setWaypointType "LOITER";
_wp setWaypointLoiterType "CIRCLE_L";
_wp setWaypointLoiterRadius _rad;
_air1 setSpeedMode "Normal";
_wp setWaypointSpeed "Normal";
_grp setCurrentWaypoint _wp;