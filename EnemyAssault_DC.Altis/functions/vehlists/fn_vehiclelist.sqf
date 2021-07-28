_vehicleList = [];
_carList = [];
_armorList = [];
_staticList = [];
_ugvList = [];

_carCN = [
			"B_Quadbike_01_F",
			"B_LSV_01_unarmed_F",
			"B_LSV_01_armed_F",
			"B_LSV_01_AT_F",
			"O_LSV_02_armed_F",
			"I_G_Offroad_01_F",
			"I_G_Offroad_01_AT_F",
			"I_G_Offroad_01_armed_F",
			"I_G_Van_02_transport_F",
			"B_MRAP_01_F",
			"B_MRAP_01_hmg_F",
			"B_MRAP_01_gmg_F",
			"O_MRAP_02_hmg_F",
			"I_MRAP_03_hmg_F",
			"I_MRAP_03_gmg_F",
			"B_Truck_01_transport_F",
			"B_Truck_01_fuel_F",
			"B_Truck_01_medical_F",
			"B_Truck_01_Repair_F",
			"B_Truck_01_ammo_F",
			"B_Truck_01_flatbed_F",
			"B_UGV_01_rcws_F",
			"B_UGV_01_F"
			];
			
_armorCN = [
			"B_APC_Wheeled_01_cannon_F",
			"B_AFV_Wheeled_01_up_cannon_F",
			"B_APC_Tracked_01_rcws_F",
			"O_APC_Wheeled_02_rcws_v2_F",
			"O_APC_Tracked_02_cannon_F",
			"I_APC_Wheeled_03_cannon_F",
			"I_APC_tracked_03_cannon_F",
			"B_MBT_01_TUSK_F",
			"O_MBT_02_cannon_F",
			"O_MBT_04_command_F",
			"I_MBT_03_cannon_F",
			"I_LT_01_AT_F",
			"I_LT_01_cannon_F",
			"B_APC_Tracked_01_CRV_F",
			"B_APC_Tracked_01_AA_F",
			"I_LT_01_AA_F",
			"I_LT_01_scout_F"
			];
			
_staticCN = [
			"B_HMG_01_high_F",
			"B_GMG_01_high_F",
			"B_static_AA_F",
			"B_static_AT_F",
			"B_Mortar_01_F",
			"B_Radar_System_01_F",
			"B_SAM_System_03_F"
			];
						
_ugvCN = [
			"B_UGV_01_rcws_F",
			"B_UGV_01_F",
			"B_UGV_02_Demining_F"
			];
			
for "_i" from 0 to (count _carCN)-1 do {
	_wCName = _carCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_carList pushback [_wCName,_wDName,_wPic,_wDesc];
	_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
};

for "_i" from 0 to (count _armorCN)-1 do {
	_wCName = _armorCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_armorList pushback [_wCName,_wDName,_wPic,_wDesc];
	_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
};

for "_i" from 0 to (count _staticCN)-1 do {
	_wCName = _staticCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_staticList pushback [_wCName,_wDName,_wPic,_wDesc];
	_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
};

for "_i" from 0 to (count _ugvCN)-1 do {
	_wCName = _ugvCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_ugvList pushback _wCName;
	_vehicleList pushback [_wCName,_wDName,_wPic,_wDesc];
};

ghst_vehiclelist = _vehicleList;
ghst_carlist = _carList;		//used by Spawn Car (function\dlg\fn_spawnveh.sqf)
ghst_armorlist = _armorlist;	//used by Spawn Armor (function\dlg\fn_spawnveh.sqf)
ghst_staticvehlist = _staticlist;	//used by Spawn Static (function\dlg\fn_spawnveh.sqf)
ghst_ugvList = _ugvList;	// not used to vehicle spawn, just used commSupp system

hint "vehicle list ready";