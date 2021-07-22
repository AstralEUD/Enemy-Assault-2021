/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralEUD                │
│                                                       │
│   Description: For spawn vehicle with currency        │
│   Write like this: ["classname",price]                │
└──────────────────────────────────────────────────────*/

params ["_position", "_vehicle","_nowmoney","_spCheck","_direction","_nowscore"];
_nowmoney = ["read", ["kill_score", _killeruid, 0]] call _inidbi;
hint format ["Now money : %1",_nowmoney];
_ASTvehicles apply {
	[
		[getText(configFile >> "CfgVehicles" >> _x select 0 >> "displayName")],
		[format ["Points: %1",_x select 1],
		[getText(configFile >> "CfgVehicles" >> _x select 0 >> "picture")],
		[],
		//[getText(configFile >> "CfgVehicles" >> _x select 0 >> "icon"),[random 1,random 1,random 1,1]],
		getText(configFile >> "CfgVehicles" >> _x select 0 >> "displayName"),
		_x,
		getNumber(configFile >> "CfgVehicles" >> _x select 0 >> "scope")
	]
};
[
	[
		_ASTvehicles,
		4, // Selects the quadbike by default
		false // Multi select disabled
	],
	"Vehicle Shop",
	{
		/*systemchat format["_confirmed: %1",_confirmed];
		systemchat format["_index: %1",_index];
		systemchat format["_data: %1",_data];
		systemchat format["_value: %1",_value];*/
		if (_nowmoney < ((_ASTvehicles select _index) select 1)) exitWith {hint "Not enough minerals.";};
		if (_confirmed == True) then {
			if(isNil "_position") exitWith {hint "The spawn point marker doesn't exist?";};
			_spCheck = nearestObjects[_position,["landVehicle","Air","Ship"],12] select 0;
			if(!isNil "_spCheck") exitWith {hint "There is a Car/Aircraft/Ship on the spawn point. Check out!"};
			_direction = markerDir Vehicle_Spawn;
			_position = getMarkerPos Vehicle_Spawn;
			_vehicle = (_ASTvehicles select _index) select 0) createVehicle _position;
			_vehicle allowDamage false;
			_vehicle setPos _position; //Make sure it gets set onto the position.
			_vehicle setDir _direction; //Set the vehicles direction the same as the marker.
			_vehicle allowDamage true;
			_nowscore = _nowmoney - ((_ASTvehicles select _index) select 1);
			["write", [_killeruid, "kill_score", _nowscore]] call _inidbi;
			hint parseText format["You have spawned a %1<br/>Now money: %2",_displayName,_nowscore];
			} else {
			hint("You selected nothing!")
		};
			
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_listbox;
