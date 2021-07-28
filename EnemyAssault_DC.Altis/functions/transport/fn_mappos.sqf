/*
V2 By: Ghost - Sends mapclick request to user requesting transport move to destination then executes on server
ghst_dest_transport = [_air1,["<t size='1.5' shadow='2' color='#00FF00'>Helicopter Destination</t>", "call ghst_fnc_mappos", [_air1,_flyheight,_escortgrp,_pname], 5, false, true, "","alive _target"]] remoteExec ["addAction"]; 
*/

private ["_pos"];
_args = _this select 3;
_air1 = _args select 0;
_flyheight = _args select 1;
_escortgrp = _args select 2;
_pname = _args select 3;//player that called it

openMap true;

hint "Left click on the map where you want to go";

mapclick = false;

onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";

waituntil {mapclick or !(visiblemap)};

	if !(visibleMap) exitwith {
		hint "New destination request cancelled";
	};
	
_pos = [clickpos select 0, clickpos select 1, (getposatl player) select 2];

sleep 1;

openMap false;

[_pos,_air1,_flyheight,_escortgrp,_pname] remoteExec ["ghst_fnc_dest_transport",2];