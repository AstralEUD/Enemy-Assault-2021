//V1.1 Script by: Ghost - calls in a support personal UAV "B_UAV_01_F"
//
private ["_type","_delay","_veh_name","_dir","_pos","_air1_array","_air1","_wGrp"];

_type = _this select 0;// type of uav to spawn i.e. "B_UAV_01_F"
_delay = (_this select 1) * 60;// time before uav support can be called again

_veh_name = (configFile >> "cfgVehicles" >> (_type) >> "displayName") call bis_fnc_getcfgdata;

_timedelay = (player getVariable "ghst_puavsup");
if (Time < _timedelay) exitwith {hint format ["%2 Support will be available in %1",((_timedelay - Time) call ghst_fnc_timer), _veh_name];};

_dir = getdir player;
_pos = player getpos [2, _dir];
_ppos = (getposatl player select 2);

player playActionNow "PutDown";
_air1_array = [[_pos select 0, _pos select 1, (_ppos) + 1.5], _dir, _type, (side player)] call BIS_fnc_spawnVehicle;

_air1 = _air1_array select 0;
_wGrp = _air1_array select 2;

createVehicleCrew _air1;

_air1 setdir _dir;
_air1 setposatl [_pos select 0, _pos select 1, (_ppos) + 1.5];  

//_air1 flyinheight 1;

player setVariable ["ghst_puavsup", Time + _delay];

//connect player to puav
player connectTerminalToUav _air1;

While {true} do {
if !((alive _air1) or {canmove _air1}) exitwith {hint format ["shit we lost %1 Support", _veh_name];};
if (fuel _air1 < 0.2) then {_air1 sidechat "Fuel getting low. Need to refuel soon";};
sleep 10;
};

{deletevehicle _x} foreach crew _air1;
deletevehicle _air1;

sleep 20;
deletegroup _wGrp;
/*
sleep _delay;

hint format ["%1 Support Ready", _veh_name];

player setVariable ["ghst_puavsup", false];

if (true) exitwith {};
*/