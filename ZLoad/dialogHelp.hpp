//missionConfigFile >> "zlo_HelpDialog"
class zlo_HelpDialog
{
	idd = 456964;
	movingEnabled = false;
	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.329844 * safezoneW + safezoneX;//0.329844
			y = 0.302 * safezoneH + safezoneY;
			w = 0.340312 * safezoneW;
			h = 0.396 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 0.330906 * safezoneW + safezoneX;
			y = 0.303908 * safezoneH + safezoneY;
			w = 0.338281 * safezoneW;
			h = 0.392407 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 0.330833 * safezoneW + safezoneX;
			y = 0.303393 * safezoneH + safezoneY;
			w = 0.337813 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0.4,0.4,0.4,1};
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100; //--- ToDo: Localize;
			x = 0.330875 * safezoneW + safezoneX;
			y = 0.30772 * safezoneH + safezoneY;
			w = 0.317084 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "X"; //--- ToDo: Localize;
			action = "closeDialog 0";
			x = 0.647979 * safezoneW + safezoneX;
			y = 0.303274 * safezoneH + safezoneY;
			w = 0.0209895 * safezoneW;
			h = 0.0335926 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;//--- ToDo: Localize;
			x = 0.33449 * safezoneW + safezoneX;
			y = 0.357 * safezoneH + safezoneY;
			w = 0.330521 * safezoneW;
			h = 0.332778 * safezoneH;
		};
	};
};