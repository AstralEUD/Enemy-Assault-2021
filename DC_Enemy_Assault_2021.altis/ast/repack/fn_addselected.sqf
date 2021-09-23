disableSerialization;
params ["_control", "_selectedIndex"];
_MRS_GUI_ListFrom = uiNamespace getVariable "MRS_GUI_ListFrom";
_MRS_GUI_BtnRepack = uiNamespace getVariable "MRS_GUI_BtnRepack";
_MRS_GUI_ListTo = uiNamespace getVariable "MRS_GUI_ListTo";
if((_MRS_GUI_ListFrom lbColor _selectedIndex)#1==1)then{			
	_MRS_GUI_ListFrom lbSetColor [_selectedIndex, [1,0,0,1]];	
	
	_MRS_Data_ListFrom = parseSimpleArray (_MRS_GUI_ListFrom lbData _selectedIndex);
	MRS_Mags_Selected pushBack [_MRS_Data_ListFrom#0, _MRS_Data_ListFrom#1, _MRS_Data_ListFrom#4];		
	
	_MRS_Ammo_Selected = [];
	_MRS_Ammo_Left = 0;
	{
		_MRS_Ammo_Selected pushBackUnique getText (configfile >> "CfgMagazines" >> _x#0 >> "ammo");
		_MRS_Ammo_Left = _MRS_Ammo_Left + _x#1;
	}forEach MRS_Mags_Selected;
	
	if((count _MRS_Ammo_Selected == 1) && (count MRS_Mags_Selected > 1))then{_MRS_GUI_BtnRepack ctrlEnable true;}else{_MRS_GUI_BtnRepack ctrlEnable false;};	
	
	_MRS_Mags_Repacked = [];
	{
		_MRS_Ammo_Max = getNumber (configfile >> "CfgMagazines" >> _x#0 >> "count");
		_MRS_Mags_Repacked pushBack [_x#0, 0 max (_MRS_Ammo_Max min _MRS_Ammo_Left), _x#2];
		_MRS_Ammo_Left = _MRS_Ammo_Left - (0 max (_MRS_Ammo_Max min _MRS_Ammo_Left));
	}forEach MRS_Mags_Selected;
	
	lbClear _MRS_GUI_ListTo;		
	{
		if(_x#1 > 0)then{
			_MRS_GUI_ListTo lbAdd str formatText ["%1 [%2/%3]",
			getText (configfile >> "CfgMagazines" >> _x#0 >> "displayName"),
			_x#1,
			getNumber (configfile >> "CfgMagazines" >> _x#0 >> "count")
			];
		};
	}forEach _MRS_Mags_Repacked;			
	
	_MRS_Mags_AllMags = [];
	{			
		_MRS_Ammo_TypeRef = getText (configfile >> "CfgMagazines" >> ((_MRS_Mags_Repacked#0)#0) >> "ammo");
		_MRS_Ammo_TypeSel = getText (configfile >> "CfgMagazines" >> _x#0 >> "ammo");
		if((_MRS_Ammo_TypeSel == _MRS_Ammo_TypeRef) && (_x#4 in ["Uniform", "Vest", "Backpack"]))then{
			_MRS_Mags_AllMags pushBack [_x#0,_x#1,_x#4];
		};
	}forEach (magazinesAmmoFull player);
	
	MRS_Mags_Final = (_MRS_Mags_AllMags - MRS_Mags_Selected + _MRS_Mags_Repacked);
};