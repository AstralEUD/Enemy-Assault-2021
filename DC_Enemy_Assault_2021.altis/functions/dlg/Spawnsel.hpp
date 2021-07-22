////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Ghost, v1.063, #Lozary)
////////////////////////////////////////////////////////

class ghst_Dual_listbox
{
		idd = 1900
		movingEnabled = false;
		
		class controls
		{
			class ghst_IGUIBack: IGUIBack
			{
				idc = 2200;
				x = 0.29375 * safezoneW + safezoneX;
				y = 0.225 * safezoneH + safezoneY;
				w = 0.4125 * safezoneW;
				h = 0.55 * safezoneH;
			};
			class ghst_RscButton: RscButton
			{
				x = 0.386562 * safezoneW + safezoneX;
				y = 0.731 * safezoneH + safezoneY;
				w = 0.020625 * safezoneW;
				h = 0.022 * safezoneH;
				action = "closeDialog 0";
			};
			class ghst_RscButton2: RscButton
			{
				x = 0.592812 * safezoneW + safezoneX;
				y = 0.731 * safezoneH + safezoneY;
				w = 0.04125 * safezoneW;
				h = 0.022 * safezoneH;
				action = "closeDialog 0";
			};
			class ghst_RscListbox: RscListbox
			{
				idc = 1500;
				x = 0.314375 * safezoneW + safezoneX;
				y = 0.291 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.418 * safezoneH;
				onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
				onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
				onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
				onMouseMoving = "";
				onMouseHolding = "";

				onLBSelChanged = "systemChat str ['onLBSelChanged',_this]; false";
				onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";
			};
			class ghst_RscListbox2: RscListbox
			{
				idc = 1501;
				x = 0.520625 * safezoneW + safezoneX;
				y = 0.291 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.418 * safezoneH;
			};
			class ghst_RscText: RscText
			{
				idc = 1000;
				text = "Select First Vehicle"; //--- ToDo: Localize;
				x = 0.314375 * safezoneW + safezoneX;
				y = 0.247 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.022 * safezoneH;
			};
			class ghst_RscText2: RscText
			{
				idc = 1001;
				text = "Select Second Vehicle"; //--- ToDo: Localize;
				x = 0.520625 * safezoneW + safezoneX;
				y = 0.247 * safezoneH + safezoneY;
				w = 0.165 * safezoneW;
				h = 0.022 * safezoneH;
			};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
