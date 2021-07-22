disableSerialization;
waitUntil{!isnull (findDisplay 456963);};
_ctrl = (finddisplay 456963) displayCtrl (2803);
_enable = cbChecked _ctrl;
_veh = zlo_VehicleClass;
_typeVeh = typeOf _veh;
_ctrl = _this select 0;
_indxMirror = _this Select 1;
if(_enable isEqualTo true)then
{
	_allPylonsNames = (configProperties [configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
	_countMirrorsPylon = 0;
	_mirrorPos = [];
	{
		if(getNumber (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons">> _x >> "mirroredMissilePos") != 0)then
		{ _countMirrorsPylon = _countMirrorsPylon + 1};
		_mirrorPos pushBack (getNumber (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons">> _x >> "mirroredMissilePos"));
	}forEach _allPylonsNames;
	//i = 5;
	_i = 0;
	_idcM = (2100);
	_SelPylon = ctrlIDC _ctrl -_idcM;//+10 = 2011
	{
		if!(_x isEqualTo 0)then
		{	if( _x isEqualTo _SelPylon)then
			{
				_ctrl = (findDisplay 456963) displayCtrl(2101+_i);
				_ctrl lbSetCurSel _indxMirror;
				_ctrl ctrlCommit 0;
			}
		};
		_i = _i + 1;
	}foreach _mirrorPos;
};
//start indx at 2101 finish at 2114
/*
2101#1
2102#2
2103#3
2104#4
2105#5
2106#6
2107#7
2108#8
2109#9
2110#10
2111#11
2112#12
2113#13
2114#14
*/