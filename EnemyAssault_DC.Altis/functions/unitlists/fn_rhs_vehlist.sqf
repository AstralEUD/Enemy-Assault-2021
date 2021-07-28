_namelist = [];
_namelist2 = [];

_rhstankList = [];
_rhscarList = [];
_rhsstaticList = [];
_rhsartyList = [];
_rhsaaList = [];
_rhsaheloList = [];
_rhstheloList = [];
_rhsplaneList = [];

_rhsvehcivList = [];
_rhsaircivList = [];

_cfgvehicles = configFile >> "cfgvehicles";

for "_i" from 0 to (count _cfgvehicles)-1 do {
	_vehicle = _cfgvehicles select _i;
	if (isClass _vehicle) then {
		_wCName = configName(_vehicle);
		_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
		_wModel = getText(configFile >> "cfgvehicles" >> _wCName >> "model");
		_wside = getnumber(configFile >> "cfgvehicles" >> _wCName >> "side");
		_wscope = getnumber(configFile >> "cfgvehicles" >> _wCName >> "scope");
		_wvehclass = getText(configFile >> "cfgvehicles" >> _wCName >> "vehicleClass");
		_wfaction = getText(configFile >> "cfgvehicles" >> _wCName >> "faction");
		_wcrew = getnumber(configFile >> "cfgvehicles" >> _wCName >> "transportSoldier");

		if ((_wvehclass == "rhs_vehclass_tank") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhstankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_apc") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhstankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_ifv") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhstankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Armored") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhstankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_car") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2) && (_wcrew > 3)) then {

			if !(_wCName in _namelist) then {
				_rhscarList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_truck") && !(_wCName iskindof "RHS_Ural_MSV_Base") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2) && (_wcrew > 3)) then {

			if !(_wCName in _namelist) then {
				_rhscarList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Armored") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhscarList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Static") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsstaticList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_artillery") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsartyList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "RHS_Mi24_base") && (_wvehclass == "rhs_vehclass_helicopter") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsaheloList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "RHS_Mi8_base") && (_wvehclass == "rhs_vehclass_helicopter") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhstheloList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_tank") && (_wfaction == "rhs_faction_tv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhstankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_artillery") && (_wfaction == "rhs_faction_tv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsartyList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_artillery") && (_wfaction == "rhs_faction_rva") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsartyList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if (((_wCName iskindof "RHS_Ural_Zu23_Base") or (_wCName iskindof "rhs_gaz66_zu23_base")) && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist2) then {
				_rhsaaList pushback _wCName;
				_namelist2 pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_aa") && (_wfaction == "rhs_faction_vpvo") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsaaList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_aircraft") && (_wfaction == "rhs_faction_vvs") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsplaneList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "rhs_vehclass_aircraft") && (_wfaction == "rhs_faction_vvs_c") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsplaneList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};	
		if (((_wvehclass == "rhs_vehclass_truck") or (_wCName iskindof "Car_F")) && !(_wCName iskindof "Kart_01_Base_F") && (_wfaction == "CIV_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsvehcivList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Air") && !(_wCName iskindof "Plane_Civil_01_base_F") && (_wfaction == "CIV_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsaircivList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};		
	};
};

//{diag_log _x} foreach [_rhstankList,_rhscarList,_rhsstaticList,_rhsartyList,_rhsaaList,_rhsaheloList,_rhstheloList,_rhsplaneList,_rhsvehcivList,_rhsaircivList];

ghst_rhstankList = _rhstankList;
ghst_rhscarList = _rhscarList;
ghst_rhsstaticList = _rhsstaticList;
ghst_rhsartyList = _rhsartyList;
ghst_rhsaaList = _rhsaaList;
ghst_rhsaheloList = _rhsaheloList;
ghst_rhstheloList = _rhstheloList;
ghst_rhsplaneList = _rhsplaneList;

ghst_rhsvehcivList = _rhsvehcivList;
ghst_rhsaircivList = _rhsaircivList;

hint "vehicle list ready";