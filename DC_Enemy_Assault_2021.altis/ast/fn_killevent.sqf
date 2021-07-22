/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralEUD                │
│                                                       │
│   Description: For record Kill / TeamKill by iniDB2   │
│   Note: Need Optimization                             │
└──────────────────────────────────────────────────────*/
addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
	if (isNull _instigator) then {_instigator = _killer};
	private _nowtime = "getTimeStamp" call inidbi;
	private _killeruid = getPlayerUID _killer;
	if (isPlayer _killed) then {
		if (_killed isKindOf "CAManBase" && {((side group _killed) == west or (side group _killed) == civilian)}) exitWith {
			private _tkreport = format ["TEAMKILL REPORT // Time : %1, Killer : %2, Killed : %3, Killer UID : %4",_nowtime,_killer,_killed,_killeruid];
			["write", ["team_kill_maindb", _nowtime, _tkreport]] call inidbi;
			["write", [_killeruid, "teamkill", _tkreport]] call inidbi;
			hint parseText format ["<t size='2.0' color='#ff781f'> Attentions! </t><br/>%1 teamkilled %2",_killer,_killed];
		};
	};
	private _nowscore = (["read", [_killeruid, "kill_score", 0]] call inidbi) + 1;
	["write", [_killeruid, "kill_score", _nowscore]] call inidbi;
}
];
