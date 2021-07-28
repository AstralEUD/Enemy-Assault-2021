//PPAP Condition Check
PPAP_condition_1 = false;
PPAP_condition_2 = false;
PPAP_condition_result = true;

while {true} do {
	if (1 in PPAP_condition_check_options) then {
		PPAP_condition_1 = false;
		{
			if (_x find "PPAP_service_area_" > -1) then {
				if !(PPAP_condition_1) then {
					if (player inArea _x && alive player) then {
						PPAP_condition_1 = true;
					};
				};
			};
		} forEach allMapMarkers;
	};
	if (2 in PPAP_condition_check_options) then {
		private _nearfob = [] call F_getNearestFob;
		private _fobdistance = 9999;
		if (count _nearfob isEqualTo 3) then {
			_fobdistance = player distance _nearfob;
		};
		if ((_fobdistance < GRLIB_fob_range) && alive player) then {
			PPAP_condition_2 = true;
		} else {
			PPAP_condition_2 = false;
		};
	};
	if (PPAP_condition_1 || PPAP_condition_2) then {
		PPAP_condition_result = true;
		} else {
		PPAP_condition_result = false;
	};
	sleep 1;
};