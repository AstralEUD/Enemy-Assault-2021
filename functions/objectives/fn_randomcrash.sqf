//V1.4.2 By: Ghost
//spawns object in a random location
//if (!isserver) exitwith {};
private ["_position_mark","_radarray","_obj","_trigrad","_locselname","_markunitsarray","_markunits","_mcolor","_msize","_side","_rnum","_tsk","_menlist","_staticlist","_spawnpos","_veh","_veh_name","_VarName","_vehpos","_pos","_eGrp","_g","_mark1","_tasktopic","_taskdesc","_trig1act","_trg1"];

_position_mark = _this select 0;//position for center pos
_radarray = _this select 1;//radius around position to search for buildings
_obj = _this select 2;//object to place somewhere randomly e.g. "TKVehicleBox_EP1"
_trigrad = _this select 3;//radius for trigger
#define aiSkill _this select 4//sets AI accuracy and aiming speed
_locselname = _this select 5;//name of location
_markunitsarray = _this select 6;//put marker on map for task
	_markunits = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
	_msize = _markunitsarray select 2;
_side = _this select 7;//side of enemy

//create random number and add to task
_rnum = str(round (random 999));

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_menlist = ghst_menlist;
_staticlist = ghst_staticlist;

_spawnpos = [];
while {count _spawnpos < 2} do {
	private ["_temppos"];
	_temppos = [_position_mark,[_radarray select 0, _radarray select 1, (random 360)]] call ghst_fnc_rand_position;
	_spawnpos = _temppos findEmptyPosition[ 10 , 100 , _obj ];
};

//create crashed vehicle
_veh = createVehicle [_obj,_spawnpos, [], 0, "NONE"];
_veh_name = getText (configFile >> "cfgVehicles" >> (_obj) >> "displayName");
_VarName = ("ghst_" + _obj + _rnum + str round(_position_mark select 0));
_veh setVehicleVarName _VarName;
//_veh Call Compile Format ["%1=_This ;",_VarName];
missionNamespace setVariable [_VarName,_veh];
publicVariable _VarName;
_vehpos = (getposatl _veh);
_veh setdir (random 360);
_veh setVectorUP (surfaceNormal [(getPosATL _veh) select 0,(getPosATL _veh) select 1]);

	//create markers for units
	if (_markunits) then {
		_pos = [_vehpos,[_msize select 0,_msize select 1,(random 360)]] call ghst_fnc_rand_position;
		_mark1 = [_pos,_mcolor,"","",_msize,"Ellipse","Border"] call ghst_fnc_mark_point;
			
		[_veh,_mark1] spawn {
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
	_eGrp = createGroup _side;
	for "_g" from 0 to ceil(random 5)+2 do {
		private ["_temppos","_mansel","_gp1","_unit1","_gunsel","_gun1"];
		_temppos = [_vehpos,[15,15,(random 360)]] call ghst_fnc_rand_position;
		_mansel = _menlist call BIS_fnc_selectRandom;
		_gp1 = _temppos findEmptyPosition[ 0 , 15 , _mansel ];
		_unit1 = [_gp1,_egrp,_mansel,aiSkill] call ghst_fnc_create_unit;
			if ((round (random 10)) > 7) then {
				_gunsel = _staticlist call BIS_fnc_selectRandom;
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

//create task
_tsk = "tsk_crash" + _rnum + str(_position_mark);
Ghst_Current_tasks pushback _tsk;
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Locate %1", _veh_name];
_taskdesc = format ["Locate the crashed %1 in %2 and check for survivors", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_pos,0,2,true,"Search"] call BIS_fnc_taskCreate;

//create fire and smoke on wreck
//[_veh,6,time,false,true] spawn BIS_Effects_Burn;

//create trigger for cache destruction
_trig1act = format ["deleteVehicle thistrigger; [""%1"",'succeeded'] call BIS_fnc_taskSetState; [playableunits,5000,100] remoteExec ['ghst_fnc_addscore']; %2 setdamage 1; deleteVehicle %2;", _tsk, _veh];
_trg1 = createTrigger["EmptyDetector",_pos];
_trg1 setTriggerArea[_trigrad,0,false];
_trg1 setTriggerActivation["WEST","PRESENT",false];
_trg1 setTriggerStatements["this",_trig1act,""];