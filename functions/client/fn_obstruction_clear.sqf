//obstruction cleanup
//this addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Obstruction</t>", { [] call ghst_fnc_obstruction_clear; }, [], 1, false, false, "","alive _target and _this == driver _target"];
private["_obj_array","_x","_check_radius","_veh","_dir","_pos"];

_obj_array = [];
_check_radius = 10;
_veh = vehicle player;
_dir = getdir _veh;
_pos = [(getposatl _veh select 0) + 10 * sin(_dir),(getposatl _veh select 1) + 10 * cos(_dir),(getposatl _veh select 2)];
{if (count crew _x == 0 and !((canmove _x) or (alive _x))) then {_obj_array pushback _x; deletevehicle _x};} foreach (nearestObjects [_pos, ["AllVehicles"], _check_radius]);
{_obj_array pushback _x; deletevehicle _x;} foreach (nearestObjects [_pos, ["Slingload_01_Base_F","Pod_Heli_Transport_04_base_F","USAF_MOABdisplay"], _check_radius]);
{_obj_array pushback _x; deletevehicle _x;} foreach nearestObjects [_pos,["CraterLong_small","CraterLong","WeaponHolder","GroundWeaponHolder"], _check_radius];
hint format ["%1 objects Cleared", count _obj_array];