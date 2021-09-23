_namelist = [];

_oList = [];
_otList = [];
_oviperList = [];
_otviperList = [];
_oreconList = [];
_otreconList = [];
_ourbanList = [];
_iList = [];

// LDF
_lList = [];
_ldList = [];
_lplist = [];

_mencivList = [];

_odiverlist = [];
_otdiverlist = [];
_idiverlist = [];


_odList = [];
_otdList = [];
_idList = [];

_oplist = [];
_iplist = [];

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
		_wvehclass = getText(configFile >> "cfgvehicles" >> _wCName >> "vehicleClass");
		_wfaction = getText(configFile >> "cfgvehicles" >> _wCName >> "faction");

		if ((_wCName iskindof "Man") && (_wvehclass == "Men") && !(_wCName iskindof "O_Soldier_unarmed_F") && !(_wCName iskindof "O_Survivor_F") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "O_crew_F") && !(_wCName iskindof "O_Pilot_F") && !(_wCName iskindof "O_V_Soldier_base_F") && !(_wCName iskindof "O_Protagonist_VR_F") && !(_wCName iskindof "O_Soldier_VR_F")) then {
				_oList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "O_Soldier_F") then {
				{_oList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && (_wCName iskindof "O_crew_F")) then {
				_odList pushback _wCName;
				_namelist pushback _wCName;
			};			
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "Men") && !(_wCName iskindof "O_T_Soldier_unarmed_F") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "O_T_Crew_F") && !(_wCName iskindof "O_T_Pilot_F") && !(_wCName iskindof "O_V_Soldier_base_F") && !(_wCName iskindof "O_Protagonist_VR_F") && !(_wCName iskindof "O_Soldier_VR_F")) then {
				_otList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "O_T_Soldier_F") then {
				{_otList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && (_wCName iskindof "O_T_Crew_F")) then {
				_otdList pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "MenUrban") && !(_wCName iskindof "O_SoldierU_unarmed_F") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_ourbanList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "O_soldierU_F") then {
				{_ourbanList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "Men") && !(_wCName iskindof "I_Soldier_unarmed_F") && !(_wCName iskindof "I_Survivor_F") && (_wfaction == "IND_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "I_crew_F") && !(_wCName iskindof "I_Pilot_F") && !(_wCName iskindof "I_Protagonist_VR_F") && !(_wCName iskindof "I_Soldier_VR_F")) then {
				_iList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "I_Soldier_F") then {
				{_iList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && (_wCName iskindof "I_crew_F")) then {
				_idList pushback _wCName;
				_namelist pushback _wCName;
			};			
		};
		if ((_wCName isKindOf "Man") && (_wvehclass == "Men") && !(_wCName isKindOf "I_E_Scientist_Unarmed_F") && !(_wCName isKindOf "I_E_Survivor_F") && !(_wCName isKindOf "I_E_officer_Parade_f") && !(_wCName isKindOf "I_E_officer_Parade_veteran_F") && (_wfaction == "IND_E_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "I_E_Crew_F") && !(_wCName iskindof "I_E_Pilot_F")) then {
				_lList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName isKindOf "I_E_Soldier_F") then {
				{_lList pushBack _wCName;} forEach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && (_wCName isKindOf "I_E_Crew_F")) then {
				_ldList pushback _wCName;
				_namelist pushback _wCname;
			};
		};
		if ((_wCName iskindof "O_V_Soldier_base_F") && (_wvehclass == "Men") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_oviperList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "O_V_Soldier_base_F") && (_wvehclass == "Men") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_otviperList pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "O_Soldier_recon_base") && (_wvehclass == "MenRecon") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_oreconList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};
		if ((_wCName iskindof "O_T_Soldier_recon_base") && (_wvehclass == "MenRecon") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_otreconList pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "O_Pilot_F") && (_wvehclass == "Men") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_oplist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "I_Pilot_F") && (_wvehclass == "Men") && (_wfaction == "IND_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_iplist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "I_E_Pilot_F") && (_wvehclass == "Men") && (_wfaction == "IND_E_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_lplist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "O_T_Soldier_diver_base_F") && (_wvehclass == "MenDiver") && (_wfaction == "OPF_T_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_otdiverlist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "O_Soldier_diver_base_F") && (_wvehclass == "MenDiver") && (_wfaction == "OPF_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_odiverlist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "I_Soldier_diver_base_F") && (_wvehclass == "MenDiver") && (_wfaction == "IND_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_idiverlist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "Man") && (_wfaction == "CIV_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "C_Protagonist_VR_F") && !(_wCName iskindof "C_Soldier_VR_F")) then {
				_mencivList pushback _wCName;
				_namelist pushback _wCName;
			};		
		};	
	};
};
hint "";

//{diag_log _x} foreach [_oList,_otList,_oviperList,_otviperList,_oreconList,_otreconList,_ourbanList,_iList,_odiverlist,_otdiverlist,_idiverlist,_odList,_otdList,_idList,_oplist,_iplist,_mencivList];

ghst_oList = _oList;
ghst_otList = _otList;
ghst_oviperList = _oviperList;
ghst_otviperList = _otviperList;
ghst_oreconList = _oreconList;
ghst_otreconList = _otreconList;
ghst_ourbanList = _ourbanList;
ghst_iList = _iList;

ghst_lList = _lList;

ghst_mencivList = _mencivList;

ghst_odiverlist = _odiverlist;
ghst_otdiverlist = _otdiverlist;
ghst_idiverlist = _idiverlist;

ghst_odList = _odList;
ghst_otdList = _otdList;
ghst_idList = _idList;

ghst_lDlist = _ldList;

ghst_oplist = _oplist;
ghst_iplist = _iplist;

ghst_lplist = _lplist;

hint "Men list ready";