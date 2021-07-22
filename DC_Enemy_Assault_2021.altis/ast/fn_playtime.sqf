/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For add EH to give playtme score       │
└──────────────────────────────────────────────────────*/

addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	playerConnectArr pushBackUnique "_uid";
}];
addMissionEventHandler ["PlayerDisconnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
	playerConnectArr  = playerConnectArr - _uid;
}];
publicVariable "_playerConnectArr";
