/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For  refund vehicle                    │
└──────────────────────────────────────────────────────*/

params["_spCheck","_selections","_price","_crewCount","_nowmoney","_tobe","_playerUID","_position"];
_position = getMarkerPos ["Vehicle_Spawn_Marker",false];
_spCheck = nearestObjects [_position, ["landVehicle","Air","Ship"], 12] select 0;
_playerUID = getPlayerUID player;
if (!isNil "_spCheck") exitWith {hint "There is no vehicle/aircraft/shop on the position"};
if (_spCheck getVariable ["spawner",""] != _playerUID) exitWith {hint "You're not owner/spawner of this Vehicle"};
[
	["Are you sure that want to refund vehicles really?"],
	"Agreement",
	{
		if _confirmed then {
			//systemchat "You accepted the T&C's";
			_selections = ASTvehicles find _spCheck;
			_price = round (((ASTvehicles find _selections) select 1 )*0.8)
			if (!count(fullCrew [_spCheck, "cargo"]) < 1) exitWith {hint "There is still crew on the vehicle"};
			[player] remoteExec ["AST_fnc_db_fetch_money", 2, false];
			_tobe = AST_kill_score + _price;
			[player, "kill_score", _tobe] remoteExec ["AST_fnc_db_save", 2, false];
			deleteVehicle _spCheck;
		} else {
			hint {"You rejcted it"};
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;
