/*
V1.8.3 script by: Ghost - Creates specifed air vehicle and flys to Objective Area and drops enemy paras.
eparadrop = [_objarea,"O_Heli_Light_02_unarmed_F",[radius a, radius b],true,[true,"ColorRed"],aiskill 0.3] execVM "eparadrop.sqf";
ex:
ghst_epara = [getmarkerpos "town"),[300,300],"O_Heli_Light_02_unarmed_F",true,[true,"ColorRed"],0.3] execVM "scripts\eparadrop.sqf";
*/
if (!isserver) exitwith {};
private ["_air_type"];

_objpos = _this select 0;//position where helo flies to
_radarray = _this select 1;//radius  array around objmark to drop paras
	_radx = ((_radarray select 0) * 5);
	_rady = ((_radarray select 1) * 5);
_air_type = _this select 2;//aircraft type: "O_Heli_Light_02_unarmed_F"
_repeat = _this select 3;//true to repeat para drop, false for one time
_markunitsarray = _this select 4;//marks waypoints of helo
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
#define aiSkill _this select 5//sets AI accuracy and aiming speed

if (typeName _air_type == "ARRAY") then {
	_air_type = selectrandom _air_type;
};

_paralist = ghst_paralist;
_ghst_side = ghst_side;
_flyheight = 200;

_parapos = [_objpos,_radarray] call ghst_fnc_rand_position;

//create marker
if (_markunits) then {
	[_parapos,_mcolor,"Transport Waypoint UNLOAD"] call ghst_fnc_mark_point;
};

private ["_spawnpos","_loop"];
_loop = true;
while {_loop} do {
	_spawnpos = [(_objpos select 0) + (_radx * (sin(random 360))),(_objpos select 1) + (_rady * (cos(random 360))), _flyheight];
		if (((_spawnpos distance _objpos) > (_radx - 200)) and (_spawnpos distance (getmarkerpos "Respawn_West") > 1500)) exitwith {_loop = false;};
};

//create marker
if (_markunits) then {
	[_spawnpos,_mcolor,"Transport Spawn"] call ghst_fnc_mark_point;
};


_dir = _spawnpos getdir _objpos;

_egrp = createGroup _ghst_side;

_air1_array = [_spawnpos, _dir, _air_type, _egrp] call BIS_fnc_spawnVehicle;
_air1 = _air1_array select 0;
//_air1 = createVehicle [_air_type,_spawnpos, [], 0, "FLY"];
//_air1 setdir _dir;
_air1 setpos [(getpos _air1 select 0), (getpos _air1 select 1), _flyheight];
//_crew = [_air1, _egrp] call BIS_fnc_SpawnCrew;
_air1 flyinheight _flyheight;
_air1 setSpeedMode "normal";
_air1 setBehaviour "CARELESS";

_paras1 = createGroup _ghst_side;
_cargoPositions = _air1 emptyPositions "cargo";
	for "_x" from 0 to (_cargoPositions)-1 do {

		_mansel = selectRandom _paralist;
		_man = [_spawnpos,_paras1,_mansel,aiSkill] call ghst_fnc_create_unit;
		_man assignAsCargo _air1;
		_man moveincargo _air1;
		//sleep 0.2;
	};
	
//set combat mode
_paras1 setCombatMode "RED";

//create random waypoints for paras
[_paras1,_objpos, _radarray,_markunitsarray,["COMBAT", "FULL", "WEDGE"]] call ghst_fnc_waypoints;

if (_repeat) then {
	eparadrop = [_objpos,_air_type,_radarray,_paras1,_repeat,_markunitsarray,aiSkill] spawn {
		
		_objpos = _this select 0;
		_air_type = _this select 1;
		_radarray = _this select 2;
		_paras1 = _this select 3;
		_repeat = _this select 4;
		_markunitsarray = _this select 5;
		_aiSkill = _this select 6;

			while {count units _paras1 > 0} do {
				sleep 60;				
			};
		sleep 900 + round(random 600);
		deletegroup _paras1;
		
		eparadrop = [_objpos,_radarray,_air_type,_repeat,_markunitsarray,_aiSkill] call ghst_fnc_eparadrop;
		
		if (true) exitwith {};
	};
};

	While {(alive _air1) and {(canMove _air1)}} do {
	
		//_air1 setpos [(_parapos select 0), (_parapos select 1)+1500, _flyheight];
		
		_air1 domove _parapos;

		Waituntil {(_air1 distance _parapos) < (_flyheight + 100)};

			{
				_x disableCollisionWith _air1;
				unassignvehicle _x;
				_x action ["GETOUT", _air1];
				sleep 1;
				_chute = createVehicle ["NonSteerable_Parachute_F",[0,0,0], [], 0, "NONE"];
				_chute disableCollisionWith _air1;
				_chute setPos getPos _x;
				_x assignAsDriver _chute;
				_x moveIndriver _chute;
			} foreach units _paras1;
			
			_air1 domove _spawnpos;
		
		Waituntil {(_air1 distance _spawnpos) < (_flyheight + 100)};
		
		if (true) exitwith {};
	};
	
{deletevehicle _x} foreach crew _air1;
deletevehicle _air1;

sleep 20;
deletegroup _egrp;
	
if (true) exitwith {};