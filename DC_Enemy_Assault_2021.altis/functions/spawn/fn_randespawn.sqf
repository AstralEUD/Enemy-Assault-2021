//V1 By: Ghost - spawns enemy near player randomly as long as player is X distance from base and all players
if !(isServer) exitWith {};

_basearray = _this select 0;//base position
	_basepos = _basearray select 0;//base position
	_basedist = _basearray select 1;//dist from base
_radarray = _this select 1;//radius [300,300]
_sqdnum = _this select 2;//how many units in each group
_markunitsarray = _this select 3;
	_markunits = _markunitsarray select 0;//true to mark units
	_mcolor = _markunitsarray select 1;//marker color
#define aiSkill _this select 4//sets AI accuracy and aiming speed

while {true} do {

	//Unit list to randomly select and spawn - Edit as needed
	_menlist = ghst_menlist;
	_boatlist = ghst_patrolboatlist;
	_ghst_side = ghst_side;

	private ["_playersel","_playerpos"];
	
	_playersel = allPlayers call BIS_fnc_selectRandom;//(playableunits + switchableUnits)
	
	if !(isnil "_playersel") then {

		_playerpos = getpos _playersel;
		
		if (((_playerpos distance _basepos) > _basedist) and !(surfaceIsWater _playerpos)) then {
		
			private ["_eGrp","_spawnpos"];
			
			_spawnpos = [_playerpos,_radarray] call ghst_fnc_rand_position;
			
			if (({ (_x distance _spawnpos) < ((_radarray select 0) - 50) } count allPlayers) == count allPlayers) exitwith {};
		
			_eGrp = createGroup _ghst_side;
			
				if (_markunits) then {
					[_spawnpos,_mcolor,"RANDOM ESPAWN"] call ghst_fnc_mark_point;
				};

				for "_x" from 0 to ceil(random _sqdnum)+2 do {

					_mansel = _menlist call BIS_fnc_selectRandom;
					_man = [_spawnpos,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;

					sleep 0.2;
				};
			
			[_eGrp,_playerpos, _radarray,_markunitsarray,["AWARE", "FULL", "WEDGE"]] call ghst_fnc_waypoints;

				while {true} do {
				
					if (({ (_x distance (getposatl leader _eGrp)) > _basedist } count allPlayers) == count allPlayers) exitwith {{deletevehicle _x} foreach units _egrp; sleep 20; deleteGroup _egrp;};
					
					if (count units _eGrp == 0) exitwith {sleep 20; deleteGroup _egrp;};
					
					sleep 10;
				};
			
			sleep 600 + (random 600);
		
		};
		
		if (((_playerpos distance _basepos) > _basedist) and (surfaceIsWater _playerpos)) then {
		
			private ["_eGrp","_spawnpos"];
			
			_spawnpos = [_playerpos,_radarray,true] call ghst_fnc_rand_position;
			
			if (({ (_x distance _spawnpos) < ((_radarray select 0) - 50) } count allPlayers) == count allPlayers) exitwith {};
		
			_eGrp = createGroup _ghst_side;
			
				if (_markunits) then {
					[_spawnpos,_mcolor,"RANDOM ESPAWN"] call ghst_fnc_mark_point;
				};
			
			_veh = _boatlist call BIS_fnc_selectRandom;
			_boat1 = createVehicle [_veh,_spawnpos, [], 0, "NONE"];

			_crew = [_boat1, _eGrp] call BIS_fnc_SpawnCrew;
			
			//set combat mode
			_eGrp setCombatMode "RED";
		
			[_eGrp,_playerpos, [((_radarray select 0) * 2),((_radarray select 1)* 2)],_markunitsarray,["AWARE", "FULL", "WEDGE"],true] call ghst_fnc_waypoints;

				while {true} do {
				
					if (({ (_x distance (getposasl leader _eGrp)) > _basedist } count allPlayers) == count allPlayers) exitwith {{deletevehicle _x} foreach units _egrp; sleep 20; deleteGroup _egrp; deletevehicle _boat1;};
					
					if (count units _eGrp == 0) exitwith {sleep 20; deleteGroup _egrp; deletevehicle _boat1;};
					
					sleep 10;
				};
			
			sleep 600 + (random 600);
		
		};
	};
	
	sleep 10;

};