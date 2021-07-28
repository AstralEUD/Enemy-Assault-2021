_vehicleList = [];
_uavList = [];
_helolist = [];
_namelist = [];
_namelist2 = [];
_namelist3 = [];

_cfgvehicles = configFile >> "cfgvehicles";

_PARAM_FIRAIR = "PARAM_FIRAIR" call BIS_fnc_getParamValue;

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

		if ((((_wCName iskindof "Helicopter_Base_F") or (_wCName iskindof "Plane_Base_F") or (_wCName iskindof "VTOL_01_base_F")) && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "rhs_faction_usarmy_wd") or (_wfaction == "rhs_faction_usarmy_d") or (_wfaction == "rhs_faction_usmc_wd") or (_wfaction == "rhs_faction_usmc_d") or (_wfaction == "rhs_faction_usaf") or (_wfaction == "rhs_faction_socom") or (_wfaction == "BLU_T_F")) && (_wDName!="") && !(_wCName iskindof "ParachuteBase") && !(_wCName iskindof "UAV_01_base_F") && !(_wCName iskindof "UAV_03_base_F") && !(_wCName iskindof "UAV_06_base_F") && (_wModel!="") && (_wpic!="")) or (_wCName iskindof "C_Plane_Civil_01_F")) then {
			/*
			if (_wfaction == "rhs_faction_usmc_d") then {
				_wDName = _wDName + " Desert";
			};
			if (_wfaction == "rhs_faction_usarmy_d") then {
				_wDName = _wDName + " Desert";
			};
			*/
			if !(_wDName in _namelist) then {
				_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist pushback _wDName;
			};
		};
		/*
		//Add Littlebirds
        if (((_wCName iskindof "B_Heli_Light_01_F") or (_wCName iskindof "B_Heli_Light_01_armed_F")) && !(_wCName iskindof "B_Heli_Light_01_stripped_F")) then {            
            if !(_wDName in _namelist) then {
				_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist pushback _wDName;
            };
        };*/
		/*
		//Add Huron Containers
		if ((_wCName iskindof "Slingload_01_Base_F") && !(_wCName == "Slingload_01_Base_F")) then {
			if !(_wDName in _namelist) then {
				_vehicleList = _vehicleList + [[_wCName,_wDName,"",_wDesc]];
				_namelist = _namelist + [_wDName];
			};
		};
		*/
		if (((_wCName iskindof "Helicopter_Base_F") or (_wCName iskindof "VTOL_01_base_F")) && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "rhs_faction_usarmy_wd") or (_wfaction == "rhs_faction_usarmy_d") or (_wfaction == "rhs_faction_usmc_wd") or (_wfaction == "rhs_faction_usmc_d") or (_wfaction == "rhs_faction_usaf") or (_wfaction == "rhs_faction_socom") or (_wfaction == "BLU_T_F")) && (_wDName!="") && !(_wCName iskindof "ParachuteBase") && !(_wCName iskindof "UAV_01_base_F") && !(_wCName iskindof "UAV_03_base_F") && !(_wCName iskindof "UAV_06_base_F") && !(_wCName iskindof "FIR_F16_Base") && (_wModel!="") && (_wpic!="")) then {
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
			if !(_wDName in _namelist3) then {
				_helolist pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist3 pushback _wDName;
			};
		};
		//Spawn F16 mod jet if selected
		if ((_PARAM_FIRAIR == 1) and ((_wCName == "FIR_F16C") or (_wCName == "FIR_F15C") or (_wCName == "FIR_F15D") or (_wCName == "FIR_F15E") or (_wCName == "FIR_F15K") or (_wCName == "FIR_A10A") or (_wCName == "FIR_A10C") or (_wCName == "FLAN_EA18G") or (_wCName == "FIR_AV8B") or (_wCName == "FIR_F22") or (_wCName == "FIR_F14D"))) then {
			if !(_wDName in _namelist) then {
				_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist pushback _wDName;
			};
		};
		//UAV List
		if (((_wCName iskindof "UAV_01_base_F") or (_wCName iskindof "UAV_02_base_F") or (_wCName iskindof "UAV_03_base_F") or (_wCName iskindof "UAV_05_base_F") or (_wCName iskindof "UAV_06_base_F")) && (_wModel!="") && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F"))) then {
			if !(_wDName in _namelist2) then {
				_uavList pushback _wCName;
				_namelist2 pushback _wDName;
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

ghst_helolist = _helolist;
ghst_aircraftlist = _vehicleList;
ghst_uavList = _uavList;

//publicvariable "ghst_aircraftlist";

hint "aircraft list ready";
/*
for "_x" from 0 to (count _vehiclelist)-1 do {

diag_log format ["%1",_vehicleList select _x];

};
*/