class AST_HUD_GUI
{
	idd = 11018;
	duration = 1e+14;
	OnLoad = "uiNamespace setVariable ['AST_HUD_GUI', _this select 0];";
	fadein=0;
	fadeout=0;
	class Controls
	{
		// Background panel for player info - top left with adjusted size
		class AST_HUD_PLAYER_INFO_BACK
		{
			type = 0; // Static
			idc = 110186;
			x = safeZoneX + safeZoneW * 0.01; // Left side
			y = safeZoneY + safeZoneH * 0.02; // Top
			w = safeZoneW * 0.11; // Wider to fit original text
			h = safeZoneH * 0.07; // Short height
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.3};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = 0;
		};
		
		// Player info display - top left
		class AST_HUD_PLAYER_INFO
		{
			type = 13; // CT_STRUCTURED_TEXT
			idc = 110187;
			x = safeZoneX + safeZoneW * 0.012; // Left side
			y = safeZoneY + safeZoneH * 0.022; // Top
			w = safeZoneW * 0.105; // Wider to fit original text
			h = safeZoneH * 0.066; // Short height
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.7); // Smaller text
			colorBackground[] = {0,0,0,0};
			class Attributes {
				font = "PuristaMedium";
				color = "#FFFFFF";
				align = "left";
				shadow = "1";
			};
		};
		// Background panel for main HUD
		class AST_HUD_BACK
		{
			type = 0; // Static
			idc = 110180;
			x = safeZoneX + safeZoneW * 0.875;
			y = safeZoneY + safeZoneH * 0.96;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.07;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = 0;
		};
		
		// Background design element - left border
		class AST_HUD_BACK_BORDER_LEFT
		{
			type = 0; // Static
			idc = 110183;
			x = safeZoneX + safeZoneW * 0.875;
			y = safeZoneY + safeZoneH * 0.96;
			w = safeZoneW * 0.002;
			h = safeZoneH * 0.07;
			style = 0;
			text = "";
			colorBackground[] = {0.6,0.8,1,0.8}; // Blue accent
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// Icon for credits
		class AST_HUD_ICON
		{
			type = 0; // Static
			idc = 110185;
			x = safeZoneX + safeZoneW * 0.878;
			y = safeZoneY + safeZoneH * 0.965;
			w = safeZoneW * 0.015;
			h = safeZoneH * 0.025;
			style = 48; // ST_PICTURE
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,0.8};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			text = "\A3\ui_f\data\map\markers\military\dot_CA.paa"; // 변경된 아이콘
		};
		
		// Main points display with updated styling
		class AST_HUD_INFO
		{
			type = 13; // CT_STRUCTURED_TEXT
			idc = 110181;
			x = safeZoneX + safeZoneW * 0.895;
			y = safeZoneY + safeZoneH * 0.965;
			w = safeZoneW * 0.095;
			h = safeZoneH * 0.06;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.7);
			colorBackground[] = {0,0,0,0};
			class Attributes {
				font = "PuristaSemiBold";
				color = "#FFFFFF";
				align = "right";
				shadow = "1";
			};
		};
		
		// Background for alerts (fades in/out with alerts)
		class AST_HUD_ALERT_BACK
		{
			type = 0; // Static
			idc = 110184;
			x = safeZoneX + safeZoneW * 0.875;
			y = safeZoneY + safeZoneH * 0.9;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.06;
			style = 0;
			text = "";
			colorBackground[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			moving = 0;
		};
		
		// Alert display with updated styling
		class AST_HUD_ALERT
		{
			type = 13; // CT_STRUCTURED_TEXT
			idc = 110182;
			x = safeZoneX + safeZoneW * 0.878;
			y = safeZoneY + safeZoneH * 0.905;
			w = safeZoneW * 0.115;
			h = safeZoneH * 0.05;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.6);
			colorBackground[] = {0,0,0,0};
			class Attributes {
				font = "PuristaBold";
				align = "center";
				shadow = "1";
			};
		};
	};
};
