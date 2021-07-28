//PPAP Action
disableSerialization;
PPAP_cursor_condition = false;
PPAP_condition_result = true;
PPAP_check_locality = compileFinal "
	params ['_target', '_caller'];
	if (!(owner _target isEqualTo _caller) && !(unitIsUAV _target)) then {
		_target setOwner _caller;
	};
	if (!(owner _target isEqualTo _caller) && unitIsUAV _target) then {
		(group _target) setGroupOwner _caller;
	};
";
PPAP_action = compileFinal "
	player addAction
	[
		'PPAP',
		{
			if (PPAP_cursor_condition) then {
				PPAP_targetvehicle = cursorObject;
				_my_id = clientOwner;
				[PPAP_targetvehicle, _my_id] remoteExec ['PPAP_check_locality', 2];
			} else {
				PPAP_targetvehicle = vehicle player;
			};
			0 = createDialog 'PPAP_GUI';
		},
		[], 0, false, true, '',
		'PPAP_condition_result && PPAP_vehicle_condition_result',
		-1
	];
";

[] spawn PPAP_action;

player addEventHandler ["Respawn", {[] spawn PPAP_action;}];

private _vehicleclass = "";
private _vehiclefaction = "";
private _targetvehicle = "";

while {true} do {
	if (player isEqualTo vehicle player && cursorObject isKindOf "Air" && !(isEngineOn cursorObject) && player distance cursorObject < 10 && (crew cursorObject isEqualTo [] || (unitIsUAV cursorObject && !(isUAVConnected cursorObject)))) then {
		_vehicleclass = typeof cursorObject;
		_vehiclefaction = faction cursorObject;
		_targetvehicle = cursorObject;
		PPAP_cursor_condition = true;
	} else {
		_vehicleclass = typeof vehicle player;
		_vehiclefaction = faction vehicle player;
		_targetvehicle = vehicle player;
		PPAP_cursor_condition = false;
	};
	if (PPAP_cursor_condition || (!(player isEqualTo _targetvehicle) && player isEqualTo driver _targetvehicle && !(isEngineOn _targetvehicle) && crew vehicle player isEqualTo [player])) then {
		_dl_check = configName (configfile >> "CfgVehicles" >> _vehicleclass >> "Components" >> "TransportPylonsComponent");
		if (_dl_check isEqualTo "TransportPylonsComponent") then {
			PPAP_vehicle_condition_1 = true;
			PPAP_vehicle_condition_2 = true;
			PPAP_vehicle_condition_3 = true;
			PPAP_vehicle_condition_4 = true;
			if (1 in PPAP_available_vehicles) then {
				if !(_vehicleclass in PPAP_blacklist) then {
					PPAP_vehicle_condition_1 = true;
				} else {
					PPAP_vehicle_condition_1 = false;
				};
			};
			if (2 in PPAP_available_vehicles) then {
				if (PPAP_vehicle_condition_1) then {
					if (_vehicleclass in PPAP_whitelist) then {
						PPAP_vehicle_condition_2 = true;
					} else {
						PPAP_vehicle_condition_2 = false;
					};
				};
			};
			if (3 in PPAP_available_vehicles) then {
				if !(_vehiclefaction find "BLU" isEqualTo -1) then {
					PPAP_vehicle_condition_3 = true;
				} else {
					PPAP_vehicle_condition_3 = false;
				};
			};
			if (4 in PPAP_available_vehicles) then {
				if !(_vehiclefaction find "OPF" isEqualTo -1) then {
					PPAP_vehicle_condition_3 = true;
				} else {
					PPAP_vehicle_condition_3 = false;
				};
			};
			if (5 in PPAP_available_vehicles) then {
				if !(_vehiclefaction find "IND" isEqualTo -1) then {
					PPAP_vehicle_condition_3 = true;
				} else {
					PPAP_vehicle_condition_3 = false;
				};
			};
			private _ammo_vehicle_finder = vehicles inAreaArray [getPos _targetvehicle, 20, 20, 0, false, 10] select {(typeof _x) in PPAP_ammo_vehicle_list};
			if (count _ammo_vehicle_finder > 0 && alive player) then {
				PPAP_vehicle_condition_4 = true;
				} else {
				PPAP_vehicle_condition_4 = false;
			};
			PPAP_vehicle_condition_result = false;
			if (PPAP_vehicle_condition_1 && PPAP_vehicle_condition_2 && PPAP_vehicle_condition_3 && PPAP_vehicle_condition_4) then {PPAP_vehicle_condition_result = true;};
		} else {
			PPAP_vehicle_condition_result = false;
		};
	} else {
		PPAP_vehicle_condition_result = false;
	};
	sleep 1;
};