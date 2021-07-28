/*V3.5.3 by: Ghost - create enemy convoy for a counter offensive.
ghst_ecounter = [pos,{radius array],spawn radius,enemynum,[markwaypoints(true\false),"ColorRed"],aiskill]  execvm "scripts\ghst_ecounter.sqf";

ex: ghst_ecounter = [[1,2,3],[100,100],10,6,[true,"ColorRed"],0.5]  execvm "scripts\ghst_ecounter.sqf";
*/
if (!isserver) exitwith {};

_position_mark = _this select 0;//objective position
_radarray = _this select 1;//distance from marker center to spawn
	_radx = _radarray select 0;
	_rady = _radarray select 1;
_rad = _this select 2;//radius around marker center for unload point
_enum = _this select 3;//number of vehicles to spawn
_markunitsarray = _this select 4;//markwaypoints
	_markwps = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
#define aiSkill _this select 5//sets AI accuracy


{deleteGroup _x} foreach allGroups;

//Enemy vehicle and unit list
//#include "unit_list.sqf"
_menlist = ghst_menlist;
_vehlist = ghst_convoyvehlist;
_ghst_side = ghst_side;
//do not edit this section - Spawns the cars
//
//
//find spawn point outside of objective zone
private ["_loop","_roadssel","_roads","_wpstart"];
_loop = true;
	while {_loop} do {
		_startpos = [(_position_mark select 0) + _radx * sin(random 360),(_position_mark select 1) + _rady * cos(random 360)];
		_roads = (_startpos nearRoads 200);
			if !(isnil "_roads") then {
				if (((_startpos distance _position_mark) > (_radx - 200)) and {!(count _roads == 0)} and {(_startpos distance (getmarkerpos "Respawn_West") > 1500)}) exitwith {_loop = false;};
			};
	};
_roadssel = selectRandom _roads;   
_wpstart = getpos _roadssel;

	if (_markwps) then {
		[_wpstart,_mcolor,"Start"] call ghst_fnc_mark_point;
	};

//Spawn
for "_e" from 0 to (_enum)-1 do {

	private ["_wppos","_roadssel","_roads","_emptyseats"];
	
	_roads = (_position_mark nearRoads _rad);   
	_roadssel = selectRandom _roads;  
	if (isnil "_roadssel") then {
		_wppos = [_position_mark,_radarray] call ghst_fnc_rand_position;
	} else {
		_wppos = getpos _roadssel;
	};
	_dir = _wpstart getdir _wppos;

	_veh = selectRandom _vehlist;
	_car1 = createVehicle [_veh,_wpstart, [], 0, "NONE"];
	EA_spawned_things pushBack _car1;
	_car1 setdir _dir;
	//sleep 0.2;
	//_eGrp = createGroup _ghst_side;
	//_crew = [_car1, _egrp] call BIS_fnc_SpawnCrew;
	createVehicleCrew _car1;
	_eGrp = group (driver _car1);

	_emptyseats = _car1 emptypositions "cargo";
	
	if (_emptyseats > 9) then {_emptyseats = 9;};
	
		for "_s" from 1 to _emptyseats do {
			_mansel = selectRandom _menlist;
			_man = [_wpstart,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
			_man assignAsCargo _car1;
			_man moveincargo _car1;
			//sleep 0.01;
		};
	
	//sleep 0.5;

	[_eGrp,_position_mark, _wppos, [_rad,_rad],_markunitsarray,["AWARE", "NORMAL", "WEDGE"]] call ghst_fnc_waypoints_unload;

	//sleep 5;
};