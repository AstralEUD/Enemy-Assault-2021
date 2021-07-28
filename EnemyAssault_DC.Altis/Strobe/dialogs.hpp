class MS2000_DIALOG
{
	idd = -1;
	Movingenable = true;
	
	class Controls
	{

		class MS2K_BOX: BOXStrobe
		{ 
			idc = -1;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.264 * safezoneH;

		};
		class MS2K_FRAME: RscFrameStrobe
		{
			idc = -1;
			text = "MS2000"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.264 * safezoneH;
		};
		class MS2K_BTNON: RscButtonStrobe
		{
			idc = -1;
			text = "↑"; //--- ToDo: Localize;
			x = 0.334531 * safezoneW + safezoneX;
			y = 0.616 * safezoneH + safezoneY;
			w = 0.01289 * safezoneW;
			h = 0.0980 * safezoneH;
			action = "closeDialog 0;_nil=[]ExecVM ""Strobe\StrobeON.sqf""";
		};
		class RscPicture_1200: RscPictureStrobe
		{
			idc = -1;
			text = "Strobe\StrobeOFF.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class MS2K_TEXT: RscTextStrobe
		{
			idc = -1;
			text = "MS2000"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};

class MS2000_DIALOGON
{
	idd = -1;
	Movingenable = true;
	
	class Controls
	{

		class MS2K_BOXOON: BOXStrobe
		{ 
			idc = -1;
			text = "";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.264 * safezoneH;

		};
		class MS2K_FRAMEON: RscFrameStrobe
		{
			idc = -1;
			text = "MS2000"; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.264 * safezoneH;
		};
		class MS2K_BTNONON: RscButtonStrobe
		{
			idc = -1;
			text = "↓"; //--- ToDo: Localize;
			x = 0.334531 * safezoneW + safezoneX;
			y = 0.616 * safezoneH + safezoneY;
			w = 0.01289 * safezoneW;
			h = 0.0980 * safezoneH;
			action = "closeDialog 0;_nil=[]ExecVM ""Strobe\StrobeOFF.sqf""";
		};
		class RscPicture_1200: RscPictureStrobe
		{
			idc = -1;
			text = "Strobe\StrobeON.paa";
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class MS2K_TEXT: RscTextStrobe
		{
			idc = -1;
			text = "MS2000"; //--- ToDo: Localize;
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.434 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
		};
	};
};