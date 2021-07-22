/*
Ver 1.2 - By: Ghost   Randomly creates different types of vehicles to sit on a road or random location.
eveh_sentry_spawn = [[1,1,2] or "marker",[wpradius_X,wpradius_Y] if not a marker,grpnum,east,[true,"ColorRed"],aiaccuracy] execVM "dta\scripts\eveh_sentry_spawn.sqf";
*/
if (!isServer) exitWith {};

_patrol_mark = _this select 0;//position or marker
_radarray = _this select 1;//radius array around position and Direction [300,300,53]
_grpnum = _this select 2;
_sideguards = _this select 3;//side of guards
_markunitsarray = _this select 4;
	_markunits = _markunitsarray select 0;//true to mark units
	_mcolor = _markunitsarray select 1;//marker color
#define aiSkill _this select 5//sets AI accuracy

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
//_menlist = ghst_crewmenlist;
_menlist = ghst_menlist;
_vehlist = ghst_patrolvehlist;

//Do not edit below this line unless you know what you are doing//
/////////////////////////////////////////////////////

private ["_rad"];

if ((_radarray select 0) > (_radarray select 1)) then {_rad = (_radarray select 0);} else {_rad = (_radarray select 1);};

//Get array of roads in area
//_roads = (_patrol_mark nearRoads _rad);
_roads = (_patrol_mark nearRoads _rad) select {((_x isEqualType objNull) && (!((roadsConnectedTo _x) isEqualTo [])))};

for "_x" from 0 to (_grpnum)-1 do {

	private ["_pos","_dir"];
	if (count _roads > 0) then {
		_roadssel = selectRandom _roads;
		_roadconto = roadsConnectedTo _roadssel;
		_dir = [_roadssel, _roadconto select 0] call BIS_fnc_DirTo;
		_roads = _roads - [_roadssel];
		_pos =  [(getposatl _roadssel select 0) -5 * sin(random 360),(getposatl _roadssel select 1) -5 * cos(random 360)];

	} else {

		_pos = [_patrol_mark,_radarray] call ghst_fnc_rand_position;
		
		_dir = (_radarray select 2);
	};
	
	if (isnil "_dir") then {_dir = random 360;};
	
	_veh = selectRandom _vehlist;
	_armor1 = createVehicle [_veh,_pos, [], 0, "NONE"];
	_armor1 setdir _dir;
	_armor1 setposatl (getposatl _armor1);

	//_eGrp = createGroup _sideguards;
	//_crew = [_armor1, _eGrp] call BIS_fnc_SpawnCrew;
	createVehicleCrew _armor1;
	_eGrp = group (driver _armor1);

	_emptyseats = _armor1 emptypositions "cargo";
	
		for "_s" from 0 to (_emptyseats)-2 do {
			_mansel = selectRandom _menlist;
			_man = [_pos,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
			_man assignAsCargo _armor1;
			_man moveincargo _armor1;
			//sleep 0.01;
		};
		
	//set combat mode
	_eGrp setCombatMode "RED";

	//create markers for units
	if (_markunits) then {
		_mtext = format ["Sentry %1",_eGrp];
		[_pos,_mcolor,_mtext] call ghst_fnc_mark_point;
	};
};
	
if (true) exitWith {};