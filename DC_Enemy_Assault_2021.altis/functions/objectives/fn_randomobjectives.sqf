//V1.2.4 - By Ghost modified
//Randomly selects and generates objectives. Requires funciton module.

//if (!isserver) exitwith {};
private ["_position_array","_radarray","_numobjs","_campmark","_locselname","_objlist","_commanderlist","_transport_heli_list","_ammobox_list","_ghst_aa_list","_ghst_arty_list","_ghst_side","_PARAM_AISkill","_o","_random_pos","_buildarray","_curtasks","_curtasks_num","_max_reinf","_timedelay"];

//check to see if there are multiple positions

_random_pos = _this select 0;//center position for objectives
_radarray = _this select 1;//radius around center position e.g. [30,40]
_numobjs = _this select 2;//number of random objectives
_campmark = _this select 3;//location where camp site is
_locselname = _this select 4;//name of location

AST_op_pos = _random_pos;
publicVariable "AST_op_pos";

_list = AST_op_pos nearObjects ["House",1500];
{
	_x allowDamage false;
	_x addEventHandler["Hit",{_this select 0 setdamage 0}];
	_x addEventHandler["Dammaged",{_this select 0 setdamage 0}];
} forEach _list;
diag_log "서버 건물 무적 스크립트 성공";

_commanderlist = ghst_commanderlist;
_transport_heli_list = ghst_transport_heli_list;
_ammobox_list = ghst_ammobox_list;
_ghst_aa_list = ghst_aa_list;
_ghst_arty_list = ghst_arty_list;
_ghst_powarray = ghst_powarray;
_ghst_side = ghst_side;
_PARAM_AISkill = "PARAM_AISkill" call BIS_fnc_getParamValue;
_PARAM_TASKTYPES = "PARAM_TASKTYPES" call BIS_fnc_getParamValue;

//list of objectives
//["leader","rescue","ARTY","ammo","intel","crash","ZSU_AA2","comtower","leader2","intel2","rescue2","ZSU_AA","tower","ammo2","intel3","leader3","ammo3","Bombtruck","leader4","ARTY2"];
if (_PARAM_TASKTYPES == 1) then {
	_objlist = ["ARTY","ZSU_AA2","ZSU_AA","ARTY2","Bombtruck","ARTY3"];
} else {
	_objlist = ["leader","rescue","ARTY","dataterminal","intel","ZSU_AA2","leader2","dataterminal2","intel2","rescue2","ARTY2","ZSU_AA","intel3","leader3","Bombtruck","dataterminal3","leader4","ARTY3"];//"leader","rescue","ARTY","ammo","intel","ZSU_AA2","leader2","Acquireobj","intel2","rescue2","ZSU_AA","ammo2","intel3","leader3","ammo3","Bombtruck","leader4","ARTY2"
};

//empty array for objects to be put into for script later on
ghst_Build_objs = [];
Ghst_Current_tasks = [];
if (_numobjs > count _objlist) then {_numobjs = count _objlist;};
//select specified number of random objectives
for "_o" from 1 to (_numobjs) do {
	private ["_idx","_r","_objsel","_idx"];
	//select a position
		//_idx = floor(random count _position_array);
		//_random_pos = _position_array select _idx;
		//_position_array set [_idx,-1];
		//_position_array = _position_array - [-1];

	//select random objective from list
	_r =  floor(random count _objlist);
	_objsel = _objlist select _r;
	//_objsel = selectRandom _objlist;
	//_objlist = _objlist - [_objsel];
	_objlist deleteAt _r;
	
	diag_log text ""; 
	diag_log text format["|=============================   %1 %2   =============================|", _locselname, _objsel];
	diag_log text "";
	
	switch (_objsel) do
		{   
			case "leader":
			{
			[_random_pos,_radarray,_commanderlist,_locselname,_ghst_side] call ghst_fnc_assassinate;
			};
			case "leader2":
			{
			[_random_pos,_radarray,_commanderlist,_locselname,_ghst_side] call ghst_fnc_assassinate;
			};
			case "leader3":
			{
			[_random_pos,_radarray,_commanderlist,_locselname,_ghst_side] call ghst_fnc_assassinate;
			};
			case "leader4":
			{
			[_random_pos,_radarray,_commanderlist,_locselname,_ghst_side] call ghst_fnc_assassinate;
			};
			case "intel":
			{
			[_random_pos,_radarray,_locselname] call ghst_fnc_intel;
			};
			case "intel2":
			{
			[_random_pos,_radarray,_locselname] call ghst_fnc_intel;
			};
			case "intel3":
			{
			[_random_pos,_radarray,_locselname] call ghst_fnc_intel;
			};
			//not used
			case "clear":
			{
			[_random_pos,_radarray,_locselname,_ghst_side] call ghst_fnc_clear;
			};
			case "rescue":
			{
			private ["_powarray","_powsel"];
			_powsel = selectRandom _ghst_powarray;
			[_random_pos,_radarray,_campmark,_powsel,_locselname] call ghst_fnc_rescue;
			};
			case "rescue2":
			{
			private ["_powarray","_powsel"];
			_powsel = selectRandom _ghst_powarray;
			[_random_pos,_radarray,_campmark,_powsel,_locselname] call ghst_fnc_rescue;
			};
			case "crash":
			{
			private ["_crasharray","_crashsel"];
			_crasharray = ["Land_Wreck_Heli_Attack_01_F","Land_Wreck_Plane_Transport_01_F"];
			_crashsel = selectRandom _crasharray;
			[_random_pos,_radarray,_crashsel,[15,15],(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomcrash;
			};
			case "tower":
			{
			private ["_buildarray"];
			_buildarray = ["CUP_A2_oil_pump_ep1","CUP_A2_oil_tower_ep1","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Land_Communication_F","Land_TTowerSmall_1_F"];
			[_random_pos,1000,_buildarray,[200,200],[2,3],_ghst_side,(_PARAM_AISkill/10),[true, _transport_heli_list]] spawn ghst_fnc_randombuild;
			};
			case "ammo":
			{
			_ammobox_list = selectRandom ghst_ammobox_list;
			[_random_pos,_radarray,_ammobox_list,_locselname,true] call ghst_fnc_objinbuild;
			};
			case "ammo2":
			{
			_ammobox_list = selectRandom ghst_ammobox_list;
			[_random_pos,_radarray,_ammobox_list,_locselname,true] call ghst_fnc_objinbuild;
			};
			case "ammo3":
			{
			_ammobox_list = selectRandom ghst_ammobox_list;
			[_random_pos,_radarray,_ammobox_list,_locselname,true] call ghst_fnc_objinbuild;
			};
			case "dataterminal":
			{
			[_random_pos,_radarray,_locselname] call ghst_fnc_dataterminal;
			};
			case "dataterminal2":
			{
			[_random_pos,_radarray,_locselname] call ghst_fnc_dataterminal;
			};
			case "dataterminal3":
			{
			[_random_pos,_radarray,_locselname] call ghst_fnc_dataterminal;
			};
			//not used
			case "seawreck":
			{
			private ["_wreckarray"];
			_wreckarray = ["Land_UWreck_FishingBoat_F","Land_Wreck_Traw2_F","Land_Wreck_Traw_F","Land_UWreck_MV22_F","Land_UWreck_Heli_Attack_02_F"];//"Land_UWreck_FishingBoat_F","Land_Wreck_Traw2_F","Land_Wreck_Traw_F","Land_UWreck_MV22_F","Land_UWreck_Heli_Attack_02_F"
			//"UWreck_base_F"
			[(getmarkerpos "center"),ghst_mapsize,_wreckarray,[100,100],[3,2],_ghst_side,(_PARAM_AISkill/10)] call ghst_fnc_randomwreck;
			};
			case "ZSU_AA":
			{
			_aasel = selectRandom _ghst_aa_list;
			[_random_pos,_radarray,_aasel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "ZSU_AA2":
			{
			_aasel = selectRandom _ghst_aa_list;
			[_random_pos,_radarray,_aasel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "ARTY":
			{
			_artysel = selectRandom _ghst_arty_list;
			[_random_pos,_radarray,_artysel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "ARTY2":
			{
			_artysel = selectRandom _ghst_arty_list;
			[_random_pos,_radarray,_artysel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "ARTY3":
			{
			_artysel = selectRandom _ghst_arty_list;
			[_random_pos,_radarray,_artysel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "comtower":
			{
			private ["_towers","_towersel"];
			_towers = ["Land_Communication_F","Land_TTowerSmall_1_F"];
			_towersel = selectRandom _towers;
			[_random_pos,_radarray,_towersel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "Bombtruck":
			{
			private ["_devices","_devicesel"];
			_devices = ["O_Truck_03_device_F","Land_Device_assembled_F","Land_Device_disassembled_F"];
			_devicesel = selectRandom _devices;
			[_random_pos,_radarray,_devicesel,true,(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomloc;
			};
			case "Acquireobj":
			{
			private ["_acquiredobjsel"];
			_acquiredobjsel = selectRandom ["Land_Cargo10_blue_F", "Land_Cargo10_brick_red_F", "Land_Cargo10_cyan_F", "Land_Cargo10_grey_F", "Land_Cargo10_light_blue_F", "Land_Device_slingloadable_F", "Land_Pod_Heli_Transport_04_ammo_F", "Land_Pod_Heli_Transport_04_box_F", "Land_Pod_Heli_Transport_04_fuel_F", "Land_Pod_Heli_Transport_04_repair_F", "Land_Cargo10_light_green_F", "Land_Cargo10_military_green_F", "Land_Cargo10_orange_F", "Land_Cargo10_red_F", "Land_Cargo10_sand_F", "Land_Cargo10_white_F", "Land_Cargo10_yellow_F"];
			[_random_pos,_radarray,_acquiredobjsel,(getposasl obj_drop),(_PARAM_AISkill/10),_locselname,[true,"ColorRed",[200,200]],_ghst_side] call ghst_fnc_randomacquire;
			};
		};
	sleep 3;
};

//check for towers around objective area and if so spawn task
_buildarray = ["CUP_A2_oil_pump_ep1","CUP_A2_oil_tower_ep1","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Land_Communication_F","Land_TTowerSmall_2_F","Land_dp_transformer_F","Land_TTowerSmall_1_F"];
[_random_pos,1000,_buildarray,[200,200],[2,3],_ghst_side,(_PARAM_AISkill/10),[true, _transport_heli_list]] call ghst_fnc_randombuild;

diag_log text ""; 
diag_log text format["|=============================   %1 %2   =============================|", _locselname, "Put In Buildings"];
diag_log text "";

sleep 5;
//send all objects to buildings that are in array ghst_Build_objs
//diag_log ghst_Build_objs;
[_random_pos,_radarray,ghst_Build_objs,[true,"ColorRed",[100,100]],[3,7,_ghst_side],(_PARAM_AISkill/10),false] spawn ghst_fnc_PutinBuild;

//create trigger for reinforcements
{
	_xpos = getpos (_x select 0);
	_trig2cond = format ["%1", _ghst_side];
	_trig2act = format ["deleteVehicle thistrigger; [%1,[2000,2000],100,1,[false,""ColorRed""],%2] spawn ghst_fnc_ecounter;", _xpos, (_PARAM_AISkill/10)];
	_trg2 = createTrigger["EmptyDetector",_xpos];
	_trg2 setTriggerArea[50,50,0,false];
	_trg2 setTriggerActivation[_trig2cond,"PRESENT",false];
	_trg2 setTriggerStatements["count thislist < 8",_trig2act,""];
} foreach ghst_Build_objs;

//sleep 60;
//check for all tasks complete and activate end variable.
//_curtasks = [];
_curtasks = Ghst_Current_tasks;
//missionNamespace setVariable ["Ghst_Cur_tsks", Ghst_Current_tasks,true];
_curtasks_num = count _curtasks;
_curtasks select (count _curtasks)-1 call BIS_fnc_taskSetCurrent;
//diag_log _curtasks;
//diag_log _curtasks_num;

diag_log text ""; 
diag_log text format["|=============================   %1 %2   =============================|", _locselname, "Loop Start"];
diag_log text "";

_timedelay = Time + 1200;
_max_reinf = 0;
While {true} do {
	private ["_randnum"];
	//{if ([_x] call BIS_fnc_taskCompleted) then {_curtasks = _curtasks - [_x]; diag_log _curtasks;};} foreach _curtasks;
	if ({[_x] call BIS_fnc_taskCompleted} count _curtasks == _curtasks_num) exitwith {[_random_pos,1100] spawn ghst_fnc_full_cleanup;};
	//if (count alldead > 50) then {call ghst_fnc_cleanup;};
	_randnum = (random 10);
	sleep 10;
	if ((_ghst_side countSide allunits < 45) and {(_randnum > 5)} and {(count _curtasks > 0)} and {(Time > _timedelay)}) then {
		[_random_pos,_radarray,_transport_heli_list,false,[false,"ColorRed"],(_PARAM_AISkill/10)] spawn ghst_fnc_eparadrop;
		_timedelay = Time + 900 + (round(random 900));
	};
	if ((_ghst_side countSide allunits < 35) and {(_randnum < 5)} and {(count _curtasks > 0)} and {(_max_reinf < _numobjs)} and {(Time > _timedelay)}) then {
		[_random_pos,[2000,2000],(_radarray select 0),(1 + (ROUND (random 2))),[false,"ColorRed"],(_PARAM_AISkill/10)] spawn ghst_fnc_ecounter; _max_reinf = _max_reinf + 1;
		_timedelay = Time + 900 + (round(random 900));
	};
	sleep 10;
};

diag_log text ""; 
diag_log text format["|=============================   %1 %2   =============================|", _locselname, "Loop End"];
diag_log text "";