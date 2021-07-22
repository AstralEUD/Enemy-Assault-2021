//V1.6.1 by: Ghost
//if !(isserver) exitwith {};
/*
Spawn AA Defence
ghst_aa = [["spawnmarkers","spawnmarkers2"],["unittype","unittype2"],[veh1,veh2],allowdamage? true/false,WEST] spawn ghst_fnc_basedef;
*/
_spawn_markers = _this select 0;
_aa_type_array = _this select 1;
_veh_array = _this select 2;
_damg = _this select 3;
_side = _this select 4;

_loop = true;
{

_spawnaa1 = getmarkerpos _x;
_dir = markerdir _x;

_aa_type = selectRandom _aa_type_array;

_aa1 = createGroup _side;
_crewtype = [_side,configFile >> "CfgVehicles" >> _aa_type] call bis_fnc_selectcrew;

_vaa1 = createVehicle [_aa_type,_spawnaa1, [], 0, "NONE"];
createVehicleCrew _vaa1;
_vaa1 setdir _dir;
_vaa1 setposatl _spawnaa1;
/*
if ((_vaa1 emptypositions "Commander") > 0) then {
	_aaman1 = _aa1 createUnit [_crewtype,_spawnaa1, [], 0, "NONE"];
	_aaman1 moveincommander _vaa1;
	_aaman1 addEventHandler ["HandleDamage", {}];
	_aaman1 allowDamage false;
};
_aaman2 = _aa1 createUnit [_crewtype, _spawnaa1, [], 0, "NONE"];
_aaman2 moveingunner _vaa1;
*/
_vaa1 lock true;
{dostop _x} foreach units _aa1;
if !(_damg) then {
	{
	_x addEventHandler ["HandleDamage", {}];
	_x allowDamage false;
	} foreach [_vaa1];
};

_aa1 setFormDir _dir;

_veh_array pushback _vaa1;

} foreach _spawn_markers;

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

diag_log "BASE DEFENSE SCRIPT END!";

if (true) exitwith {};