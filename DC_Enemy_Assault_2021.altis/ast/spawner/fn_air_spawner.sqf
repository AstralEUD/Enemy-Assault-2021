/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralEUD                │
│                                                       │
│   Description: For spawn air with currency            │
│   Write like this: ["classname",price]                │
└──────────────────────────────────────────────────────*/

params["_spCheck","_position","_direction","_vehicle","_playeruid","_nowscore","_caller"];
hint format ["Now money : %1",AST_kill_score];
[
	[
		ASTAirSpawnList,
		4, // Selects the quadbike by default
		false // Multi select disabled
	],
	"Vehicle Shop",
	{
		/*systemchat format["_confirmed: %1",_confirmed];
		systemchat format["_index: %1",_index];
		systemchat format["_data: %1",_data];
		systemchat format["_value: %1",_value];*/
		if (_confirmed == True) then {
			if (AST_kill_score < ((ASTairlist select _index) select 1)) exitWith {hint "Not enough minerals.";};
			_direction = markerDir "AST_Air_Spawn_Marker";
			_playeruid = getPlayerUID player;
			_position = getMarkerPos ["AST_Air_Spawn_Marker",false];
			_displayName = getText(configFile >> "CfgVehicles" >> (ASTairlist select _index) select 0 >> "displayName");
			hint parseText format["You have spawned a %1<br/>Now money: %2",_displayName,AST_kill_score];
			_airclass = (ASTairlist select _index) select 0;
			AST_kill_score = AST_kill_score - ((ASTairlist select _index) select 1);
			_price = (ASTairlist select _index) select 1;
			[_price] call AST_fnc_hud_minus;
			[player, "kill_score", AST_kill_score] remoteExec ["AST_fnc_db_save", 2, false];
			if ((_airclass == "B_Plane_Fighter_01_Stealth_F") or (_airclass == "I_Plane_Fighter_03_dynamicLoadout_F") or (_airclass == "I_Plane_Fighter_04_F")) then {
				[_airclass, player] spawn AST_fnc_inair;
			} else {
				if(isNil "_position") exitWith {hint "The spawn point marker doesn't exist?"};
				_spCheck = nearestObjects [_position, ["landVehicle","Air","Ship"], 12] select 0;
				if(!isNil "_spCheck") exitWith {hint "There is a Car/Aircraft/Ship on the spawn point. Check out!"};
				_vehicle = ((ASTairlist select _index) select 0) createVehicle _position;
				_vehicle allowDamage false;
				_vehicle setPos _position; //Make sure it gets set onto the position.
				_vehicle setDir _direction; //Set the vehicles direction the same as the marker.
				_vehicle allowDamage true;
				_vehicle setVariable ["spawner",_playeruid,true];
				_VarName = "ghst_air" + str((count ghst_vehicles) + 1);
				missionNamespace setVariable [_VarName,_vehicle];
				ghst_vehicles pushBack _VarName;
			};
			} else {
			hint("You selected nothing!")
		};
			
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;
