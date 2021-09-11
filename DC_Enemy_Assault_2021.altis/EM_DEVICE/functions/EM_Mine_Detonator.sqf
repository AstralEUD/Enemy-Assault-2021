[player] remoteExec["EM_Beep", (player nearEntities 15)];
_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
{	
	_f=0;
	if (typeOf _x in EM_Mines_Mines) then {_f=431};
	if (typeOf _x in EM_Mines_Remote) then {_f=433};
	if (typeOf _x in EM_Mines_IED) then {_f=435};
	if (typeOf _x in EM_Mines_IEDs) then {_f=435};
	_fmin=missionNamespace getVariable["#EM_SelMin",0];
	_fmax=missionNamespace getVariable["#EM_SelMax",0];
	_targetDir = vectorNormalized((eyePos player)vectorFromTo(getPosASL _x));
	_distance = player distance _x;
	_cosine = (_weaponDir vectorDotProduct _targetDir);
	_signalPower = ([ _distance, EM_Power_Mine, _cosine ] call EM_CalcPower);
	if ((_signalPower call EM_Log) > -40)then{
		if(_f>_fmin && _f<_fmax) then {
			_x setDamage 1
		};
	};
}forEach allMines;	
