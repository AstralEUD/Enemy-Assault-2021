disableSerialization;
_veh = zlo_VehicleClass;
_UID = format["%1",[_veh] call zlo_fnc_getVehicleID];
_ctrl = findDisplay(456965) displayCtrl(1400);
_saveName =  ctrlText _ctrl; 
if(_saveName isEqualTo "")then
{
	hint parseText format["<br /><img image='ZLoad\img\wr.jpg' /><br /><t color='#FF0000'>%1</t><br /> <br /> ",localize "zlo_emptyspace_text"];
}else
{ 
	
	_i = 0;
	_Pylons = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
	_params = [];
	_params pushBack _saveName;
	while{_i < count _Pylons} do
	{
		_ctrl = findDisplay(456963) displayCtrl(2101+_i);
		_sel = lbCurSel _ctrl;
		_params pushBack _sel;
		_i = _i +1;
	};
	_ctrl = findDisplay(456965) displayCtrl(1500);
	_ctrl lbAdd format["%1",(_params select 0)];
	zlo_VehicleSavedPresets pushBack _params;
	//Write 
	profileNamespace setVariable [_UID,zlo_VehicleSavedPresets];
	saveProfileNamespace;
	hint parseText format["<br /><img image='ZLoad\img\wr.jpg' /><br />%1 '<t color='#1f8636'>%2</t>' %3<br /> <br />",localize "zlo_pres1_text",_saveName,localize "zlo_saved_text"];
};

//CBA_fnc_removePlayerAction
//profileNamespace setVariable [_UID,[["name",-1,4,2,4,-1],["name2",2,2,4,2,2]]];