////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by UNITnormal, v1.063, #Vurive)
////////////////////////////////////////////////////////
//missionConfigFile >> "TC_GUI"
class TC_GUI
{
	idd = 5900;
	OnLoad = "[] spawn fnc_TC_setup;";
	movingEnable = false;
	controls[] = {"TC_BG", "TC_Title", "TC_Text_Trait" , "TC_Close", "TC_List_Trait", "TC_Apply", "TC_Current_Trait_1", "TC_Current_Trait_2", "TC_ControlsGroup_Right"};
	objects[] = {};

	class TC_BG: TC_IGUIBack
	{
		idc = -1;
		x = 0.329375 * safezoneW + safezoneX;
		y = 0.318 * safezoneH + safezoneY;
		w = 0.34125 * safezoneW;
		h = 0.392 * safezoneH;
	};
	class TC_Title: TC_RscText
	{
		idc = -1;
		text = $STR_TC_MAIN_MENU_NAME;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.16 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class TC_Text_Trait: TC_RscText
	{
		idc = -1;
		text = $STR_TC_TRAIT;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.374 * safezoneH + safezoneY;
		w = 0.065625 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class TC_List_Trait: TC_RscListbox
	{
		idc = 5910;
		style = LB_TEXTURES;
		sizeEx = 0.035;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.150937 * safezoneW;
		h = 0.224 * safezoneH;
	};
	class TC_Close: TC_RscButton
	{
		idc = -1;
		text = $STR_TC_CLOSE_MENU;
		action = "closeDialog 0;";
		x = 0.611562 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.0459375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class TC_Apply: TC_RscButton
	{
		idc = 5940;
		text = $STR_TC_APPLY;
		x = 0.559062 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.0459375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class TC_Current_Trait_1: TC_RscText
	{
		idc = -1;
		text = $STR_TC_CURRENT_TRAIT;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.091875 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class TC_Current_Trait_2: TC_RscText
	{
		idc = 5950;
		sizeEx = 0.03;
		text = "<Placeholder>";
		x = 0.427812 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.124687 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class TC_ControlsGroup_Right: TC_RscControlsGroup
	{
		idc = -1;
		x = 0.506562 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.150937 * safezoneW;
		h = 0.224 * safezoneH;
		class Controls
		{
			class TC_Selected_Preset_Content: TC_RscStructuredText
			{
				idc = 5920;
				size = 0.035;
				x = 0 * safezoneW;
				y = 0 * safezoneH;
				w = 0.15 * safezoneW;
				h = 0.224 * safezoneH;
			};
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////