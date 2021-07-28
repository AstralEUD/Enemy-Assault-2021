#include "def_vehsel.hpp"
#include "bisdefines.hpp"

class Ghst_RscText_WS : RscText{
	type = CT_STATIC;
	style = ST_LEFT;
	idc = -1;
	//colorText[] = {0.8784, 0.8471, 0.651, 1.0};//colorText[] = {0.2, .2, 0.2, 1};
	//colorBackground[] = {0, 0, 0, 0};//colorBackground[] = {0, 0, 0, 0};
	//font = GUI_FONT_NORMAL;
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
		//font = GUI_FONT_NORMAL;
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
	//font = GUI_FONT_NORMAL;
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
	//font = GUI_FONT_NORMAL;
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
	//font = GUI_FONT_NORMAL;
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

class SelectVehicle
{
  idd = DLG_VEH_IDD;
  movingEnable = 1;
  controlsBackground[] = {BACKGROUND1,BACKGROUND2,HEADER};
  class BACKGROUND1 : Ghst_RscText_WS{
	colorBackground[] = {0,0,0,0.5};
    //colorbackground[] = {0.1961, 0.1451, 0.0941, 0.85};//colorBackground[] = {.6, .6, .6, .8};
    text = ;
  	x = 0.2;
  	y = 0.1;
  	w = 0.4;
  	h = 0.8;
  	moving = 1;
  };
  class BACKGROUND2 : Ghst_RscText_WS {
	colorBackground[] = {0,0,0,0.5};
    //colorbackground[] = {0.1961, 0.1451, 0.0941, 0.85};//colorBackground[] = {.4, .4, .4, .8};
    text = ;
  	x = 0.6;
  	y = 0.1;
  	w = 0.4;
  	h = 0.8;
  	moving = 1;
  };
  class HEADER : Ghst_RscText_WS {
    x = 0.2;
    y = 0.1;
    w = 0.4;
    h = 0.06;
		moving = 0;
	colorBackground[] = {0,0,0,0.5};
    //colorbackground[] = {0.1961, 0.1451, 0.0941, 0.85};//colorBackground[] = {.2, .2, .2, .8};
		//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {1, .5, 0, .9};
    sizeEx = 0.04;
    text = "Available Vehicles";
  };

  objects[] = {};
  
  controls[] = {VEHLIST,VEHIMG,VEHNAME,VEHDESC_CTRL,VEHSEL,VEHclose};
  class VEHLIST : Ghst_RscListBox_WS {
  	idc = DLG_VEH_LIST;
  	x = 0.21;
  	y = 0.165;
  	w = 0.38;
  	h = 0.62;//0.72;
		//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {0, 0, 0, 1};
		//soundSelect[] = {"",0.1,1};
#ifdef VBS
  	onMouseMoving = "DLG_VEH_SEL=_this";
#endif
  	moving = 1;
  };
  class VEHNAME : Ghst_RscTextMulti_WS {
  	idc = DLG_VEH_NAME;
  	style = ST_CENTER;
  	x = 0.61;
  	y = 0.1;
  	w = 0.38;
  	h = 0.08;
    sizeEx = 0.04;
		//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {1, .5, 0, .9};
  	moving = 1;
  };
  class VEHIMG : Ghst_RscPictureKeepAspect_WS {
  	idc = DLG_VEH_PIC;
  	x = 0.61;
  	y = 0.15;
  	w = 0.37;
  	h = 0.28;
  	moving = 1;
  };
  class VEHDESC_CTRL: Ghst_RscControlsGroup_WS {
		x = .6;
		y = .44;
		w = .395;
		h = .4;
  	class Controls {
  		class VEHDESC: Ghst_RscStructuredText_WS {
		  	idc = DLG_VEH_DESC;
		  	x = 0;
		  	y = 0;
		  	w = 0.38;
		  	h = 0.8;
				//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {1, 1, 1, 1};
		  	moving = 1;
		  };
		};
  };

  class VEHSEL : Ghst_RscButton_WS
  {
  	idc = DLG_VEH_BTN;
  	x = 0.30;//0.61
  	y = 0.83;
  	w = 0.20;//0.38
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Use Selected";
  	action = "DLG_VEH_SELECTED = true;ghst_vehsel = ""go"";";
  };
  
  class VEHclose : VEHSEL
  {
  	idc = -1;
  	x = 0.80;
  	w = 0.10;
		sizeEx = 0.04;
	 	text = "Close";
  	action = "ghst_vehsel = ""none"";closeDialog 0;";
  };
  /*
  class VEHQTY : VEHLIST {
  	idc = DLG_VEH_QTY;
  	x = 0.55;//0.41;
  	y = 0.80;
  	w = 0.18;
  	h = 0.07;
		//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {0, 0, 0, 1};
		//soundSelect[] = {"",0.1,1};
#ifdef VBS
  	onMouseMoving = "DLG_VEH_QTY_SEL=_this";
#endif
  	moving = 1;
  };*/
};
/*
class SelectVehicleQty : SelectVehicle
{
  idd = DLG_QTY_IDD;
  movingEnable = 1;
  controlsBackground[] = {BACKGROUNDQTY};
  class BACKGROUNDQTY : Ghst_RscText_WS {
    //colorbackground[] = {0.1961, 0.1451, 0.0941, 0.85};//colorBackground[] = {.6, .6, .6, .8};
    text = ;
  	x = 0.8;//0.2;
  	y = 0.6;//0.84;
  	w = 0.2;
  	h = 0.2;
  	moving = 1;
  };

  objects[] = {};
  
  controls[] = {VEHQTY,OK};
  class VEHQTY : VEHLIST {
  	idc = DLG_VEH_QTY;
  	x = 0.81;//0.41;
  	y = 0.61;
  	w = 0.18;
  	h = 0.12;
		//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {0, 0, 0, 1};
		//soundSelect[] = {"",0.1,1};
#ifdef VBS
  	onMouseMoving = "DLG_VEH_QTY_SEL=_this";
#endif
  	moving = 1;
  };
  class OK : Ghst_RscButton_WS
  {
  	idc = DLG_QTY_BTN;
  	x = 0.81;//0.21;
  	y = 0.75;
  	w = 0.18;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Spawn QTY";
  	action = "DLG_QTY_SELECTED = true;";
  };
};
*/