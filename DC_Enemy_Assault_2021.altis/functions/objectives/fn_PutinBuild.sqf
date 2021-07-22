/*
V2.6 - By Ghost
fills a random building around a position with all objects listed. best to keep radius small so not many buidlings need to be calculated
*/
//if !(isserver) exitwith {};
private ["_position_mark","_radarray","_unitarray","_markunitsarray","_markunits","_mcolor","_msize","_haveguards","_minguards","_maxguards","_sideguards","_rad","_menlist","_build_positions"];

_position_mark = _this select 0;//position
_radarray = _this select 1;//radius array around position and Direction [300,300,53]
_unitarray = _this select 2;//object to be placed in building
_markunitsarray = _this select 3;
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
	_msize = _markunitsarray select 2;
_haveguards = _this select 4;//guard array
	_minguards = _haveguards select 0;//how many guards min
	_maxguards = _haveguards select 1;//how many guards max
	_sideguards = _haveguards select 2;//marker size [50,50]
#define aiSkill _this select 5//sets AI accuracy and aiming speed
#define debug _this select 6//set to true for diag_log

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_specopslist;

//Do not edit below this line unless you know what you are doing//
/////////////////////////////////////////////////////
//get all buildings around position of set radius
if ((_radarray select 0) > (_radarray select 1)) then {_rad = (_radarray select 0);} else {_rad = (_radarray select 1);};

_nearBuildings = _position_mark nearObjects ["HouseBase", _rad];

if (debug) then {diag_log format ["Number of Buildings: %1, Number of units in array: %2, Radius Array: %3, Radius for buildings: %4, Position for Buildings: %5", count _nearBuildings, count _unitarray, _radarray, _rad, _position_mark];};

_build_positions = [];

{
	private ["_p"];

	_p = _x buildingPos -1;
	//diag_log _p;

	if (!(isNil "_p") and {!(_p isEqualTo [0,0,0])} and {!(_x iskindof "Piers_base_F")} and {count _p > 1}) then
	{
		_build_positions pushback _p;
	};
		
} foreach _nearBuildings;

//Put specified objects in Buildings With Guards
{

	private ["_p","_selbuild","_position","_positionarray","_pos","_eGrp","_g","_selunit","_tsk","_zadjust"];
	
	_selunit = _x select 0;
	_tsk = _x select 1;
	_p = 1;
	
	while {true} do {

		if (count _nearBuildings isEqualTo 0) exitwith {};
		if (count _build_positions isEqualTo 0) exitwith {_position = nil;};

		//select random building and remove from list
		
		_b = floor(random count _build_positions);
		_positionarray = _build_positions select _b;
		_build_positions deleteAt _b;

		_r = floor(random count _positionarray);
		_position = _positionarray select _r;
		_positionarray deleteAt _r;
		
		if (!(isnil "_position") and {count _position > 0})  exitwith {_position};
		
		if (debug) then {_p = _p + 1};
	};
	
	if (debug) then {diag_log format ["Ran Position Loop %1 Times", _p];};
	
	//debug
	if (debug) then {diag_log format ["BUILD POS ARRAY %1 BUILD POS SELECTED %2", _positionarray, _position];};

		if ((isNil "_position") or {count _position isEqualTo 0}) then {
			if (debug) then {diag_log format["FAILED TO PLACE OBJECT %1", _selunit];};
			
			_pos = [_position_mark,_radarray] call ghst_fnc_rand_position;
			
			_selunit allowdamage false;
			_position = _pos findEmptyPosition[ 0 , 20 , typeof _selunit];
			_selunit setPosatl _position;
			_selunit setFormDir (random 360);
			_selunit allowdamage true;
			
		} else {
			if (debug) then {diag_log format["PLACED OBJECT %1 POS %2", _selunit, _position];};
			_selunit allowdamage false;
			_zadjust = switch (typeof _selunit) do {
					case "Land_Suitcase_F": { 1.5 };
					case "Land_DataTerminal_01_F": { 0 };
					default { 0.1 };
				};
			_selunit setPosatl [(_position select 0), (_position select 1), (_position select 2) + _zadjust];//help avoid colliding with floor
			_selunit setDir (random 360);
			_selunit allowdamage true;
		};		
		
	//create markers for units
	if (_markunits) then {
		private ["_pos","_mark1","_phase"];
		_pos = [_position,[_msize select 0,_msize select 1,(random 360)]] call ghst_fnc_rand_position;
		_mark1 = [_pos,_mcolor,"","",_msize,"Ellipse","Border"] call ghst_fnc_mark_point;
		[_tsk,_pos] call BIS_fnc_taskSetDestination;
		
		if (isnil "_selbuild") then {_selbuild = _selunit;};
		
		[_selunit,_mark1,_selbuild,_tsk] spawn {
			private ["_unit","_mark1","_selbuild"];
			_unit = _this select 0;
			_mark1 = _this select 1;
			_selbuild = _this select 2;
			_tsk = _this select 3;
			
			while {alive _unit} do {
				if (((damage _selbuild) > 0.9) and {((_unit iskindof "Land_Suitcase_F") or (_unit iskindof "Land_DataTerminal_01_F"))}) exitwith {deletevehicle _unit;};
				if ((_unit iskindof "Land_DataTerminal_01_F") and {(_tsk call BIS_fnc_taskCompleted)}) exitwith {};
				if (((damage _selbuild) > 0.9) and {(!(_unit iskindof "Land_Suitcase_F") or !(_unit iskindof "Land_DataTerminal_01_F"))}) exitwith {_unit setdamage 1;};

				sleep 5;
			};
			
			deletemarker _mark1;
		
		};
	};
			
	//Spawn guards
	_eGrp = createGroup _sideguards;
	
		for "_g" from 0 to (_minguards + floor(random(_maxguards - _minguards))) do {
				private ["_r","_position","_mansel","_unit1"];
				if !(isNil "_positionarray") then {
				_r = floor(random count _positionarray);
				_position = _positionarray select _r;
				//_positionarray set [_r,-1];
				//_positionarray = _positionarray - [-1];
				_positionarray deleteAt _r;
				};
				if (!(isNil "_position") and {count _position > 1}) then {
					_mansel = selectRandom _menlist;
					_unit1 = [_position,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
					_unit1 setPosatl _position;
					_unit1 setFormDir (random 360);
					if ((getposatl _unit1 select 2) > 8) then {
						_unit1 setUnitPos "MIDDLE";
					} else  {
						_unit1 setUnitPos "UP";
					};
					dostop _unit1;
					
					if (debug) then {diag_log format["UNIT PLACED INSIDE BUILD %1", _position];};
				} else {
					private ["_mansel","_position","_pos","_unit1"];
					_mansel = selectRandom _menlist;
					
					_pos = [(getposatl _selunit),[15,15,(random 360)]] call ghst_fnc_rand_position;
						
					_position = _pos findEmptyPosition[ 0 , 20 , _mansel ];
					if (count _position > 1) then {
						_unit1 = [_position,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
						//_unit1 setPosatl _position;
						_unit1 setFormDir (random 360);
						dostop _unit1;
					};
					
					if (debug) then {diag_log format["UNIT PLACED AROUND BUILD %1", _position];};
				};
			//sleep 0.03;
		};
	_selunit allowdamage true;
	//sleep 1;
} foreach _unitarray;

if (debug) then {diag_log "Objects put in buildings"};