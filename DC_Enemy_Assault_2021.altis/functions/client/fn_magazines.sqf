/*
V1.2 Script by Ghost (main design by Kronzky) Will add all items, magazines to an ammo box. no more manual typing of weapon/magazine/item names.
put this call ghst_fnc_magazines; in the initline of an ammo box.
*/
private ["_wepcount","_magcount","_weaponsList","_magazinesList","_namelist","_cfgmagazines","_i","_magazine","_mCName","_mDName","_mModel","_mType","_mscope","_mPic","_mDesc","_weapon"];

_wepcount = 30;
_magcount = 30;

clearMagazineCargoGlobal _this;
clearWeaponCargoGlobal _this;
clearItemCargoGlobal _this;

_weaponsList = [];

_this addItemCargoGlobal ["FirstAidKit",_magcount];

_magazinesList = [];
_namelist = [];
_cfgmagazines = configFile >> "cfgmagazines";
for "_i" from 0 to (count _cfgmagazines)-1 do {
	_magazine = _cfgmagazines select _i;
	if (isClass _magazine) then {
		_mCName = configName(_magazine);
		_mDName = (configFile >> "cfgmagazines" >> _mCName >> "displayName") call bis_fnc_getcfgdata;
		_mModel = (configFile >> "cfgmagazines" >> _mCName >> "model") call bis_fnc_getcfgdata;
		_mType = (configFile >> "cfgmagazines" >> _mCName >> "type") call bis_fnc_getcfgdata;
		_mscope = (configFile >> "cfgmagazines" >> _mCName >> "scope") call bis_fnc_getcfgdata;
		_mPic =  (configFile >> "cfgmagazines" >> _mCName >> "picture") call bis_fnc_getcfgdata;
		_mDesc = (configFile >> "cfgmagazines" >> _mCName >> "Library" >> "libTextDesc") call bis_fnc_getcfgdata;	

		if ((_mCName!="") && (_mDName!="") && (_mModel!="") && (_mPic!="")) then {
			if !(_mDName in _namelist) then {
				_magazinesList pushback [_mCName];
				_namelist pushback _mDName;
			};
		};
	};
	/*
	if (_i % 10==0) then {
		hintsilent format["Loading magazines List... (%1)",count _magazinesList];
		sleep .0001;
};*/
};
hint "";
_namelist = nil;

for "_i" from 0 to (count _weaponsList)-1 do {
	_weapon = _weaponsList select _i;
	_this addWeaponCargoGlobal [_weapon select 0,_wepcount];
};

for "_i" from 0 to (count _magazinesList)-1 do {
	_magazine = _magazinesList select _i;
	_this addMagazineCargoGlobal [_magazine select 0,_magcount];
};