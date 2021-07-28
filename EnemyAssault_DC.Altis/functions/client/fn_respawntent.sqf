//V1.1 Script by: Ghost - calls in a support Respawn tent
//ghst_puavsupport = [""Land_TentA_F"",5] spawn ghst_fnc_respawntent;
private ["_type","_delay","_veh_name","_dir","_pos","_tent","_marker","_data","_respawnmarkername","_respawnName","_ghst_respawntent_data"];

_type = _this select 0;// type of tent to spawn i.e. "B_Respawn_TentA_F"
_delay = (_this select 1) * 60;// time before tent support can be called again

_veh_name = (configFile >> "cfgVehicles" >> (_type) >> "displayName") call bis_fnc_getcfgdata;

_timedelay = (player getVariable "ghst_respawntent");
if (Time < _timedelay) exitwith {hint format ["Respawn Tent will be available in %1",((_timedelay - Time) call ghst_fnc_timer)];};

_ghst_respawntent_data = missionNamespace getvariable "ghst_respawntent_data";

if !(isnil "ghst_respawntent_pdata") then {
	private ["_idx"];
	_idx = _ghst_respawntent_data find ghst_respawntent_pdata;
	_ghst_respawntent_data deleteAt _idx;
	(ghst_respawntent_pdata select 2) call BIS_fnc_removeRespawnPosition;
	deletevehicle (ghst_respawntent_pdata select 0);
	deletemarker (ghst_respawntent_pdata select 1);
};

_respawnName = format [" Respawn Tent (%1)", name player];
_respawnmarkername = format ["ghst_respawntent_marker_%1", name player];

_dir = getdir player;
_pos = [player, 3, _dir] call BIS_fnc_relPos;
_ppos = (getposatl player select 2);

player playActionNow "PutDown";
_tent = _type createvehicle [_pos select 0, _pos select 1, _ppos];

_tent setdir _dir;
_tent setposatl [_pos select 0, _pos select 1, _ppos];
_tent setVectorUP (surfaceNormal [_pos select 0,_pos select 1, _ppos]);

_marker = [_pos,"ColorBlue",_respawnmarkername,_respawnName,"hd_flag",[0.5,0.5]] call ghst_fnc_mark_local;

_data = [missionNamespace,_tent] call BIS_fnc_addRespawnPosition;

//_ghst_respawntent_data = _ghst_respawntent_data + [[_tent,_marker,_data]];
_ghst_respawntent_data pushback [_tent,_marker,_data];
ghst_respawntent_pdata = [_tent,_marker,_data];//for players tracking
missionnamespace setVariable ["ghst_respawntent_data", _ghst_respawntent_data, true];

player setVariable ["ghst_respawntent", Time + _delay];