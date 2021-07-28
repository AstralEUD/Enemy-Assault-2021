/*V1 - By: Ghost - creates random ieds at specified objects on map
ghst_ieds = [_locselpos,_rad,_maxieds,_side,_showmarks] execvm "scripts\ghst_ieds.sqf";
ghst_ieds = [(getmarkerpos "center"),3000,40,EAST,[true,"ColorBlack"]] execvm "scripts\ghst_ieds.sqf";
*/
if (!isserver) exitwith {};

_centerposition = _this select 0;//position
_rad = _this select 1;//radius for ieds to spawn
_maxieds = _this select 2;//max number of ieds to spawn
_side = _this select 3;//side for ieds to kill
_markunitsarray = _this select 4;
	_markunits = _markunitsarray select 0;//true to mark units
	_mcolor = _markunitsarray select 1;//marker color

_iedlist = ["Sh_120mm_HE","Bo_Mk82","Sh_155mm_AMOS","Sh_120mm_HE","Bo_GBU12_LGB","Sh_82mm_AMOS","Bo_Mk82"];

_loctypelist = ["Land_Tyres_F","Land_JunkPile_F","Land_GarbageWashingMachine_F","Land_GarbagePallet_F","Land_GarbageBags_F"];

//Do not edit below this line unless you know what you are doing//
//////////////////////////////////////////////////////

ghst_ied_array = [];

//Get array of roads in area
_roads = (_centerposition nearRoads _rad);

_ieds = floor(count _roads / 10);

if (_ieds > _maxieds) then {_ieds = _maxieds;};

//create empty vehicles
for "_x" from 0 to (_ieds) do {

		_roadssel = selectRandom _roads;
		_roadconto = roadsConnectedTo _roadssel;
		_direction = [_roadssel, _roadconto select 0] call BIS_fnc_DirTo;
		_roads = _roads - [_roadssel];
		_pos =  [(getposatl _roadssel select 0)-5 * sin(random 359),(getposatl _roadssel select 1)-5 * cos(random 359)]; 
		_loctype = selectRandom _loctypelist;
		_iedloc = createVehicle [_loctype,_pos, [], 0, "NONE"];
		_iedloc setdir (random 360);
		_iedloc setPosATL [getposatl _iedloc select 0,getposatl _iedloc select 1,0];

		//create markers for ieds
		if (_markunits) then {
			[_pos,_mcolor,"IED"] call ghst_fnc_mark_point;
		};	
		
		//create loop to detect side and blow up
		[_iedloc,_iedlist,_side] spawn {
			_iedloc = _this select 0;
			_iedlist = _this select 1;
			_side = _this select 2;
			
			_iedsel = selectRandom _iedlist;
			
				while {!(isnil "_iedloc") or (alive _iedloc)} do {
					sleep 4;
					if (damage _iedloc > 0.4) exitwith {};
					_near = (getpos _iedloc) nearObjects ["Man", 15];
					{if (side _x == _side) then {
					_iedloc setdamage 0.5;
					}} forEach _near;
				};
			if !(isnil "_iedloc") then {	
				_ied = _iedsel createVehicle (getpos _iedloc);
				deletevehicle _iedloc;
			};
		};
	
	ghst_ied_array = ghst_ied_array + [_iedloc];

	//sleep 0.1;

};