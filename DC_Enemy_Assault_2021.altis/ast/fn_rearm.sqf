/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: Rearm & Refuel module                  │
└──────────────────────────────────────────────────────*/

params ["_playerVehicle","_nowmoney","_tobe","_playerUID"];
_playerUID = getPlayerUID player;
_nowmoney = ["read", [_playerUID, "kill_score", 0]] call inidbi;
if (_nowmoney < 2) exitWith {format "Not enough Minerals!";};
if (vehicle player == player) exitWith {format "Rearm can be used while you're in a vehicle!";};
