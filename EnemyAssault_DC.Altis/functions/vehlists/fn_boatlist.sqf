_boatList = [];

_boatCN = [
			"C_Scooter_Transport_01_F",
			"C_Boat_Civil_01_police_F",
			"I_C_Boat_Transport_02_F",
			"B_Boat_Transport_01_F",
			"B_Boat_Armed_01_minigun_F",
			"B_SDV_01_F"
			];
			
_boxCN = [
			"B_supplyCrate_F",
			"FlexibleTank_01_sand_F",
			"Box_NATO_AmmoVeh_F",
			"Box_IND_AmmoVeh_F",
			"Box_East_AmmoVeh_F",
			"B_Slingload_01_Cargo_F",
			"B_Slingload_01_Ammo_F",
			"B_Slingload_01_Medevac_F",
			"B_Slingload_01_Fuel_F",
			"B_Slingload_01_Repair_F"
			];

for "_i" from 0 to (count _boatCN)-1 do {
	_wCName = _boatCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  getText(configFile >> "cfgvehicles" >> _wCName >> "picture");
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_boatList pushback [_wCName,_wDName,_wPic,_wDesc];
};

for "_i" from 0 to (count _boxCN)-1 do {
	_wCName = _boxCN select _i;
	_wDName = getText(configFile >> "cfgvehicles" >> _wCName >> "displayName");
	_wPic =  "";
	_wDesc = getText(configFile >> "cfgvehicles" >> _wCName >> "Library" >> "libTextDesc");

	_boatList pushback [_wCName,_wDName,_wPic,_wDesc];
};

ghst_boatlist = _boatList;

hint "boatlist list ready";