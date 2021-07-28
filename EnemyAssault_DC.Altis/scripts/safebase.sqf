if (isDedicated) exitWith {};
waitUntil {!isNull player};

player addEventHandler ["Fired", {
  _p = _this select 6;
	if (_p distance (getMarkerPos "Respawn_West")  < 100) then {
	  deleteVehicle _p;
		titleText [Format ["기지에서 발포하지 말아주세요.(사격은 사격장 가서 해주세요.) #Warning# Don't Shoot in the base"],"BLACK FADED"];
	};
}];