//V1.8.2 by: Ghost
/*
Spawn Enemy Air patrols
*/
if !(isserver) exitwith {};

_spawnmarker = _this select 0;//spawn point
_centermarker = _this select 1;//center point
_radarray = _this select 2;//radius around center point [2500,2500]
	_radx = _radarray select 0;//radius A
	_rady = _radarray select 1;//radius B
_flyheight = _this select 3;//fly height
_airqty = _this select 4;//how many to spawn rg 2,3
_rspawn = _this select 5;//respawn array
	_dorspawn = _rspawn select 0;//true for respawn
	_minrspawn = ((_rspawn select 1) * 60);//delay in mins minimum till respawn
_markunitsarray = _this select 6;
	_markwps = _markunitsarray select 0;
	_mcolor = _markunitsarray select 1;
_ghst_side = [_this, 7, ghst_side,[EAST]] call BIS_fnc_param;//check to see if type is specified otherwise use default unitlist aircraft
_ghst_patrol_air_list = [_this, 8, ghst_patrol_air_list,[[]]] call BIS_fnc_param;//check to see if type array is specified otherwise use default unitlist type array

waitUntil {count ASTAirArray > 1};

_sleeptime = selectRandom [30, 60, 90, 120];
sleep _sleeptime;
/*
	if (count ASTAirArray > 1) then {
		ASTAirArray deleteAt (ASTAirArray findIf {!alive _x});
		if (count ASTAirArray > 1) exitWith {true};
	};
	*/

_spawnpos = [(_spawnmarker select 0),(_spawnmarker select 1), (_flyheight * 2)];
_dir = _spawnmarker getdir _centermarker;

_egrp = createGroup _ghst_side;


for "_x" from 0 to (_airqty) - 1 do {

	_air_type = _ghst_patrol_air_list call BIS_fnc_selectRandom;
	_air1_array = [_spawnpos, _dir, _air_type, _egrp] call BIS_fnc_spawnVehicle;
	_air1 = _air1_array select 0;
	//_air1 = createVehicle [_air_type,_spawnpos, [], 0, "FLY"];
	//_air1 setdir _dir;
	_air1 setpos [(getpos _air1 select 0), (getpos _air1 select 1), (_flyheight * 2)];
	_air1 setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];
	//_crew = [_air1, _egrp] call BIS_fnc_SpawnCrew;
	//sleep 1;
	_air1 flyinheight _flyheight;
	_air1 setSpeedMode "NORMAL";
	
	sleep 1;
};
//set combat mode
_eGrp setCombatMode "RED";
["적 항공기가 출현했습니다."] remoteExec ["hint",0];
[_eGrp,_centermarker,_radarray,_markunitsarray,["AWARE", "NORMAL", "WEDGE"]] call ghst_fnc_waypoints;

sleep 5;

while {count units _egrp > 0} do {
	{if (alive _x) then {
		_x setfuel 1;
		_x setVehicleAmmo 1;
	};} foreach units _egrp;
sleep 900;
};
hint "air dead";
sleep 30;

deletegroup _egrp;

if (_dorspawn) then {

sleep round(random _minrspawn) + _minrspawn;

[_spawnmarker,_centermarker,_radarray,_flyheight,_airqty,_rspawn,_markunitsarray,_ghst_side,_ghst_patrol_air_list] call ghst_fnc_eair;

};

if (true) exitwith {};