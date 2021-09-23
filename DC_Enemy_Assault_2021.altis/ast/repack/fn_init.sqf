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

player addEventHandler ["InventoryOpened", {
	[] spawn {
		disableSerialization;
		waitUntil{!isNull (findDisplay 602)};
		call MRS_fnc_Init_GUI;	
		_MRS_GUI_ListFrom = uiNamespace getVariable "MRS_GUI_ListFrom";
		_MRS_GUI_BtnRepack = uiNamespace getVariable "MRS_GUI_BtnRepack";
		_MRS_GUI_ListTo = uiNamespace getVariable "MRS_GUI_ListTo";
		_MRS_GUI_BtnReset = uiNamespace getVariable "MRS_GUI_BtnReset";
		_MRS_GUI_BtnInfo = uiNamespace getVariable "MRS_GUI_BtnInfo";
		_MRS_GUI_ListFrom ctrlAddEventHandler ["LBDblClick", {
			params ["_control", "_selectedIndex"];		
			[_control, _selectedIndex] call MRS_fnc_AddSelected;		
		}];
		
		_MRS_GUI_BtnReset ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			call MRS_fnc_Init_ListFrom;
		}];	
		
		//THIS IS LICENSE NOTIFICATION. DO NOT CHANGE, DELETE THIS.
		_MRS_GUI_BtnInfo ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			[] spawn {
				[parseText "This is simple magazine repack script with GUI attached to Inventory display. Ammo fills up from the first selected magazine. Mixing different tracers is not allowed.
				<br/><br/>Copyright 2019. <a href='https://discord.gg/9NgM26P'>SAKY</a> All Rights Reserved.
				<br/><t align='left' size='0.8'>This script is released under <a href='https://www.bohemia.net/community/licenses/arma-public-license-nd'>Arma Public License No Derivatives</a></t>"
				,"Magazine Repack Script by SAKY"] call BIS_fnc_guiMessage;
			};
		}];	
		
		_MRS_GUI_BtnRepack ctrlAddEventHandler ["ButtonClick", {
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
			call MRS_fnc_Init_ListFrom;
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
		
		call MRS_fnc_Init_ListFrom;
	};
}];