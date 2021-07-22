//V1 By: Ghost - creates simple task to exfil and publicvariable finish
//if (!isserver) exitwith {};
private ["_campmark","_rnum","_tsk","_trig1cond","_trig1act","_trg1"];

_campmark = _this select 0;//position for base pos

//create random number
_rnum = str(round (random 999));
//create task
_tsk = "exfiltsk" + _rnum;
Ghst_Current_tasks pushback _tsk;

[true,[_tsk],["Move back to base for EXFIL.","EXFIL","EXFIL"],_campmark,0,2,true,"exit"] call BIS_fnc_taskCreate;
//create trigger for exfil point
_trig1cond = "this and ({_x in thisList} count playableUnits == {alive _x} count playableUnits)";
_trig1act = format ["deleteVehicle thistrigger; ['%1','succeeded'] call BIS_fnc_taskSetState; finish = true; publicvariable 'finish';", _tsk];
_trg1 = createTrigger["EmptyDetector", _campmark];
_trg1 setTriggerArea[25,25,0,false];
_trg1 setTriggerActivation["WEST","PRESENT",true];
_trg1 setTriggerTimeout[5,5,5,true];
_trg1 setTriggerStatements[_trig1cond, _trig1act,""];