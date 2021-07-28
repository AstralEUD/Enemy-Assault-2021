/*V1 By Ghost - allows player to load dragged unit into vehicle
ghst_action_unloadvehicle = this addaction ["<t size='1.2' shadow='2' color='#0000FF'>load Unit</t>", { call ghst_fnc_unloadvehicle; }, [injured], 1, false, false, "","alive _target and _this == _target"];
*/
private ["_host","_caller","_id","_obj","_injured","_carryunit","_nearvehs","_nearveh"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_args = _this select 3;
_injured = _args select 0;
_carryunit = _args select 1;

_nearvehs = nearestObjects [_caller, ["air","car","truck","tank"], 20];
_nearveh = _nearvehs select 0;
if (_nearveh emptyPositions "Cargo" > 0) then {
	_host removeaction _id;
	if !(isnil "ghst_action_release") then {
		_host removeAction ghst_action_release;
	};
	_injured action ["Getout", _nearveh];
	dostop _injured;
	ghst_dragunit = false;
	_caller addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];
} else {hint "No cargo space available";};

