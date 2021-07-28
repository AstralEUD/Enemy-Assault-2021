_planeList = [];
_heliList = [];
_uavList = [];

_planeCN = [
			"B_Plane_CAS_01_dynamicLoadout_F",
			"B_Plane_Fighter_01_F",
			"B_Plane_Fighter_01_Stealth_F",
			"O_Plane_CAS_02_dynamicLoadout_F",
			"O_Plane_Fighter_02_F",
			"O_Plane_Fighter_02_Stealth_F",
			"I_Plane_Fighter_03_dynamicLoadout_F",
			"I_Plane_Fighter_04_F",
			"O_T_VTOL_02_vehicle_dynamicLoadout_F",
			"O_T_VTOL_02_infantry_dynamicLoadout_F",
			"B_T_VTOL_01_vehicle_F",
			"B_T_VTOL_01_armed_F",
			"B_T_VTOL_01_infantry_F",
			"B_UAV_02_dynamicLoadout_F",
			"B_UAV_05_F",
			"O_UAV_02_dynamicLoadout_F"
			];
			
_heliCN = [
			"B_Heli_Light_01_dynamicLoadout_F",
			"B_Heli_Light_01_F",
			"B_Heli_Attack_01_dynamicLoadout_F",
			"B_Heli_Transport_01_F",
			"B_Heli_Transport_03_F",
			"O_Heli_Transport_04_covered_F",
			"O_Heli_Attack_02_dynamicLoadout_F",
			"O_Heli_Light_02_dynamicLoadout_F",
			"O_Heli_Light_02_unarmed_F",
			"I_Heli_Transport_02_F",
			"I_Heli_light_03_unarmed_F",
			"I_Heli_light_03_dynamicLoadout_F",
			"O_Heli_Transport_04_repair_F",
			"O_Heli_Transport_04_ammo_F",
			"O_Heli_Transport_04_fuel_F",
			"B_T_UAV_03_dynamicLoadout_F"
			];
			
_uavCN = [
			"B_T_UAV_03_dynamicLoadout_F",
			"B_UAV_02_dynamicLoadout_F",
			"B_UAV_05_F",
			"B_UAV_06_medical_F",
			"B_UAV_01_F"
			];

for "_i" from 0 to (count _planeCN)-1 do {
	_wCName = _planeCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_planeList pushback [_wCName,_wDName,_wPic,_wDesc];
};

for "_i" from 0 to (count _heliCN)-1 do {
	_wCName = _heliCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_heliList pushback [_wCName,_wDName,_wPic,_wDesc];
};

for "_i" from 0 to (count _uavCN)-1 do {
	_wCName = _uavCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_uavList pushback _wCName;
};

ghst_helolist = _heliList;		//used by Spawn Helicopters(function\dlg\fn_spawnair.sqf)
ghst_aircraftlist = _planeList;	//used by Spawn Aircraft (function\dlg\fn_spawnair.sqf)
ghst_uavList = _uavList;		// not used vehicle spawn, just used commSupp system

hint "aircraft list ready";