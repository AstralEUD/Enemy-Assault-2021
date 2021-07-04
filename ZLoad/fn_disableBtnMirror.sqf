disableSerialization;
waitUntil{!isnull (findDisplay 456963);};
_ctrl = (finddisplay 456963) displayCtrl (2803);
_ctrl cbSetChecked !(cbChecked _ctrl);

_veh = zlo_VehicleClass;
_typeVeh = typeOf _veh;
_allPylonsNames = (configProperties [configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
//10
_mirrorPos = [];
{
	_mirrorPos pushBack (getNumber (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons">> _x >> "mirroredMissilePos"));

}forEach _allPylonsNames;
_i = 0;
_ctCheckBox = (finddisplay 456963) displayCtrl (2803);
	i = 0;
	{
		_ctrl = (findDisplay 456963) displayCtrl (_i+2101);
		if(cbChecked _ctCheckBox)then{
			if(_x != 0)then{
				_ctrl ctrlEnable false;
			};
		};
		if!(cbChecked _ctCheckBox)then{
			if(_x != 0)then{
				_ctrl ctrlEnable true;
			};
		};
		_i = _i + 1;
	}forEach _mirrorPos;
