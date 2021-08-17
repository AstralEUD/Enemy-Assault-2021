waitUntil {count AST_limitedItems > 0};

private _configClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "CfgWeapons");
private _vehClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "CfgVehicles");
private _faceClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "cfgGlasses");

private _weapons = [];
private _vehicles =[];
private _glasses =[];

{
	if !(configName _x in AST_limitedItems) then
	{
		_weapons pushBack (configName _x);
	};
} forEach _configClasses;
{
	if !(configName _x in AST_limitedItems) then
	{
		_vehicles pushBack (configName _x);
	};
} forEach _vehClasses;
{
	if !(configName _x in AST_limitedItems) then
	{
		_glasses pushBack (configName _x);
	};
} forEach _faceClasses;

[
	infostand,
	_weapons,
	TRUE,
	TRUE
] call BIS_fnc_addVirtualWeaponCargo;
[
	infostand,
	_vehicles,
	TRUE,
	TRUE
] call BIS_fnc_addVirtualBackpackCargo;
[
	infostand,
	_weapons,
	TRUE,
	TRUE
] call BIS_fnc_addVirtualItemCargo;
[
	infostand,
	_glasses,
	TRUE,
	TRUE
] call BIS_fnc_addVirtualItemCargo;
[
	infostand,
	_weapons,
	TRUE,
	TRUE
] call BIS_fnc_addVirtualMagazineCargo;

[] execVM "ast\arsenal\arsenal_limit.sqf";
//[] execVM "arsenal_Shop.sqf";