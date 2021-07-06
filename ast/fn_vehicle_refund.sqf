/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For  refund vehicle                    │
└──────────────────────────────────────────────────────*/

params["_spCheck","_selections","_price","_crewCount","_nowmoney","_tobe"];
private _position = getMarkerPos Vehicle_Spawn;
_spCheck = nearestObjects[_position,["landVehicle","Air","Ship"],12] select 0;
if (!isNil "_spCheck") exitWith {hint "There is no vehicle/aircraft/shop on the position"};
[
	["Are you sure that want to refund vehicles really?"],
	"Agreement",
	{
		if _confirmed then {
			//systemchat "You accepted the T&C's";
			_selections = _vehicles find _spCheck;
			_price = round (((_vehicles find _selections) select 1 ;)*0.8)
			if (!count(fullCrew [_spCheck, "cargo"]) < 1) exitWith {hint "There is still crew on the vehicle"};
			_nowmoney = ["read", ["kill_score", _killeruid, 0]] call _inidbi;
			_tobe = _nowmoney + _price
			["write", [_killeruid, "kill_score", _tobe]] call _inidbi;
			deleteVehicle _spCheck;
		} else {
			hint {"You rejcted it"};
		};
	},
	"", // reverts to default
	""  // reverts to default, disable cancel option
] call CAU_UserInputMenus_fnc_guiMessage;
