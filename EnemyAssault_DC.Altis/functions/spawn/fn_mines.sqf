/*V1.1 - By: Ghost - creates random mines on/near the roads or near buildings in given radius
ghst_mines = [_locselpos,_rad,_maxmines,_roads,_side,_showmarks] call ghst_fnc_mines;
ghst_mines = [(getmarkerpos "center"),3000,40,true,EAST,[true,"ColorBlack"]] call ghst_fnc_mines;
*/
if (!isserver) exitwith {};

_centerposition = _this select 0;//position
_rad = _this select 1;//radius for mines to spawn
_maxmines = _this select 2;//max number of mines to spawn
_useroads = _this select 3;//use the roads or buildings
_side = _this select 4;//side for mines to be known
_markunitsarray = _this select 5;
	_markunits = _markunitsarray select 0;//true to mark units
	_mcolor = _markunitsarray select 1;//marker color

_minelist = ["APERSBoundingMine","APERSBoundingMine","APERSTripMine","APERSBoundingMine"];
//"ATMine","APERSMine","APERSBoundingMine","SLAMDirectionalMine","APERSTripMine"

//Do not edit below this line unless you know what you are doing//
//////////////////////////////////////////////////////
private ["_roads","_mines","_nearBuildings"];
ghst_mine_array = [];
if (_useroads) then {
	//Get array of roads in area
	_roads = (_centerposition nearRoads _rad);

	_mines = floor(count _roads / 10);
} else {
	_nearBuildings = _centerposition nearObjects ["HouseBase", _rad];
	_mines = floor(count _nearBuildings / 10);
};

if (_mines > _maxmines) then {_mines = _maxmines;};

//create mines
for "_x" from 0 to (_mines) do {
	private ["_direction","_pos"];
	if (_useroads) then {
		_roadssel = selectRandom _roads;
		_roadconto = roadsConnectedTo _roadssel;
		_direction = [_roadssel, _roadconto select 0] call BIS_fnc_DirTo;
		_roads = _roads - [_roadssel];
		_pos =  [(getposatl _roadssel select 0)-5 * sin(random 359),(getposatl _roadssel select 1)-5 * cos(random 359)]; 
	} else {
		_buildsel = selectRandom _nearBuildings;
		_nearBuildings = _nearBuildings - [_buildsel];
		_pos = _buildsel buildingExit 0;
	};
	_minesel = selectRandom _minelist;
	_mine = createMine [_minesel, [_pos select 0,_pos select 1,0], [], 0];
		if (isnil "_direction") then {
			_mine setdir (random 360);
		} else {
			_mine setdir _direction;
		};
	_mine setPosATL [getposatl _mine select 0,getposatl _mine select 1,0];
	_side revealMine _mine;

		//create markers for mines
		if (_markunits) then {
			[_pos,_mcolor,"Mine"] call ghst_fnc_mark_point;
		};	
	
	ghst_mine_array pushback _mine;

	//sleep 0.1;

};