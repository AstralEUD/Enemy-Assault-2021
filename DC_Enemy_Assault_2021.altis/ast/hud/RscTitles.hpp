class AST_HUD_GUI
{
	idd = 11018;
	duration = 1e+14;
	OnLoad = "uiNamespace setVariable ['AST_HUD_GUI', _this select 0];";
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
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3);
			colorBackground[] = {1,1,1,0};
		};
		class AST_HUD_ALERT
		{
			type = 13;
			idc = 110182;
			x = safeZoneX + safeZoneW * 0.87625;
			y = safeZoneY + safeZoneH * 0.85666667;
			w = safeZoneW * 0.11625;
			h = safeZoneH * 0.07444445;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 3);
			colorBackground[] = {1,1,1,0};
		};	
	};
};
