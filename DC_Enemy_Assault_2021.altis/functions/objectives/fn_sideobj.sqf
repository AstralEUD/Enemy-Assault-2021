/*
V1.1 By: Ghost  
selects random side obj to spawn. ghst_sideobj = [] call ghst_fnc_sideobj;
*/
//if !(isserver) exitwith {};
private ["_ghst_side","_transport_heli_list","_PARAM_AISkill","_locselpos","_locselname","_area_size","_area_size2","_enemy_house","_enemy_patrols","_enemy_squadsize","_enemy_vehicles","_mark1","_idx","_locsel","_buildarray"];

_ghst_side = ghst_side;
_transport_heli_list = ghst_transport_heli_list;
_PARAM_AISkill = "PARAM_AISkill" call BIS_fnc_getParamValue;

//Select one random location and spawn objective
_idx = floor(random count ghst_milarray);
_locsel = ghst_milarray select _idx;

if (isnil "_locsel") exitwith {diag_log format ["TASK LOCATIONS EMPTY FOR SIDE OBJECTIVES %1", ghst_milarray]; [[1,1,0],1] spawn ghst_fnc_full_cleanup;};
//ghst_milarray set [_idx,-1];
//ghst_milarray = ghst_milarray - [-1];
ghst_milarray deleteAt _idx;
_locselpos = _locsel select 0;//get position of location
AST_op_pos = _locselpos;
publicVariable "AST_op_pos";
_locselname = _locsel select 1;//get name of location
Ghst_Current_tasks = [];

#define _area_size 300
#define _area_size2 500
/*
if (_locselname == "Ghost Hotel") then {
	#define _enemy_house [40,25]
} else {
	#define _enemy_house [30,15]
};*/
#define _enemy_house [40,25]
#define _enemy_patrols (2 + round(random 2))
#define _enemy_squadsize (3 + round(random 3))
#define _enemy_vehicles (4 + round(random 2))

//random boat patrol
[_locselpos,[500,500],2,_ghst_side,[false,"ColorRed"],(_PARAM_AISkill/10)] call ghst_fnc_eboatspawn;	

[_locselpos,_area_size,_ghst_side,_enemy_house,[false,"ColorRed"],(_PARAM_AISkill/10),false,false] call ghst_fnc_fillbuild;

//external scripts to spawn enemy around objective
[_locselpos,[_area_size,_area_size,(random 360)],_enemy_patrols,_enemy_patrols,_ghst_side,[false,"ColorRed"],(_PARAM_AISkill/10),false] call ghst_fnc_espawn;

[_locselpos,_area_size,[false,"Colorblack"],_ghst_side,(_PARAM_AISkill/10)] call ghst_fnc_roofmgs2;

[_locselpos,[_area_size,_area_size,(random 360)],_enemy_vehicles,_ghst_side,[false,"ColorRed"],(_PARAM_AISkill/10)] call ghst_fnc_evehsentryspawn;

[_locselpos,_area_size2,8,true,false,WEST] call ghst_fnc_civcars;

[_locselpos,_area_size,20,["Alsatian_Random_F"]] call ghst_fnc_animals;

[_locselpos,_area_size2,8,false,_ghst_side,[false,"ColorBlack"]] call ghst_fnc_mines;

[_locselpos,_area_size2,2,WEST,[false,"ColorRed"]] call ghst_fnc_ieds;

[_locselpos,_area_size,false] call ghst_fnc_civhpads;

//random objective script
_PARAM_Tasks = "PARAM_Tasks" call BIS_fnc_getParamValue;
ghst_randomobjectives = [_locselpos,[_area_size,_area_size],_PARAM_Tasks,(getposasl helortb),_locselname] spawn ghst_fnc_randomobjectives;

/*
//Clear Area task
[_locselpos,[_area_size,_area_size],_locselname,_ghst_side] call ghst_fnc_clear;

//check for towers around objective area and if so spawn task
_buildarray = ["Land_TTowerBig_2_F","Land_TTowerBig_1_F","Land_Communication_F","Land_TTowerSmall_1_F"];
[_locselpos,_area_size2,_buildarray,[200,200],[_enemy_patrols,_enemy_squadsize],_ghst_side,(_PARAM_AISkill/10),[true, _transport_heli_list]] call ghst_fnc_randombuild;

//Create objective area marker
_mark1 = [_locselpos,"ColorRed","","",[_area_size,_area_size],"Ellipse","Border"] call ghst_fnc_mark_point;

if (isnil "_locselpos") exitwith {[[1,1,0],1] spawn ghst_fnc_full_cleanup;};

[_locselpos,_mark1] spawn {
	private ["_locselpos","_mark1","_curtasks","_curtasks_num"];
	_locselpos = _this select 0;
	_mark1 = _this select 1;

	sleep 5;
	//check for all tasks complete and activate end variable.
	//_curtasks = [];
	_curtasks = Ghst_Current_tasks;
	//missionNamespace setVariable ["Ghst_Cur_tsks", Ghst_Current_tasks,true];
	_curtasks_num = count _curtasks;
	//diag_log _curtasks;
	_curtasks select 0 call BIS_fnc_taskSetCurrent;

	While {true} do {
		//{if ([_x] call BIS_fnc_taskCompleted) then {_curtasks = _curtasks - [_x]; diag_log _curtasks;};} foreach _curtasks;
		if ({[_x] call BIS_fnc_taskCompleted} count _curtasks isEqualTo _curtasks_num) exitwith {deletemarker _mark1; [_locselpos,1100] spawn ghst_fnc_full_cleanup;};
		//if (count alldead > 30) then {call ghst_fnc_cleanup;};
		sleep 10;
	};
};
*/