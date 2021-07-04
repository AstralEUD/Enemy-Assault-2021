//call ghst_fnc_addzeusobjs;
//{_x addCuratorEditableObjects [(allMissionObjects "all"),true];} forEach allCurators;
{_x addCuratorEditableObjects [AllUnits + vehicles,true];} forEach allCurators;