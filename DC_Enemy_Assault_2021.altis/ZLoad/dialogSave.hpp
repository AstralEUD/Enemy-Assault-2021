//missionConfigFile >> "zlo_SaveDialog"
class zlo_SaveDialog
{
	idd = 456965;
	movingEnabled = false;
	class controls
	{////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by ZeroAinz, v1.063, #Zutefy)
		////////////////////////////////////////////////////////

		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;

			x = 0.414406 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.150573 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;

			x = 0.415437 * safezoneW + safezoneX;
			y = 0.303979 * safezoneH + safezoneY;
			w = 0.148489 * safezoneW;
			h = 0.392297 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 0.41585 * safezoneW + safezoneX;
			y = 0.30332 * safezoneH + safezoneY;
			w = 0.127864 * safezoneW;
			h = 0.031148 * safezoneH;

			colorBackground[] = {0.4,0.4,0.4,1};
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
	
			x = 0.4175 * safezoneW + safezoneX;
			y = 0.30772 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = ""; //--- ToDo: Localize;
			x = 0.421376 * safezoneW + safezoneX;
			y = 0.353017 * safezoneH + safezoneY;
			w = 0.10023 * safezoneW;
			h = 0.0196148 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.419149 * safezoneW + safezoneX;
			y = 0.382439 * safezoneH + safezoneY;
			w = 0.141065 * safezoneW;
			h = 0.274608 * safezoneH;
			LBSelChanged = "[] spawn zlo_fnc_savePreset";
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			action = "closeDialog 0";

			text = "X"; //--- ToDo: Localize;
			x = 0.543106 * safezoneW + safezoneX;
			y = 0.30354 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.0311481 * safezoneH;

		};
		class RscButton_1602: RscButton
		{
			idc = 1601;
			x = 0.526804 * safezoneW + safezoneX;
			y = 0.353017 * safezoneH + safezoneY;
			w = 0.03341 * safezoneW;
			h = 0.0196148 * safezoneH;
			action ="[] spawn zlo_fnc_savePreset";
		};
		class RscButton_1603: RscButton
		{
			idc = 1602;
			action = "[] spawn zlo_fnc_loadPreset";
			x = 0.467407 * safezoneW + safezoneX;
			y = 0.666855 * safezoneH + safezoneY;
			w = 0.0928056 * safezoneW;
			h = 0.0196148 * safezoneH;
		};
		class RscButton_1604: RscButton
		{
			idc = 1603;
			action = "[] spawn zlo_fnc_deletePreset";
			x = 0.419149 * safezoneW + safezoneX;
			y = 0.666855 * safezoneH + safezoneY;
			w = 0.0408345 * safezoneW;
			h = 0.0196148 * safezoneH;
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////

	};
};