params ["_pow"];
_group = group _pow;
_units = units _group;
{
	["rescue"] remoteExec ["ast_fnc_killalert", owner _x];
} forEach _units;