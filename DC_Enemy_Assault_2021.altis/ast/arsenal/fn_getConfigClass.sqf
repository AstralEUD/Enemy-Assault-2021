params [
	["_configName", "", [""]]
];

call {
	if (isClass (configFile >> "CfgWeapons" >> _configName)) exitWith {configFile >> "CfgWeapons" >> _this};
	if (isClass (configFile >> "CfgMagazines" >> _configName)) exitWith {configFile >> "CfgMagazines" >> _this};
	if (isClass (configFile >> "CfgGlasses" >> _configName)) exitWith {configFile >> "CfgGlasses" >> _this};
	if (isClass (configFile >> "CfgVehicles" >> _configName)) exitWith {configFile >> "CfgVehicles" >> _this};
	configNull
};