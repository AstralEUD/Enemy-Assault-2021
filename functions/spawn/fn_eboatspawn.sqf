/*
Ver 1.1 - By: Ghost   Randomly creates different types of boats to sentries in the area .
_eboatspawn = [[1,1,2] or "marker",[wpradius_X,wpradius_Y,dir],grpnum,EAST,[true,"ColorRed"],aiaccuracy] execVM "scripts\eboatspawn.sqf";
*/
if !(isServer) exitWith {};

_position_mark = _this select 0;//position or marker
_radarray = _this select 1;//radius array around position and Direction [300,300,53]
_grpnum = _this select 2;
_sideguards = _this select 3;//side of guards
_markunitsarray = _this select 4;
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
#define aiSkill _this select 5//sets AI accuracy and aiming speed

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_crewmenlist;
_boatlist = ghst_patrolboatlist;
_crewlist = ghst_crewmenlist;

for "_x" from 0 to (_grpnum)-1 do {

	_pos = [_position_mark,_radarray,true] call ghst_fnc_rand_position;

	if (count _pos == 0) exitwith {hint "no water position found";};
	
	_veh = selectRandom _boatlist;
	_boat1 = createVehicle [_veh,_pos, [], 0, "NONE"];
	_eGrp = createGroup _sideguards;
	_boat1 setdir (random 360);
	_boat1 setposasl (getposasl _boat1);

	_crewsel = selectRandom _crewlist;
	_crew = [_boat1, _eGrp,false,"",_crewsel] call BIS_fnc_SpawnCrew;
	
	//set combat mode
	_eGrp setCombatMode "RED";

	//[_eGrp,_position_mark,_radarray,_markunitsarray,["SAFE", "NORMAL", "STAG COLUMN"],true] call ghst_fnc_waypoints;
	
	//sleep 2;
	
};

if (true) exitWith {};