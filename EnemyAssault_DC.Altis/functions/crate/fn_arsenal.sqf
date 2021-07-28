ClearWeaponCargoglobal _this; 
clearMagazineCargoGlobal _this; 
removeAllItems _this; 
clearItemCargoGlobal _this;
clearBackpackCargoGlobal _this;

["AmmoboxInit",[_this,true]] spawn BIS_fnc_arsenal;
if (ghst_acemod) then {
	//ace arsenal
	[_this, true, true] call ace_arsenal_fnc_initBox;
};