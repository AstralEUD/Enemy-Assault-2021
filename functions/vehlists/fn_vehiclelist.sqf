_vehicleList = [];
_namelist = [];
_carList = [];
_namelist2 = [];
_armorList = [];
_namelist3 = [];
_staticList = [];
_namelist4 = [];
_ugvList = [];
_namelist5 = [];
//_unitList = [];

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
/*
		if ((((_wCName iskindof "Tank_F") or (_wCName iskindof "StaticWeapon") or (_wCName iskindof "Car_F") or (_wCName iskindof "motorcycle")) && !(_wCName iskindof "Papercar") && !(_wCName iskindof "UGV_01_base_F") && !(_wCName iskindof "UGV_02_base_F") && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "BLU_G_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F")) && (_wDName!="") && (_wModel!="")  && (_wpic!="")) or (_wCName iskindof "C_Offroad_02_unarmed_F")) then {
		
			if (_wfaction == "BLU_T_F") then {
				_wDName = _wDName + " Olive";
			};
			if (_wfaction == "BLU_F") then {
				_wDName = _wDName + " Sand";
			};
			
			if !(_wDName in _namelist) then {
				_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist pushback _wDName;
			};
		};
*/
		if ((_wCName iskindof "Tank_F") && !(_wCName iskindof "Papercar") && !(_wCName iskindof "UGV_01_base_F") && !(_wCName iskindof "UGV_02_base_F") && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or(_wfaction == "BLU_G_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F")) && (_wDName!="") && (_wModel!="")  && (_wpic!="")) then {
		
			if (_wfaction == "BLU_T_F") then {
				_wDName = _wDName + " Olive";
			};
			if (_wfaction == "BLU_F") then {
				_wDName = _wDName + " Sand";
			};
			
			if !(_wDName in _namelist2) then {
				_armorlist pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist2 pushback _wDName;
			};
		};
		//Add AWC Nyx
		if ((_wCName iskindof "LT_01_base_F") && !(_wCName iskindof "Papercar") && !(_wCName iskindof "UGV_01_base_F") && !(_wCName iskindof "UGV_02_base_F") && (_wscope == 2) && (_wDName!="") && (_wModel!="")  && (_wpic!="")) then {
		
			if !(_wDName in _namelist2) then {
				_armorlist pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist2 pushback _wDName;
			};
		};
		
		if (((_wCName iskindof "Car_F") or (_wCName iskindof "motorcycle")) && !(_wCName iskindof "Papercar") && !(_wCName iskindof "UGV_01_base_F") && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or(_wfaction == "BLU_G_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F")) && (_wDName!="") && (_wModel!="")  && (_wpic!="")) then {
		
			if (_wfaction == "BLU_T_F") then {
				_wDName = _wDName + " Olive";
			};
			if (_wfaction == "BLU_F") then {
				_wDName = _wDName + " Sand";
			};
			
			if !(_wDName in _namelist3) then {
				_carList pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist3 pushback _wDName;
			};
		};
		
		if ((_wCName iskindof "StaticWeapon") && !(_wCName iskindof "Papercar") && !(_wCName iskindof "UGV_01_base_F") && !(_wCName iskindof "B_SAM_System_02_F") && !(_wCName iskindof "B_SAM_System_01_F") && !(_wCName iskindof "SAM_System_03_base_F") && !(_wCName iskindof "B_AAA_System_01_F") && !(_wCName iskindof "Radar_System_01_base_F") && !(_wCName iskindof "B_Ship_MRLS_01_base_F") && !(_wCName iskindof "B_Ship_Gun_01_base_F") && (_wside == 1) && (_wscope == 2) && ((_wfaction == "BLU_F") or (_wfaction == "BLU_G_F") or (_wfaction == "BLU_CTRG_F") or (_wfaction == "BLU_T_F")) && (_wDName!="") && (_wModel!="")  && (_wpic!="")) then {
		
			if (_wfaction == "BLU_T_F") then {
				_wDName = _wDName + " Olive";
			};
			if (_wfaction == "BLU_F") then {
				_wDName = _wDName + " Sand";
			};
			
			if !(_wDName in _namelist4) then {
				_staticlist pushback [_wCName,_wDName,_wPic,_wDesc];
				_namelist4 pushback _wDName;
			};
		};
		//UGV List
		if (((_wCName iskindof "UGV_01_base_F") or (_wCName iskindof "UGV_02_Base_F")) && !(_wCName iskindof "CruiseMissile2") && (_wModel!="") && (_wside == 1)) then {
			if !(_wDName in _namelist5) then {
				_ugvList pushback _wCName;
				_namelist5 pushback _wDName;
			};
		};
	};
	/*if (_i % 10==0) then {
		hintsilent format["Loading Vehicle List... (%1)",count _vehicleList];
		sleep .0001;
};*/
};
hint "";
//adding custom ammobox for mortar rounds
//_vehicleList = _vehicleList + [["USOrdnanceBox_EP1","Mortar Ammo Box","","Box holds 50 Mortar Rounds"]];

//ghst_unitlist = _unitList;
//diag_log ghst_unitlist;
//ghst_vehiclelist = _vehicleList;
ghst_carlist = _carList;
ghst_armorlist = _armorlist;
ghst_staticvehlist = _staticlist;
ghst_ugvList = _ugvList;

//publicvariable "ghst_vehiclelist";

hint "vehicle list ready";