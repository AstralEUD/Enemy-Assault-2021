_infantrylist = [];
_namelist = [];

_cfgvehicles = configFile >> "cfgvehicles";

for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_wCName = configName(_vehicle);
		_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
		_wModel = getText(configFile >> "cfgvehicles" >> _wCName >> "model");
		_wType = getNumber(configFile >> "cfgvehicles" >> _wCName >> "type");
		_wside = getnumber(configFile >> "cfgvehicles" >> _wCName >> "side");
		_wscope = getnumber(configFile >> "cfgvehicles" >> _wCName >> "scope");
		_wfaction = getText(configFile >> "cfgvehicles" >> _wCName >> "faction");
		_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
		_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");	

		if (((_wCName iskindof "B_Soldier_F") or (_wCName iskindof "B_Pilot_F") or (_wCName iskindof "B_helicrew_F") or (_wCName iskindof "B_crew_F")) && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "BLU_G_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F"))) then {
			if !(_wDName in _namelist) then {
				_infantrylist pushback _wCName;
				_namelist pushback _wDName;
			};
		};
	};
};
hint "";
_namelist=nil;

ghst_inflist = _infantrylist;

hint "infantry list ready";