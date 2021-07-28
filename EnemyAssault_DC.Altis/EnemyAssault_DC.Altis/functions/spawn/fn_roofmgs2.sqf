//V1 Spawns mgs on top of random number of buildings of a certain type. Requires 1 EAST unit placed on map.
//Issues - units may hang over edges depending on which way they are aiming. Some units might be inside of very large buildings
//ghst_roofmgs2 = [(getmarkerpos "marker"),1000(radius),[true,"ColorRed"],EAST,aiaccuracy] call ghst_fnc_roofmgs2;

if !(isserver) exitwith {};

private ["_b","_s","_r","_m"];

_position_mark = _this select 0;
_rad = _this select 1;
_markunitsarray = _this select 2;
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
_side = _this select 3;//side of static weapons
#define aiSkill _this select 4//sets AI accuracy

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_menlist;
_gunlist = ghst_staticlist;

_weprad = 1.5;
_roofposarray = [];

//Do not edit below this line unless you know what you are doing//
/////////////////////////////////////////////////////
//House list
_Buildings = _position_mark nearObjects ["HouseBase", _rad];

for "_b" from 0 to (floor(random count _Buildings)) do {
	_r =  floor(random count _Buildings);
	_buildsel = _Buildings select _r;
	//_Buildings set [_r,-1];
	//_Buildings = _Buildings - [-1];
	_Buildings deleteAt _r;
	
	_buildpossarray = [_buildsel] call BIS_fnc_buildingPositions;
	
	if (((count _buildpossarray) > 0) and  !(_buildsel iskindof "Piers_base_F")) then {
	
		_temppos = [];
	
		{
			_buildPosASL = ATLtoASL(_x);
			
			_isObstructedZ = lineIntersects [_buildPosASL, [(_buildPosASL select 0), (_buildPosASL select 1), (_buildPosASL select 2) + 20]];
			_hasSurfaceBelowXa = lineIntersects [[(_buildPosASL select 0) - _weprad, (_buildPosASL select 1), (_buildPosASL select 2)], [(_buildPosASL select 0) - _weprad, (_buildPosASL select 1), (_buildPosASL select 2) - 0.5]];
			_hasSurfaceBelowXb = lineIntersects [[(_buildPosASL select 0) + _weprad, (_buildPosASL select 1), (_buildPosASL select 2)], [(_buildPosASL select 0) + _weprad, (_buildPosASL select 1), (_buildPosASL select 2) - 0.5]];
			_hasSurfaceBelowYa = lineIntersects [[(_buildPosASL select 0), (_buildPosASL select 1) - _weprad, (_buildPosASL select 2)], [(_buildPosASL select 0), (_buildPosASL select 1) - _weprad, (_buildPosASL select 2) - 0.5]];
			_hasSurfaceBelowYb = lineIntersects [[(_buildPosASL select 0), (_buildPosASL select 1) + _weprad, (_buildPosASL select 2)], [(_buildPosASL select 0), (_buildPosASL select 1) + _weprad, (_buildPosASL select 2) - 0.5]];
			
			if (! _isObstructedZ and (_hasSurfaceBelowXa and _hasSurfaceBelowXb) and (_hasSurfaceBelowYa and _hasSurfaceBelowYb)) then {
			
				_temppos pushback _x;
				
			};
		} foreach _buildpossarray;
		
		if ((count _temppos) > 0) then {
			_Rooftopsel = selectRandom _temppos;
			_roofposarray pushback _Rooftopsel;
		};
	};
};

//Spawn static weapons
for "_s" from 0 to (count _roofposarray)-1 do {

	_grp = createGroup _side;
	private ["_r"];
	_r =  floor(random count _roofposarray);
	_buildpos = _roofposarray select _r;
	//_roofposarray set [_r,-1];
	//_roofposarray = _roofposarray - [-1];
	_roofposarray deleteAt _r;
	
	if (! isNil "_buildpos") then {
		_gunsel = selectRandom _gunlist;
		_mgun = createVehicle [_gunsel, (_buildpos), [], 0, "NONE"];
		EA_spawned_things pushBack _mgun;
		_mgun setdir (random 360);
		_mgun setposatl _buildpos;
		//spawn Unit for MG
		_mansel = selectRandom _menlist;
		_mgman = [(getposatl _mgun),_grp,_mansel,aiSkill] call ghst_fnc_create_unit;
		_mgman moveingunner _mgun;
		_mgman setFormDir (random 360);
		
		//put marker on spawned mg
		if (_markunits) then {
			_veh_name = getText (configFile >> "cfgVehicles" >> (_gunsel) >> "displayName");
			[(getposatl _mgman),_mcolor,_veh_name] call ghst_fnc_mark_point;
		};
	};
};