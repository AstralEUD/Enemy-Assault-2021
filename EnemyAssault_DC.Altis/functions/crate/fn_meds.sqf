private ["_meds"];
ClearWeaponCargoglobal _this; 
clearMagazineCargoGlobal _this; 
removeAllItems _this; 
clearItemCargoGlobal _this;
clearBackpackCargoGlobal _this;

_meds = ["FirstAidKit",
"Medikit"];

if ghst_acemod then {
_meds = ["ACE_fieldDressing",
"ACE_packingBandage",
"ACE_elasticBandage",
"ACE_tourniquet",
"ACE_morphine",
"ACE_adenosine",
"ACE_atropine",
"ACE_epinephrine",
"ACE_plasmaIV",
"ACE_plasmaIV_500",
"ACE_plasmaIV_250",
"ACE_bloodIV",
"ACE_bloodIV_500",
"ACE_bloodIV_250",
"ACE_salineIV",
"ACE_salineIV_500",
"ACE_salineIV_250",
"ACE_quikclot",
"ACE_personalAidKit",
"ACE_surgicalKit",
"ACE_bodyBag"];
};

{_this addItemCargoGlobal [_x, 60];} foreach _meds;