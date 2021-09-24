{
	if ((typeOf _x) isKindOf ["Chemlight_green", configFile >> "CfgMagazines"]) then {
		[_x] spawn {
			params["_chem"];
			detach _chem;
			sleep 1;	
			deleteVehicle _chem;
		}
	}
}forEach attachedObjects (vehicle player);  