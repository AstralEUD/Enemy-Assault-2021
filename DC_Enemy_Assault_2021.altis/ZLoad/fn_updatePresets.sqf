disableSerialization;
waitUntil{!isnull (findDisplay 456963);};
_veh = zlo_VehicleClass;
_typeVeh = (typeOf _veh);


_presetsCFG = "true" configClasses (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "presets");
_allPylonsNames = (configProperties [configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
_i = 0;
_curSel = _this select 1;
_presetsMags = getArray(configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "presets" >> configName (_presetsCFG select _curSel) >> "attachment");

while{_i < count _allPylonsNames} do
	{
		_avaiableMags = _veh getCompatiblePylonMagazines _i+1;
		_ctrl = (findDisplay 456963) displayCtrl (_i+2101);
		_c = 1;
		{
			if((count _presetsMags) > 0)then
			{
				if!((_presetsMags select _i)isEqualTo "")then
				{
						if((_presetsMags select _i) isEqualTo _x) then
					{
						_ctrl lbSetCurSel _c;
					};
				};
				if((_presetsMags select _i)isEqualTo "")then{
					_ctrl lbSetCurSel 0;
				};
			};
			if((count _presetsMags) == 0)then
			{
				_ctrl lbSetCurSel 0;
			};
			_c = _c + 1;
		}forEach _avaiableMags;
		_i = _i + 1;
	};