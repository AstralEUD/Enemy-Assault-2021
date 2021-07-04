//1.2 By: Ghost - spawns intel to be gathered
//if (!isserver) exitwith {};
private ["_position_mark","_rad","_locselname","_intelarray","_rnum","_intelsel","_VarName","_intelobj","_veh_name","_intelobj","_tsk","_tasktopic","_taskdesc"];

_position_mark = _this select 0;//position to search buildings around
_rad = _this select 1;//radius around position to search for buildings
_locselname = _this select 2;//name of location

//array of available intel objects
_intelarray = ["Land_Suitcase_F","Land_PlasticCase_01_large_F","Land_PlasticCase_01_medium_F","Land_PlasticCase_01_small_F","Land_MetalCase_01_large_F","Land_MetalCase_01_medium_F","Land_MetalCase_01_small_F","Land_PCSet_01_case_F","CBRNContainer_01_closed_yellow_F","CBRNContainer_01_closed_olive_F","Land_PlasticCase_01_large_black_F","Land_PlasticCase_01_large_black_CBRN_F","Land_PlasticCase_01_large_CBRN_F","Land_PlasticCase_01_large_olive_F","Land_PlasticCase_01_large_olive_CBRN_F","Land_PlasticCase_01_medium_black_F","Land_PlasticCase_01_medium_black_CBRN_F","Land_PlasticCase_01_medium_CBRN_F","Land_PlasticCase_01_medium_olive_F","Land_PlasticCase_01_medium_olive_CBRN_F","Land_PlasticCase_01_small_black_F","Land_PlasticCase_01_small_black_CBRN_F","Land_PlasticCase_01_small_CBRN_F","Land_PlasticCase_01_small_olive_F","Land_PlasticCase_01_small_olive_CBRN_F"];//,"Land_Laptop_unfolded_F","Land_Laptop_F","Land_FilePhotos_F","Land_File1_F","Land_File2_F"

//create random number
_rnum = str(round (random 999));

//select random intel
_intelsel = selectRandom _intelarray;

//create intel
_intelobj = createVehicle [_intelsel,[_position_mark select 0, _position_mark select 1, 0], [], 0, "NONE"];
_veh_name = getText (configFile >> "cfgVehicles" >> (_intelsel) >> "displayName");
_VarName = ("ghst_intel" + _rnum);
_intelobj setVehicleVarName _VarName;
//_intelobj Call Compile Format ["%1=_This;",_VarName];
missionNamespace setVariable [_VarName,_intelobj];
publicVariable _VarName;

//create task
_tsk = "tsk_intel" + _rnum + str(_position_mark);
//Ghst_Current_tasks = Ghst_Current_tasks + [_tsk];
Ghst_Current_tasks pushback _tsk;
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Find %1", _veh_name];
_taskdesc = format ["Search the buildings in %2 for %1. Pay attention to the floors.", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_position_mark,0,2,true,"intel"] call BIS_fnc_taskCreate;

_intelobj setVariable ["notfound", true, true];
//attaches addaction to object
//[[_intelobj,_tsk],"ghst_fnc_intel",true,true] spawn BIS_fnc_MP;
//[[_intelobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Grab Intel</t>", "call ghst_fnc_itemfound", _tsk, 6, true, true, "",""]],"ghst_fnc_addaction",true,true] spawn BIS_fnc_MP;
[_intelobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Grab Intel</t>", "call ghst_fnc_itemfound", _tsk, 6, true, true, "(_target getVariable 'notfound')",""]] remoteExec ["ghst_fnc_addaction",0,true];

//send intel to random building
//null0 = [_position_mark,_rad,[_intelobj],[false,"ColorGreen",false],[3,6,EAST],((paramsArray select 3)/10),false] execvm "scripts\objectives\ghst_PutinBuild.sqf";
//ghst_Build_objs = ghst_Build_objs + [_intelobj,_tsk];
ghst_Build_objs pushback [_intelobj,_tsk];

[_intelobj,_tsk] spawn {
	private ["_intelobj","_tsk"];
	_intelobj = _this select 0;
	_tsk = _this select 1;
	
	while {true} do {
		//if (_tsk call SHK_Taskmaster_isCompleted) exitwith {};
		if (_tsk call BIS_fnc_taskCompleted) exitwith {};
		if (!(_tsk call BIS_fnc_taskCompleted) and {(isnull _intelobj)}) exitwith {[_tsk,"failed"] call BIS_fnc_taskSetState; [playableunits,0,-200] remoteExec ["ghst_fnc_addscore"];};
		sleep 5;
	};
};