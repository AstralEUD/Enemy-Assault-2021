waitUntil {CHECK_ARSENAL == true};
private _configClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "CfgWeapons");
private _vehClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "CfgVehicles");
private _faceClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "cfgGlasses");
private _magazineClasses = "(getNumber (_x >> 'scope') >= 2)" configClasses (configFile >> "cfgMagazines");

private _weapons = [];
private _vehicles =[];
private _glasses =[];
private _magazines =[];

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
{
	if !(configName _x in AST_limitedItems) then
	{
		_magazines pushBack (configName _x);
	};
} forEach _magazineClasses;

[
	AmmoBox01,
	_weapons,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualWeaponCargo;
[
	AmmoBox01,
	_vehicles,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualBackpackCargo;
[
	AmmoBox01,
	_weapons,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualItemCargo;
[
	AmmoBox01,
	_glasses,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualItemCargo;
[
	AmmoBox01,
	_weapons,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualMagazineCargo;
[
	AmmoBox01,
	_magazines,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualMagazineCargo;

// AmmoBox02

[
	AmmoBox02,
	_weapons,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualWeaponCargo;
[
	AmmoBox02,
	_vehicles,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualBackpackCargo;
[
	AmmoBox02,
	_weapons,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualItemCargo;
[
	AmmoBox02,
	_glasses,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualItemCargo;
[
	AmmoBox02,
	_weapons,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualMagazineCargo;
[
	AmmoBox02,
	_magazines,
	FALSE,
	TRUE
] call BIS_fnc_addVirtualMagazineCargo;



//[] execVM "arsenal_Shop.sqf";