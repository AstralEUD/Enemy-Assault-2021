private["_x","_objmark","_rad","_PARAM_Enemy","_curtasks","_missiontype","_mapsize"];

_objmark = _this select 0;//position
_rad = _this select 1;//radius around position

["All Tasks Complete, RTB for new tasking"]remoteExec ["ghst_fnc_global_sidechat"];
[playableunits,5000,100] remoteExec ["ghst_fnc_addscore"];

while {true} do {
	//if ({ isPlayer _x and _x distance _objmark > (_rad + 1000) } count playableunits == count playableunits) exitwith {};
	if ({ isPlayer _x and ((position _x) inArea "AST_basePositions")} count playableunits == count playableunits) exitwith {};
	sleep 10;
};

AST_missionMaking = true;
publicVariable "AST_missionMaking";

//deletes current tasks including map task icons
_curtasks = Ghst_Current_tasks;
{_x call BIS_fnc_deleteTask} foreach _curtasks;

{deletevehicle _x;} foreach ghst_mine_array;

{deletevehicle _x;} foreach ghst_ied_array;

{deletevehicle _x;} foreach ghst_animal_array;

{deletevehicle _x;} foreach AST_money_array;

//AC-130 LDL_cam_rotating_center relocate
if !(isnil "LDL_cam_rotating_center") then {
	LDL_cam_rotating_center setpos (getmarkerpos "center");
};

//{if ((faction _x == "IND_F") or (faction _x == "OPF_F") or (faction _x == "CIV_F")) then {deletevehicle _x;};} foreach (_objmark nearObjects ["ALL", _rad]);
{if (!(_x iskindof "Camping_base_F") or !(_x iskindof "House")) then {deletevehicle _x;};} foreach (_objmark nearObjects ["ALL", _rad]);

{if (((side _x == east) or (side _x == independent) or (side _x == civilian)) and !(vehicle _x isKindOf "Plane_Base_F")) then {deletevehicle _x;};} foreach allunits;

{if !(alive _x) then {deletevehicle _x;};} foreach vehicles;

{deleteVehicle _x;} forEach allDead;

{deletevehicle _x;} foreach nearestObjects [(getmarkerpos "Respawn_West"),["CraterLong_small","CraterLong","WeaponHolder","GroundWeaponHolder"], 2000,true];
{deletevehicle _x;} foreach nearestObjects [[0,0,0],["ALL"], 200,true];

//delete empty groups
{deleteGroup _x;} foreach allGroups;

call ghst_fnc_clear_respawn_tents;//remove respawn tents from map

//Enemy Unit list
call ghst_fnc_unitlist;

_missiontype = selectRandom [1,2,3];
_PARAM_CONVOYTASK = "PARAM_CONVOYTASK" call BIS_fnc_getParamValue;
switch (_missiontype) do {
	case 1: {
			//launch next objective area
			//[] remoteExecCall ["ast_fnc_rtbReward",0];
			call ghst_fnc_randomobj;
		};
	case 2: {
			//launch convoy
			if (((random 9) > 6) and (_PARAM_CONVOYTASK == 1)) then {[(getmarkerpos "center"),[ghst_mapsize,ghst_mapsize],1000,(Ceil (random 6) + 6)] call ghst_fnc_convoy;} else {call ghst_fnc_randomobj;};
		};
	case 3: {
			//launch side objective area
			if ((count ghst_milarray > 0) and ((random 9) > 6)) then {call ghst_fnc_sideobj;} else {call ghst_fnc_randomobj;};
		};
	default {
			//launch next objective area
			[] remoteExecCall ["ast_fnc_rtbReward",0];
			call ghst_fnc_randomobj;
		};
};