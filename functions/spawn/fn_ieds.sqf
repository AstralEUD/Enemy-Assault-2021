/*V1.3 - By: Ghost - creates random ieds at specified objects on map
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

_iedtypelist = ["IEDLandBig_F","IEDUrbanBig_F","IEDLandSmall_F","IEDUrbanSmall_F"];

//Do not edit below this line unless you know what you are doing//
//////////////////////////////////////////////////////
private ["_roads"];
ghst_ied_array = [];
_roads = [];

//Get array of roads in area
_roads = (_centerposition nearRoads _rad);
{
	if ((toUpper(str _x) find "WRECK") >= 0) then {
		_roads pushback _x;
	};
} foreach (nearestTerrainObjects [_centerposition, ["HIDE"],_rad]);

_ieds = floor(count _roads / 10);

if (_ieds > _maxieds) then {_ieds = _maxieds;};

//create empty vehicles
for "_x" from 0 to (_ieds) do {

		_roadssel = selectRandom _roads;
		_roadconto = roadsConnectedTo _roadssel;
		_direction = [_roadssel, _roadconto select 0] call BIS_fnc_DirTo;
		_roads = _roads - [_roadssel];
		_pos =  [(getposatl _roadssel select 0)-5 * sin(random 359),(getposatl _roadssel select 1)-5 * cos(random 359)]; 
		_loctype = selectRandom _iedtypelist;
		_iedtype = createmine [_loctype,_pos, [], 0];
		_iedtype setdir (random 360);
		_iedtype setPosATL [getposatl _iedtype select 0,getposatl _iedtype select 1,0];

		//create markers for ieds
		if (_markunits) then {
			[_pos,_mcolor,"IED"] call ghst_fnc_mark_point;
		};	
		
		//create loop to detect side and blow up
		[_iedtype,_side,_pos] spawn {
			_iedtype = _this select 0;
			_side = _this select 1;
			_pos = _this select 2;
			
				while {!(isnil "_iedtype") or (alive _iedtype)} do {
					sleep 4;
					if !(mineActive _iedtype) exitwith {};
					if !(alive _iedtype) then {_explosion = "HelicopterExploBig" createVehicle _pos;};
					_near = (getpos _iedtype) nearEntities [["Man", "Car", "Tank"], 15];// nearObjects ["Man", 15];
					{if ((side _x == _side) and (((_x selectionPosition "launcher" select 2) > 1.2) or {(_x iskindof "Car")} or {(_x iskindof "Tank")})) then {
					_iedtype setdamage 1;
					_explosion = "HelicopterExploBig" createVehicle _pos;
					}} forEach _near;
				};
				
			if !(isnil "_iedtype") then {
			deletevehicle _iedtype;
			};
		};
	
	ghst_ied_array pushback _iedtype;

	//sleep 0.1;

};