//V1.1 By: Ghost
//spawns object in a random location to bring back to base
//if (!isserver) exitwith {};
private ["_position_mark","_radarray","_obj","_dropoff_point","_locselname","_markunitsarray","_markunits","_mcolor","_msize","_sideguards","_rnum","_tsk","_menlist","_staticlist","_vehlist","_vehsel","_crew","_spawnpos","_temppos","_md","_veh","_veh_name","_VarName","_vehpos","_pos","_mark1","_eGrp","_armor1","_g","_tasktopic","_taskdesc","_trig1stat","_trig1act","_trg1","_trig1cond","_mass"];

_position_mark = _this select 0;//position for center pos
_radarray = _this select 1;//radius around position to search for a position
_obj = _this select 2;//object to place somewhere randomly e.g. "Land_Cargo20_military_green_F"
_dropoff_point = _this select 3;//position where object can be dropped off at
#define aiSkill _this select 4//sets AI accuracy
_locselname = _this select 5;//name of location
_markunitsarray = _this select 6;//put marker on map for task
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
	_msize = _markunitsarray select 2;
_sideguards = _this select 7;//side of enemy

//create random number and add to task
_rnum = str(round (random 999));

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_menlist;
_staticlist = ghst_staticlist;
_vehlist = ghst_patrolvehlist;

_spawnpos = [];
_md = 100;
while {(_spawnpos isEqualTo []) and (_md < 500)} do {
	_temppos = [_position_mark,[_radarray select 0, _radarray select 1, (random 360)]] call ghst_fnc_rand_position;
	_spawnpos = _temppos findEmptyPosition[ 10 , _md , _obj ];
	_md = _md + 50;
};

if (_spawnpos isEqualTo []) then {_spawnpos = [_position_mark,[_radarray select 0, _radarray select 1, (random 360)]] call ghst_fnc_rand_position;};

//create Object
_veh = createVehicle [_obj,_spawnpos, [], 0, "NONE"];
_veh_name = (configFile >> "cfgVehicles" >> (_obj) >> "displayName") call bis_fnc_getcfgdata;
//_veh_pic =  (configFile >> "cfgvehicles" >> (_obj) >> "picture") call bis_fnc_getcfgdata;
_VarName = ("ghst_" + _obj + _rnum + str round(_spawnpos select 0));
_veh setVehicleVarName _VarName;
//_veh Call Compile Format ["%1=_This ;",_VarName];
missionNamespace setVariable [_VarName,_veh];
publicVariable _VarName;
_vehpos = (getposatl _veh);
_veh setdir (random 360);
_veh setposatl _vehpos;
//_mass = getMass _veh;
_mass = 2000;
_veh setMass _mass;//round(_mass * 0.5);
	
	//create markers for units
	if (_markunits) then {
		_pos = [_vehpos,[_msize select 0,_msize select 1,(random 360)]] call ghst_fnc_rand_position;
		_mark1 = [_pos,_mcolor,"","",_msize,"Ellipse","Border"] call ghst_fnc_mark_point;
			
		_nul = [_veh,_mark1] spawn {
			private ["_unit","_mark1"];
			_unit = _this select 0;
			_mark1 = _this select 1;
			
			while {alive _unit} do {
				sleep 5;
			};
			
			deletemarker _mark1;
		
		};
	};

	//create units as guards
	_eGrp = createGroup _sideguards;
	for "_g" from 0 to ceil(random 5)+2 do {
		private ["_temppos","_mansel","_gp1","_unit1","_gun1"];
		_temppos = [_vehpos,[15,15,(random 360)]] call ghst_fnc_rand_position;
		_mansel = selectRandom _menlist;
		_gp1 = _temppos findEmptyPosition[ 0 , 20 , _mansel ];
		_unit1 = [_gp1,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
			if ((round (random 10)) > 7) then {
				_gunsel = selectRandom _staticlist;
				_gun1 = createVehicle [_gunsel,_gp1, [], 0, "NONE"];
				_unit1 assignasgunner _gun1;
				_unit1 moveingunner _gun1;
			};
		_unit1 setpos _gp1;
		_unit1 setFormDir (random 359);
		_unit1 setUnitPos "UP";
		dostop _unit1;
		sleep 0.03;
	};

_temppos = [_vehpos,[20,20,(random 360)]] call ghst_fnc_rand_position;
_vehsel = selectRandom _vehlist;
_armor1 = createVehicle [_vehsel,_temppos, [], 0, "NONE"];
_armor1 setdir (random 359);
_armor1 setposatl (getposatl _armor1);

_eGrp = createGroup _sideguards;
_crew = [_armor1, _eGrp] call BIS_fnc_SpawnCrew;

//set combat mode
_eGrp setCombatMode "RED";

//create task
_tsk = "tsk_randacquire" + _rnum + str(_position_mark);
Ghst_Current_tasks pushback _tsk;
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Acquire %1", _veh_name];
_taskdesc = format ["Locate the enemy %1 in %2 and bring it back to base using large helicopter or HEMTT. Drop %1 off at parking lot just NW of Terminal.", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_pos,0,2,true,"search"] call BIS_fnc_taskCreate;

//create trigger for drop off point
if (surfaceIsWater _dropoff_point) then {
	_trig1cond = format ["this and ((getposasl (thislist select 0)) select 2 < ((%1 select 2) + 3))", _dropoff_point];
} else {
	_trig1cond = "this and ((getposatl (thislist select 0)) select 2 < 3)";
};
_trig1act = format ["deleteVehicle thistrigger; ['%1','succeeded'] call BIS_fnc_taskSetState; [playableunits,5000,100] remoteExec ['ghst_fnc_addscore'];", _tsk];
_trg1 = createTrigger["EmptyDetector", _dropoff_point];
_trg1 setTriggerArea[30,60,45,true];
_trg1 setTriggerActivation["VEHICLE","PRESENT",false];
_trg1 triggerAttachVehicle [_veh];
_trg1 setTriggerStatements[_trig1cond, _trig1act,""];
_trg1 setTriggerTimeout [5, 5, 5, true];

[_veh,_trg1,_tsk] spawn {	
	_veh = _this select 0;
	_trg1 = _this select 1;
	_tsk = _this select 2;
	
	while {!(isnil "_veh")} do {
		if ([_tsk] call BIS_fnc_taskCompleted) exitwith {deletevehicle _veh;};
		if (!([_tsk] call BIS_fnc_taskCompleted) and {!(alive _veh)}) exitwith {[_tsk,"failed"] call BIS_fnc_taskSetState; [playableunits,0,-200] remoteExec ['ghst_fnc_addscore']; deleteVehicle _trg1; deletevehicle _veh;};
		sleep 5;
	};
};