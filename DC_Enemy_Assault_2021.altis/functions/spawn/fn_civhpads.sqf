/*V1.8.4- By: Ghost - creates empty civilian helicopters at random helipads
ghst_civhpads = [_locselpos,_rad,show markers] call ghst_fnc_civhpads;
ghst_civhpads = [(getmarkerpos "center"),3000,true] call ghst_fnc_civhpads;
*/
if (!isserver) exitwith {};

_pos = _this select 0;//position
_rad = _this select 1;//radius to find helipads
_showmarks = param [2, false, [true]];

//Vehicle list - edit as needed//
_helicivlist = ghst_helicivlist;

//Do not edit below this line unless you know what you are doing//
//////////////////////////////////////////////////////

//Get array of roads in area
_pads = _pos nearObjects ["Helipad_base_F", _rad];

if (count _pads < 1) exitwith {hint "no helipads";};

_helis = floor(count _pads / 10);

//create empty helicopters
for "_x" from 0 to _helis do {

	_padsel = selectRandom _pads;
	_pads = _pads - [_padsel];
	_pos =  getposatl _padsel; 
	_dir = getdir _padsel;
	_helisel = selectRandom _helicivlist;
	_veh = createVehicle [_helisel,_pos, [], 0, "NONE"];
	_veh setFuel (0.3 + random 0.5);
	_veh setdir _dir;

	_veh setPosATL [getposatl _veh select 0,getposatl _veh select 1,0];
	_veh setvelocity [0,0,0];
	
	//create markers		
	if (_showmarks) then {
	[_pos,"ColorCiv","CIV Heli"] call ghst_fnc_mark_point;
	};
};