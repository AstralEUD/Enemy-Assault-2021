/*V1 By Ghost - allows player to Release dragged unit
this addaction ["<t size='1.2' shadow='2' color='#FF0000'>Release Unit</t>", { call ghst_fnc_release; }, [], 1, false, false, "","alive _target and _this == _target"];
*/
private ["_host","_caller","_id","_args","_carryunit","_animationstate"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_args = _this select 3;
_injured = _args select 0;
_animationstate = _args select 1;
_carryunit = _args select 2;

_host removeaction _id;

ghst_dragunit = false;

if !(isnil "ghst_action_loadvehicle") then {
	_host removeAction ghst_action_loadvehicle;
};

detach _injured;

if !(_carryunit) then {
	_host playMoveNow "AmovPknlMstpSrasWrflDnon";
};
if (alive _injured) then {
	_injured playMoveNow _animationstate;
};

_host addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];

