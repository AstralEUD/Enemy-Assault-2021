disableSerialization;
_veh = zlo_VehicleClass;
_UID =[_veh] call zlo_fnc_getVehicleID;
//_saved = profileNamespace getVariable [format["%1",_UID],false];
_ctrl = (findDisplay 456965) displayCtrl (1500);
_loaded = profileNamespace getVariable [format["%1",_UID],false];
if!(_loaded isEqualTo false )then
{
	_sel = lbCurSel _ctrl;
	if!(_sel isEqualTo -1)then
	{
		//_saved deleteAt _sel;
		hint parseText format["<br /><img image='ZLoad\img\wr.jpg' /><br />%1 '<t color='#FF0000'>%3</t>' %2<br /> <br /> ",localize "zlo_pres1_text",localize "zlo_pres2_text",(_loaded select _sel)select 0];
		_loaded deleteAt _sel;
		profileNamespace setVariable [format["%1",_UID],_loaded];
		saveProfileNamespace;
		_ctrl lbDelete _sel;
		_ctrl ctrlCommit 0;
		//profileNamespace setVariable [format["%1",_UID],zlo_VehicleSavedPresets];
	};
};