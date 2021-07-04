//1 By: Ghost - spawns data terminal to interact with
//if (!isserver) exitwith {};
private ["_position_mark","_rad","_locselname","_rnum","_terminal","_VarName","_terminalobj","_veh_name","_terminalobj","_tsk","_tasktopic","_taskdesc"];

_position_mark = _this select 0;//position to search buildings around
_rad = _this select 1;//radius around position to search for buildings
_locselname = _this select 2;//name of location

//create random number
_rnum = str(round (random 999));

//select random terminal
_terminal = "Land_DataTerminal_01_F";

//create terminal
_terminalobj = createVehicle [_terminal,[_position_mark select 0, _position_mark select 1, 0], [], 0, "NONE"];
_veh_name = getText (configFile >> "cfgVehicles" >> (_terminal) >> "displayName");
_VarName = ("ghst_terminal" + _rnum);
_terminalobj setVehicleVarName _VarName;
//_terminalobj Call Compile Format ["%1=_This;",_VarName];
missionNamespace setVariable [_VarName,_terminalobj];
publicVariable _VarName;

//create task
_tsk = "tsk_terminal" + _rnum + str(_position_mark);
//Ghst_Current_tasks = Ghst_Current_tasks + [_tsk];
Ghst_Current_tasks pushback _tsk;
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Find %1", _veh_name];
_taskdesc = format ["Search the buildings in %2 for %1. Once you have found %1 download the data.", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_position_mark,0,2,true,"interact"] call BIS_fnc_taskCreate;
//[_tsk,true,[_taskdesc,_tasktopic,_taskmark],_position_mark,"AUTOASSIGNED",2,true,true,"Search"] call BIS_fnc_setTask;

_terminalobj setVariable ["notdisabled", true, true];
//attaches addaction to object
//[[_terminalobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Disable Terminal Link</t>", "call ghst_fnc_disableterminal", _tsk, 6, true, true, "",""]],"ghst_fnc_addaction",true,true] spawn BIS_fnc_MP;
//[_terminalobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Disable Terminal Link</t>", "call ghst_fnc_disableterminal", _tsk, 6, true, true, "","(_target getVariable 'notdisabled')"]] remoteExec ["ghst_fnc_addaction",0,true];
//Animate terminal
[_terminalobj,3] call BIS_fnc_dataTerminalAnimate;

[
    _terminalobj,                                                                        
    "<t size='1.5' shadow='2' color='#2EFEF7'>Download Data</t>",                                                                      
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",                   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",                   
    "(_target getVariable 'notdisabled')",                                                      
    "true",                                                   
    {_this select 1 sidechat "Downloading Data";},                                                                                
    {},                                                                                
    {call ghst_fnc_disableterminal;},                                              
    {_this select 1 sidechat "Wait one moment";},                                                                               
    [_tsk],                                                                                
    15,                                                                                
    6,                                                                                 
    true,                                                                              
    false                                                                          
] remoteExec ["BIS_fnc_holdActionAdd",0,_terminalobj];

//send terminal to random building
//null0 = [_position_mark,_rad,[_terminalobj],[false,"ColorGreen",false],[3,6,EAST],((paramsArray select 3)/10),false] execvm "scripts\objectives\ghst_PutinBuild.sqf";
//ghst_Build_objs = ghst_Build_objs + [_terminalobj,_tsk];
ghst_Build_objs pushback [_terminalobj,_tsk];

[_terminalobj,_tsk] spawn {
	private ["_terminalobj","_tsk"];
	_terminalobj = _this select 0;
	_tsk = _this select 1;
	
	while {true} do {
		//if (_tsk call SHK_Taskmaster_isCompleted) exitwith {};
		if (_tsk call BIS_fnc_taskCompleted) exitwith {};
		if (!(_tsk call BIS_fnc_taskCompleted) and (isnull _terminalobj)) exitwith {[_tsk,"failed"] call BIS_fnc_taskSetState; [playableunits,0,-200] remoteExec ["ghst_fnc_addscore"];};
		sleep 5;
	};
};