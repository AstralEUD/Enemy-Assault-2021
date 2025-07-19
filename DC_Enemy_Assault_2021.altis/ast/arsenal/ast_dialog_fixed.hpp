class AST_arsenal_GUI
{
	idd = 1118;
	OnLoad = "[] spawn AST_fnc_arsenal_init;";
	movingEnable = false;
	
	class ControlsBackground
	{
		class MainBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.269375;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.46125;
			h = safeZoneH * 0.54888889;
			style = 0;
			text = "";
			colorBackground[] = {0.1,0.1,0.1,0.9}; // 어두운 배경
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 상단 헤더 배경
		class HeaderBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.269375;
			y = safeZoneY + safeZoneH * 0.22555556;
			w = safeZoneW * 0.46125;
			h = safeZoneH * 0.05;
			style = 0;
			text = "";
			colorBackground[] = {0.2,0.4,0.6,1}; // 블루 계열 헤더
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 좌측 패널 배경 (리스트)
		class LeftPanelBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.28;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.16;
			h = safeZoneH * 0.42;
			style = 0;
			text = "";
			colorBackground[] = {0.15,0.15,0.15,0.8};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 우측 패널 배경 (선택된 아이템)
		class RightPanelBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.45;
			y = safeZoneY + safeZoneH * 0.32;
			w = safeZoneW * 0.27;
			h = safeZoneH * 0.42;
			style = 0;
			text = "";
			colorBackground[] = {0.15,0.15,0.15,0.8};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 카테고리 배경
		class CategoryBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.28;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.44;
			h = safeZoneH * 0.03;
			style = 0;
			text = "";
			colorBackground[] = {0.15,0.15,0.15,0.8};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 하단 배경
		class BottomPanelBackground
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.28;
			y = safeZoneY + safeZoneH * 0.745;
			w = safeZoneW * 0.44;
			h = safeZoneH * 0.04;
			style = 0;
			text = "";
			colorBackground[] = {0.15,0.15,0.15,0.8};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
	};
	class Controls
	{
		// 메인 타이틀
		class AST_STORE_TITLE
		{
			type = 13; // CT_STRUCTURED_TEXT
			idc = 11182;
			x = safeZoneX + safeZoneW * 0.35;
			y = safeZoneY + safeZoneH * 0.23;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.04;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0};
			class Attributes {
				font = "PuristaBold";
				color = "#FFFFFF";
				colorLink = "#D09B43";
				align = "center";
				shadow = "1";
			};
		};
		
		// 포인트 표시 (상단 우측)
		class AST_STORE_PTS
		{
			type = 13; // CT_STRUCTURED_TEXT
			idc = 11183;
			x = safeZoneX + safeZoneW * 0.55;
			y = safeZoneY + safeZoneH * 0.23;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.04;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			colorBackground[] = {0,0,0,0};
			class Attributes {
				font = "PuristaBold";
				color = "#A3E0FF";
				align = "right";
				shadow = "1";
			};
		};
		
		// 아이템 리스트
		class AST_STORE_LIST
		{
			type = 5; // CT_LISTBOX
			idc = 11181;
			x = safeZoneX + safeZoneW * 0.285;
			y = safeZoneY + safeZoneH * 0.325;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.41;
			style = 16; // LB_MULTI
			colorBackground[] = {0,0,0,0.3};
			colorSelectBackground[] = {0.2,0.4,0.6,1};
			colorSelectBackground2[] = {0.2,0.4,0.6,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0.4,0.4,0.4,1};
			colorSelect[] = {1,1,1,1};
			colorSelect2[] = {1,1,1,1};
			colorPicture[] = {1,1,1,1};
			colorPictureSelected[] = {1,1,1,1};
			colorPictureDisabled[] = {1,1,1,0.5};
			colorScrollbar[] = {0.8,0.8,0.8,1};
			colorPictureRight[] = {1,1,1,1};
			colorPictureRightSelected[] = {1,1,1,1};
			colorPictureRightDisabled[] = {1,1,1,0.5};
			colorTextRight[] = {0.8,0.8,0.8,1};
			colorSelectRight[] = {0.8,0.8,0.8,1};
			colorSelect2Right[] = {0.8,0.8,0.8,1};
			font = "PuristaMedium";
			pictureColor[] = {1,1,1,1};
			rowHeight = 0.04;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
			class ListScrollBar {
				color[] = {1,1,1,0.6};
				colorActive[] = {1,1,1,1};
				colorDisabled[] = {1,1,1,0.3};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
		};
		
		// 선택된 아이템 이미지
		class AST_STORE_SELECTED_PIC
		{
			type = 0;
			idc = 11184;
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.33;
			w = safeZoneW * 0.15;
			h = safeZoneH * 0.15;
			style = 48; // ST_PICTURE
			text = "";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 선택된 아이템 이름
		class AST_STORE_SELECTED_NAME
		{
			type = 0;
			idc = 11185;
			x = safeZoneX + safeZoneW * 0.455;
			y = safeZoneY + safeZoneH * 0.5;
			w = safeZoneW * 0.26;
			h = safeZoneH * 0.04;
			style = 2;
			text = "아이템 선택해주세요...";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 선택된 아이템 설명
		class AST_STORE_SELECTED_DESC
		{
			type = 13; // CT_STRUCTURED_TEXT
			idc = 11186;
			x = safeZoneX + safeZoneW * 0.455;
			y = safeZoneY + safeZoneH * 0.55;
			w = safeZoneW * 0.26;
			h = safeZoneH * 0.08;
			style = 0;
			text = "";
			size = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			colorBackground[] = {0,0,0,0};
			class Attributes {
				font = "PuristaLight";
				color = "#FFFFFF";
				align = "left";
				shadow = "1";
			};
		};
		
		// 카테고리 버튼 - 전체 보기
		class AST_STORE_CAT_ALL
		{
			type = 1;
			idc = 11191;
			x = safeZoneX + safeZoneW * 0.28;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "전체";
			borderSize = 0;
			colorBackground[] = {0.2,0.4,0.6,1}; // Default: selected
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[0] call AST_fnc_arsenal_filter;";
			tooltip = "모든 무기 보기";
		};

		class AST_STORE_CAT_AR
		{
			type = 1;
			idc = 11192;
			x = safeZoneX + safeZoneW * 0.323;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "돌격소총";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[1] call AST_fnc_arsenal_filter;";
			tooltip = "돌격소총 보기";
		};

		class AST_STORE_CAT_DMR
		{
			type = 1;
			idc = 11193;
			x = safeZoneX + safeZoneW * 0.366;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "정밀소총";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[2] call AST_fnc_arsenal_filter;";
			tooltip = "정밀사격소총 보기";
		};

		class AST_STORE_CAT_SNIPER
		{
			type = 1;
			idc = 11194;
			x = safeZoneX + safeZoneW * 0.409;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "저격소총";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[3] call AST_fnc_arsenal_filter;";
			tooltip = "저격소총 보기";
		};

		class AST_STORE_CAT_SMG
		{
			type = 1;
			idc = 11195;
			x = safeZoneX + safeZoneW * 0.452;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "기관단총";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[4] call AST_fnc_arsenal_filter;";
			tooltip = "기관단총 보기";
		};

		class AST_STORE_CAT_MG
		{
			type = 1;
			idc = 11196;
			x = safeZoneX + safeZoneW * 0.495;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "기관총";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[5] call AST_fnc_arsenal_filter;";
			tooltip = "기관총 보기";
		};

		class AST_STORE_CAT_PISTOL
		{
			type = 1;
			idc = 11197;
			x = safeZoneX + safeZoneW * 0.538;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "권총";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[6] call AST_fnc_arsenal_filter;";
			tooltip = "권총 보기";
		};

		class AST_STORE_CAT_EXPLOSIVES
		{
			type = 1;
			idc = 11198;
			x = safeZoneX + safeZoneW * 0.581;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "폭발물";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[7] call AST_fnc_arsenal_filter;";
			tooltip = "폭발물 보기";
		};

		class AST_STORE_CAT_ACCESSORIES
		{
			type = 1;
			idc = 11199;
			x = safeZoneX + safeZoneW * 0.624;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "부착물";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[8] call AST_fnc_arsenal_filter;";
			tooltip = "부착물 보기";
		};

		class AST_STORE_CAT_OTHER
		{
			type = 1;
			idc = 11200;
			x = safeZoneX + safeZoneW * 0.667;
			y = safeZoneY + safeZoneH * 0.285;
			w = safeZoneW * 0.042;
			h = safeZoneH * 0.03;
			style = 0;
			text = "기타";
			borderSize = 0;
			colorBackground[] = {0.2,0.2,0.2,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaMedium";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[9] call AST_fnc_arsenal_filter;";
			tooltip = "기타 아이템 보기";
		};

		// 구매 버튼
		class AST_STORE_BUY
		{
			type = 1;
			idc = 11187;
			x = safeZoneX + safeZoneW * 0.605;
			y = safeZoneY + safeZoneH * 0.64;
			w = safeZoneW * 0.09;
			h = safeZoneH * 0.05;
			style = 0;
			text = "구매하기";
			borderSize = 0;
			colorBackground[] = {0.2,0.4,0.6,1};
			colorBackgroundActive[] = {0.3,0.5,0.7,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,0.8};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.5,0.5,0.5,0.8};
			colorFocused[] = {0.3,0.5,0.7,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaSemiBold";
			offsetPressedX = 0.01;
			offsetPressedY = 0.01;
			offsetX = 0.01;
			offsetY = 0.01;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1.0};
			onButtonClick = "[] call AST_fnc_arsenal_clicked;";
		};
		
		// 검색 필드
		class AST_STORE_SEARCH
		{
			type = 2; // CT_EDIT
			idc = 11192;
			x = safeZoneX + safeZoneW * 0.31;
			y = safeZoneY + safeZoneH * 0.75;
			w = safeZoneW * 0.12;
			h = safeZoneH * 0.03;
			style = 0;
			text = "";
			colorBackground[] = {0.05,0.05,0.05,1};
			colorText[] = {1,1,1,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {0.25,0.5,0.9,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			tooltip = "검색할 무기 이름을 입력하세요";
			onKeyUp = "[] spawn AST_fnc_arsenal_search_new;";
			autocomplete = "";
		};
		
		// 검색 아이콘
		class AST_STORE_SEARCH_ICON
		{
			type = 0;
			idc = -1;
			x = safeZoneX + safeZoneW * 0.28;
			y = safeZoneY + safeZoneH * 0.75;
			w = safeZoneW * 0.03;
			h = safeZoneH * 0.03;
			style = 48;
			text = "\a3\ui_f\data\IGUI\RscIngameUI\RscUnitInfo\icon_mg_ca.paa";
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,0.5};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		
		// 정렬 옵션 콤보 박스
		class AST_STORE_SORT
		{
			type = 4; // CT_COMBO
			idc = 11193;
			x = safeZoneX + safeZoneW * 0.55;
			y = safeZoneY + safeZoneH * 0.75;
			w = safeZoneW * 0.08;
			h = safeZoneH * 0.03;
			style = 16;
			colorSelect[] = {1,1,1,1};
			colorText[] = {0.8,0.8,0.8,1};
			colorBackground[] = {0.2,0.2,0.2,1};
			colorSelectBackground[] = {0.3,0.5,0.7,1};
			colorScrollbar[] = {0.8,0.8,0.8,1};
			colorDisabled[] = {0.4,0.4,0.4,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8);
			tooltip = "정렬 방식 선택";
			onLBSelChanged = "[] call AST_fnc_arsenal_sort;";
			
			arrowEmpty = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_ca.paa";
			arrowFull = "\A3\ui_f\data\GUI\RscCommon\rsccombo\arrow_combo_active_ca.paa";
			wholeHeight = 0.3;
			maxHistoryDelay = 1.0;
			soundSelect[] = {"\A3\ui_f\data\sound\RscCombo\soundSelect",0.1,1};
			soundExpand[] = {"\A3\ui_f\data\sound\RscCombo\soundExpand",0.1,1};
			soundCollapse[] = {"\A3\ui_f\data\sound\RscCombo\soundCollapse",0.1,1};
			
			class ComboScrollBar
			{
				color[] = {0.8,0.8,0.8,0.8};
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
			};
		};
		
		// 닫기 버튼
		class AST_CLOSEBUTTON
		{
			type = 1;
			idc = 11188;
			x = safeZoneX + safeZoneW * 0.7;
			y = safeZoneY + safeZoneH * 0.228;
			w = safeZoneW * 0.03;
			h = safeZoneH * 0.04;
			style = 2;
			text = "X";
			borderSize = 0;
			colorBackground[] = {0.5,0.1,0.1,1};
			colorBackgroundActive[] = {0.7,0.15,0.15,1};
			colorBackgroundDisabled[] = {0.2,0.2,0.2,1};
			colorBorder[] = {0,0,0,0};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorFocused[] = {0.7,0.15,0.15,1};
			colorShadow[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
			font = "PuristaBold";
			action = "closeDialog 0;";
			offsetX = 0.003;
			offsetY = 0.003;
			offsetPressedX = 0.002;
			offsetPressedY = 0.002;
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
			soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1.0};
			soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1.0};
			soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1.0};
			soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1.0};
		};
	};
};
