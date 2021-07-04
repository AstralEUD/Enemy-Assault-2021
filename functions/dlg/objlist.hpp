#include "def_vehsel.hpp"
//#include "defines.hpp"

class UseSelectedVehicle
{
  idd = DLG_USE_IDD;
  movingEnable = 1;
  controlsBackground[] = {BACKGROUND1,HEADER};
  class BACKGROUND1 : Ghst_RscText_WS {
	colorBackground[] = {0,0,0,0.5};
    //colorbackground[] = {0.1961, 0.1451, 0.0941, 0.85};//colorBackground[] = {.4, .4, .4, .8};
    text = ;
  	x = 0.2;
  	y = 0.1;
  	w = 0.4;
  	h = 0.76;
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
    text = "Available Objects";
  };

  objects[] = {};
  
  controls[] = {VEHLIST,OK};
  class VEHLIST : Ghst_RscListBox_WS {
  	idc = DLG_USE_LIST;
  	x = 0.21;
  	y = 0.165;
  	w = 0.38;
  	h = 0.62;//0.72;
		//colorText[] = {0.95, 0.95, 0.95, 1};//colorText[] = {0, 0, 0, 1};
		//soundSelect[] = {"",0.1,1};
#ifdef VBS
  	onMouseMoving = "DLG_VEH_USE_SEL = _this";
#endif
  	moving = 1;
  };
  class OK : Ghst_RscButton_WS
  {
  	idc = DLG_USE_BTN;
  	x = 0.3;
  	y = 0.8;
  	w = 0.18;
  	h = 0.04;
		sizeEx = 0.04;
	 	text = "Use Selected";
  	action = "DLG_USE_SELECTED = true;ghst_vehsel = ""go"";";
  };
};