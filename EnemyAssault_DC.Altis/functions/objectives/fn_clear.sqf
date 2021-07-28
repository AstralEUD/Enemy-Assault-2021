//V1.1 By: Ghost - gives all clear when enemy units are less than 3
//if (!isserver) exitwith {};
private ["_position_mark","_radarray","_radx","_rady","_locselname","_side","_rnum","_tsk","_trig1act","_trg1"];

_position_mark = _this select 0;//position to search units around
_radarray = _this select 1;//radius around position to search for units
	_radx = ((_radarray select 0) + 300);//radius x
	_rady = ((_radarray select 1) + 300);//radius y
_locselname = _this select 2;//name of location	
_side = _this select 3;//side of enemy

//create random number
_rnum = str(round (random 999));
//create task
_tsk = "tsk_clear" + _rnum + str(_position_mark);
Ghst_Current_tasks pushback _tsk;

//create task
_tasktopic = format ["Clear %1", _locselname];
_taskdesc = format ["Eliminate all enemy presence around %1.", _locselname];

[true,[_tsk],[_taskdesc,_tasktopic,"Clear"],_position_mark,0,2,true,"Attack"] call BIS_fnc_taskCreate;

//sleep 60;

//create trigger for no enemy left
_trig1act = format ["deleteVehicle thistrigger; ['%1','succeeded'] call BIS_fnc_taskSetState; [playableunits,5000,100] remoteExec ['ghst_fnc_addscore']; {_x setdamage 1} foreach thislist;", _tsk];
_trg1 = createTrigger["EmptyDetector",_position_mark];
_trg1 setTriggerArea[_radx,_rady,0,false];
_trg1 setTriggerActivation[format ["%1", _side],"PRESENT",false];
_trg1 setTriggerStatements["count thislist < 6", _trig1act,""];