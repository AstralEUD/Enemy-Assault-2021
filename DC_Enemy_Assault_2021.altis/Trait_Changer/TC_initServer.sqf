//Trait Changer Server

//TC_trait_check_server = [_callerid, _trait_name, _current_trait_name];
TC_trait_check_server = [];
"TC_trait_check_server" addPublicVariableEventHandler {
	_this # 1 params ["_callerid", "_trait_name", "_current_trait_name"];
	
	_trait_index = -2;
	{
		if (_x find _trait_name > -1) then {
			_trait_index = _forEachIndex;
		};
	} forEach TC_trait_array;

	_trait_limit_max = -2;
	_trait_status = -2;
	if !(_trait_name isEqualTo "STR_TC_NO_TRAIT") then {
		_trait_limit_max = TC_trait_limit_max_array # _trait_index;
		_trait_status = TC_trait_status_array # _trait_index;
	};
	
	_current_trait_index = -2;
	_current_trait_status = -2;
	if !(_current_trait_name isEqualTo "STR_TC_NO_TRAIT") then {
		{
			if (_x find _current_trait_name > -1) then {
				_current_trait_index = _forEachIndex;
			};
		} forEach TC_trait_array;
		_current_trait_status = TC_trait_status_array # _current_trait_index;
	};
	
	TC_result_client = [false, _trait_limit_max];
	
	Switch true do {
		case (_trait_name isEqualTo "STR_TC_NO_TRAIT" || _trait_limit_max isEqualTo -1) : {
			if (!(_current_trait_name isEqualTo "STR_TC_NO_TRAIT") && !(_current_trait_status isEqualTo 0)) then {
				TC_trait_status_array set [_current_trait_index, _current_trait_status - 1];
			};
			TC_result_client set [0, true];
		};
		case ((_trait_status < _trait_limit_max) && !(_current_trait_name isEqualTo _trait_name)) : {
			if (!(_current_trait_name isEqualTo "STR_TC_NO_TRAIT") && !(_current_trait_status isEqualTo 0)) then {
				TC_trait_status_array set [_current_trait_index, _current_trait_status - 1];
			};
			TC_trait_status_array set [_trait_index, _trait_status + 1];
			TC_result_client set [0, true];
		};
	};
	_callerid publicVariableClient "TC_result_client";
};