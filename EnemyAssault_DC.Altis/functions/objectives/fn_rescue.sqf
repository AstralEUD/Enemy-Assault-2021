//V1.5.8 spawns a unit to be rescued
//if (!isserver) exitwith {};
private ["_position_mark","_radarray","_campmark","_unit_type","_locselname","_wside","_rnum","_wGrp","_pow","_VarName","_veh_name","_tsk","_taskdesc","_trig2cond","_trig2act","_trg1","_trig1cond"];

_position_mark = _this select 0;//position to search buildings around
_radarray = _this select 1;//radius around position to search for buildings
_campmark = _this select 2;//position where camp site is
_unit_type = _this select 3;//unit to be rescued "C_man_p_fugitive_F"
_locselname = _this select 4;//name of location

//create random number
_rnum = str(round (random 999));

//create unit to be rescued
//_wside =  (configFile >> "cfgvehicles" >> (_unit_type) >> "side") call bis_fnc_getcfgdata;
//if (_wside == 1) then {_wside = west;} else {_wside = civilian;};
_wGrp = createGroup CIVILIAN;//_wside;
_pow = [[_position_mark select 0, _position_mark select 1, 0.2],_wGrp,_unit_type,0.8] call ghst_fnc_create_unit;
_pow allowdamage false;
if !(isnil "AGM_Interaction_fnc_setCaptivityStatus") then {
	//FOR AGM Mod
	[_pow, "AGM_Handcuffed", true] call AGM_Interaction_fnc_setCaptivityStatus;
} else {
	_pow setCaptive true;
};
_VarName = "ghst_pow" + _rnum + str round(_position_mark select 0);
_pow setVehicleVarName _VarName;
//_pow Call Compile Format ["%1=_This ;",_VarName];
missionNamespace setVariable [_VarName,_pow];
publicVariable _VarName;
_veh_name = name _pow;

if (isnil "_veh_name") then {_veh_name = "John Doe";};

removeAllAssignedItems _pow;
removeallweapons _pow;
removeHeadgear _pow;
removeBackpack _pow;
_pow setunitpos "UP";
_pow setBehaviour "Careless";
dostop _pow;
//_pow playActionNow "Surrender";
_pow playmove "amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon";
_pow disableAI "MOVE";

_pow setVariable ["notrescued", true, true];
//add save action
//[[_pow],"ghst_fnc_hostjoin",true,true] spawn BIS_fnc_MP;
//[[_pow,["<t size='1.5' shadow='2' color='#2EFEF7'>Rescue Hostage</t>", "call ghst_fnc_hostjoin", [], 6, true, true, "","(alive _target)"]],"ghst_fnc_addaction",true,true] spawn BIS_fnc_MP;
//[_pow,["<t size='1.5' shadow='2' color='#2EFEF7'>Rescue Hostage</t>", "call ghst_fnc_hostjoin", [], 6, true, true, "","(alive _target) and (_target getVariable 'notrescued')"]] remoteExec ["ghst_fnc_addaction",0,true];

[
    _pow,                                                                        
    "<t size='1.5' shadow='2' color='#2EFEF7'>Rescue Hostage</t>",                                                                      
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",                   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unbind_ca.paa",                   
    "(alive _target) and (_target getVariable 'notrescued')",                                                      
    "true",                                                   
    {_this select 1 sidechat "Hold still while I get you free";},                                                                                
    {},                                                                                
    {call ghst_fnc_hostjoin;},                                              
    {_this select 1 sidechat "Wait one moment";},                                                                               
    [],                                                                                
    10,                                                                                
    6,                                                                                 
    true,                                                                              
    false                                                                          
] remoteExec ["BIS_fnc_holdActionAdd",0,_pow];

//create task
_tsk = "tsk_pow" + _rnum + str round(_position_mark select 0);
//Ghst_Current_tasks = Ghst_Current_tasks + [_tsk];
Ghst_Current_tasks pushback _tsk;
//create task
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Rescue %1", _veh_name];
_taskdesc = format ["Rescue the POW %1. He is held up in one of the buildings or around %2. Once located bring him back to base.", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_position_mark,0,2,true,"meet"] call BIS_fnc_taskCreate;

//send unit to random building
//null0 = [_position_mark,_radarray,[_pow],[false,"ColorGreen",false],[3,6,EAST],((paramsArray select 3)/10),false] execvm "scripts\objectives\ghst_PutinBuild.sqf";
//ghst_Build_objs = ghst_Build_objs + [_pow,_tsk];
ghst_Build_objs pushback [_pow,_tsk];

//create trigger for save point
if (surfaceIsWater _campmark) then {
	_trig1cond = format ["this and ((getposasl (thislist select 0)) select 2 < ((%1 select 2) + 3))", _campmark];
} else {
	_trig1cond = "this and ((getposatl (thislist select 0)) select 2 < 1)";
};
_trig1act = format ["deleteVehicle thistrigger; [%1] joinsilent grpNull; ['%2','succeeded'] call BIS_fnc_taskSetState; if (vehicle %1 != %1) then {unassignVehicle (%1); (%1) action ['EJECT', vehicle %1]; [%1] allowGetin false; dostop %1; %1 setCaptive true;}; [playableunits,5000,100] remoteExec ['ghst_fnc_addscore'];", _pow, _tsk];
_trg1 = createTrigger["EmptyDetector", _campmark];
_trg1 setTriggerArea[10,10,0,false];
_trg1 setTriggerActivation["VEHICLE","PRESENT",false];
_trg1 triggerAttachVehicle [_pow];
_trg1 setTriggerStatements[_trig1cond, _trig1act,""];

[_pow,_trg1,_tsk] spawn {	
	_pow = _this select 0;
	_trg1 = _this select 1;
	_tsk = _this select 2;
	
	while {!(isnil "_pow")} do {
		if ([_tsk] call BIS_fnc_taskCompleted) exitwith {deletevehicle _pow;};
		if (!([_tsk] call BIS_fnc_taskCompleted) and {!(alive _pow)}) exitwith {[_tsk,"failed"] call BIS_fnc_taskSetState; [playableunits,0,-200] remoteExec ["ghst_fnc_addscore"]; deleteVehicle _trg1; deletevehicle _pow;};
		sleep 5;
	};
};
