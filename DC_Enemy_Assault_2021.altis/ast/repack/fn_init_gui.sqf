disableSerialization;
_t_MRS_GUI_Background = findDisplay 602 ctrlCreate["RscText", -1];
uiNamespace setVariable ["MRS_GUI_Background",_t_MRS_GUI_Background];
_t_MRS_GUI_Background ctrlSetPosition [0.267969 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.464062 * safezoneW,0.176 * safezoneH];
_t_MRS_GUI_Background ctrlSetBackgroundColor [0.05,0.05,0.05,0.7];
_t_MRS_GUI_Background ctrlCommit 0;

_t_MRS_GUI_Text0 = findDisplay 602 ctrlCreate["RscText", -1];
uiNamespace setVariable ["MRS_GUI_Text0",_t_MRS_GUI_Text0];
_t_MRS_GUI_Text0 ctrlSetPosition [0.273125 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.103125 * safezoneW,0.033 * safezoneH];	
_t_MRS_GUI_Text0 ctrlSetText "재포장할 탄약 선택";
_t_MRS_GUI_Text0 ctrlCommit 0;

_MRS_GUI_Text1 = findDisplay 602 ctrlCreate["RscText", -1];
uiNamespace setVariable ["MRS_GUI_Text1",_MRS_GUI_Text1];
_MRS_GUI_Text1 ctrlSetPosition [0.463906 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.103125 * safezoneW,0.033 * safezoneH];	
_MRS_GUI_Text1 ctrlSetText "포장 후 결과";
_MRS_GUI_Text1 ctrlCommit 0;

_MRS_GUI_ListFrom = findDisplay 602 ctrlCreate["RscListBox", 8500];
uiNamespace setVariable ["MRS_GUI_ListFrom",_MRS_GUI_ListFrom];
_MRS_GUI_ListFrom ctrlSetPosition [0.273125 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.132 * safezoneH];
_MRS_GUI_ListFrom ctrlCommit 0;

_MRS_GUI_ListTo = findDisplay 602 ctrlCreate["RscListBox", 8500];
uiNamespace setVariable ["MRS_GUI_ListTo", _MRS_GUI_ListTo];
_MRS_GUI_ListTo ctrlSetPosition [0.463906 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.132 * safezoneH];
_MRS_GUI_ListTo ctrlCommit 0;

_MRS_GUI_BtnRepack = findDisplay 602 ctrlCreate["RscButton", 8501];
uiNamespace setVariable ["MRS_GUI_BtnRepack",_MRS_GUI_BtnRepack];
_MRS_GUI_BtnRepack ctrlSetPosition [0.654688 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.0721875 * safezoneW,0.077 * safezoneH];
_MRS_GUI_BtnRepack ctrlSetText "탄창정리";
_MRS_GUI_BtnRepack ctrlEnable false;
_MRS_GUI_BtnRepack ctrlCommit 0;

_MRS_GUI_BtnReset = findDisplay 602 ctrlCreate["RscButton", 8502];
uiNamespace setVariable ["MRS_GUI_BtnReset",_MRS_GUI_BtnReset];
_MRS_GUI_BtnReset ctrlSetPosition [0.654688 * safezoneW + safezoneX,0.885 * safezoneH + safezoneY,0.0721875 * safezoneW,0.044 * safezoneH];
_MRS_GUI_BtnReset ctrlSetText "초기화";
_MRS_GUI_BtnReset ctrlEnable true;
_MRS_GUI_BtnReset ctrlCommit 0;	

_MRS_GUI_BtnInfo = findDisplay 602 ctrlCreate["RscButton", 8502];
uiNamespace setVariable ["MRS_GUI_BtnInfo",_MRS_GUI_BtnInfo];
_MRS_GUI_BtnInfo ctrlSetPosition [0.716563 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH];
_MRS_GUI_BtnInfo ctrlSetText "[ ? ]";
_MRS_GUI_BtnInfo ctrlEnable true;
_MRS_GUI_BtnInfo ctrlCommit 0;	