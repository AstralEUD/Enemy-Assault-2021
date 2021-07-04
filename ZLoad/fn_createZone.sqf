disableSerialization;
_player = _this select 0;
_range = _this select 2;
zlo_VehicleInAsisstance = false;
_indx = _player addAction [format["%2<t color='#ff0000'>%1",localize "zlo_service_name",""],"ZLoad\fn_showDialog.sqf",nil,12,true,true,"",
				format["(vehicle player != player and (player distance getMarkerPos ('%1')) < %2 and vehicle player isKindOf 'Air' and alive vehicle player and alive player and driver (vehicle player) isEqualTo player) or (getConnectedUAV player) isKindOf 'air' and ((getConnectedUAV player) distance getMarkerPos ('%1')) < %2 and alive getConnectedUAV player",_this select 1,_this select 2],
				-1,false,""];
