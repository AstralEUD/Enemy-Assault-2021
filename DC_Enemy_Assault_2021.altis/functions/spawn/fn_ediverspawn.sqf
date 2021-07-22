/*
V1.1 by: Ghost
creates set number of groups of up to 8 units in a random location around a designated area in water
ghst_ediverspawn = [[1,1,2] or "marker",[wpradius_X,wpradius_Y,direction] if not a marker,grpnum,sqdnum,east,[true,"ColorRed"],aiaccuracy,true] execVM "scripts\ediverspawn.sqf";
*/
if !(isServer) exitWith {};

_patrol_mark = _this select 0;//position or marker
_radarray = _this select 1;
_grpnum = _this select 2;
_sqdnum = _this select 3;
_sideguards = _this select 4;//side of guards
_markunitsarray = _this select 5;
	_markunits = _markunitsarray select 0;//true to mark units
	_mcolor = _markunitsarray select 1;//marker color
#define aiSkill _this select 6//sets AI accuracy and aiming speed
_respawn = _this select 7;//respawn group when dead

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_diverlist;

//Do not edit below this line unless you know what you are doing//
/////////////////////////////////////////////////////

for "_t" from 0 to (_grpnum)-1 do {

_eGrp = createGroup _sideguards;

	_spawnpos = [_patrol_mark,_radarray,true] call ghst_fnc_rand_position;
	_spawnposasl = ATLtoASL _spawnpos;
	_randomz = random (_spawnposasl select 2);
	_spawnposasl = [_spawnposasl select 0, _spawnposasl select 1, _randomz];

	for "_x" from 0 to ceil(random _sqdnum)+1 do {

		_mansel = selectRandom _menlist;
		_man = [_spawnposasl,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;

		sleep 0.2;
	};
	
//set combat mode
_eGrp setCombatMode "RED";

[_eGrp,_patrol_mark,_radarray,_markunitsarray,["SAFE", "NORMAL", "STAG COLUMN"],true,true] call ghst_fnc_waypoints;

	//repspawn groups when all untis are dead
	if (_respawn) then {

		[_eGrp, _spawnposasl, _menlist, _sqdnum, aiSkill] spawn {
			private ["_eGrp","_spawnposasl","_menlist","_sqdnum","_aiSkill","_mansel","_man"];
			_eGrp = _this select 0;
			_spawnposasl = _this select 1;
			_menlist = _this select 2;
			_sqdnum = _this select 3;
			_aiSkill = _this select 4;
			
			while {true} do {
			
				if (count units _eGrp == 0) then {
				
					sleep 600;
			
					for "_x" from 0 to ceil(random _sqdnum)+1 do {

					_mansel = selectRandom _menlist;
					_man = [_spawnposasl,_egrp,_mansel,_aiSkill] call ghst_fnc_create_unit;

					sleep 0.2;
					};
				};
				
				sleep 60;
			};
		};
	};
	
};

if (true) exitWith {};