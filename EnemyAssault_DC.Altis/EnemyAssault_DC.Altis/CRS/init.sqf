#include"CFG.sqf";

CRS_Holster=compileFinal preprocessFile"CRS\f\holster.sqf";

if(isClass(configFile>>"cfgPatches">>"ace_common"))exitWith{};
sleep 6;
execVM"CRS\f\CRS.sqf";