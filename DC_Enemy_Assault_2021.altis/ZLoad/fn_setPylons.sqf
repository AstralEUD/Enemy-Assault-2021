/*
	author: DEXTER
	description: none
	returns: nothing
*/
disableSerialization;
private ["_veh","_magsCurrent","_typeVeh","_allPylonsNames","_counPylons","_equipedMag","_i","_ctrl"];
waitUntil{!isnull (findDisplay 456963);};
_veh = zlo_VehicleClass;
_typeVeh = (typeOf _veh);

_bannedPylons = ['4Rnd_BombCluster_01_F','PylonMissile_1Rnd_BombCluster_01_F','PylonRack_2Rnd_BombCluster_01_F','4Rnd_BombCluster_02_F','4Rnd_BombCluster_03_F','PylonMissile_1Rnd_BombCluster_02_F',
'PylonMissile_1Rnd_BombCluster_02_cap_F','PylonMissile_1Rnd_BombCluster_03_F','PylonRack_2Rnd_BombCluster_03_F'];

_magsCurrent = getPylonMagazines (_veh);
_allPylonsNames = (configProperties [configFile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
_counPylons = count _allPylonsNames;
_i = 0;
//configfile >> "CfgVehicles" >> "B_Plane_CAS_01_dynamicLoadout_F" >> "Components" >> "TransportPylonsComponent" >> "uiPicture"

_ctrl = (findDisplay 456963) displayCtrl (_i+2101); 
_magTurret = [];
{
	_magTurret pushBack getArray(configfile >> "CfgVehicles" >> _typeVeh >> "Components" >> "TransportPylonsComponent" >> "Pylons" >> _x >> "turret");
}forEach _allPylonsNames;
_needChange = 0;

_pylonWeaponsBefore =[];
{
	_pylonWeaponsBefore pushBack	getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
} forEach _magsCurrent;
//systemChat format ["%1 - Пополнение БК : Завершена", getText (configfile >> "CfgVehicles" >> typeOf _veh >> "displayName")];
while{_i < _counPylons} do
{
	_avaiableMags = _veh getCompatiblePylonMagazines _i+1;
	_ctrl = (findDisplay 456963) displayCtrl (_i+2101);
	_indexPylon = lbCurSel _ctrl;
	_c = 0;
	if(_indexPylon != 0)then
	{
//configfile >> "CfgVehicles" >> "rhs_mig29s_base" >> "icon"
//configfile >> "CfgVehicles" >> "rhs_mig29s_base" >> "Attributes" >> "rhs_decalNoseArt" >> "expression"
	    {
	        //configfile >> "CfgVehicles" >> "CUP_O_SU34_RU" >> "Components" >> "TransportPylonsComponent" >> "pylons" >> "pylons1" >> "turret"
    	    if(_indexPylon == _c+1) then
    		{
				if(!(getText(configFile >> "CfgMagazines" >> _magsCurrent select _i >> "displayName") isEqualTo (_ctrl lbText _c+1)) && ((_bannedPylons find _x) == -1)) then
				{
					_veh setPylonLoadOut [_allPylonsNames select _i,_x,false,_magTurret select _i];
					_veh setAmmoOnPylon [_i-1,getNumber (configfile >> "CfgMagazines" >> _x >> "count")];
					_needChange = _needChange + 1;
				};
    		};
    		_c = _c + 1;
    	}forEach _avaiableMags;
	};
	if(_indexPylon == 0)then
	{
	_veh setPylonLoadOut [_allPylonsNames select _i,""];
	
	};
	
	_i = _i + 1;
};
_magsCurrent = getPylonMagazines _veh;
_pylonWeapons =[];
{
	_pylonWeapons pushBack	getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
} forEach _magsCurrent;
{
	if((_pylonWeapons find _x) isEqualTo -1)then
	{
		_veh removeWeaponGlobal _x;
	};
}forEach _pylonWeaponsBefore;
/*
if({_x ==  _pylonWeapons select _i} count _pylonWeapons < 1)then
		{
					systemChat format ["del 1%1",_pylonWeapons select _i];
			_veh removeWeaponGlobal (getText (configFile >> "CfgMagazines" >> _pylonWeapons select _i >> "pylonWeapon"));
					systemChat format ["delted 1%1",_pylonWeapons select _i];
		};


_pylonWeapons = _magsCurrent apply {getText ((configfile >> "CfgMagazines" >> _x >> "pylonWeapon"))};

{
	_veh removeWeaponGlobal getText (configFile >> "CfgMagazines" >> _x >> "pylonWeapon");
} forEach _magsCurrent;
systemChat format ["weapons : %1",_pylonWeapons];
*/
//#############
//skin
//#############
//<img image='%1' />      getText (configfile >> "CfgVehicles" >> typeOf _veh >> "icon")
//#########
//#Refuel/Repair/ammo
//#########
/*
(findDisplay 456963) displayCtrl(2800) - fuel 30
(findDisplay 456963) displayCtrl(2801) - repair 60
(findDisplay 456963) displayCtrl(2802) - ammo 30
                                             60
*/
//30-3
_timeFuel = 5;//30
_timeRepair = 5;//60
_timeAmmo = 5;//30
_timePylons = 5;//30
_timeSkin = 5;//10
_tTime = 0;
zlo_VehicleInAsisstance = false;
_refuel = cbChecked ((findDisplay 456963) displayCtrl(2800));
_repair =cbChecked ((findDisplay 456963) displayCtrl(2801));
_ammo =cbChecked ((findDisplay 456963) displayCtrl(2802));
_ctrl = (findDisplay 456963) displayCtrl 2100;
_selCamo = lbCurSel _ctrl;

closeDialog 0;
if((alive _veh) isEqualTo true)then
{		
	if((_refuel)isequalto true)then
	{
		_tTime = _tTime + _timeFuel;
		zlo_VehicleInAsisstance = true;
	};
	if((_repair)isequalto true)then
	{
		_tTime = _tTime + _timeRepair;
		zlo_VehicleInAsisstance = true;
	};
	if((_ammo)isequalto true)then
	{
		_veh setVehicleAmmo 0;
		_tTime = _tTime + _timeAmmo;
		zlo_VehicleInAsisstance = true;
	};
	if(_needChange > 0)then
	{
		_tTime = _tTime + _timePylons;
		zlo_VehicleInAsisstance = true;
	};
	if(_needChange > 1)then
	{
		_tTime = _tTime + _timePylons;
		zlo_VehicleInAsisstance = true;
	};
	if(_needChange > 2)then
	{
		_tTime = _tTime + _timePylons;
		zlo_VehicleInAsisstance = true;
	};
	if(_needChange > 3)then
	{
		_tTime = _tTime + _timePylons;
		zlo_VehicleInAsisstance = true;
	};
	if(_needChange > 4)then
	{
		_tTime = _tTime + _timePylons;
		zlo_VehicleInAsisstance = true;
	};
	if(_needChange > 5)then
	{
		_tTime = _tTime + _timePylons;
		zlo_VehicleInAsisstance = true;
	};
	if(_selCamo > 0)then
	{
		_tTime = _tTime + _timeSkin;
		zlo_VehicleInAsisstance = true;
	};
	//maitenance on start
	hint parseText format["<br /><img image='ZLoad\img\wr.jpg' /><br />%1 :<t color='#FF0000'>%2</t> %3<br /> <br /> ",localize "zlo_wait_text",_tTime,localize"zlo_sec_text"];	
	uiSleep _tTime;
	AST_kill_score = AST_kill_score - 15;
	[15] call ast_fnc_hud_minus;
	systemChat format ["현재 포인트 : %1",AST_kill_score];
	hint parseText format["<br /><img image='ZLoad\img\wr.jpg' /><br /><t color='#1f8636'>%1</t><br /> <br /> ",localize "zlo_serviceeeady_text"];
	if((alive _veh) isEqualTo true)then
	{
		if((_refuel)isequalto true)then
		{
			_veh setFuel 1;;
		}else
		{
			_veh setFuel zlo_VehicleFuel;
		};
		if((_repair)isequalto true)then
		{
			_veh setDamage 0;
		};
		if((_ammo)isequalto true)then
		{
			_veh setVehicleAmmo 1;
		};
		if(_needChange > 6)then
		{
			_veh setVehicleAmmo 1;
		};
		zlo_VehicleInAsisstance = false;
	};
};

_camoCountSources = "true" configClasses (configfile >> "CfgVehicles" >> _typeVeh >> "textureSources");
_camoTextures = [""];
_camoNames = [""];
_i = 0;
if (_selCamo > -1) then
{
	if(count _camoCountSources > 0) then
	{
		{
			_camoTextures pushback (getArray (configfile >> "CfgVehicles" >> _typeVeh >> "textureSources" >> configName _x >> "textures"))
		}forEach _camoCountSources;

		{
			_index = (_camoTextures select _selCamo+1) find _x;
			_veh setObjectTextureGlobal [_index, (_camoTextures select _selCamo+1) select _index];
			_parents = [];
			_inherit = (configfile >> "CfgVehicles" >> _typeVeh);
			while{!isNull _inherit}do
			{
			    _parents pushBack configName _inherit;
			    _inherit = inheritsFrom _inherit;
			};
			{
			    if("CUP_AV8B_Base" isEqualTo _x)then
			    {
			        _veh setObjectTextureGlobal [_index+1, (_camoTextures select _selCamo+1) select _index];
			    };
			}forEach _parents;
			//textures[] = {"cup\airvehicles\cup_airvehicles_av8b\data\texture\CUP_av8b_aaf_1_co.paa","cup\airvehicles\cup_airvehicles_av8b\data\texture\CUP_av8b_aaf_1_co.paa","#(argb,512,512,1)r2t(rendertarget0,1.0)"};
		} foreach (_camoTextures select _selCamo+1);
	};
};
			