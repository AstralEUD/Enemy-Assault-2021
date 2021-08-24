/*
Ver 3.9.4 - By: Ghost   Randomly creates different types of vehicles .
ghst_evehspawn = [[1,1,2],[wpradius_X,wpradius_Y],grpnum,[true,"ColorRed"],aiaccuracy] execVM "dta\scripts\evehspawn.sqf";
*/
if (!isServer) exitWith {};

_position_mark = _this select 0;//position
_radarray = _this select 1;
	_radx = _radarray select 0;
	_rady = _radarray select 1;
_grpnum = _this select 2;
_sideguards = _this select 3;//side of guards
_markunitsarray = _this select 4;
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
#define aiSkill _this select 5//sets AI accuracy

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_crewmenlist;
_vehlist = ghst_patrolvehlist;

for "_x" from 0 to (_grpnum)-1 do {

	_marker = [_position_mark,_radarray] call ghst_fnc_rand_position;

	_veh = selectRandom _vehlist;
	_armor1 = createVehicle [_veh,_marker, [], 0, "NONE"];

	_armor1 addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		if (isNull _killer) exitWith {};
		if (!isPlayer _killer) exitWith {};
		[5,_killer] call ast_fnc_vehicleKill;
	}];

	if ((random 1) > 0.5) then { 
		_armor1 allowCrewInImmobile true;
	} else {
		_armor1 allowCrewInImmobile false;
	};

	//sleep 1;
	_eGrp = createGroup _sideguards;

	_crew = [_armor1, _eGrp] call BIS_fnc_SpawnCrew;
	
	//set combat mode
	_eGrp setCombatMode "RED";

	for "_w" from 0 to (3) do {
	
		_wppos = [_position_mark,_radarray] call ghst_fnc_rand_position;

		_eGrp addwaypoint [_wppos, 10];
		//create markers for units
		if (_markunits) then {
		_markname = str(_wppos);
		_mark1 = createMarker [_markname, _wppos];
		_mark1 setMarkerShape "ICON";
		_mark1 setmarkertype "mil_dot";
		_mark1 setmarkercolor _mcolor;
		_mark1 setmarkertext format ["%1 Waypoint %2",_egrp, _w];
		};
		[_eGrp, _w] setWPPos _wppos;
			if (_w == 3) then {
				[_eGrp, _w] setWaypointType "CYCLE";
				[_eGrp, _w] setWaypointStatements ["true", "vehicle this setFuel 0.7; vehicle this setVehicleAmmo 0.7;"];
			} else {
				[_eGrp, _w] setWaypointType "SAD";
			};
		//[_eGrp, _w] setWaypointSpeed "LIMITED";
		[_egrp, _w] setWaypointTimeout [10, 30, 60];
		[_egrp, _w] setWaypointCompletionRadius 25;
		//sleep 0.1;
	};
	
	//sleep 2;
	
};

if (true) exitWith {};