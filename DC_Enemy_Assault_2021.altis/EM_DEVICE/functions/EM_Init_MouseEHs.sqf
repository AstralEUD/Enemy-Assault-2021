(findDisplay 46) displayAddEventHandler["MouseButtonDown", {
	params["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	if (_button == 0 && EM_AllowTransmit) then	{
		EM_TrigTime = time + 1;
		missionNamespace setVariable["#EM_Transmit", true];
	};
}];

(findDisplay 46) displayAddEventHandler["MouseButtonUp", {
	params["_displayorcontrol", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	if (_button == 0) then {
		EM_TrigTime = nil;
		missionNamespace setVariable["#EM_Transmit", false];
	};
}];	
