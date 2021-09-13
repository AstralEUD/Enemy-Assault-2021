//V1.3.8 By: Ghost
//spawns object in a random location
//if (!isserver) exitwith {};
private ["_position_mark","_radarray","_obj","_usenet","_locselname","_markunitsarray","_markunits","_mcolor","_msize","_sideguards","_rnum","_tsk","_menlist","_staticlist","_spawnpos","_temppos","_md","_veh","_veh_name","_VarName","_vehpos","_vehnet","_pos","_mark1","_eGrp","_g","_tasktopic","_taskdesc","_trig1stat","_trig1act","_trg1"];

_position_mark = _this select 0;//position for center pos
_radarray = _this select 1;//radius around position to search for a position
_obj = _this select 2;//object to place somewhere randomly e.g. "O_MBT_02_arty_F"
_usenet = _this select 3;//true/false to use camo net over target
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

_spawnpos = [];
_md = 100;
while {(_spawnpos isEqualTo []) and (_md < 500)} do {
	_temppos = [_position_mark,[_radarray select 0, _radarray select 1, (random 360)]] call ghst_fnc_rand_position;
	_spawnpos = _temppos findEmptyPosition[ 10 , _md , _obj ];
	_md = _md + 50;
};

if (_spawnpos isEqualTo []) then {_spawnpos = [_position_mark,[_radarray select 0, _radarray select 1, (random 360)]] call ghst_fnc_rand_position;};

//create cache
_veh = createVehicle [_obj,_spawnpos, [], 0, "NONE"];
if (_veh iskindof "StaticWeapon") then {
	createVehicleCrew _veh;
};
_veh lock 2;
_veh setVehicleLock "LOCKED";
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

//spawn camo net over cache
	if (_usenet and !(_veh iskindof "House_F") and !(_veh iskindof "rhs_9k79_B")) then {
		_vehnet = createVehicle [ghst_opfortent,_vehpos, [], 0, "CAN_COLLIDE"];
		_vehnet allowdamage false;
		_vehnet setdir (getdir _veh) - 180;
		_vehnet setposatl _vehpos;
		_vehnet setVectorUP (surfaceNormal [_vehpos select 0,_vehpos select 1]);
		_vehnet allowdamage true;
	};
	
	//put camo on vehicles if they have it and random slat armor
	[_veh, FALSE, ["showcamonethull", 1, "showcamonetturret", 1, "showcamonetcannon", 1, "showslathull", 0.3]] call BIS_fnc_initVehicle;
	
	if (_veh iskindof "rhs_9k79_B") then {
		[_veh,nil,["RHS_Rocket_Handler", 1]] call BIS_fnc_initVehicle;
	};
	
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
		_gp1 = _temppos findEmptyPosition[ 0 , 15 , _mansel ];
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
	
	

//create task
_tsk = "tsk_randloc" + _rnum + str(_position_mark);
Ghst_Current_tasks pushback _tsk;
if ((random 1) > 0.4) then {
	_taskmark = format ["%1", _veh_name];
	_tasktopic = format ["Hack and Destroy %1", _veh_name];
	//_taskdesc = format ["Locate the enemy %1 in %2 and blow it up. <br/><img image='%3' widwidth='64' height='64'/>", _veh_name,_locselname,_veh_pic];
	_taskdesc = format ["Hack %1 and Destroy %1: Before hack it, It is invincible!", _veh_name,_locselname];
	_veh setVariable ["notfound",true, true];
	_veh allowDamage false;
	_vehname = _tsk + "veh";
	missionNameSpace setVariable [_vehname, _veh];
	[_veh,["<t size='1.5' shadow='2' color='#437299'>Hack the Vehicle's System</t>", "call ast_fnc_destroyHack", _vehname, 6, true, true, "(_target getVariable 'notfound')",""]] remoteExec ["ghst_fnc_addaction",0,true];
	[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_pos,0,2,true,"documents"] call BIS_fnc_taskCreate;
} else {
	_taskmark = format ["%1", _veh_name];
	_tasktopic = format ["Destroy %1", _veh_name];
	//_taskdesc = format ["Locate the enemy %1 in %2 and blow it up. <br/><img image='%3' widwidth='64' height='64'/>", _veh_name,_locselname,_veh_pic];
	_taskdesc = format ["Find %1 in %2 and blow it up", _veh_name,_locselname];
	[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_pos,0,2,true,"Destroy"] call BIS_fnc_taskCreate;
};

//create trigger for cache destruction
//_trig1stat = format ["!(alive %1)",_veh];
_trig1stat = format ["damage %1 > 0.6",_veh];
//_trig1act = format ["deleteVehicle thistrigger; [""%1"",'succeeded'] call SHK_Taskmaster_upd;", _tsk];
_trig1act = format ["deleteVehicle thistrigger; %2 setdamage 1; [""%1"",'succeeded'] call BIS_fnc_taskSetState; [playableunits,5000,100] remoteExec ['ghst_fnc_addscore'];", _tsk, _veh];
_trg1 = createTrigger["EmptyDetector",_pos];
_trg1 setTriggerArea[(_radarray select 0), (_radarray select 1),0,false];
_trg1 setTriggerActivation["NONE","PRESENT",false];
_trg1 setTriggerStatements[_trig1stat,_trig1act,""];