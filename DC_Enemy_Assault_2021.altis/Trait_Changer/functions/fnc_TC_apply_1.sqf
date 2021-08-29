disableSerialization;
params ["_trait_name", "_options", "_respawn"];
{player setUnitTrait [_x, false]} forEach TC_trait_skillNames_boolean;
{player setUnitTrait [_x, false, true]} forEach TC_trait_skillNames_boolean_custom;
{player setUnitTrait [_x, 1]} forEach TC_trait_skillNames_number;
if !(_options isEqualTo -1) then {
	{
		if (_x # 0 isEqualTo 0) then {
			_skillName = _x # 1;
			if (_x # 2 isEqualTo 0) then {
				player setUnitTrait [_skillName, true];
			};
			if (_x # 2 isEqualTo 1) then {
				player setUnitTrait [_skillName, true, true];
			};
			if (_x # 2 isEqualTo 2) then {
				_value = _x # 3;
				player setUnitTrait [_skillName, _value];
			};
		};
		if (_x # 0 isEqualTo 1) then {
			_value = _x # 1;
			player setCustomAimCoef _value;
		};
	} forEach _options;
};
if !(_respawn) then {
	TC_current_trait_name = _trait_name;
	hint format [localize "STR_TC_DONE", localize _trait_name];
};