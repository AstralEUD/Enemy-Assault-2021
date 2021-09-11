[] spawn {
	_towers=nearestTerrainObjects[[worldSize / 2, worldsize / 2, 0], ["TRANSMITTER"], worldsize];
	{
		_f=_x getVariable ["EM_FREQ",0];
		if (_f==0) then{
			_x setVariable ["EM_FREQ", selectRandom [79.3,81.2,84.6,85.5,392,397,410,415,419,432,456,479,486,490], true];
		};			
		
		_l = createLocation ["Area",_x getRelPos [10,0],0,0];
		_l setText format["%1 Mhz",_x getVariable ["EM_FREQ",0]];		
		EM_Radios pushBack _x;
	}forEach _towers;	
};

/*
{
	if ("EM_Marker" in _x)	then {
		_x setMarkerAlpha 0;
		_markerText = ((markerText _x) splitString "\");
		_markerName = _markerText#0;
		_markerFreq = parseNumber(_markerText#1);
		_markerPower = parseNumber(_markerText#2);
		_towers = nearestTerrainObjects[getMarkerPos _x, ["TRANSMITTER"], 50];
		if (count _towers > 0) then {
			_tower = _towers #0;
			_towerLoc  = unitAimPositionVisual _tower;
			_location = createLocation [ "ViewPoint" , AGLToASL unitAimPositionVisual _tower, 5000, 5000];
			_location setText _markerName;		
			_location setVariable ["EM_Values", [_markerFreq, _markerPower]];
		EM_Radios pushBack [_location,_tower];
		} else {
			systemChat format["[%1]마커 주변에는 통신탑이 없습니다.", _x];
		};
	};
}forEach allMapMarkers;
*/

//["Land_Communication_F","Land_Radar_Small_F","Land_TTowerBig_2_F","Land_TTowerBig_1_F","Land_Radar_F"]
