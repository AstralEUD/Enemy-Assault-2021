/*
V3.8 - By Ghost
fills a random building around a position with a random number of men. 100 buildings is max allowed to find positions for. Each unit spawned is ONE group. So 100 units spawned is 100 groups.
null0 = [position[1,2,3],radius,,Side of units in buildings(EAST),[max units, min units],[markunits (true/false),"color"],ai accuracy 0.1-1,debug(true/false)] execvm "ghst_fillbuild3.sqf";
Requires at least 1 unit to be placed in mission of the side being spawned in buildings
when script is done will setpublicvariable ghst_buildfill to true. Have set to false in init.sqf for use in triggers and such
example
null0 = [[1,2,3],300,EAST,[80,40],[markunits (true/false),"color"],aiskill 0.4,debug(true/false),pubvar(true/false),random civs(true/false)] execvm "ghst_fillbuild3.sqf";
example
null0 = [[1,2,3],200,EAST,[30,15],[true,"ColorRed"],0.4,true,true,false] execvm "ghst_fillbuild3.sqf";
*/

if (!isserver) exitwith {};

private ["_sumpos"];

_position_mark = _this select 0;//position
_rad = _this select 1;//radius around position
_sideguards = _this select 2;//side of guards
_numarray = _this select 3;
	_maxnum = _numarray select 0;//max units in buildings
	_minnum = _numarray select 1;//min units in buildings
_markunitsarray = _this select 4;
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
#define aiSkill _this select 5//sets AI accuracy and aiming speed
#define debug _this select 6//set to true for diag_log
#define pubvar _this select 7//if true will pubvar ghst_buildfill
_civs = param [8, false, [true]];//spawn civilians

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_menhouselist;
_civlist = ghst_civlist;
//Do not edit below this line unless you know what you are doing//
/////////////////////////////////////////////////////

//get all buildings around position of set radius
_nearBuildings = _position_mark nearObjects ["HouseBase", _rad];

if (debug) then {diag_log format ["Number of Buildings: %1", count _nearBuildings];};

//gets coordinates for all selected buildings
_build_positions = [];
_all_positions = [];

{
	private ["_p"];

	_p = _x buildingPos -1;
	//diag_log _p;

	if (!(isNil "_p") and {!(_p isEqualTo [0,0,0])} and {!(_x iskindof "Piers_base_F")} and {count _p > 1}) then
	{
		_all_positions append _p;
		_build_positions pushback _p;
	};
		
} foreach _nearBuildings;
//Min/Max for number of spawning units
_sumpos = round(random count _all_positions);
if (_sumpos > _maxnum) then {_sumpos = _maxnum};//(_maxnum - floor(random _minnum));};
//if (_sumpos < _minnum) then {_sumpos = _sumpos;};

if (debug) then {
	diag_log format ["Max pos: %1, Unit Side: %2, Number of pos: %3, BuildPos array: %4", _sumpos, _sideguards, count _all_positions, _build_positions];
	diag_log _build_positions;
	diag_log _all_positions;
};

//spawn number of units in random buildings
for "_p" from 0 to (_sumpos) do {

	private ["_positionarray","_b"];
	_positionarray = [];
	
	_b = floor(random count _build_positions);
	_positionarray = _build_positions select _b;
	//_build_positions set [_b,-1];
	//_build_positions = _build_positions - [-1];
	_build_positions deleteAt _b;
	_eGrp = createGroup _sideguards;
	_mansel = selectRandom _menlist;
	
		//have unit patrol if randomly selected and building has enough positions	
		if (!(isnil "_positionarray") and {(floor (random 10) > 6)}) then {
			private ["_position"];//"_r",
			//_r = floor(random count _positionarray);
			_position = selectRandom _positionarray;//_positionarray select _r;
			
			_unit1 = [_position,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
			_unit1 setPosatl _position;
			_unit1 setFormDir (random 360);
			//create markers for patrol units
			if (_markunits) then {
			_mark1 = [_position,_mcolor,"","mil_objective"] call ghst_fnc_mark_point;
			};
			// spawn patrol script
			[_unit1,_eGrp,_positionarray,debug] spawn {
				_unit = _this select 0;//unit to patrol
				_grp = _this select 1;//group of unit
				_positionarray = _this select 2;//position array for building
				_debug = _this select 3;//debug
					while {alive _unit} do {
						_pos = _positionarray select floor(random count _positionarray);
						_unit setBehaviour "SAFE";
						_unit doMove _pos;
						if (_debug) then {diag_log format ["UNIT %1 MOVE BUILD POS %2", _unit, _pos];};
						_grp setSpeedMode "LIMITED";
						sleep (floor((random 40) + 60));
					};
			};
		} else {
			private ["_b","_position"];
			_b = floor(random count _all_positions);
			_position = _all_positions select _b;
			//_all_positions set [_b,-1];
			//_all_positions = _all_positions - [-1];
			_all_positions deleteAt _b;
			_unit1 = [_position,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
			_unit1 setPosatl _position;
			_unit1 setFormDir (random 360);
			if ((getposatl _unit1 select 2) > 10) then {
				_unit1 setUnitPos "MIDDLE";
			} else  {
				_unit1 setUnitPos "UP";
			};
			//create markers for units
			if (_markunits) then {
				_mark1 = [_position,_mcolor] call ghst_fnc_mark_point;
			};
		};
		
		if (_civs and (round (random 10) > 7)) then {
			private ["_b","_position","_civsel","_civ1"];
			_b = floor(random count _all_positions);
			_position = _all_positions select _b;
			//_all_positions set [_b,-1];
			//_all_positions = _all_positions - [-1];
			_all_positions deleteAt _b;
			_cGrp = createGroup civilian;
			_civsel = selectRandom _civlist;
			_civ1 = [_position,_cGrp,_civsel,aiSkill] call ghst_fnc_create_unit;
			_civ1 setPosatl _position;
			_civ1 setFormDir (random 360);
			//create markers for units
			if (_markunits) then {
				_civmark1 = [_position,"ColorCivilian"] call ghst_fnc_mark_point;
			};
		};
	//sleep 0.03;
};

if (pubvar) then {
	ghst_buildfill = true;
	publicvariable "ghst_buildfill";
};
if (debug) then {diag_log "buildings filled";};

if (true) exitwith {};