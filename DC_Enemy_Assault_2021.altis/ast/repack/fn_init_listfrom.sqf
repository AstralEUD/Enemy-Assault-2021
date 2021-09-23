disableSerialization;
_MRS_GUI_ListFrom = uiNamespace getVariable "MRS_GUI_ListFrom";
_MRS_GUI_BtnRepack = uiNamespace getVariable "MRS_GUI_BtnRepack";
_MRS_GUI_ListTo = uiNamespace getVariable "MRS_GUI_ListTo";
lbClear _MRS_GUI_ListFrom;	
lbClear _MRS_GUI_ListTo;		
_MRS_GUI_BtnRepack ctrlEnable false;
MRS_Mags_Selected = [];

_MRS_Mags_NotFull = [];	
{
	if(_x#4 in ["Uniform","Vest","Backpack"])then{
		_MRS_Mags_NotFull pushBack [getText (configfile >> "CfgMagazines" >> _x#0 >> "displayName"),_x];
	};
}forEach (magazinesAmmoFull player);

{			
	_MRS_Mags_Data = _x#1;
	_MRS_Mags_Data pushBack getText (configfile >> "CfgMagazines" >> (_x#1)#0 >> "ammo");
	_MRS_Mags_Data pushBack getNumber (configfile >> "CfgMagazines" >> (_x#1)#0 >> "count");
	_MRS_Mags_Data pushBack str formatText ["%1 [%2/%3]",_x#0,_MRS_Mags_Data#1,_MRS_Mags_Data#6];
	
	if(_MRS_Mags_Data#1 < _MRS_Mags_Data#6) then {
		_MRS_GUI_ListFrom lbAdd _MRS_Mags_Data#7;
		_MRS_GUI_ListFrom lbSetData [(lbSize _MRS_GUI_ListFrom)-1, str _MRS_Mags_Data];
	};
}forEach _MRS_Mags_NotFull;	