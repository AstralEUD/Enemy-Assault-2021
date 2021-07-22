private ["_msg","_vars"];
_msg = _this select 0;//message for hint
_vars = param [1, [west,"Base"], [objNull, []], [1,2]];

_vars sideChat _msg;