/*
	Magazine Repack Script (made by SAKY)
	This is simple repack script with GUI attached to Inventory display.
	
	How to use
	0.The script starts when you open the inventory.
	1.Magazines which is not full will be automatically added to the list.
	2.Double click on the magazine which you want to repack.
	3.Ammo will be repacked from the first magazine you choosed.
	4.Different magazines can be repacked if they use the same ammo. (But no tracer mixing!)
	
	How to install
	1.Add this sqf file in any location in your mission folder.
	2.Add the line below in the init.sqf.
	[] execVM "SAKY_MAGAZINE_REPACK.sqf";
	
	Localization
	Change the ctrlSetText's string to your language. Long string can be cut so make it simple as you can.
	MRS_GUI_Text0 ctrlSetText "재포장할 탄약 선택"; >> "Magazines to repack"
	MRS_GUI_Text1 ctrlSetText "포장 후 결과"; >> "Expected Result"
	MRS_GUI_BtnRepack ctrlSetText "탄창정리"; >> "Repack Magazines"
	MRS_GUI_BtnReset ctrlSetText "초기화"; >> "Reset"
	
	
	License
	This script is released under Arma Public License No Derivatives (APL-ND) 
	https://www.bohemia.net/community/licenses/arma-public-license-nd
	
	Contact
	Forum - https://forums.bohemia.net/forums/topic/226290-pre-releasenew-magazine-repack-script-with-vanila-theme-gui/
	JLD Server Discord - https://discord.gg/9NgM26P call admin SAKY
*/

disableSerialization;

player addEventHandler ["InventoryOpened", {
	[] spawn {
		waitUntil{!isNull (findDisplay 602)};
		call MRS_Init_GUI;	
		
		MRS_GUI_ListFrom ctrlAddEventHandler ["LBDblClick", {
			params ["_control", "_selectedIndex"];		
			call MRS_Fnc_AddSelected;		
		}];
		
		MRS_GUI_BtnReset ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			call MRS_Init_ListFrom;
		}];	
		
		//THIS IS LICENSE NOTIFICATION. DO NOT CHANGE, DELETE THIS.
		MRS_GUI_BtnInfo ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			[] spawn {
				[parseText "This is simple magazine repack script with GUI attached to Inventory display. Ammo fills up from the first selected magazine. Mixing different tracers is not allowed.
				<br/><br/>Copyright 2019. <a href='https://discord.gg/9NgM26P'>SAKY</a> All Rights Reserved.
				<br/><t align='left' size='0.8'>This script is released under <a href='https://www.bohemia.net/community/licenses/arma-public-license-nd'>Arma Public License No Derivatives</a></t>"
				,"Magazine Repack Script by SAKY"] call BIS_fnc_guiMessage;
			};
		}];	
		
		MRS_GUI_BtnRepack ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			{
				player removeMagazines _x#0;
			}forEach MRS_Mags_Final;			
			{
				switch (_x#2) do {
				case "Uniform"	: {(uniformContainer player) addMagazineAmmoCargo [_x#0, 1, _x#1];};
				case "Vest" 	: {(vestContainer player) addMagazineAmmoCargo [_x#0, 1, _x#1];};
				case "Backpack"	: {(backpackContainer player) addMagazineAmmoCargo [_x#0, 1, _x#1];};
					default {systemChat str _x;};
				};
			}forEach MRS_Mags_Final;			
			MRS_Mags_Final = [];
			call MRS_Init_ListFrom;
		}];
		
		MRS_Mags_Previous = magazinesAmmoFull player;
		(findDisplay 602) displayAddEventHandler ["MouseMoving",{			
			{
				if ((_x#4) != (MRS_Mags_Previous#_forEachIndex#4)) exitWith {
					call MRS_Init_ListFrom; 
				};
			}forEach (magazinesAmmoFull player);
			MRS_Mags_Previous = magazinesAmmoFull player;
		}];
		
		call MRS_Init_ListFrom;
	};
}];

MRS_Init_ListFrom={	
	lbClear MRS_GUI_ListFrom;	
	lbClear MRS_GUI_ListTo;		
	MRS_GUI_BtnRepack ctrlEnable false;
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
			MRS_GUI_ListFrom lbAdd _MRS_Mags_Data#7;
			MRS_GUI_ListFrom lbSetData [(lbSize MRS_GUI_ListFrom)-1, str _MRS_Mags_Data];
		};
	}forEach _MRS_Mags_NotFull;	
};

MRS_Fnc_AddSelected = {
	if((MRS_GUI_ListFrom lbColor _selectedIndex)#1==1)then{			
		MRS_GUI_ListFrom lbSetColor [_selectedIndex, [1,0,0,1]];	
		
		_MRS_Data_ListFrom = parseSimpleArray (MRS_GUI_ListFrom lbData _selectedIndex);
		MRS_Mags_Selected pushBack [_MRS_Data_ListFrom#0, _MRS_Data_ListFrom#1, _MRS_Data_ListFrom#4];		
		
		_MRS_Ammo_Selected = [];
		_MRS_Ammo_Left = 0;
		{
			_MRS_Ammo_Selected pushBackUnique getText (configfile >> "CfgMagazines" >> _x#0 >> "ammo");
			_MRS_Ammo_Left = _MRS_Ammo_Left + _x#1;
		}forEach MRS_Mags_Selected;
		
		if((count _MRS_Ammo_Selected == 1) && (count MRS_Mags_Selected > 1))then{MRS_GUI_BtnRepack ctrlEnable true;}else{MRS_GUI_BtnRepack ctrlEnable false;};	
		
		_MRS_Mags_Repacked = [];
		{
			_MRS_Ammo_Max = getNumber (configfile >> "CfgMagazines" >> _x#0 >> "count");
			_MRS_Mags_Repacked pushBack [_x#0, 0 max (_MRS_Ammo_Max min _MRS_Ammo_Left), _x#2];
			_MRS_Ammo_Left = _MRS_Ammo_Left - (0 max (_MRS_Ammo_Max min _MRS_Ammo_Left));
		}forEach MRS_Mags_Selected;
		
		lbClear MRS_GUI_ListTo;		
		{
			if(_x#1 > 0)then{
				MRS_GUI_ListTo lbAdd str formatText ["%1 [%2/%3]",
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
};

MRS_Init_GUI = {
	MRS_GUI_Background = findDisplay 602 ctrlCreate["RscText", -1];
	MRS_GUI_Background ctrlSetPosition [0.267969 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.464062 * safezoneW,0.176 * safezoneH];
	MRS_GUI_Background ctrlSetBackgroundColor [0.05,0.05,0.05,0.7];
	MRS_GUI_Background ctrlCommit 0;
	
	MRS_GUI_Text0 = findDisplay 602 ctrlCreate["RscText", -1];
	MRS_GUI_Text0 ctrlSetPosition [0.273125 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.103125 * safezoneW,0.033 * safezoneH];	
	MRS_GUI_Text0 ctrlSetText "재포장할 탄약 선택";
	MRS_GUI_Text0 ctrlCommit 0;
	
	MRS_GUI_Text1 = findDisplay 602 ctrlCreate["RscText", -1];
	MRS_GUI_Text1 ctrlSetPosition [0.463906 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.103125 * safezoneW,0.033 * safezoneH];	
	MRS_GUI_Text1 ctrlSetText "포장 후 결과";
	MRS_GUI_Text1 ctrlCommit 0;
	
	MRS_GUI_ListFrom = findDisplay 602 ctrlCreate["RscListBox", 8500];
	MRS_GUI_ListFrom ctrlSetPosition [0.273125 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.132 * safezoneH];
	MRS_GUI_ListFrom ctrlCommit 0;
	
	MRS_GUI_ListTo = findDisplay 602 ctrlCreate["RscListBox", 8500];
	MRS_GUI_ListTo ctrlSetPosition [0.463906 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.132 * safezoneH];
	MRS_GUI_ListTo ctrlCommit 0;
	
	MRS_GUI_BtnRepack = findDisplay 602 ctrlCreate["RscButton", 8501];
	MRS_GUI_BtnRepack ctrlSetPosition [0.654688 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.0721875 * safezoneW,0.077 * safezoneH];
	MRS_GUI_BtnRepack ctrlSetText "탄창정리";
	MRS_GUI_BtnRepack ctrlEnable false;
	MRS_GUI_BtnRepack ctrlCommit 0;
	
	MRS_GUI_BtnReset = findDisplay 602 ctrlCreate["RscButton", 8502];
	MRS_GUI_BtnReset ctrlSetPosition [0.654688 * safezoneW + safezoneX,0.885 * safezoneH + safezoneY,0.0721875 * safezoneW,0.044 * safezoneH];
	MRS_GUI_BtnReset ctrlSetText "초기화";
	MRS_GUI_BtnReset ctrlEnable true;
	MRS_GUI_BtnReset ctrlCommit 0;	
	
	MRS_GUI_BtnInfo = findDisplay 602 ctrlCreate["RscButton", 8502];
	MRS_GUI_BtnInfo ctrlSetPosition [0.716563 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
	MRS_GUI_BtnInfo ctrlSetText "[ ? ]";
	MRS_GUI_BtnInfo ctrlEnable true;
	MRS_GUI_BtnInfo ctrlCommit 0;	
};