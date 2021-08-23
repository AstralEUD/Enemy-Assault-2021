class AST_arsenal_GUI
{
	idd = 1118;
	OnLoad = "[] spawn AST_fnc_arsenal_init;";
	//OnUnload = "";
	movingEnable = false;
	//controls[] = {"Background","AST_STORE_LIST","AST_STORE_TEXT1","AST_STORE_TEXT2","AST_STORE_PICTURE","AST_STORE_NAMETEXT","AST_STORE_DESCTEXT","AST_STORE_BUTTON","AST_CLOSEBUTTON"};
	//objects[] = {};
	class ControlsBackground
	{
		class Background
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.269375;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.46125;
			h = safeZoneH * 0.54888889;
			style = 128;
			text = "";
			colorBackground[] = {0.302,0.302,0.302,1};
			colorText[] = {0.302,0.302,0.302,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			shadow = 1;
			tooltipColorShade[] = {0.502,0.502,0.502,1};
			
		};
		
	};
	class Controls
	{
		class AST_STORE_LIST
		{
			type = 5;
			idc = 11181;
			x = safeZoneX + safeZoneW * 0.29394532;
			y = safeZoneY + safeZoneH * 0.32291667;
			w = safeZoneW * 0.14355469;
			h = safeZoneH * 0.42013889;
			style = 16;
			colorBackground[] = {0.6,0.6,0.6,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelect[] = {1,1,0.4,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.4) / 1.2) / 25) * 1.25);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1.0};
			class ListScrollBar
			{
				color[] = {1,1,1,1};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
				
			};
			
		};
		class AST_STORE_TEXT1
		{
			type = 13;
			idc = 11182;
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.265;
			h = safeZoneH * 0.03777778;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class AST_STORE_TEXT2
		{
			type = 13;
			idc = 11183;
			x = safeZoneX + safeZoneW * 0.58625;
			y = safeZoneY + safeZoneH * 0.25;
			w = safeZoneW * 0.07;
			h = safeZoneH * 0.03777778;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {1,1,1,0};
			class Attributes
			{
				
			};
			
		};
		class AST_STORE_PICTURE
		{
			type = 0;
			idc = 11184;
			x = safeZoneX + safeZoneW * 0.46484375;
			y = safeZoneY + safeZoneH * 0.39583334;
			w = safeZoneW * 0.24121094;
			h = safeZoneH * 0.20833334;
			style = 0+48;
			text = "";
			colorBackground[] = {0.2,0.2,0.2,1};
			colorText[] = {0.2235,0.4588,0.7843,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class AST_STORE_NAMETEXT
		{
			type = 0;
			idc = 11185;
			x = safeZoneX + safeZoneW * 0.46484375;
			y = safeZoneY + safeZoneH * 0.32291667;
			w = safeZoneW * 0.24121094;
			h = safeZoneH * 0.03819445;
			style = 0;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class AST_STORE_DESCTEXT
		{
			type = 0;
			idc = 11186;
			x = safeZoneX + safeZoneW * 0.46484375;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.16796875;
			h = safeZoneH * 0.08680556;
			style = 0;
			text = "";
			colorBackground[] = {0.502,0.502,0.502,1};
			colorText[] = {0,0,0,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			
		};
		class AST_STORE_BUTTON
		{
			type = 1;
			idc = 11187;
			x = safeZoneX + safeZoneW * 0.66015625;
			y = safeZoneY + safeZoneH * 0.63888889;
			w = safeZoneW * 0.04589844;
			h = safeZoneH * 0.08680556;
			style = 0;
			text = "구매";
			borderSize = 0;
			colorBackground[] = {0.4,0.4,0.4,1};
			colorBackgroundActive[] = {1,1,1,1};
			colorBackgroundDisabled[] = {0.4,0.4,0.4,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.2,0.2,0.2,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {0.9137,0.9098,0.8588,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "call AST_fnc_arsenal_Clicked;";
			
		};
		class AST_CLOSEBUTTON
		{
			type = 16;
			idc = 11188;
			x = safeZoneX + safeZoneW * 0.66875;
			y = safeZoneY + safeZoneH * 0.24888889;
			w = safeZoneW * 0.0375;
			h = safeZoneH * 0.03777778;
			style = 0;
			text = "[ X ]";
			animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureDisabled = "#(argb,8,8,3)color(0.2,0.2,0.2,1)";
			animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
			animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
			animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {1,1,1,1};
			color2[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorBackground2[] = {0.102,0.102,0.102,1};
			colorBackgroundFocused[] = {0,0,0,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {1,1,1,1};
			font = "PuristaMedium";
			action = "closeDialog 0;";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
			textureNoShortcut = "";
			class HitZone
			{
				top = 0;
				right = 0;
				bottom = 0;
				left = 0;
				
			};
			class ShortcutPos
			{
				top = 0;
				left = 0;
				w = 0;
				h = 0;
				
			};
			class TextPos
			{
				top = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2;
				right = 0.005;
				bottom = 0;
				left = 0.25 * (((safezoneW / safezoneH) min 1.2) / 40);
				
			};
		};
	};
};
