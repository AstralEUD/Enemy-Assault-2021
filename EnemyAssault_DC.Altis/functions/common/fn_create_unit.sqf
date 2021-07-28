private ["_spawnpos","_egrp","_mansel","_aiSkill","_man"];

_spawnpos = _this select 0;
_egrp = _this select 1;
_mansel = _this select 2;
_aiSkill = [_this, 3, 0.5, [0]] call BIS_fnc_param;

_man = _egrp createUnit [_mansel,_spawnpos, [], 0, "NONE"];

[_man,_aiSkill] call ghst_fnc_aiskill;

_man