class EmtpyLine1
{
	title = ":: Mission Settings ::";
	values[]={0,0};
	texts[]={ "",""};
	default = 0;
};
class paramDaytimeHour
{
	title = "    Time of Day:";
	values[] = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,0};
	texts[] = {"0100","0200","0300","0400","0500","0600","0700","0800","0900","1000","1100","1200","1300","1400","1500","1600","1700","1800","1900","2000","2100","2200","2300","2400","Random"};
	default = 0;
};
/*
//class paramDaytimeHour
#define DAYTIMEHOUR_DEFAULT	12
#include "\a3\functions_f\Params\paramDaytimeHour.hpp"
*/
/*
class PARAM_Rain
{
	title= "    Weather Setting:";
	values[]= {0,1,3,6,90,99};
	texts[]= {"Random Weather and No Rain","Random Weather and Rain","%30 Rain","%60 Rain","Stormy Heavy Rain","Stormy no Rain"};
	default= 1;
};
*/
class PARAM_Fog
{
	title= "    Fog Setting:";
	values[]= {1,0,10,20,30,40,50,60,70,80,90,100};
	texts[]= {"Random Fog","0% Fog","10% Fog","20% Fog","30% Fog","40% Fog","50% Fog","60% Fog","70% Fog","80% Fog","90% Fog","100% Fog"};
	default= 1;
};
class PARAM_Overcast
{
	title= "    Overcast Setting:";
	values[]= {1,0,10,20,30,40,50,60,70,80,90,100};
	texts[]= {"Random Overcast","0% Overcast","10% Overcast","20% Overcast","30% Overcast","40% Overcast","50% Overcast","60% Overcast","70% Overcast","80% Overcast","90% Overcast","100% Overcast"};
	default= 1;
};
class PARAM_Teamdead
{
	title = "    Fail Mission when Team is killed:";
	values[] = {1,0};
	texts[] = {"Yes","No"};
	default = 0;
};
class PARAM_AISkill
{
	title= "    AI Accuracy and Speed Skill:";
	values[]= { 1,2,3,4,5,6,7,8,9,10 };
	texts[]= { "0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1.0" };
	default= 2;
	code = "";
};
class headlessClient
{
	title="    Headless Client:";
	texts[]={"Disabled","Enabled"};
	values[]={0,1};
	default=0;
	function="ghst_fnc_headlessclient";
	isGlobal=0;
};
class PARAM_EnemyType
{
	title = "    What Type of Default Enemy to Fight:";
	values[] = {99,0,1,2};
	texts[] = {"Random Default","Iranian","Iranian Jungle","Greek"};
	default = 99;
};
class PARAM_Tasks
{
	title = "    Number of Tasks:";
	values[] = {8,7,6,5,4,3,2,1};
	texts[] = {"8","7","6","5","4","3","2","1"};
	default = 10;
};
class PARAM_TASKTYPES
{
	title = "    Type of Tasks:";
	values[] = {1,0};
	texts[] = {"JTAC Task Types","ALL Task Types"};
	default = 0;
};
class PARAM_CONVOYTASK
{
	title = "    Convoy Task:";
	values[] = {1,0};
	texts[] = {"Have Convoy Task","No Convoys"};
	default = 0;
};
class PARAM_NUMOBJ
{
	title = "    Number of Locations:";
	values[] = {3,2,0};
	texts[] = {"ALL","Half","Random"};
	default = 3;
};
class PARAM_Fatigue
{
	title = "    Player Stamina:";
	values[] = {1,0};
	texts[] = {"ON","OFF"};
	default = 0;
};
class PARAM_AimSway
{
	title = "    Player Aiming Sway:";
	values[] = {100,2,3,4,5,6,7,8,9};
	texts[] = {"default","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7"};
	default = 2;
};
class PARAM_PMARKERS
{
	title = "    Player Markers:";
	values[] = {1,0};
	texts[] = {"ON","OFF"};
	default = 1;
};
class PARAM_PIFF
{
	title = "    Player IFF:";
	values[] = {1,0};
	texts[] = {"ON","OFF"};
	default = 0;
};
class PARAM_PlayerVehicles
{
	title = "    Number of Player Vehicles Allowed:";
	values[] = {1,2,3,4,5,6};
	texts[] = {"1","2","3","4","5","6"};
	default = 2;
};
class PARAM_MAX_GRP_NUM
{
	title = "    Max Friendly AI Count";
	values[] = {1,2,3,4,5,6,7,8,9,10,11,12};
	texts[] = {"1","2","3","4","5","6","7","8","9","10","11","12"};
	default = 3;
};
class PARAM_Cooldowns
{
	title = "    Support Cooldown Timers in Minutes:";
	values[] = {2,5,10,15,20,25,30};
	texts[] = {"2","5","10","15","20","25","30"};
	default = 2;
};
class EmtpyLine2
{
	title = ":: Mod Settings ::";
	values[]={0,0};
	texts[]={ "",""};
	default = 0;
};
class PARAM_RHS
{
	title = "    USE RHS Escalation:";
	values[] = {0,1};
	texts[] = {"No RHS Escalation","USE RHS Escalation"};
	default = 1;
};
class PARAM_EnemyTypeRHS
{
	title = "    What Type of RHS Enemy to Fight:";
	values[] = {99,0,1,2};
	texts[] = {"Random Russian","Russian Flora","Russian EMR","Russian EMR Desert"};
	default = 99;
};
class PARAM_FIRAIR
{
	title = "    USE FIR FA16/F15/A10:";
	values[] = {0,1};
	texts[] = {"No FIR AIR","USE FIR AIR"};
	default = 0;
};
/*class PARAM_HeadlessClient
{
	title = "Headless Client:";
	values[] = {1,0};
	texts[] = {"ON","OFF"};
	default = 0;
};
*/