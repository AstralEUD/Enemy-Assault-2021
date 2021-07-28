private ["_alive_players","_unit","_marker","_pmark_color","_x","_markerDir","_markertext","_mark","_idx","_isplayer"];
//_alive_players = ghst_players;//(playableunits + switchableunits);//ghst_players;//
{
	_unit = missionNamespace getVariable _x;
	_marker = _x;
	_markertext = "";
	_isplayer = false;
	_pmark_color = "ColorBLUFOR";
	if !(isNil "_unit") then {
	//if !(isnull _unit) then {
	
		if (hasInterface and isplayer _unit) then {_isplayer = true;};
		
		if ((ghst_player_markers find _marker) == -1) then {
			//_pmark_color = _unit call ghst_fnc_pmarkcolor;
			_mark = [[0,0],_pmark_color,_marker,"","mil_triangle",[0.3,0.6]] call ghst_fnc_mark_local;
			ghst_player_markers pushback _mark;
			//diag_log _mark;
		};
		if (isNull objectParent _unit) then {
			_markertext = name _unit;
		};
		if !(isNull objectParent _unit) then {
			if ((driver vehicle _unit isEqualTo _unit) and {(count crew vehicle _unit > 1)}) then {
				_markertext = format ["%1 [%2 +%3]", (name _unit), (configFile >> "cfgVehicles" >> (typeOf vehicle _unit) >> "displayName") call BIS_fnc_getCfgData, count (crew vehicle _unit) -1];
			};
			if ((_unit in (crew vehicle _unit)) and {(count crew vehicle _unit isEqualTo 1)}) then {
				_markertext = format ["%1 [%2]", (name _unit), (configFile >> "cfgVehicles" >> (typeOf vehicle _unit) >> "displayName") call BIS_fnc_getCfgData];
			};
		};
/*			if !((vehicle _unit == _unit) or ((_unit in (crew vehicle _unit)) and ((count crew vehicle _unit > 1) or (count crew vehicle _unit == 1)))) then {
			_markertext = "";
		};*/
		if ((_unit getVariable "BIS_revive_incapacitated") or (_unit getVariable ["ACE_isUnconscious﻿", false])) then {
			_markertext = format ["%1 [Down]", name _unit];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerPosLocal getPosASL _unit;
		} else {
			//_pmark_color = _unit call ghstMarkerplayers_color;
			_marker setMarkerColorLocal _pmark_color;
		};
/*			if !((vehicle _unit == _unit) or ((driver vehicle _unit == _unit) and ((count crew vehicle _unit > 1) or (count crew vehicle _unit == 1)))) then {
			_markertext = "";
		};*/
		
		if (alive _unit and _isplayer) then {
			_markerDir = getDir vehicle _unit;
			_marker setMarkerAlphaLocal 1;
			_marker setMarkerPosLocal getPosASL _unit;
			_marker setMarkerTextLocal _markertext;
			_marker setMarkerDirLocal _markerDir;
		} else {
			_marker setMarkerPosLocal [0,0];
			_marker setMarkerTextLocal "";
			_marker setMarkerAlphaLocal 0;
		};
	} else {
		_idx = ghst_player_markers find _marker;
		if !(_idx == -1) then {
			ghst_player_markers deleteAt _idx;
			deleteMarkerLocal _marker;
		};
	};
} forEach ghst_players;//_alive_players;//allPlayers;