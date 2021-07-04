//V1 By Ghost create convoy task of x vehicles to patrol around the map.
//_mapsize = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize") / 2;
//nul = [(getmarkerpos "center"),[_mapsize,_mapsize],1000,6,0.5,true] call ghst_fnc_convoy;

private ["_loop","_roadssel","_roads","_convoygrp","_wppos","_convoyarray","_dir"];

_position_mark = _this select 0;//center position for convoy waypoints
_radarray = _this select 1;// radx,rady around center position for waypoints
	_radx = _radarray select 0;
	_rady = _radarray select 1;
_rad = _this select 2;//search radius around a point to find roads
_enum = _this select 3;//number of vehicles in convoy
#define aiSkill _this select 4//sets AI accuracy
_markwps = param [5, false, [true]];//true to mark waypoints


_menlist = ghst_menlist;
_vehlist = ghst_convoyvehlist;
_side = ghst_side;
_convoyarray = [];
Ghst_Current_tasks = [];

_loop = true;
	while {_loop} do {
		_startpos = [(_position_mark select 0) + _radx * sin(random 360),(_position_mark select 1) + _rady * cos(random 360)];
		_roads = (_startpos nearRoads _rad);
			if !(isnil "_roads") then {
				if (((_startpos distance _position_mark) > (_radx - 200)) and !(count _roads == 0) and (_startpos distance (getmarkerpos "Respawn_West") > 1500)) exitwith {_loop = false;};
			};
	};

_convoygrp = creategroup _side;

	for "_w" from 1 to (3) do {
	
		private ["_roads","_roadssel","_wppos"];

		//if !(_w == 1) then {
			_pos = [_position_mark,_radarray] call ghst_fnc_rand_position;
			_roads = (_pos nearRoads _rad);
			_roadssel = selectRandom _roads;   
			_wppos = getpos _roadssel;
		//};

		_wp = _convoygrp addwaypoint [_wppos, 10];
		_wp setWPPos _wppos;
			if !(_w == 3) then {
				_wp setWaypointType "MOVE";
				_wp setWaypointBehaviour "SAFE";
				_wp setWaypointCombatMode "RED";
				_wp setWaypointSpeed "NORMAL"; 
				_wp setWaypointFormation "COLUMN";
				_wp setWaypointCompletionRadius 25;
			};
			if (_w == 3) then {
				_wp setWaypointType "CYCLE";
			};

		if (_markwps) then {
			_marktext = format ["%1 Waypoint: %2 Type: %3",_convoygrp, _w, waypointType [_convoygrp,_w]];
			_marker = [_wppos,"COLORRED",_marktext] call ghst_fnc_mark_point;
		};
	};
	
	_roadssel = selectRandom _roads;   
	//_roadconto = roadsConnectedTo _roadssel;
	//_dir = _roadssel getdir (_roadconto select 0);
	_wPos = waypointPosition [_convoygrp, 1];
	_dir = _roadssel getdir _wPos;

	for "_e" from 1 to (_enum) do {
	
		private ["_wppos_old"];
		
		_veh = selectRandom _vehlist;
		
		if (!(isnil "_roadssel") and (_e == 1)) then {
			_wppos = getpos _roadssel; 
		} else {
			_wppos = [_wppos, 1, 100, 5, 0, 20, 0] call BIS_fnc_findSafePos;
			//_wppos = _wppos_old findEmptyPosition [3,150,_veh];
		};
		
		if (_markwps) then { 
			_marker = [_wppos,"COLORRED","START"] call ghst_fnc_mark_point; 
		};

		private ["_emptyseats"];
		
		_spawnveh = [_wppos, _dir, _veh, _convoygrp] call BIS_fnc_spawnVehicle;
		_car1 = (_spawnveh select 0);
		//_car1 = createVehicle [_veh,_wppos, [], 0, "FORM"];
		//_car1 setdir _dir;
		createVehicleCrew _car1;
		//[_car1,_convoygrp] call BIS_fnc_spawnCrew;
		_convoyarray pushback _car1;

		_emptyseats = _car1 emptypositions "cargo";
		
		if (_emptyseats > 12) then {_emptyseats = 12;};
			_cargogrp = creategroup _side;
			for "_s" from 1 to _emptyseats do {
				_mansel = selectRandom _menlist;
				_man = [_wppos,_cargogrp,_mansel,aiSkill] call ghst_fnc_create_unit;
				_man assignAsCargo _car1;
				_man moveincargo _car1;

			};
			
		if !(isnil "_roadssel") then {
			 _roadconto = roadsConnectedTo _roadssel; 
			 _roadssel = _roadconto select 1; 
		};
	
	};
	{
		[_x] spawn {
			_x = _this select 0;
			_marker = [_x,"COLORRED"] call ghst_fnc_mark_point;
			
			While { (alive _x) } do {
				_marker setmarkerpos (getpos _x);
				sleep 5;
			};
			
			deletemarker _marker;
		};
	} foreach _convoyarray;

 //create random number
_rnum = str(round (random 999));
//create task
_tsk = "tsk_convoy" + _rnum + str(getpos leader _convoygrp);
//Ghst_Current_tasks pushback _tsk;

//create task
_tasktopic = "Destroy Convoy";
_taskdesc = format ["Eliminate the enemy convoy of %1 vehicles. Satellite is tracking the lead vehicle so check the map for the marker. Make sure you kill all crew and vehicles.", count _convoyarray];

[true,[_tsk],[_taskdesc,_tasktopic,"Convoy"],(leader _convoygrp),true,1,true,"destroy"] call BIS_fnc_taskCreate;
Ghst_Current_tasks pushback _tsk;
/*
//create trigger for no enemy left
_trig1stat = format ["count thislist < 10 and ({alive _x} count %1) == 0", _convoyarray];
_trig1act = format ["deleteVehicle thistrigger; ['%1','succeeded'] call BIS_fnc_taskSetState; [playableunits,5000,100] remoteExec ['ghst_fnc_addscore'];", _tsk];
_trg1 = createTrigger["EmptyDetector",_position_mark];
_trg1 setTriggerArea[_radx,_rady,0,false];
_trg1 setTriggerActivation[format ["%1", _side],"PRESENT",false];
_trg1 setTriggerStatements[_trig1stat, _trig1act,""];
*/
While {true} do {
	if ((({alive _x} count _convoyarray) == 0) and (({alive _x} count units _convoygrp) < 5)) exitwith {};
	if (_tsk call BIS_fnc_taskCompleted) exitwith {};
	sleep 10;
};

[_tsk,"succeeded"] call BIS_fnc_taskSetState;
[playableunits,5000,100] remoteExec ["ghst_fnc_addscore"];
[_position_mark,500] spawn ghst_fnc_full_cleanup;