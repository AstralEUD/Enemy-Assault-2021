//missionConfigFile >> "zlo_LoadOut_Dialog"
class zlo_LoadOut_Dialog
{
    idd = 456963;
    movingEnabled = false;
    class controls
    {////////////////////////////////////////////////////////
     // GUI EDITOR OUTPUT START (by ZeroAinz, v1.063, #Foziti)
     ////////////////////////////////////////////////////////

     class zlo_rscBackground: IGUIBack
     {
	 
     	idc = 2201;
		x = 0.287531 * safezoneW + safezoneX;//286531
		y = 0.21004 * safezoneH + safezoneY;
		w = 0.424812 * safezoneW;
		h = 0.566001 * safezoneH;
		onDestroy = "[] spawn zlo_fnc_exitESC";
	
	colorBackground[] = {0,0,0,1};
     };
	 
	class zlo_rscBackround2: IGUIBack
	{
		idc = 2200;
		text = "secondbk"; //--- ToDo: Localize;
		
	x = 0.288562 * safezoneW + safezoneX;//287562
	y = 0.2118 * safezoneH + safezoneY;
	w = 0.422812 * safezoneW;
	h = 0.561 * safezoneH;
	colorBackground[] = {0.2,0.2,0.2,1};
	};
	
	class zlo_rscBackround3: IGUIBack
	{
		idc = 2202;
		x = 0.288562 * safezoneW + safezoneX;
		y = 0.698 * safezoneH + safezoneY;
		w = 0.422812 * safezoneW;
		h = 0.076 * safezoneH;
	colorBackground[] = {0.4,0.4,0.4,1};//0.2/0.5/0.5/1
	//12 53 21 1
	//31 31 31 1
	};
     class zlo_vehicleimg: RscPicture
     {
     	idc = 1200;

     	text = "zload\img\wr.paa";
     	//style=0x800;
	x = 0.309219 * safezoneW + safezoneX;
	y = 0.2602 * safezoneH + safezoneY;
	w = 0.381563 * safezoneW;
	h = 0.418 * safezoneH;
	colorBackground[] = {1,1,1,1};
     };
     class zlo_pylon1Box: RscCombo
     {
     	idc = 2101;

     	text = "1"; //--- ToDo: Localize;
     	x = -0.494844 * safezoneW + safezoneX;
     	y = -0.291 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon2Box: RscCombo
     {
     	idc = 2102;

     	text = "2"; //--- ToDo: Localize;
     	x = -0.489687 * safezoneW + safezoneX;
     	y = -0.324 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon3Box: RscCombo
     {
     	idc = 2103;

     	text = "3"; //--- ToDo: Localize;
     	x = -0.484531 * safezoneW + safezoneX;
     	y = -0.357 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon4Box: RscCombo
     {
     	idc = 2104;

     	text = "4"; //--- ToDo: Localize;
     	x = -0.479375 * safezoneW + safezoneX;
     	y = -0.39 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon5Box: RscCombo
     {
     	idc = 2105;

     	text = "5"; //--- ToDo: Localize;
     	x = -0.474219 * safezoneW + safezoneX;
     	y = -0.423 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon6Box: RscCombo
     {
     	idc = 2106;

     	text = "6"; //--- ToDo: Localize;
     	x = -0.448438 * safezoneW + safezoneX;
     	y = -0.478 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon7Box: RscCombo
     {
     	idc = 2107;

     	text = "7"; //--- ToDo: Localize;
     	x = -0.474219 * safezoneW + safezoneX;
     	y = -0.533 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon8Box: RscCombo
     {
     	idc = 2108;

     	text = "8"; //--- ToDo: Localize;
     	x = -0.479375 * safezoneW + safezoneX;
     	y = -0.566 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon9Box: RscCombo
     {
     	idc = 2109;

     	text = "9"; //--- ToDo: Localize;
     	x = -0.484531 * safezoneW + safezoneX;
     	y = -0.599 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon10Box: RscCombo
     {
     	idc = 2110;

     	text = "10"; //--- ToDo: Localize;
     	x = -0.489687 * safezoneW + safezoneX;
     	y = -0.632 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon11Box: RscCombo
     {
     	idc = 2111;

     	text = "11"; //--- ToDo: Localize;
     	x = -0.494844 * safezoneW + safezoneX;
     	y = -0.6672 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon12Box: RscCombo
     {
     	idc = 2112;

     	text = "12"; //--- ToDo: Localize;
     	x = -0.546406 * safezoneW + safezoneX;
     	y = -0.478 * safezoneH + safezoneY;
     	w = -0.0928125 * safezoneW;
     	h = -0.022 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
     };
     class zlo_pylon13Box: RscCombo
       {
       	idc = 2113;

       	text = "13"; //--- ToDo: Localize;
       	x = -0.298931 * safezoneW + safezoneX;
       	y = -0.0819657 * safezoneH + safezoneY;
       	w = -0.0773343 * safezoneW;
       	h = -0.0330027 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
       };
     class zlo_pylon14Box: RscCombo
       {
       	idc = 2114;

       	text = "14"; //--- ToDo: Localize;
       	x = -0.298931 * safezoneW + safezoneX;
       	y = -0.125969 * safezoneH + safezoneY;
       	w = -0.0928012 * safezoneW;
       	h = -0.0330027 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
       };

    class zlo_comboPresets : RscCombo
    {
    	idc = 2115;
    	//Presets
     	//onLBSelChanged
	x = 0.559812 * safezoneW + safezoneX;
	y = 0.7112 * safezoneH + safezoneY;
	w = 0.0773217 * safezoneW;
	h = 0.0220018 * safezoneH;
     	soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
     	soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
     	soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
    };
     class zlo_camoBox: RscCombo
     {
     	idc = 2100;

     	text = "4.1camotext"; //--- ToDo: Localize;
	x = 0.559812 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.0773437 * safezoneW;
	h = 0.022 * safezoneH;
     };
     class zlo_buttonApply: RscButton
     {
       idc = 1601;
        action = "[] spawn zlo_fnc_SetPylons;";
	x = 0.644375 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
     };
     class zlo_text1: RscText
     {
     	idc = 1000;

	x = 0.494844 * safezoneW + safezoneX;
	y = 0.7508 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.011 * safezoneH;
     };
     class zlo_buttonExit: RscButton
     {
     	idc = 1600;
     	action = "closeDialog 0";
     	text = "X"; //--- ToDo: Localize;
	x = 0.690781 * safezoneW + safezoneX;
	y = 0.2206 * safezoneH + safezoneY;
	w = 0.0154689 * safezoneW;
	h = 0.022 * safezoneH;
     };
     class zlo_text2: RscText
     {
     	idc = 1001;

	x = 0.358719 * safezoneW + safezoneX;
	y = 0.7112 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
        };
     class zlo_text3: RscText
     {
        idc = 1002;

	x = 0.291791 * safezoneW + safezoneX;
	y = 0.7112 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
     };
     class zlo_text4: RscText
     {
     	idc = 1003;

	x = 0.291687 * safezoneW + safezoneX;
	y = 0.2206 * safezoneH + safezoneY;
	w = 0.386719 * safezoneW;
	h = 0.022 * safezoneH;
     };
	class zlo_creditText: RscText
	{
		idc = 1005;

	x = 0.291687 * safezoneW + safezoneX;
	y = 0.6716 * safezoneH + safezoneY;
	w = 0.412512 * safezoneW;
	h = 0.0330026 * safezoneH;
	colorText[] = {0.31,0.31,0.31,1};
	};
     class zlo_buttonReload: RscButton
     {
     	idc = 1603;

     	action = "[] spawn zlo_fnc_Ammo;";
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
     };
     class zlo_buttonRefuel: RscButton
     {
     	idc = 1604;
     	action = "[] spawn zlo_fnc_Refuel;";
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
	colorActive[] = {0.54,0.96,0,0.3};
     };
     class zlo_buttonRepair: RscButton
     {
     	idc = 1602;
     	action = "[] spawn zlo_fnc_Repair;";
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
     };

    class zlo_textPresetVibor: RscText
    {
    	idc = 1004;
    	text = localize "zlo_preset_text"; //--- ToDo: Localize;
	x = 0.494844 * safezoneW + safezoneX;
	y = 0.7112 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;
    };
	
	
	class zlo_btnMirror: RscButton
	{
		idc = 1605;
		text = Localize "zlo_mirror_text"; //--- ToDo: Localize;
		action ="[] spawn zlo_fnc_disableBtnMirror";
	x = 0.644375 * safezoneW + safezoneX;
	y = 0.7112 * safezoneH + safezoneY;
	w = 0.061875 * safezoneW;
	h = 0.022 * safezoneH;

	};
	class zlo_helpbutton: RscButton
	{
		idc = 1606;
		text = "?"; //--- ToDo: Localize;
	x = 0.675312 * safezoneW + safezoneX;
	y = 0.2206 * safezoneH + safezoneY;
	w = 0.0154689 * safezoneW;
	h = 0.022 * safezoneH;
	action = "[] spawn zlo_fnc_showHelp";
	};	
class zlo_checkRefuel: RscCheckbox
{
	idc = 2800;
	text = "ckboxrefuel"; //--- ToDo: Localize;
	x = 0.29375 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
class zlo_checkRepair: RscCheckbox
{
	idc = 2801;
	text = "checkboxRepair"; //--- ToDo: Localize;
	x = 0.360781 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
};
	class zlo_checkAmmo: RscCheckbox
	{
	idc = 2802;
	text = "checkBK";
	x = 0.427812 * safezoneW + safezoneX;
	y = 0.7442 * safezoneH + safezoneY;
	w = 0.0103125 * safezoneW;
	h = 0.022 * safezoneH;
	};
	class zlo_MirrorChek: RscCheckbox
	{
	idc = 2803;
	x = -0.427812 * safezoneW + safezoneX;
	y = -0.753 * safezoneH + safezoneY;
	w = -0.0103125 * safezoneW;
	h = -0.022 * safezoneH;
	};
	class zlo_buttonSavedPresets: RscButton
	{
		idc = 1607;
		
		action = "[] spawn zlo_fnc_showSavePresets;"; //--- ToDo: Localize;
		x = 0.427812 * safezoneW + safezoneX;
		y = 0.7112 * safezoneH + safezoneY;
		w = 0.061875 * safezoneW;
		h = 0.022 * safezoneH;
	};
     ////////////////////////////////////////////////////////
     // GUI EDITOR OUTPUT END
     ////////////////////////////////////////////////////////

    };
};
