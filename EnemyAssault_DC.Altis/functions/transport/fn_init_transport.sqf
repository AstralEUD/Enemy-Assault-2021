/*
V2 By: Ghost - creates helicopter to pickup caller
ghst_transport = ["typeofhelicopter","typeofhelicopter for escort in array []","spawn pos",50 alt, 30 min delay] spawn ghst_fnc_init_transport;
*/

private ["_pos"];
_airtype = _this select 0;//transport type
_escortarray = _this select 1;//escort type array
_spawnmark = _this select 2;//spawning location
_flyheight = _this select 3;//fly height
_delay = (_this select 4) * 60;// time before Transport can be called again

_timedelay = (player getVariable "ghst_transport");
if (Time < _timedelay) exitwith {hint format ["Transport Helicopter will be available in %1",((_timedelay - Time) call ghst_fnc_timer)];};

private ["_lzpad","_lzpad2","_lzpad_mark","_lzpad2_mark","_wpgetout","_destact","_destrtb"];

openMap true;

hint "Left click on the map where you want pick up";

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};
if (!visibleMap) exitwith {
	hint "Helicopter Transport Ready";
	};
	
_pos = [clickpos select 0, clickpos select 1, (getposatl player) select 2];
/*
_pos = _clickpos findEmptyPosition[ 10 , 100 , _airtype ];
if (count _pos < 2) then {
_pos = clickpos;
};
*/
sleep 1;

openMap false;
if (surfaceiswater _pos) exitwith {hint "Helicopter cannot land in water";};

player setVariable ["ghst_transport", Time + _delay];

[_spawnmark,_pos,_airtype,_flyheight,_escortarray,player] remoteExec ["ghst_fnc_transportserver",2];