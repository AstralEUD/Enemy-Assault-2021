private ["_unit","_dam","_veh"];
_unit = _this select 0;
_dam = _this select 2;

if (! alive _unit || {_dam == 0}) exitWith {
	_dam
};/*
_veh = vehicle player;
if ((_dam >= 0.8) or (damage _veh) > 0.8) then {
	if !(_veh == player) then {
		unassignvehicle player;
		player action ["Eject", _veh];
	};
};*/
if (_dam >= 0.8) then {
	//[player, [missionNamespace, "GHST_Current_Gear"]] call bis_fnc_saveInventory;
	player setVariable ["GHST_Current_Gear",getUnitLoadout player];
	//call ghst_fnc_setrespawninventory;

};
BIS_hitArray = _this; BIS_wasHit = true;
_dam