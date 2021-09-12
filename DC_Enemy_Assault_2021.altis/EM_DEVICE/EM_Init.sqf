EM_Infantry_List=[
"C_scientist_F",
"B_Helipilot_F",
"B_officer_F",
"I_officer_F",
"I_Story_Colonel_F",
"I_E_officer_F",
"I_E_officer_parade_F",
"O_Story_Colonel_F",
"O_Story_CEO_F",
"O_officer_F"];

EM_Object_List = [
"Land_DataTerminal_01_F",
"Land_Suitcase_F",
"Land_PlasticCase_01_large_F",
"Land_PlasticCase_01_medium_F",
"Land_PlasticCase_01_small_F",
"Land_MetalCase_01_large_F",
"Land_MetalCase_01_medium_F",
"Land_MetalCase_01_small_F",
"Land_PCSet_01_case_F",
"CBRNContainer_01_closed_yellow_F",
"CBRNContainer_01_closed_olive_F",
"Land_PlasticCase_01_large_black_F",
"Land_PlasticCase_01_large_black_CBRN_F",
"Land_PlasticCase_01_large_CBRN_F",
"Land_PlasticCase_01_large_olive_F",
"Land_PlasticCase_01_large_olive_CBRN_F",
"Land_PlasticCase_01_medium_black_F",
"Land_PlasticCase_01_medium_black_CBRN_F",
"Land_PlasticCase_01_medium_CBRN_F",
"Land_PlasticCase_01_medium_olive_F",
"Land_PlasticCase_01_medium_olive_CBRN_F",
"Land_PlasticCase_01_small_black_F",
"Land_PlasticCase_01_small_black_CBRN_F",
"Land_PlasticCase_01_small_CBRN_F",
"Land_PlasticCase_01_small_olive_F",
"Land_PlasticCase_01_small_olive_CBRN_F"];

EM_Mines_Mines=[
"BombCluster_03_UXO3_Ammo_F",
"BombCluster_02_UXO3_Ammo_F",
"BombCluster_01_UXO3_Ammo_F",
"BombCluster_03_UXO2_Ammo_F",
"BombCluster_02_UXO2_Ammo_F",
"BombCluster_01_UXO2_Ammo_F",
"BombCluster_03_UXO1_Ammo_F",
"BombCluster_02_UXO1_Ammo_F",
"BombCluster_01_UXO1_Ammo_F",
"BombCluster_03_UXO4_Ammo_F",
"BombCluster_01_UXO4_Ammo_F",
"BombCluster_02_UXO4_Ammo_F",
"UnderwaterMine_Range_Ammo",
"UnderwaterMineAB_Range_Ammo",
"UnderwaterMinePDM_Range_Ammo",
"SLAMDirectionalMine_Wire_Ammo",
"APERSBoundingMine_Range_Ammo",
"APERSMineDispenser_Mine_Ammo",
"APERSTripMine_Wire_Ammo",
"APERSMine_Range_Ammo",
"ATMine_Range_Ammo",
"TrainingMine_Ammo"];
EM_Mines_Remote=[
"APERSMineDispenser_Ammo",
"ClaymoreDirectionalMine_Remote_Ammo",
"SatchelCharge_Remote_Ammo",
"DemoCharge_Remote_Ammo"];
EM_Mines_IED=[
"IEDUrbanBig_Remote_Ammo",
"IEDLandBig_Remote_Ammo"];
EM_Mines_IEDs=[
"IEDUrbanSmall_Remote_Ammo",
"IEDLandSmall_Remote_Ammo"];

EM_Power_Inf = 1e-15;
EM_Power_Veh = 2e-14;
EM_Power_Air = 1e-15;
EM_Power_UAV = 1e-15;
EM_Power_Mine = 1e-15;
EM_Power_Tower = 1e-12;

EM_Gain_Max = 35;

EM_TrigTime = nil;
EM_AllowTransmit = false;

EM_Radios = [];
EM_Signal_Inf = [];
EM_Signal_Veh = [];
EM_Signal_Radio = [];
EM_Signal_Mine = [];
EM_Signal_Obj=[];

EM_AntennaPrevious = "nil";

EM_Debug = false;

EM_Hint_Flag1=false;
EM_Hint_Flag2=false;
EM_Hint_Flag3=false;
EM_Hint_Flag4=false;
EM_Hint_Flag5=false;

waitUntil{!isNull findDisplay 46};
EM_Beep = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Beep.sqf";
EM_CalcPower = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_CalcPower.sqf";
EM_Gain = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Gain.sqf";
EM_Log = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Log.sqf";
EM_Mine_Detonator = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Mine_Detonator.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_Transmitter.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_MouseEHs.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_EachFrame.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_Draw3D.sqf";

[] spawn {
	while {true} do {
		if (EM_Hint_Flag1) then {[["SpectrumDevice", "SpectrumDeviceMain1"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;};
		if (EM_Hint_Flag2) then {[["SpectrumDevice", "SpectrumDeviceMain2"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;};
		if (EM_Hint_Flag3) then {[["SpectrumDevice", "SpectrumDeviceMain3"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;};
		if (EM_Hint_Flag4) then {[["SpectrumDevice", "SpectrumDeviceMain4"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;};
		if (EM_Hint_Flag5) then {[["SpectrumDevice", "SpectrumDeviceMain5"], 15,"",35,"",true,true,true,true] call BIS_fnc_advHint;};
		sleep 1;
	};
};