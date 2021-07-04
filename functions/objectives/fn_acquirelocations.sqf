private["_centerPos","_mrkr","_placesCfg","_namesToKeep","_place","_name","_i","_opname","_position","_PARAM_NUMOBJ","_ghst_Locations"];
//create map center marker
ghst_mapsize = getNumber (configfile >> "CfgWorlds" >> worldName >> "mapSize") / 2;
_centerPos = [ghst_mapsize, ghst_mapsize, 0];
_mrkr = createMarker ["CENTER", _centerPos];
_mrkr setMarkerShape "ICON";
_mrkr setMarkerColor "ColorBLUE";
_mrkr setMarkerSize [1, 1];
_mrkr setMarkerType "empty";
_mrkr setMarkerText "CENTER";
/*
//Create Village on SW Area and Ghost Hotel
ghst_ghost_hotel = createLocation [ "NameLocal" , [21883.5,20980.5,0], 800, 800];
ghst_ghost_hotel setText "Ghost Hotel";

ghst_Farmland = createLocation [ "NameLocal" , [10300.5,9399.63,0], 1500, 1500];
ghst_Farmland setText "Farmland";
*/
ghst_objarray = [];
//ghst_localarray = nearestLocations [(getmarkerpos "center"),["NameLocal"],20000];//local sites
//ghst_marinearray = nearestLocations [(getmarkerpos "center"),["NameMarine"],20000];//marine sites
ghst_milarray = [];
ghst_towerarray = [];

//Get list of military sites, factories, and power plants

_placesCfg = configFile >> "CfgWorlds" >> worldName >> "Names";
_namesToKeep = ["MILITARY","FACTORY","POWER PLANT"];
for "_i" from 0 to (count _placesCfg)-1 do
{
	_place = _placesCfg select _i;
	_name = toUpper(getText(_place >> "name"));
	_position = getArray (_place >> "position");
	
	if((_name in _namesToKeep) and (_position distance (getmarkerpos "Respawn_West") > 1000)) then {
		_opname = format["%1 %2", _name, _i];
		/*
		_mrkr = createMarker [_opname, _position];
		_mrkr setMarkerShape "ICON";
		_mrkr setMarkerColor "ColorBlack";
		_mrkr setMarkerSize [1, 1];
		_mrkr setMarkerType "mil_flag";
		_mrkr setMarkerText _opname;
		*/
		ghst_milarray pushback [_position, _opname];
	};
};
/*
_position = (getmarkerpos "ghost_hotel");
if (!(isnil "_position") and (_position select 0 != 0)) then {
	_opname = "Ghost Hotel";
	ghst_milarray pushback [_position, _opname];
};
*/
//diag_log ghst_milarray;
//normal objective areas
_PARAM_NUMOBJ = "PARAM_NUMOBJ" call BIS_fnc_getParamValue;
/*
if (_PARAM_NUMOBJ isEqualTo 1) then {

	//Kavala Only
	_ghst_Locations = nearestLocations [(getmarkerpos "kavala"),["NameCityCapital","NameCity","NameVillage"],300];//"NameCityCapital","NameCity","NameVillage"

	ghst_objarray pushback (_ghst_Locations select 0);

} else {
	*/
	private ["_num_objs","_locselname","_locsel","_idx","_o"];
	
	_num_objs = 1;
	
	//find all locations
	_ghst_Locations = nearestLocations [(getmarkerpos "center"),["NameCityCapital","NameCity","NameVillage","NameLocal"],ghst_mapsize];//"NameCityCapital","NameCity","NameVillage"
	
	//Random number of objectives
	if (_PARAM_NUMOBJ isEqualTo 0) then {
		_num_objs = ceil(random (count _ghst_Locations))+ 2;
	};
	//Half of Objectives
	if (_PARAM_NUMOBJ isEqualTo 2) then {
		_num_objs = round((count _ghst_Locations) / 2);
	};
	//ALL objectives
	if (_PARAM_NUMOBJ isEqualTo 3) then {
		_num_objs = (count _ghst_Locations)-1;
	};

	for "_o" from 0 to _num_objs do {
	
		_idx = floor(random count _ghst_Locations);
		_locsel = _ghst_Locations select _idx;//select random location
		if !(isnil "_locsel") then {
			_locselname = text _locsel;//get name of location
			_centerPos = locationPosition _locsel;
			_centerPos resize 2;
			_nearbuilds = _centerPos nearObjects ["House", 150];
		if ((locationPosition _locsel) distance (getmarkerpos "Respawn_West") > 1000 and !(_locselname in ["Sagonisi"]) and !(_locselname in ["Bomos"]) and (count _nearbuilds > 0)) then {
				ghst_objarray pushback _locsel;
			};
		};	
		//_ghst_Locations set [_idx,-1];
		//_ghst_Locations = _ghst_Locations - [-1];
		_ghst_Locations deleteAt _idx;
	};
	
ghst_objarray = ghst_objarray call BIS_fnc_arrayShuffle;	
//};