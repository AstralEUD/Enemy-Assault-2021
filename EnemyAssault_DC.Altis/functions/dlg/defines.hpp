#includ "bisdefines.hpp"
class Ghst_RscText_WS : RscText{
	type = CT_STATIC;
	style = ST_LEFT;
	idc = -1;
	//colorText[] = {0.8784, 0.8471, 0.651, 1.0};//colorText[] = {0.2, .2, 0.2, 1};
	//colorBackground[] = {0, 0, 0, 0};//colorBackground[] = {0, 0, 0, 0};
	font = GUI_FONT_NORMAL;
	sizeEx = TXTSIZE;
	text = "";
};
class Ghst_RscTextMulti_WS: Ghst_RscText_WS {
	linespacing = 1;
	style = ST_LEFT + ST_MULTI + ST_NO_RECT;
};
class Ghst_RscStructuredText_WS : RscStructuredText{
	type = CT_STRUCTURED_TEXT;
	style = ST_LEFT;
	idc = -1;
	//colorText[] = {0.8784, 0.8471, 0.651, 1.0};//colorText[] = {1, 1, 1, 1};
	class Attributes
	{
		font = GUI_FONT_NORMAL;
		color = "#ffffff";
		align = "center";
		shadow = true;
	};
	text = "";
	size = 0.03;
};
class Ghst_RscButton_WS : RscButton {
	type = CT_BUTTON;
	style = ST_CENTER;
	idc = -1;
	font = GUI_FONT_NORMAL;
	sizeEx = TXTSIZE;
	default = false;
	/*
	colorText[] = {0.8784, 0.8471, 0.651, 1.0};//colorText[] = {0, 0, 0, 1};
	colorDisabled[] = {0.4, 0.4, 0.4, 1};//colorDisabled[] = {0.40, 0.40, 0.40, 1};
	colorBackground[] = {1, 0.537, 0, 0.5};//colorBackground[] = {1, 1, 1, 1};
	colorBackgroundDisabled[] = {0.95, 0.95, 0.95, 1};//colorBackgroundDisabled[] = {0.70, 0.70, 0.70, 0.80};
	colorBackgroundActive[] = {1, 0.537, 0, 1};//colorBackgroundActive[] = {1, 0.50, 0, 1};
	colorFocused[] = {1, 0.537, 0, 1};//colorFocused[] = {1, 0.50, 0, 1};
	colorShadow[] = {0.023529, 0, 0.0313725, 1};//colorShadow[] = {0.72, 0.36, 0, 0.80};
	colorBorder[] = {0.023529, 0, 0.0313725, 1};//colorBorder[] = {0.72, 0.36, 0, 0};
	soundEnter[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEnter", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundPush", 0.0, 0};
	soundClick[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundClick", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\Sound\RscButtonMenu\soundEscape", 0.09, 1};
	*/
	offsetX = 0.0030;
	offsetY = 0.0030;
	offsetPressedX = 0.0020;
	offsetPressedY = 0.0020;
	borderSize = 0.0;
};

class Ghst_RscListBox_WS : RscListBox{
	type = CT_LISTBOX;
	style = ST_LEFT;
	idc = -1;
	/*
	color[] = {1, 1, 1, 1};//added
	colorScrollbar[] = {0.95, 0.95, 0.95, 1};//added
	//colorSelect[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorSelect[] = {0.95, 0.95, 0.95, 1};//colorSelect[] = {0, 0.2, 0.4, 1};
	colorSelect2[] = {0.95, 0.95, 0.95, 1};//added
	colorSelectBackground[] = {0, 0, 0, 1};//colorSelectBackground[] = {0, 0.2, 0.4, 0.1};
	colorSelectBackground2[] = {0.8784, 0.8471, 0.651, 1.0};//added
	colorText[] = {0.8784, 0.8471, 0.651, 1.0};//colorText[] = {0.2, .2, 0.2, 1};
	colorBackground[] = {0.4, 0.4, 0.4, 0};//colorBackground[] = {0, 0, 0, 1};
	colorDisabled[] = {1,1,1,0.25};
	*/
	font = GUI_FONT_NORMAL;
	//sizeEx = 0.03921;//0.04;
	sizeEx = "(((((safezoneW / safezoneH) min 0.03921) / 0.03921) / 25) * 1)";
	rowHeight = 0.025;
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	maxHistoryDelay = ;
	autoScrollSpeed = ;
	autoScrollDelay = ;
	autoScrollRewind = ;
	/*
	class Ghst_ListScrollBar {
		color[] = {1, 1, 1, 0.6};
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};*/
};
class Ghst_RscPictureKeepAspect_WS : RscPictureKeepAspect {
	type = CT_STATIC;
	style = ST_PICTURE + ST_KEEP_ASPECT_RATIO;
	idc = -1;
	//colorbackground[] = {0.1961, 0.1451, 0.0941, 0.85};//colorBackground[] = {0, 0, 0, 0};
	//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {1, 1, 1, 1};
	font = GUI_FONT_NORMAL;
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
};
class Ghst_RscControlsGroup_WS {
	type = CT_CONTROLS_GROUP;
	style = ST_LEFT;
	idc = -1;
	class ScrollBar {};
	autoScrollRewind = ;
	autoScrollSpeed = ;
	autoScrollDelay = ;
	maxHistoryDelay = ;
	class VScrollbar {
		autoScrollRewind = ;
		autoScrollSpeed = ;
		autoScrollDelay = ;
		maxHistoryDelay = ;
		color[] = {1, 1, 1, 1};
		width = 0.0210;
	};
	class HScrollbar {
		autoScrollRewind = ;
		autoScrollSpeed = ;
		autoScrollDelay = ;
		maxHistoryDelay = ;
		color[] = {1, 1, 1, 1};
		height = 0;
		width = 0;
	};
};