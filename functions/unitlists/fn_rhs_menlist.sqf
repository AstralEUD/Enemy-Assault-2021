_namelist = [];

_mfloralist = [];
_floraList = [];
_emrdesList = [];
_emrList = [];
_reconList = [];

_mfloradlist = [];
_floradList = [];
_emrdesdList = [];
_emrdList = [];

_rhsmencivList = [];

_rhsplist = [];

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

		if ((_wCName iskindof "Man") && (_wvehclass == "rhs_vehclass_infantry_emr") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "rhs_vdv_officer") && !(_wCName iskindof "rhs_vdv_officer_armored") && !(_wCName iskindof "rhs_vdv_driver") && !(_wCName iskindof "rhs_vdv_crew") && !(_wCName iskindof "rhs_vdv_armoredcrew") && !(_wCName iskindof "rhs_vdv_combatcrew") && !(_wCName iskindof "rhs_vdv_crew_commander") && !(_wCName iskindof "rhs_vdv_driver_armored")) then {
				_emrList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "rhs_vdv_rifleman") then {
				{_emrList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && ((_wCName iskindof "rhs_vdv_crew") or (_wCName iskindof "rhs_vdv_driver_armored"))) then {
				_emrdList pushback _wCName;
				_namelist pushback _wCName;
			};			
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "rhs_vehclass_infantry_emr_des") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "rhs_vdv_des_officer") && !(_wCName iskindof "rhs_vdv_des_officer_armored") && !(_wCName iskindof "rhs_vdv_des_driver") && !(_wCName iskindof "rhs_vdv_des_crew") && !(_wCName iskindof "rhs_vdv_des_armoredcrew") && !(_wCName iskindof "rhs_vdv_des_combatcrew") && !(_wCName iskindof "rhs_vdv_des_crew_commander") && !(_wCName iskindof "rhs_vdv_des_driver_armored")) then {
				_emrdesList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "rhs_vdv_des_rifleman") then {
				{_emrdesList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && ((_wCName iskindof "rhs_vdv_des_crew") or (_wCName iskindof "rhs_vdv_des_driver_armored"))) then {
				_emrdesdList pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "rhs_vehclass_infantry_flora") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "rhs_vdv_flora_officer") && !(_wCName iskindof "rhs_vdv_flora_officer_armored") && !(_wCName iskindof "rhs_vdv_flora_driver") && !(_wCName iskindof "rhs_vdv_flora_crew") && !(_wCName iskindof "rhs_vdv_flora_armoredcrew") && !(_wCName iskindof "rhs_vdv_flora_combatcrew") && !(_wCName iskindof "rhs_vdv_flora_crew_commander") && !(_wCName iskindof "rhs_vdv_flora_driver_armored")) then {
				_floraList pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "rhs_vdv_flora_rifleman") then {
				{_floraList pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && ((_wCName iskindof "rhs_vdv_flora_crew") or (_wCName iskindof "rhs_vdv_flora_driver_armored"))) then {
				_floradList pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "rhs_vehclass_infantry_mflora") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "rhs_vdv_mflora_officer") && !(_wCName iskindof "rhs_vdv_mflora_officer_armored") && !(_wCName iskindof "rhs_vdv_mflora_driver") && !(_wCName iskindof "rhs_vdv_mflora_crew") && !(_wCName iskindof "rhs_vdv_mflora_armoredcrew") && !(_wCName iskindof "rhs_vdv_mflora_combatcrew") && !(_wCName iskindof "rhs_vdv_mflora_crew_commander") && !(_wCName iskindof "rhs_vdv_mflora_driver_armored")) then {
				_mfloralist pushback _wCName;
				_namelist pushback _wCName;
			};
			if (_wCName iskindof "rhs_vdv_mflora_rifleman") then {
				{_mfloralist pushback _wCName;} foreach [1,2,3,4,5,6];
			};
			if (!(_wCName in _namelist) && ((_wCName iskindof "rhs_vdv_mflora_crew") or (_wCName iskindof "rhs_vdv_mflora_driver_armored"))) then {
				_mfloradList pushback _wCName;
				_namelist pushback _wCName;
			};			
		};
		if ((_wCName iskindof "Man") && (_wvehclass == "rhs_vehclass_infantry_recon") && (_wfaction == "rhs_faction_vdv") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "rhs_vdv_recon_officer") && !(_wCName iskindof "rhs_vdv_recon_officer_armored")) then {
				_reconList pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "rhs_pilot_base") && (_wvehclass == "rhs_vehclass_infantry_flora") && (_wfaction == "rhs_faction_vvs") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if !(_wCName in _namelist) then {
				_rhsplist pushback _wCName;
				_namelist pushback _wCName;
			};
		};
		if ((_wCName iskindof "Man") && (_wfaction == "CIV_F") && (_wDName!="") && (_wModel!="") && (_wscope==2)) then {

			if (!(_wCName in _namelist) && !(_wCName iskindof "C_Protagonist_VR_F") && !(_wCName iskindof "C_Soldier_VR_F")) then {
				_rhsmencivList pushback _wCName;
				_namelist pushback _wCName;
			};
		};	
	};
};
hint "";

//{diag_log _x} foreach [_mfloralist,_floraList,_emrdesList,_emrList,_reconList,_mfloradlist,_floradList,_emrdesdList,_emrdList,_rhsplist,_rhsmencivList];

ghst_mfloralist = _mfloralist;
ghst_floraList = _floraList;
ghst_emrdesList = _emrdesList;
ghst_emrList = _emrList;
ghst_reconList = _reconList;

ghst_mfloradlist = _mfloradlist;
ghst_floradList = _floradList;
ghst_emrdesdList = _emrdesdList;
ghst_emrdList = _emrdList;
ghst_recondList = _mfloradList;

ghst_rhsmencivList = _rhsmencivList;

ghst_rhspList = _rhspList;

hint "Men list ready";