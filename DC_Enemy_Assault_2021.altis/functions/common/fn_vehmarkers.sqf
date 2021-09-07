private ["_veh","_marker","_x","_markertext"];
{
	_veh = missionNamespace getVariable [_x, objNull];
	_marker = _x;
	_markertext = "";
	_mark_color = "ColorGrey";

	if !(isNull _veh) then {
		if (alive _veh) then {
			if ((ghst_vehicle_markers find _marker) == -1) then {
				//_mark_color = _unit call ghst_fnc_pmarkcolor;
				_mark = [[0,0],_mark_color,_marker] call ghst_fnc_mark_local;
				ghst_vehicle_markers pushback _mark;
				//diag_log _mark;
			};
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

		_idx = ghst_vehicle_markers find _marker;
		if !(_idx == -1) then {
			ghst_vehicle_markers deleteAt _idx;
			ghst_vehicle_markers = ghst_vehicle_markers - [""];
			deleteMarkerLocal _marker;
			//diag_log format ["GHST_VEHICLE_MARKERS IDX %1 VEHICLE %2 ARRAY %3", _idx, _marker, ghst_vehicle_markers];
			
			ghst_vehicles deleteAt _forEachIndex;
			//diag_log format ["GHST_VEHICLES IDX %1 VEHICLE %2 ARRAY %3", _forEachIndex, _marker, ghst_vehicles];
		};
	};
} forEach ghst_vehicles;