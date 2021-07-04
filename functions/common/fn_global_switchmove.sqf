private ["_move","_unit"];
_unit = _this select 0;//unit to animate
_move = _this select 1;//movement in string format ""

_unit switchmove _move;