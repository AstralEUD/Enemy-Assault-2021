_veh = _this select 0;
_UID = 0;
_values = [0];
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "accuracy");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "afMax");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "armor");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "armorLights");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "audible");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "altNoForce");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "altFullForce");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "accuracy");
_values pushBack getNumber(configFile >> "CfgVehicles" >>  typeOf _veh >> "cargoCanEject");
{
	_UID = _UID + _x;
}forEach _values;
if(((_UID)* (_values select 5))!= 0)then
{
	_UID = (_UID) * (_values select 5);
};
if(((_UID) * (_values select 1))!= 0)then
{
	_UID = (_UID) * (_values select 1);
};
_UID = [_UID,0] call BIS_fnc_cutDecimals;
_UID