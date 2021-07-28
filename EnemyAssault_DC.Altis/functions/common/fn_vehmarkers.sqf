private ["_veh","_marker","_x","_markertext"];
{
	_veh = missionNamespace getVariable _x;
	_marker = _x;
	_markertext = "";
	if !(isNil "_veh") then {
		if (alive _veh) then {
			if (count crew _veh < 1) then {
				_marker setMarkerAlphaLocal 1;
				_marker setMarkerPosLocal getPosASL _veh;
				_marker setMarkerTextLocal (getText (configFile >> "cfgVehicles" >> (typeOf _veh) >> "displayName"));
			} else {
				_markertext = format ["%1 [+%2]", (configFile >> "cfgVehicles" >> (typeOf _veh) >> "displayName") call BIS_fnc_getCfgData, (count crew _veh) -1];
				_marker setMarkerPosLocal getPosASL _veh;
				_marker setMarkerTextLocal _markertext;
				_marker setMarkerAlphaLocal 0;
			};
		} else {
			_marker setMarkerPosLocal [0,0];
			_marker setMarkerTextLocal "";
			_marker setMarkerAlphaLocal 0;
		};
	} else {
		_marker setMarkerPosLocal [0,0];
		_marker setMarkerTextLocal "";
		_marker setMarkerAlphaLocal 0;
	};
} forEach ghst_vehicles;