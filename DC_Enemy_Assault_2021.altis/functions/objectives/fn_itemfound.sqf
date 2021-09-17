//removes addaction and deletes object and sets task to complete
//[_intelobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Grab Intel</t>", "call ghst_fnc_itemfound", _tsk, 6, true, true, "(_target getVariable 'notfound')",""]] remoteExec ["ghst_fnc_addaction",0,true];
private ["_host","_caller","_id","_tsk"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_tsk = _this select 3;

_host removeaction _id;

[_tsk] remoteExec ["ghst_fnc_tsk_complete"];

_host setVariable ["notfound", false, true];

//_caller sidechat "I found intel";
["I found the intel", _caller] remoteExec ["ghst_fnc_global_sidechat"];

_callerpos = getPosATL _caller;
[_callerpos, 20] remoteExecCall ["ast_fnc_missionReward",0];

[playableunits,5000,100] remoteExec ["ghst_fnc_addscore"];

deletevehicle _host;