//V1 Script by: Ghost - spawns remote designator in front of player "B_Static_Designator_01_F"
//
private ["_type","_delay","_veh_name","_dir","_pos","_des1_array","_des1","_wGrp"];

_type = _this select 0;// type of Designator to spawn i.e. "B_Static_Designator_01_F"
_delay = (_this select 1) * 60;// time before Designator support can be called again

_veh_name = (configFile >> "cfgVehicles" >> (_type) >> "displayName") call bis_fnc_getcfgdata;

_timedelay = (player getVariable "ghst_remotedes");
if (Time < _timedelay) exitwith {hint format ["%2 will be available in %1",((_timedelay - Time) call ghst_fnc_timer), _veh_name];};

_dir = getdir player;
_pos = [player, 2, _dir] call BIS_fnc_relPos;

player playActionNow "PutDown";
_des1_array = [[_pos select 0, _pos select 1, 1], _dir, _type, (side player)] call BIS_fnc_spawnVehicle;

_des1 = _des1_array select 0;
_wGrp = _des1_array select 2;

createVehicleCrew _des1;

_des1 setdir _dir;
_des1 setposatl [_pos select 0, _pos select 1, getposatl player select 2];//[(getposatl _pos select 0) + 1 * sin(_dir),(getposatl _pos select 1) + 1 * cos(_dir),0];
_des1 setVectorUP (surfaceNormal [(getPosatl _des1) select 0,(getPosatl _des1) select 1]);
_des1 setvelocity [0,0,0];

//connect player to remote designator
player connectTerminalToUav _des1;

player setVariable ["ghst_remotedes", Time + _delay];

While {true} do {
if !(alive _des1) exitwith {hint format ["%1 Destroyed", _veh_name];};
sleep 10;
};

{deletevehicle _x} foreach crew _des1;
deletevehicle _des1;

sleep 20;
deletegroup _wGrp;
/*
sleep _delay;

hint format ["%1 Ready to deploy", _veh_name];

player setVariable ["ghst_remotedes", false];

if (true) exitwith {};
*/
