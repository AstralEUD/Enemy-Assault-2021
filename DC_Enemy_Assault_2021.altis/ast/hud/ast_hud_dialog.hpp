class AST_HUD_GUI
{
	idd = 11018;
	duration = 1e+1000;
	OnLoad = "[] spawn AST_fnc_hud_init;";
	fadein=0;
	fadeout=0;
	class Controls
	{
		class AST_HUD_INFO
		{
			type = 13;
			idc = 110181;
			x = safeZoneX + safeZoneW * 0.87625;
			y = safeZoneY + safeZoneH * 0.91444445;
			w = safeZoneW * 0.11625;
			h = safeZoneH * 0.07444445;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 4.25);
			colorBackground[] = {1,1,1,0};	
		};
		class AST_HUD_ALERT
		{
			type = 5;
			idc = 110182;
			x = safeZoneX + safeZoneW * 0.871875;
			y = safeZoneY + safeZoneH * 0.76888889;
			w = safeZoneW * 0.12375;
			h = safeZoneH * 0.13444445;
			style = 16;
			colorBackground[] = {0.77,0.51,0.08,0};
			colorDisabled[] = {0.77,0.51,0.08,0};
			colorSelect[] = {0.77,0.51,0.08,0};
			colorText[] = {0.2048,0.426752,0.239616,0.773592};
			font = "PuristaMedium";
			maxHistoryDelay = 0;
			rowHeight = 0;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 4.25);
		};
	};
};
