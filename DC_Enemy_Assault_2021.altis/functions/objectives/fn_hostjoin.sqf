/*
V1.3.2 Script by: Ghost put this in POW init: this setCaptive true; this setBehaviour "Careless"; [[_pow,["<t size='1.5' shadow='2' color='#2EFEF7'>Rescue Hostage</t>", "call ghst_fnc_hostjoin", [], 6, true, true, "","(alive _target)"]],"ghst_fnc_addaction",true,true] spawn BIS_fnc_MP;
*/
private ["_host","_caller","_id"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;

if (not alive _host) exitwith {
hint "Unit Not Alive"; 
_host removeaction _id;
};

[_host] joinsilent (group _caller);
_caller groupchat format ["lets go %1, were getting you out of here", name _host];

_host enableAI "Move";
_host setBehaviour "AWARE";
//_host switchmove "";
[_host,""] remoteExec ["ghst_fnc_global_switchmove",0];

if !(isnil "AGM_Interaction_fnc_setCaptivityStatus") then {
	[_host, "AGM_Handcuffed", false] call AGM_Interaction_fnc_setCaptivityStatus;
} else {
	_host setCaptive false;
};
//_host unassignItem "G_Blindfold_01_white_F";
//_host removeItem "G_Blindfold_01_white_F";
_host unlinkItem "G_Blindfold_01_white_F";
_host setVariable ["notrescued", false, true];
_host domove (position _caller);

//_host removeaction _id;
removeAllActions _host;

[playableunits,5000,100] remoteExec ["ghst_fnc_addscore"];