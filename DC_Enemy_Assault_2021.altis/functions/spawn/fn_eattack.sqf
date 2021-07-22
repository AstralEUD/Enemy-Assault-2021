/*
V1 by: Ghost
creates groups at specified points and sends them to attack specified point
ghst_eattack = [["attack1","attack2","attack3","attack4"],(getmarkerpos "holdout"),3,4,100,((paramsArray select 3)/10)] execvm "scripts\ghst_eattack.sqf";
*/
if (!isServer) exitWith {};

_spawnarray = _this select 0;//position array of spawn points
_attackpoint = _this select 1;//position to have units attack
_grpnum = _this select 2;//number of groups
_sqdnum = _this select 3;//number of units
_rad = _this select 4;//radius around attackpoint to move to
#define aiSkill _this select 5//sets AI accuracy

//Unit list to randomly select and spawn - Edit as needed
_menlist = ghst_menlist;
_side = ghst_side;
//Do not edit below this line unless you know what you are doing//
/////////////////////////////////////////////////////
for "_t" from 0 to (_grpnum)-1 do {

	_eGrp = createGroup _side;
	_spawnpoint = selectRandom _spawnarray;
	
	for "_x" from 0 to ceil(random _sqdnum)+1 do {

		_mansel = selectRandom _menlist;
		_man = [_spawnpoint,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;

		sleep 0.5;
	};

	_egrp addwaypoint [_attackpoint, _rad];
	[_egrp, 0] setWPPos _attackpoint;
	[_egrp, 0] setWaypointType "SAD";
	[_egrp, 0] setWaypointSpeed "FULL";
	[_egrp, 0] setWaypointFormation "WEDGE";
	[_egrp, 0] setWaypointTimeout [10, 30, 60];
	
	sleep 2;
};

if (true) exitWith {};