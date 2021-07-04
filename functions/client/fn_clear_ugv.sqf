//Clear Pelter UGVs
//this addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Pelter UGVs</t>", "call ghst_fnc_clear_ugv", [], 1, false, false, "","alive _target"];
private ["_ugv_list","_count","_i"];

_ugv_list = allMissionObjects "UGV_02_Base_F";
_count = (count _ugv_list);

if (_count == 0) exitwith {hint "No Pelter UGVs deployed"};

{ deleteVehicle _x } forEach _ugv_list;

hint format ["%1 Pelter UGVs removed", _count];