disableSerialization;
//_mainDisplay 
createDialog "zlo_SaveDialog";
waitUntil{!isnull (findDisplay 456965);};
_mainDisplay = findDisplay 456965;
_ctrl = _mainDisplay displayCtrl(1601);
_ctrl ctrlSetText format["%1",localize "zlo_save_text"];
_ctrl = _mainDisplay displayCtrl(1602);
_ctrl ctrlSetText format["%1",localize "zlo_load_text"];
_ctrl = _mainDisplay displayCtrl(1603);
_ctrl ctrlSetText format["%1",localize "zlo_delete_text"];
_ctrl = _mainDisplay displayCtrl (1100);
_veh = zlo_VehicleClass;
_Name = getText (configfile >> "CfgVehicles" >> typeOf _veh>> "displayName");
_ctrl ctrlSetStructuredText parseText format["<t shadow='1' shadowColor='#4F4F4F' align='left'>%1 : %2</t>",localize "zlo_spresets_text",_Name];
_UID =[_veh] call zlo_fnc_getVehicleID;
_Pylons = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
_loaded = profileNamespace getVariable [format["%1",_UID],false];
_ctrl = _mainDisplay displayCtrl (1500);
if!(_loaded isEqualTo false )then
{
	_i=0;
	while{_i < count _loaded} do
	{
		_ctrl lbadd format["%1",(_loaded select _i)select 0];
		_i = _i + 1;
	};
	zlo_VehicleSavedPresets = _loaded;
};