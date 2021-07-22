/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For add EH to give playtme score       │
└──────────────────────────────────────────────────────*/

_playerConnectArr = [];
addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	_playerConnectArr pushBackUnique "_uid";
}];
addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	_playerConnectArr  = _playerConnectArr - _uid;
}];
publicVariable "_playerConnectArr";
