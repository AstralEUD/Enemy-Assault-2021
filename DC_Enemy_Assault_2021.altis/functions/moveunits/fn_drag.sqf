/*V1.2 By Ghost - allows player to drag cursor target unit
this addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
*/
private ["_host","_player","_id","_args","_unit","_playerMove","_animstate","_carryunit"];

_host = _this select 0;
_player = _this select 1;
_id = _this select 2;

ghst_dragunit = false;
_carryunit = false;

_unit = cursortarget;

if ((isplayer _unit) and !(_unit getVariable ["BIS_revive_incapacitated", false])) exitwith {hint "cannot move player";};

//check to see if unit is incapacitated and if not then move unit
if !(_unit getVariable ["BIS_revive_incapacitated", false]) then {_carryunit = true;};

if !(_unit iskindof "MAN") exitwith {};

_host removeaction _id;

_animstate = animationState _unit;

ghst_dragunit = true;

// Attach player to injured
if (_carryunit) then {
	_getVa = _unit getVariable ["rescue",0];
	if (_getVa == 1) then {
		[_unit] joinsilent (group _player);
	};
	_unit attachTo [_player, [-0.3,0.5,0]];
} else {
	_unit attachTo [_player, [0, 1.1, 0.092]];
	_unit setdir 180;
	_unit setPos getPos _unit;
	_player selectweapon (primaryWeapon _player);
	_unit playMoveNow "AinjPpneMrunSnonWnonDb_grab";
	// Start dragging move
	//_player playMoveNow "AcinPknlMstpSrasWrflDnon";
	_player playAction "grabDrag";
};

if !(isplayer _unit) then {
	ghst_action_loadvehiclecargo = _player addaction ["<t size='1.2' shadow='2' color='#FFFF00'>Load Unit in Cargo</t>", { call ghst_fnc_loadvehicle; }, [_unit,_carryunit,"cargo"], 1, false, false, "","alive _target and _this == _target and (((nearestObjects [_this, [""air"",""car"",""truck"",""tank"",""StaticWeapon""], 10]) select 0) emptyPositions ""Cargo"" > 0)"];
	ghst_action_loadvehicledriver = _player addaction ["<t size='1.2' shadow='2' color='#FFFF00'>Load Unit in Driver</t>", { call ghst_fnc_loadvehicle; }, [_unit,_carryunit,"driver"], 1, false, false, "","alive _target and _this == _target and (((nearestObjects [_this, [""air"",""car"",""truck"",""tank"",""StaticWeapon""], 10]) select 0) emptyPositions ""Driver"" > 0)"];
	ghst_action_loadvehiclegunner = _player addaction ["<t size='1.2' shadow='2' color='#FFFF00'>Load Unit in Gunner</t>", { call ghst_fnc_loadvehicle; }, [_unit,_carryunit,"gunner"], 1, false, false, "","alive _target and _this == _target and (((nearestObjects [_this, [""air"",""car"",""truck"",""tank"",""StaticWeapon""], 10]) select 0) emptyPositions ""Gunner"" > 0)"];
	ghst_action_loadvehicleturret = _player addaction ["<t size='1.2' shadow='2' color='#FFFF00'>Load Unit in Turret</t>", { call ghst_fnc_loadvehicle; }, [_unit,_carryunit,"turret"], 1, false, false, "","alive _target and _this == _target and (count (fullCrew [((nearestObjects [_this, [""air"",""car"",""truck"",""tank"",""StaticWeapon""], 10]) select 0), ""Turret"", true] - fullCrew [((nearestObjects [_this, [""air"",""car"",""truck"",""tank"",""StaticWeapon""], 10]) select 0), ""Turret"", false]) > 0)"];
};

ghst_action_release = _player addaction ["<t size='1.2' shadow='2' color='#00FF00'>Release Unit</t>", { call ghst_fnc_release; }, [_unit,_animstate,_carryunit], 1, false, false, "","alive _target and _this == _target"];

[_player,_unit,_carryunit] spawn {
	private ["_player","_unit","_carryunit","_stance"];
	_player = _this select 0;
	_unit = _this select 1;
	_carryunit = _this select 2;
	
	while {ghst_dragunit} do {
		sleep 1;
		if (!(alive _player) or !(alive _unit) or (_unit getVariable "BIS_revive_incapacitated") or (_unit getVariable ["ACE_isUnconscious﻿", false])) exitwith {detach _unit; ghst_dragunit = false; _unit setunitpos "MIDDLE"; _player addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];};
		if (_carryunit and !((stance _player) == (stance _unit))) then {
			_stance = switch (stance _player) do {
				case "STAND": { "UP"};
				case "CROUCH": { "MIDDLE" };
				case "PRONE": { "DOWN" };
				case "UNDEFINED": { "AUTO" };
			};
			_unit setunitpos _stance;
		};
	};
	
	if !(isnil "ghst_action_release") then {
		_player removeAction ghst_action_release;
	};
	if !(isnil "ghst_action_loadvehiclecargo") then {
		_player removeAction ghst_action_loadvehiclecargo;
	};
	if !(isnil "ghst_action_loadvehicledriver") then {
		_player removeAction ghst_action_loadvehicledriver;
	};
	if !(isnil "ghst_action_loadvehiclegunner") then {
		_player removeAction ghst_action_loadvehiclegunner;
	};
	if !(isnil "ghst_action_loadvehicleturret") then {
		_player removeAction ghst_action_loadvehicleturret;
	};
};