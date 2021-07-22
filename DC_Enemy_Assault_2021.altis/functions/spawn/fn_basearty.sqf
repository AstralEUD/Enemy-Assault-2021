//V1 by: Ghost
//if !(isserver) exitwith {};
/*
Spawn Artillery Support
ghst_arty = [["spawnmarkers","spawnmarkers2"],["unittype","unittype2"],dir,arty spacing[4,5,6],allowdamage? true/false,WEST] spawn ghst_fnc_basearty;
*/

_leader_pos = _this select 0;
_arty_type = _this select 1;
_dir = _this select 2;
_artyspacing = _this select 3;
_damg = _this select 4;
_side = _this select 5;

_veh_array = [];
_loop = true;
_artygrp1 = createGroup _side;
_artygrp1 setGroupIdGlobal ["%GroupNames :=: %GroupPlatoon","Guardian","Platoon1"];

{

_spawnarty1 = [(_leader_pos select 0) + (cos _dir * _x), (_leader_pos select 1) - (sin _dir * _x), (_leader_pos select 2)];

_crewtype = [_side,configFile >> "CfgVehicles" >> _arty_type] call bis_fnc_selectcrew;

_varty1 = createVehicle [_arty_type,_spawnarty1, [], 0, "NONE"];
_varty1 setdir _dir;
_varty1 setposatl _spawnarty1;

if ((_varty1 emptypositions "Commander") > 0) then {
	_artyman1 = _artygrp1 createUnit [_crewtype,_spawnarty1, [], 0, "NONE"];
	_artyman1 moveincommander _varty1;
	_artyman1 addEventHandler ["HandleDamage", {}];
	_artyman1 allowDamage false;
};
_artyman2 = _artygrp1 createUnit [_crewtype, _spawnarty1, [], 0, "NONE"];
_artyman2 moveingunner _varty1;
_varty1 lock true;

_cargoPositions = _varty1 emptyPositions "cargo";
	for "_x" from 0 to (_cargoPositions)-1 do {

		_artyman3 = _artygrp1 createUnit [_crewtype,_spawnarty1, [], 0, "NONE"];
		_artyman3 moveincargo _varty1;
		_artyman3 allowDamage false;
	};

if !(_damg) then {
	{
	_x addEventHandler ["HandleDamage", {}];
	_x allowDamage false;
	} foreach [_varty1,_artyman2];
};

_artygrp1 setFormDir _dir;

_veh_array pushback _varty1;

} foreach _artyspacing;

ghst_artillery synchronizeObjectsAdd [(leader _artygrp1)];
(leader _artygrp1) synchronizeObjectsAdd [ghst_artillery];

while {_loop} do {
	
	{if (alive _x) then {
	
		_x setfuel 1;
		_x setVehicleAmmo 1;
		} else {
		
		_veh_array = _veh_array - [_x];
		deletevehicle _x;
		
		};
	
	} foreach _veh_array;
	
	if (count _veh_array == 0) exitwith {_loop = false;};
	
	sleep 300;

};

//diag_log "BASE ARTILLERY SCRIPT END!";

if (true) exitwith {};