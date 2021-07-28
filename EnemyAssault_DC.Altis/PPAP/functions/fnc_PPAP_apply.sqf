//PPAP Apply
disableSerialization;
private _PPAP_display = findDisplay 8900;
private _vehicleclass = typeof PPAP_targetvehicle;
private _list_preset = _PPAP_display displayCtrl 8910;

private _list_selection = lbCurSel _list_preset;
//Apply loadout and make ammo empty. Code from BI wiki.
private _pylons = PPAP_preset_contents select _list_selection;
private _pylon_path = configProperties [configFile >> "CfgVehicles" >> _vehicleclass >> "Components" >> "TransportPylonsComponent" >> "Pylons", "isClass _x"];
private _turret_path = [];
{_array = getArray (_x >> "turret"); _turret_path pushBack _array;} forEach _pylon_path;
private _current_pylon = getPylonMagazines PPAP_targetvehicle;
{
	if !(_x isEqualTo "") then {
	PPAP_targetvehicle removeMagazineGlobal _x;
	};
} forEach _current_pylon;
{
	if !(_x isEqualTo "") then {
		PPAP_targetvehicle removeWeaponGlobal getText (configfile >> "CfgMagazines" >> _x >> "pylonWeapon");
	};
} forEach _current_pylon;
{PPAP_targetvehicle setPylonLoadout [_forEachIndex + 1, _x, true, _turret_path select _forEachIndex]; PPAP_targetvehicle setAmmoOnPylon [_forEachIndex + 1, 0];} forEach _pylons;
hint localize "STR_PPAP_DONE";
sleep 4;
hintSilent "";