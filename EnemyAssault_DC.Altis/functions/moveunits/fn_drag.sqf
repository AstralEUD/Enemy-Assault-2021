/*V1 By Ghost - allows player to drag cursor target unit
this addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
*/
private ["_host","_player","_id","_args","_injured","_playerMove","_animstate","_carryunit"];

_host = _this select 0;
_player = _this select 1;
_id = _this select 2;

ghst_dragunit = false;
_carryunit = false;

_injured = cursortarget;

if ((isplayer _injured) and !(_injured getVariable ["BIS_revive_incapacitated", false])) exitwith {hint "cannot move player";};

//check to see if unit is incapacitated and if not then move unit
if !(_injured getVariable ["BIS_revive_incapacitated", false]) then {_carryunit = true;};

if !(_injured iskindof "MAN") exitwith {};

_host removeaction _id;

_animstate = animationState _injured;

ghst_dragunit = true;

// Attach player to injured
if (_carryunit) then {
	[_injured] joinsilent (group _player);
	_injured attachTo [_player, [-0.3,0.5,0]];
} else {
	_injured attachTo [_player, [0, 1.1, 0.092]];
	_injured setdir 180;
	_injured setPos getPos _injured;
	_player selectweapon (primaryWeapon _player);
	_injured playMoveNow "AinjPpneMrunSnonWnonDb_grab";
	// Start dragging move
	//_player playMoveNow "AcinPknlMstpSrasWrflDnon";
	_player playAction "grabDrag";
};

if !(isplayer _injured) then {
	ghst_action_loadvehicle = _player addaction ["<t size='1.2' shadow='2' color='#FFFF00'>Load Unit</t>", { call ghst_fnc_loadvehicle; }, [_injured,_carryunit], 1, false, false, "","alive _target and _this == _target"];
};

ghst_action_release = _player addaction ["<t size='1.2' shadow='2' color='#00FF00'>Release Unit</t>", { call ghst_fnc_release; }, [_injured,_animstate,_carryunit], 1, false, false, "","alive _target and _this == _target"];

[_player,_injured,_carryunit] spawn {
	private ["_player","_injured","_carryunit","_stance"];
	_player = _this select 0;
	_injured = _this select 1;
	_carryunit = _this select 2;
	
	while {ghst_dragunit} do {
		sleep 1;
		if !((alive _player) or !(alive _injured)) exitwith {detach _injured; ghst_dragunit = false; _player addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];};
		if (_carryunit and !((stance _player) == (stance _injured))) then {
			_stance = switch (stance _player) do {
				case "STAND": { "UP"};
				case "CROUCH": { "MIDDLE" };
				case "PRONE": { "DOWN" };
				case "UNDEFINED": { "AUTO" };
			};
			_injured setunitpos _stance;
		};
	};
	
	if !(isnil "ghst_action_release") then {
		_player removeAction ghst_action_release;
	};
	if !(isnil "ghst_action_loadvehicle") then {
		_player removeAction ghst_action_loadvehicle;
	};
};