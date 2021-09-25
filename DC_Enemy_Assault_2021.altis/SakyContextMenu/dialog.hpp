#include "\a3\ui_f\hpp\definecommoncolors.inc"

import ContextMenu from Display3DEN;
/*
import RscText from missionconfigfil;
import RscButtonMenuOK from missionconfigfil;
import RscXSliderH from missionconfigfil;

class RscTextSCM
{
	deletable = 0;
	fade = 0;
	access = 0;
	type = CT_STATIC;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = ST_LEFT;
	shadow = 1;
	colorShadow[] = {0,0,0,0.5};
	font = "RobotoCondensed";
	SizeEx = GUI_TEXT_SIZE_MEDIUM;
	linespacing = 1;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
};
*/

class SakyContextMenuBase{
	idd=10001;	
	controls[]=
	{
		SakyContextMenu
	};
	onKeyUp="params ['_displayOrControl', '_key', '_shift', '_ctrl', '_alt']; if(_key==0xDB) then {_displayOrControl closeDisplay 1};";
	
	class SakyContextMenu:ContextMenu{
		x=getMousePosition#0;
		y=getMousePosition#1;	
		class Items
		{
			items[]=
			{				
				"gestureBase",
				"Separator",
				"chemStrobe",
				"flagBase",
				"Separator",
				"weaponBack",
				"earPlugBase"
			};		
			class chemStrobe
			{
				text = "야광봉/스트로브 부착";
				items[]=
				{
					"chemStrobeRemove",
					"chemStrobeGreen",
					"chemStrobeRed",
					"chemStrobeYellow",
					"chemStrobeBlue",
					"chemStrobeIR"
				};		
			};	
			class flagBase{
				text = "피아식별깃발 부착";
				items[]=
				{
					"flagEmpty",
					"flagBlufor",
					"flagCSAT",
					"flagRed",
					"flagGreen",
					"flagBlue",
					"flagWhite"
				};		
			};
			class gestureBase
			{
				text = "수신호";
				items[]=
				{					
					"gesture1",
					"gesture2",
					"gesture3",
					"gesture4",
					"gesture5",
					"gesture6"
				};
			};			
			class earPlugBase{
				text = "이어플러그 설정";
				items[]=
				{					
					"earPlugOn",
					"earPlugOff",
					"earPlugSetting"
				};
			};			
			class chemStrobeRemove{
				text = "야광봉/스트로브 제거";
				action = "call SCM_fnc_detachChemlight; call SCM_fnc_detachStrobe;";
			};						
			class chemStrobeGreen{
				text = "녹색 야광봉 부착";
				action = "'Chemlight_green' call SCM_fnc_attachChemlight";
				picture="a3\weapons_f\Data\UI\M_chemlight_green_CA.paa";
			};							
			class chemStrobeRed{
				text = "적색 야광봉 부착";
				action = "'Chemlight_red' call SCM_fnc_attachChemlight";
				picture="a3\weapons_f\Data\UI\M_chemlight_red_CA.paa";
			};							
			class chemStrobeYellow{
				text = "황색 야광봉 부착";
				action = "'Chemlight_yellow' call SCM_fnc_attachChemlight";
				picture="a3\weapons_f\Data\UI\M_chemlight_yellow_CA.paa";
			};							
			class chemStrobeBlue{
				text = "청색 야광봉 부착";
				action = "'Chemlight_blue' call SCM_fnc_attachChemlight";
				picture="a3\weapons_f\Data\UI\M_chemlight_blue_CA.paa";
			};							
			class chemStrobeIR{
				text = "IR 스트로브 부착";
				action = "call SCM_fnc_attachStrobe";
				picture="a3\weapons_f_epb\Ammo\Data\UI\gear_B_IRstrobe_CA.paa";
			};				
			class gesture1
			{
				text = "진격하라";
				action = "['gestureAdvance', '앞으로 진격!'] call SCM_fnc_playGesture";
			};		
			class gesture2
			{
				text = "사격중지";
				action = "['gestureCeaseFire', '사격 중지! 사격 중지!'] call SCM_fnc_playGesture";
			};		
			class gesture3
			{
				text = "사격개시";
				action = "['gestureGo', '사격 개시!'] call SCM_fnc_playGesture";
			};		
			class gesture4
			{
				text = "따라와라";
				action = "['gestureFollow', '이쪽으로 와!'] call SCM_fnc_playGesture";
			};	
			class gesture5
			{
				text = "엄폐하라";
				action = "['gestureCover', '엄폐물에 숨어라!'] call SCM_fnc_playGesture";
			};				
			class gesture6
			{
				text = "멈춰라";
				action = "['gestureFreeze', '멈춰!'] call SCM_fnc_playGesture";
			};				
			class flagBlufor
			{
				text = "NATO 깃발 장착";
				action = "'\A3\Data_F\Flags\Flag_nato_CO.paa' call SCM_fnc_forceFlagTexture";
				picture="\A3\Data_F\Flags\Flag_nato_CO.paa";
			};
			class flagCSAT
			{
				text = "CSAT 깃발 장착";
				action = "'\A3\Data_F\Flags\Flag_csat_CO.paa' call SCM_fnc_forceFlagTexture";
				picture="\A3\Data_F\Flags\Flag_csat_CO.paa";
			};
			class flagRed
			{
				text = "적색 깃발 장착";
				action = "'\A3\Data_F\Flags\Flag_red_CO.paa' call SCM_fnc_forceFlagTexture";
				picture="\A3\Data_F\Flags\Flag_red_CO.paa";
			};
			class flagGreen
			{
				text = "녹색 깃발 장착";
				action = "'\A3\Data_F\Flags\Flag_green_CO.paa' call SCM_fnc_forceFlagTexture";
				picture="\A3\Data_F\Flags\Flag_green_CO.paa";
			};
			class flagBlue
			{
				text = "청색 깃발 장착";
				action = "'\A3\Data_F\Flags\Flag_blue_CO.paa' call SCM_fnc_forceFlagTexture";
				picture="\A3\Data_F\Flags\Flag_blue_CO.paa";
			};
			class flagWhite
			{
				text = "의료 깃발 장착";
				action = "'\A3\Data_F\Flags\flag_rcrystal_CO.paa' call SCM_fnc_forceFlagTexture";
				picture="\A3\Data_F\Flags\flag_rcrystal_CO.paa";
			};
			class flagEmpty
			{
				text = "깃발 장착 해제";
				action = "'' call SCM_fnc_forceFlagTexture";
			};
			class weaponBack
			{
				text = "무기 뒤로 매기";
				action = "player action ['SWITCHWEAPON', player, player, -1]";
			};
			
			class earPlugOn{
				text = "이어플러그 착용";
				action = "1 fadeSound (profileNamespace getVariable ['SCM_Earplug_Volume',50])/100";				
			};
			class earPlugOff{
				text = "이어플러그 해제";
				action = "1 fadeSound 1";				
			};
			class earPlugSetting{
				text = "이어플러그 볼륨 조절";
				action = "createDialog 'SakyEarplugSettingGUI'";				
			};
			
			class Separator{};		
			class Default{};
		};
	};
};

class SakyEarplugSettingGUI{
	idd=10002;	
	//movingEnable=1;
	controls[]=
	{
		RscText_1000,
		RscText_1001,
		RscSlider_1900,
		RscButton_1600
	};
	class RscText_1000: RscText
	{
		idc = 1000;
		x = 0.383333 * safezoneW + safezoneX;
		y = 0.4625 * safezoneH + safezoneY;
		w = 0.233333 * safezoneW;
		h = 0.1125 * safezoneH;
		colorBackground[] = GUI_BCG_MENU;
	};
	class RscText_1001: RscText
	{
		idc = 1001;
		text = "이어플러그 볼륨 조절"; //--- ToDo: Localize;
		x = 0.383333 * safezoneW + safezoneX;
		y = 0.4375 * safezoneH + safezoneY;
		w = 0.233333 * safezoneW;
		h = 0.025 * safezoneH;
		colorBackground[] = GUI_BCG_COLOR;
	};
	class RscSlider_1900: RscXSliderH
	{
		idc = 1900;
		x = 0.391667 * safezoneW + safezoneX;
		y = 0.48 * safezoneH + safezoneY;
		w = 0.216667 * safezoneW;
		h = 0.0275 * safezoneH;
		sliderRange[] = {0, 100};
		onSliderPosChanged = "params ['_control', '_newValue']; profileNamespace setVariable ['SCM_Earplug_Volume',_newValue]; _control ctrlSetTooltip format['%1%2',_newValue,'%']; 0 fadeSound _newValue/100;";
		onLoad = "params ['_displayOrControl', ['_config', configNull]]; _vol=profileNamespace getVariable ['SCM_Earplug_Volume',50]; _displayOrControl sliderSetPosition _vol; _displayOrControl ctrlSetTooltip format['%1%2',_vol,'%']; _displayOrControl sliderSetSpeed [10, 0.1, 0.1];";
	};
	class RscButton_1600: RscButtonMenuOK
	{
		idc = 2;
		style = ST_CENTER;
		x = 0.475 * safezoneW + safezoneX;
		y = 0.525 * safezoneH + safezoneY;
		w = 0.05 * safezoneW;
		h = 0.0375 * safezoneH;
	};
};

/*
$[1.063,["a",[["safezoneX","safezoneY","safezoneW","safezoneH"],"safezoneW / 60","safezoneH / 40","GUI_GRID"],0,0,0],[1000,"",[1,"",["0.383333 * safezoneW + safezoneX","0.4625 * safezoneH + safezoneY","0.233333 * safezoneW","0.1125 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.5],[-1,-1,-1,-1],"","-1"],[]],[1001,"",[1,"Title",["0.383333 * safezoneW + safezoneX","0.4375 * safezoneH + safezoneY","0.233333 * safezoneW","0.025 * safezoneH"],[-1,-1,-1,-1],[0,0,0,0.7],[-1,-1,-1,-1],"","-1"],[]],[1900,"",[1,"",["0.391667 * safezoneW + safezoneX","0.475 * safezoneH + safezoneY","0.216667 * safezoneW","0.0375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],[1600,"",[1,"OK",["0.475 * safezoneW + safezoneX","0.525 * safezoneH + safezoneY","0.05 * safezoneW","0.0375 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]]]
*/

/*
class ctMe{
	idd=100;
	controls[]=
	{
		CTMENU
	};
	class ContextMenu;	

	class CTMENU:ContextMenu
	{
		idc=1100;
		type=46;
		style = 0x00;
		shadow=1;	
		//x = 0.4 * safezoneW + safezoneX;
		//y = 0.5 * safezoneH + safezoneY;
		x=getMousePosition#0;
		y=getMousePosition#1;		
		w="0";
		h="0";
		sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
		font="RobotoCondensedLight";
		colorBorder[]={0,0,0,0};
		colorBackground[]={0.1,0.1,0.1,1};
		colorText[]={1,1,1,1};
		colorSelect[]={0,0,0,1};
		colorSelectBackground[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
		colorDisabled[]={1,1,1,0.25};
		colorPicture[]={1,1,1,1};
		colorPictureSelect[]={0,0,0,1};
		colorPictureDisabled[]={1,1,1,0.5};
		arrow="\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa";
		rowHeight=0;
		itemSpacingW=0.0099999998;
		itemSpacingH=0.0099999998;
		pictureCheckboxEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureCheckboxEnabled_ca.paa";
		pictureCheckboxDisabled="#(argb,8,8,3)color(0,0,0,0)";
		pictureRadioEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureRadioEnabled_ca.paa";
		pictureRadioDisabled="#(argb,8,8,3)color(0,0,0,0)";
		class Items
		{
			items[]=
			{
				"gesture",
				"entry1",
				"Separator",
				"radioToggle",
				"holster",
				"earplug",
				"Separator",
				"extmenu"
			};
			class Separator
			{
				value=0;
			};
			class entry1
			{
				text = "스트로브/야광봉 사용";
				action = "systemchat ""Selected first entry."";";
				conditionShow="1";
				items[]=
				{
					"entry2",
					"entry3",
					"entry4",
					"entry5",
					"entry6",
					"Separator",
					"entry7"
				};
			};
			class entry2
			{
				text = "IR스트로브 켜기";
				action = "[] spawn LALA_fnc_IRStrobeOn;";
				picture="a3\weapons_f_epb\Ammo\Data\UI\gear_B_IRstrobe_CA.paa";
				conditionShow="1";
			};
			class entry3
			{
				text = "녹색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn1;";
				picture="a3\weapons_f\Data\UI\M_chemlight_green_CA.paa";
				conditionShow="1";
			};
			class entry4
			{
				text = "황색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn2;";
				picture="a3\weapons_f\Data\UI\M_chemlight_yellow_CA.paa";
				conditionShow="1";
			};
			class entry5
			{
				text = "청색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn3;";
				picture="a3\weapons_f\Data\UI\M_chemlight_blue_CA.paa";
				conditionShow="1";
			};
			class entry6
			{
				text = "적색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn4;";
				picture="a3\weapons_f\Data\UI\M_chemlight_red_CA.paa";
				conditionShow="1";
			};
			class entry7
			{
				text = "모두 끄기";
				action = "[] spawn LALA_fnc_IRStrobeOff;[] spawn LALA_fnc_IRchemOff1;";
				conditionShow="1";
			};	
			class gesture
			{
				text = "수신호";
				action = "";
				conditionShow="1";	
				items[]=
				{
					"gesture1",
					"gesture3",
					"gesture4",
					"gesture5",
					"gesture6",
					"Separator",
					"gesture7",
					"gesture71",
					"gesture8",
					"gesture9"
				};
			};	
			class gesture1
			{
				text = "진격하라";
				action = "player playAction ""gestureAdvance"";""앞으로 진격!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};		
			class gesture3
			{
				text = "사격중지";
				action = "player playAction ""gestureCeaseFire"";""사격중지! 사격중지!!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};		
			class gesture4
			{
				text = "사격개시";
				action = "player playAction ""gestureCover"";""사격 개시!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};		
			class gesture5
			{
				text = "따라와라";
				action = "player playAction ""gestureFollow"";""따라와!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};	
			class gesture6
			{
				text = "멈춰라";
				action = "player playAction ""gestureFreeze"";""정지!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};	
			class gesture7
			{
				text = "이륙 수신호";
				action = "[""Acts_JetsShooterShootingLaunch_loop_m""] spawn Test_PlayAnim;";				
				conditionShow="1";
			};	
			class gesture71
			{
				text = "유도 수신호";
				action = "[""Acts_JetsShooterNavigate_loop""] spawn Test_PlayAnim;";				
				conditionShow="1";
			};	
			class gesture8
			{
				text = "시동 수신호";
				action = "[""Acts_JetsMarshallingEnginesOn_loop""] spawn Test_PlayAnim;";
				conditionShow="1";
			};	
			class gesture9
			{
				text = "정지 수신호";
				action = "[""Acts_JetsMarshallingEmergencyStop_loop""] spawn Test_PlayAnim;";
				conditionShow="1";
			};				
			class radioToggle
			{
				text = "전술통신망 토글";
				action = "call Radio_Toggle;";
				picture = "\a3\weapons_f\data\ui\gear_item_radio_ca.paa";				
				conditionShow="1";
			};
			class earplug
			{
				text = "이어플러그 착용/해제";
				action = "call Test_Earplug";
				picture = "\A3\Characters_F_Orange\Headgear\Data\UI\icon_H_EarProtectors_orange_F_CA.paa";
				conditionShow="1";
			};									
			class holster
			{
				text = "무기 집어넣기";
				action = "call CRS_Holster";
				picture = "\a3\weapons_f\pistols\p07\data\ui\gear_p07_x_ca.paa";
				conditionShow="1";
			};								
			class extmenu
			{
				text = "추가설정메뉴";
				action = "[] spawn GRLIB_ExtMenu;";
				conditionShow="1";
			};
			class Default
			{
				text="";
				data="Empty";
				action = "systemchat ""Selected Nothing."";";
				enable=0;
			};
		};
	};
};
*/