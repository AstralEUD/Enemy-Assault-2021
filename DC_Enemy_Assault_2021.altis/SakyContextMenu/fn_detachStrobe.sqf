{
	if ((typeOf _x) isKindOf "LaserTargetW" || (typeOf _x) isKindOf "NVG_TargetW") then {	
		[_x] spawn {
			params["_strobe"];
			detach _strobe;
			sleep 1;	
			deleteVehicle _strobe;			
		}
	}
}forEach attachedObjects (vehicle player);  