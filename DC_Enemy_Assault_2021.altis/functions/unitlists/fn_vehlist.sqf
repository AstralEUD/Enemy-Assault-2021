_namelist = [];
_namelist2 = [];

_tankList = [];
_carList = [];
_staticList = [];
_artyList = [];
_aaList = [];

_ttankList = [];
_tcarList = [];
_tartyList = [];
_taaList = [];

_itankList = [];
_icarList = [];
_istaticList = [];

_ltankList = [];
_lcarList = [];
_lstaticList = [];

_vehcivList = [];
_aircivList = [];

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

		if ((_wvehclass == "Armored") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_tankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Car") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_carList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Static") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_staticList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "O_MBT_02_arty_F") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist2) then {
				_artyList pushback _wCName;
				_namelist2 pushback _wCName;
			};		
		};
		if ((_wCName iskindof "O_APC_Tracked_02_AA_F") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist2) then {
				_aaList pushback _wCName;
				_namelist2 pushback _wCName;
			};		
		};
		if ((_wvehclass == "Armored") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_ttankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Car") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_tcarList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "O_T_MBT_02_arty_ghex_F") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist2) then {
				_tartyList pushback _wCName;
				_namelist2 pushback _wCName;
			};		
		};
		if ((_wCName iskindof "O_T_APC_Tracked_02_AA_ghex_F") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist2) then {
				_taaList pushback _wCName;
				_namelist2 pushback _wCName;
			};		
		};
		if ((_wvehclass == "Armored") && (_wfaction == "IND_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_itankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Car") && (_wfaction == "IND_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_icarList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Static") && (_wfaction == "IND_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_istaticList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Armored") && (_wfaction == "IND_E_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_ltankList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Car") && (_wfaction == "IND_E_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_lcarList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wvehclass == "Static") && (_wfaction == "IND_E_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_lstaticList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "Car_F") && !(_wCName iskindof "Kart_01_Base_F") && (_wfaction == "CIV_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_vehcivList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "C_Heli_Light_01_civil_F") && (_wfaction == "CIV_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_aircivList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};	
	};
};
//{diag_log _x} foreach [_tankList,_carList,_staticList,_artyList,_aaList,_ttankList,_tcarList,_tartyList,_taaList,_itankList,_icarList,_istaticList,_vehcivList,_aircivList];

ghst_tankList = _tankList;
ghst_ocarList = _carList;
ghst_staticList = _staticList;
ghst_artyList = _artyList;
ghst_aaList = _aaList;

ghst_ttankList = _ttankList;
ghst_tcarList = _tcarList;
ghst_tartyList = _tartyList;
ghst_taaList = _taaList;

ghst_itankList = _itankList;
ghst_icarList = _icarList;
ghst_istaticList = _istaticList;

ghst_ltankList = _ltankList;
ghst_lcarList = _lcarList;
ghst_lstaticList = _lstaticList;

ghst_civvehList = _vehcivList;
ghst_aircivList = _aircivList;

hint "vehicle list ready";