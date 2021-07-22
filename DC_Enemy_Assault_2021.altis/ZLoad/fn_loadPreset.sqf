disableSerialization;
_maindisplay = findDisplay 456963;
_presets = zlo_VehicleSavedPresets;
_selected = lbcursel ((findDisplay 456965) displayCtrl 1500);
if!(_selected isEqualTo -1)then
{
	_i = 0;
	_selPres = (_presets select _selected);
	while{_i < count _selPres} do
	{
		_ctrl = _maindisplay displayCtrl (2101 + _i);
		_ctrl lbSetCurSel (_selPres select (_i + 1));
		_i = _i +1;
	};
	hint parseText format["<br /><img image='ZLoad\img\wr.jpg' /><br />%1<br /> <br /> ",localize "zlo_presetloaded_text"];	
	closedialog 0;
};