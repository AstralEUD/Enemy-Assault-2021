_vehicleList = [];
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

		if ((((_wCName iskindof "Ship_F") or (_wCName iskindof "Boat_F")) && ((_wside == 1) or (_wside == 2)) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F")) && (_wDName!="") && (_wModel!="") && (_wpic!="")) or (_wCName iskindof "C_Scooter_Transport_01_F")) then {
			/*
			if (_wfaction == "USMC") then {
				_wDName = _wDName + " USMC";
			};
			if (_wfaction == "BIS_US") then {
				_wDName = _wDName + " US ARMY";
			};
			if (_wCName iskindof "AH64D_Sidewinders") then {
				_wDName = _wDName + " Sidewinders";
			};
			*/
			if !(_wDName in _namelist) then {
				_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist pushback _wDName;
			};
		};
	};
	/*if (_i % 10==0) then {
		hintsilent format["Loading Vehicle List... (%1)",count _vehicleList];
		sleep .0001;
};*/
};
hint "";
_namelist=nil;

ghst_boatlist = _vehicleList;

//publicvariable "ghst_boatlist";

hint "boatlist list ready";
/*
for "_x" from 0 to (count _vehiclelist)-1 do {

diag_log format ["%1",_vehicleList select _x];

};
*/