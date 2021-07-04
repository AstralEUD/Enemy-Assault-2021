_caller = _this select 1;
_veh = vehicle _caller;
disableSerialization;
if(!isNull getConnectedUAV _caller)then
{
	_veh = getConnectedUAV _caller;
};
//localiztion
[] spawn zlo_fnc_localizeGUI;
//##############
createDialog "zlo_LoadOut_Dialog";
waitUntil{!isnull (findDisplay 456963);};
zlo_VehicleClass = _veh;
if(zlo_VehicleInAsisstance isEqualTo false)then
{
	zlo_VehicleFuel = fuel _veh;
};
zlo_VehicleSavedPresets = [];
_typeVeh = (typeOf _veh);
_vehName = getText (configfile >> "CfgVehicles" >> _typeVeh>> "displayName");
_veh setFuel 0;
_magsCurrent = getPylonMagazines (_veh);
_allPylonsNames = (configProperties [configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
_counPylons = count _allPylonsNames;
_equipedMag = getPylonMagazines _veh;
_i = 0;
_ctrl = (findDisplay 456963) displayCtrl (1005);
_ctrl ctrlSetText format["%1",toString[90 ,101 ,114 ,111 ,65 ,105 ,110 ,122 ,32 ,76 ,111 ,97 ,100 ,79 ,117 ,116 ,32 ,86 ,101 ,114 ,115 ,105 ,111 ,110 ,32 ,49 ,46 ,48]];
_ctrl = (findDisplay 456963) displayCtrl (1200);
if (isText(configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "uiPicture")) then
{
	_textIMG = getText(configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "uiPicture");
	_ctrl ctrlSetText _textIMG;
	_ctrl = (findDisplay 456963) displayCtrl (1003);
	_ctrl ctrlSetText format ["%2 by armafront.com : %1", _vehName,localize "zlo_windowName_text"];
};


_ctrl = (findDisplay 456963) displayCtrl(1200);
_ctrl ctrlEnable false;
//elements and pylons
//LBSelChanged
//
_exceptionVehiclesCup = ["CUP_B_AH1_DL_BAF","CUP_B_AH1_BAF","CUP_B_AH1_AT_BAF","CUP_B_AH1_ES_BAF","CUP_B_AH1_MR_BAF","CUP_B_AH1_NO_BAF",
						"CUP_B_Mi171Sh_ACR",
						"CUP_B_Mi35_Dynamic_CZ","CUP_B_Mi35_Dynamic_CZ_Dark","CUP_B_Mi35_Dynamic_CZ_Des","CUP_B_Mi35_Dynamic_CZ_Ram","CUP_B_Mi35_Dynamic_CZ_Tiger",
						"CUP_B_AW159_RN_Blackcat","CUP_B_AW159_GB","CUP_B_AW159_RN_gray",
						"CUP_B_Mi24_D_Dynamic_CDF","CUP_B_Mi24_D_MEV_Dynamic_CDF",
						"CUP_B_AH64D_DL_USA","CUP_B_AH6J_USA","CUP_B_AH6M_USA",
						"CUP_B_MH60L_DAP_2x_US","CUP_B_MH60L_DAP_4x_US","CUP_B_MH60L_DAP_2x_USN","CUP_B_MH60L_DAP_4x_USN",
						"CUP_B_AH1Z_Dynamic_USMC",
						"CUP_O_Ka50_DL_RU","CUP_O_Ka52_RU","CUP_O_Ka52_Blk_RU","CUP_O_Ka52_GreyCamo_RU","CUP_O_Ka52_Grey_RU",/* do mi 28 и посмотреть*/
						"CUP_O_Ka60_Grey_RU",
						"CUP_O_Mi8_RU"/*и друзия*/,
						"CUP_O_Ka60_GL_Blk_CSAT","CUP_O_Ka60_Blk_CSAT"/* and more*/,
						"CUP_O_Mi24_Mk3_CSAT_T" /*и друзя*/,
						"CUP_O_Ka50_dl_SLA",/*и др*/
						"CUP_O_Mi24_D_Dyinamic_SLA",/*and more*/
						"CUP_O_Mi24_D_Dynamic_TK"];
_ctrl = (findDisplay 456963) displayCtrl(2101);
while{_i < _counPylons} do
{

	_avaiableMags = _veh getCompatiblePylonMagazines format ["%1",_allPylonsNames select _i];
	_ctrl = (findDisplay 456963) displayCtrl (_i+2101);
	_ctrl lbadd format [">%1<",localize "zlo_empty_text"];
	_c = 1;
	{
		_magName = if (isText(configFile >> "CfgMagazines" >> _x >> "displayName")) then
		{
			getText(configFile >> "CfgMagazines" >> _x >> "displayName")
		}
		else
		{
			"/"
		};
		_post = getArray(configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> _allPylonsNames select (_i) >> "UIposition");
		_vehNameX = (format ["%1", _typeVeh])splitString "_";
		if(_vehNameX find "CUP" >= 0)then
		{	
			if((typeName (_post select 0))isEqualTo "STRING" and (typeName (_post select 1))isEqualTo "SCALAR")then
				{
					if((_exceptionVehiclesCup find _typeVeh) >= 0)then
					{
						if((typeName (_post select 0))isEqualTo "STRING")then
						{
							_post set [0,0.027];
							_ctrl ctrlSetPosition [(_post select 0) + 0.075,(_post select 1) + 0.149,0.205027,0.0399967];
						};
					};
				};
			if((typeName (_post select 0))isEqualTo "STRING" and (typeName (_post select 1))isEqualTo "STRING")then
			{
				_split = format ["%1+0",_post select 0];
				_splittedX = _split splitString "+";
				_splitX = 0;
				_isplit = 0;
				while{_isplit < ((count _splittedX))} do
				{
					_splitX = _splitX + (parseNumber (_splittedX select _isplit));
					_isplit = _isplit + 1;
				};
				_split = format ["%1",_post select 1];
				_splittedY = _split splitString "+";
				_splitY = ((parseNumber (_splittedY select 0)) + (parseNumber (_splittedY select 1)));
				_ctrl ctrlSetPosition [_splitX + 0.075,_splitY +0.149,0.205027,0.0399967];
			};
			if((typeName (_post select 0))isEqualTo "SCALAR" and (typeName (_post select 1))isEqualTo "SCALAR")then
				{
					
					_ctrl ctrlSetPosition [(_post select 0) + 0.075,(_post select 1) + 0.149,0.205027,0.0399967];
					
				};
			if((_exceptionVehiclesCup find _typeVeh) == -1)then
			{
			
			};
			//                                             +0.185
		};
		if(_vehNameX find "CUP" == -1)then
		{
			_ctrl ctrlSetPosition [(_post select 0) + 0.075,(_post select 1) + 0.149,0.205027,0.0399967];
		};
		_ctrl ctrlCommit 0;
		_ctrl lbadd _magName;
		if((_equipedMag select _i) == _x) then
		{
			_ctrl lbSetCurSel _c;
		};
		_c = _c + 1;

	}forEach _avaiableMags;
	if((lbCurSel _ctrl)== -1)then
	{
		_ctrl lbSetCurSel 0;
	};
	_i = _i + 1;
};

_camoCountSources = "true" configClasses (configfile >> "CfgVehicles" >> _typeVeh >> "textureSources");
_camoTextures = [""];
_camoNames = [""];
_ctrl = (findDisplay 456963) displayCtrl 2100;
_i = 0;
if(count _camoCountSources > 0) then
{
	_camoNames = [""];
	{
		_camoNames pushback (getText (configfile >> "CfgVehicles" >>  _typeVeh >> "textureSources" >> configName _x >> "displayName"));
		_ctrl lbAdd getText (configfile >> "CfgVehicles" >> _typeVeh >> "textureSources" >> configName _x >> "displayName");
		_camoTextures pushback (getArray (configfile >> "CfgVehicles" >> _typeVeh >> "textureSources" >> configName _x >> "textures"))
	}forEach _camoCountSources;
};
if(count _camoCountSources == 0)then
{
	_ctrl lbAdd format ["%1",localize "zlo_camo_empty_text"];
	_ctrl lbsetcursel 0;
};
//####
//####indicatori
//####
_ctrl = (findDisplay 456963) displayCtrl 1002;
_ctrl ctrlSetText format["%3 : %1%2",[(zlo_VehicleFuel)*100,0] call BIS_fnc_cutDecimals,"%",localize "zlo_fuel_text"];
_ctrl = (findDisplay 456963) displayCtrl 1001;
_ctrl ctrlSetText format["%3 : %1%2",[(getDammage _veh)*100,0] call BIS_fnc_cutDecimals,"%",localize "zlo_damage_text"];
//####
//####Presets
//####

_ctrl = (findDisplay 456963) displayCtrl 2115;
_presetsCFG = "true" configClasses (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "presets");
_ctrl ctrlRemoveAllEventHandlers "LBSelChanged";
{
	_ctrl lbAdd getText(configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "presets" >> configName _x >> "displayName");
}forEach _presetsCFG;
_i = 0;
_idz = [];
_mirrorPos = [];
_countMirrorsPylon = 0;
{
	if(getNumber (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons">> _x >> "mirroredMissilePos") != 0)then
	{
		_countMirrorsPylon = _countMirrorsPylon + 1;
	};
	_mirrorPos pushBack (getNumber (configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons">> _x >> "mirroredMissilePos"));
}forEach _allPylonsNames;
{
	if(_mirrorPos select _i == 0)then{
		_ctrl = (findDisplay 456963) displayCtrl (_i+2101);
		_ctrl ctrlRemoveAllEventHandlers "LBSelChanged";
		_temp = _ctrl ctrlAddEventHandler ["LBSelChanged","_this spawn zlo_fnc_updateMirror"];
		_idz pushBack _temp;
	};
	_i = _i +1;
}forEach _allPylonsNames;
_ctrl = (findDisplay 456963) displayCtrl 2115;
_ctrl ctrlRemoveAllEventHandlers "LBSelChanged";
_temp = _ctrl ctrlAddEventHandler ["LBSelChanged","_this spawn zlo_fnc_UpdatePresets"];
_idz pushBack _temp;



