////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by UNITnormal, v1.063, #Vurive)
////////////////////////////////////////////////////////
//missionConfigFile >> "PPAP_GUI"
class PPAP_GUI
{
	idd = 8900;
	OnLoad = "[] spawn fnc_PPAP_setup;";
	onUnload = "[] spawn fnc_PPAP_variable_cleaner;";
	movingEnable = false;
	controls[] = {"PPAP_BG", "PPAP_Title", "PPAP_Text_Preset" , "PPAP_Close", "PPAP_List_Preset", "PPAP_Apply", "PPAP_Current_Vehicle_1", "PPAP_Current_Vehicle_2", "PPAP_ControlsGroup_Right"};
	objects[] = {};

	class PPAP_BG: PPAP_IGUIBack
	{
		idc = -1;
		x = 0.329375 * safezoneW + safezoneX;
		y = 0.318 * safezoneH + safezoneY;
		w = 0.34125 * safezoneW;
		h = 0.392 * safezoneH;
	};
	class PPAP_Title: PPAP_RscText
	{
		idc = -1;
		text = $STR_PPAP_MAIN_MENU_NAME;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.16 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class PPAP_Text_Preset: PPAP_RscText
	{
		idc = -1;
		text = $STR_PPAP_PRESET;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.374 * safezoneH + safezoneY;
		w = 0.065625 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class PPAP_List_Preset: PPAP_RscListbox
	{
		idc = 8910;
		style = LB_TEXTURES;
		sizeEx = 0.035;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.150937 * safezoneW;
		h = 0.224 * safezoneH;
	};
	class PPAP_Close: PPAP_RscButton
	{
		idc = -1;
		text = $STR_PPAP_CLOSE_MENU;
		action = "closeDialog 0;";
		x = 0.611562 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.0459375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class PPAP_Apply: PPAP_RscButton
	{
		idc = 8940;
		text = $STR_PPAP_APPLY;
		x = 0.559062 * safezoneW + safezoneX;
		y = 0.332 * safezoneH + safezoneY;
		w = 0.0459375 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class PPAP_Current_Vehicle_1: PPAP_RscText
	{
		idc = -1;
		text = $STR_PPAP_CURRENT_VEHICLE;
		x = 0.3425 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.091875 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class PPAP_Current_Vehicle_2: PPAP_RscText
	{
		idc = 8950;
		sizeEx = 0.03;
		text = "<Placeholder>";
		x = 0.427812 * safezoneW + safezoneX;
		y = 0.654 * safezoneH + safezoneY;
		w = 0.124687 * safezoneW;
		h = 0.028 * safezoneH;
	};
	class PPAP_ControlsGroup_Right: PPAP_RscControlsGroup
	{
		idc = -1;
		x = 0.506562 * safezoneW + safezoneX;
		y = 0.416 * safezoneH + safezoneY;
		w = 0.150937 * safezoneW;
		h = 0.224 * safezoneH;
		class Controls
		{
			class PPAP_Selected_Preset_Content: PPAP_RscStructuredText
			{
				idc = 8920;
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