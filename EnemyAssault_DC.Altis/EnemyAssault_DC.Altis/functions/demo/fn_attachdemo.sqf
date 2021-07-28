//attach demo on object
//ghst_demo_array = [];
//player addAction ["<t size='1.2' shadow='2' color='#FEE093'>Attach C4</t> <img size='2' shadow='2' image='\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa'/>", {call ghst_fnc_attachdemo}, ["DemoCharge_Remote_Ammo_Scripted","DemoCharge_Remote_Mag"], 1, false, true, "","'DemoCharge_Remote_Mag' in magazines _target and vehicle _this == _target"];
_exparray = _this select 3;
	_expmag = _exparray select 1;

_expname = getText (configFile >> "cfgMagazines" >> (_expmag) >> "displayName");
_explosive = [_exparray,_expname] call ghst_fnc_demoplacement;
if (isnull _explosive) exitwith {hint "Cannot Attach Charge";};
player playActionNow "PutDown";
_cn = count ghst_demo_array;
_cvar = "ghst_demo" + str _cn;
ghst_demo_array pushback _explosive;

//_detaction = player addAction [format ["<t size='1.2' shadow='2' color='#B22222'>Detonate %2 #%1</t> <img size='3' shadow='2'/>", _cn + 1,_expname], {call ghst_fnc_detdemo}, [_explosive,_cn,_cvar], 5, false, true, "","vehicle _this == _target"];

//_pickupaction = player addAction [format ["<t size='1.2' shadow='2' color='#22b2b2'>Pickup %2 #%1</t> <img size='3' shadow='2'/>", _cn + 1,_expname], {call ghst_fnc_pickupdemo}, [_explosive,_cn,_cvar,_expmag,_expname], 4.9, false, true, "","vehicle _this == _target"];

//_timeraction = player addAction [format ["<t size='1.2' shadow='2' color='#00cc66'>Set Timer %2 #%1</t> <img size='3' shadow='2'/>", _cn + 1,_expname], {call ghst_fnc_timerdemo}, [_explosive,_cn,_cvar,_expmag,_expname], 4.8, false, true, "","vehicle _this == _target"];

 player setVariable [_cvar, [_detAction, _pickupAction,_timeraction]];