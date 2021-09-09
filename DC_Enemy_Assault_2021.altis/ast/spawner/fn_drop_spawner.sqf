/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralEUD                │
│                                                       │
│   Description: For spawn vehicle with currency        │
│   Write like this: ["classname",price]                │
└──────────────────────────────────────────────────────*/

params["_spCheck","_position","_direction","_vehicle","_playeruid","_nowscore","_caller"];
hint format ["Now money : %1",AST_kill_score];
[
	[
		ASTdropSpawnList,
		4, // Selects the quadbike by default
		false // Multi select disabled
	],
	"Paradrop Vehicle Shop",
	{
		/*systemchat format["_confirmed: %1",_confirmed];
		systemchat format["_index: %1",_index];
		systemchat format["_data: %1",_data];
		systemchat format["_value: %1",_value];*/
		if (_confirmed == True) then {
			if (AST_kill_score < ((ASTDropVehicles select _index) select 1)) exitWith {hint "Not enough minerals.";};
			_playeruid = getPlayerUID player;
			_displayName = getText(configFile >> "CfgVehicles" >> (ASTDropVehicles select _index) select 0 >> "displayName");
			AST_kill_score = AST_kill_score - ((ASTDropVehicles select _index) select 1);
			_price = (ASTDropVehicles select _index) select 1;
			[_price] call AST_fnc_hud_minus;
			[player, "kill_score", AST_kill_score] remoteExec ["AST_fnc_db_save", 2, false];
			_cargosel = (ASTDropVehicles select _index) select 0;
			_cargo_name = (configFile >> "cfgVehicles" >> (_cargosel) >> "displayName") call bis_fnc_getcfgdata;
			openMap true;
			_host groupchat format ["%1을 공수받기 원하는 자리에 클릭하세요.", _cargo_name];
			mapclick = false;
			onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";
			waituntil {mapclick or !(visiblemap)};
			if (!visibleMap) exitwith {
				hint "공중투하 대기중";
				};
			_pos = [clickpos select 0, clickpos select 1, _flyheight];
			sleep 1;
			openMap false;
			hint parseText format["You have requested paradrop a %1<br/>Now money: %2",_displayName,AST_kill_score];
			_airgrp = createGroup (side player);
			_dir = _spawnmark getdir _pos;
			_air_array = [_spawnmark, _dir, _airtype, _airgrp] call BIS_fnc_spawnVehicle;
			_air = _air_array select 0;
			_air setpos [getpos _air select 0, getpos _air select 1, _flyheight];
			_air setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];
			_air sidechat "화물과 함께 접근하는 중!";
			player setVariable ["ghst_cargodrop", Time + _delay];
			_air flyinheight _flyheight;
			_airgrp setbehaviour "CARELESS";

			_wpdrop = _airgrp addWaypoint [_pos, 0];
			_wpdrop setWaypointSpeed "Normal";
			_wpdrop setWaypointBehaviour "CARELESS";

			//tracking Marker
			_trackname = format ["%1 Cargo Drop", name player];
			[_air, "ColorGreen", "mil_DOT",_trackname, true] spawn ghst_fnc_tracker;

			// Delete the crew and planes once they hit the egress point.
			_wphome = _airgrp addWaypoint [_spawnmark, 0];
			private _oldDist = _air distance2D _pos;
			while {_oldDist >= _air distance2D _pos} do {
				_oldDist = _air distance2D _pos;
				sleep 0.1;
			};
			if (!(alive _air) or {!(canMove _air)}) then {player groupChat "Shit we lost air support";} else {
				_dir = getdir _air;
				_chute = createVehicle ["B_Parachute_02_F",[0,0,0], [], 0, "FLY"];
				_chute setdir _dir;
				_chute setpos [(getpos _air select 0) - 20 * sin(_dir),(getpos _air select 1) - 20 * cos(_dir),(getpos _air select 2) - 10];
				_ghst_drop = createVehicle [_cargosel,position _chute, [], 0, "none"];
					//put camo on vehicles if they have it and random slat armor
					[_ghst_drop, FALSE, ["showCamonetCannon",1,"showCamonetPlates1",1,"showCamonetPlates2",1,"showCamonetTurret",1,"showCamonetHull",1]] call BIS_fnc_initVehicle;
					if (_cargosel isKindOf "LT_01_base_F") then {
						[
							_ghst_drop,
							["Indep_Olive",1], 
							["showCamonetCannon",1,"showCamonetPlates1",1,"showCamonetPlates2",1,"showCamonetTurret",1,"showCamonetHull",1]
						] call BIS_fnc_initVehicle;
					};
				ghst_local_vehicles pushback _ghst_drop;
				_ghst_drop attachTo [_chute,[0,0,1]];
					[_ghst_drop,_cargo_name,_chute] spawn { 
								private ["_cargo","_cargo_name","_smoke","_chute"];
								_cargo = _this select 0;
								_cargo_name = _this select 1;
								_chute = _this select 2;
								
								waituntil {(getposatl _cargo select 2) < 2 or isNull _chute}; 
								detach _cargo;
								_chute setVelocity [0,5,0];
								_cargo setvelocity [0,0,0];	
								_cargopos = getPosATL _cargo;
								_cargo setposatl _cargopos;
								_cargo setVectorUP (surfaceNormal [_cargopos select 0,_cargopos select 1]);
								//[_cargo, "ColorGrey", "mil_DOT", _cargo_name] spawn ghst_fnc_tracker;
								_VarName = "ghst_cargo" + str((count ghst_vehicles) + 1);
								_cargo setVariable ["spawner",_playeruid,true];
								missionNamespace setVariable [_VarName,_cargo];
								ghst_vehicles pushBack _VarName;
								//_smoke = "SmokeShellGreen" createVehicle (getPosatl _cargo);
					};

				_air sidechat "Air drop complete heading home";

			};

			_air setfuel 0.2;

			waituntil {(_air distance2D _pos) >= 1500 or (_air distance2D _spawnmark) <= 500};

			{deletevehicle _x} foreach crew _air;
			deletevehicle _air;
			sleep 20;
			deletegroup _airgrp;
		
			} else {
			hint("You selected nothing!")
		};
			
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;
