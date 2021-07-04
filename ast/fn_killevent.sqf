/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralEUD                │
│                                                       │
│   Description: For record Kill / TeamKill by iniDB2   │
│   Note: Need Optimization                             │
└──────────────────────────────────────────────────────*/

if(hasInterface)then{
    addMissionEventHandler ["EntityKilled",{
        params ["_killed", "_killer", "_instigator"];
		if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
        if (isNull _instigator) then {_instigator = _killer};
		_nowtime = "getTimeStamp" call _inidbi;
		_killeruid = getPlayerUID _killer;
		if (isPlayer _killed) then {
			if (_killed isKindOf "CAManBase" && {((side group _killed) == west or (side group _killed) == civilian)}) exitWith {
				_tkreport = format ["TEAMKILL REPORT // Time : %1, Killer : %2, Killed : %3, Killer UID : %4",_nowtime,_killer,_killed,_killeruid];
				["write", ["team_kill_maindb", _nowtime, _tkreport]] call _inidbi;
				["write", [_killeruid, "teamkill", _tkreport]] call _inidbi;
				hint parseText format ["<t size='2.0' color='#ff781f'> Attentions! </t><br/>%1 teamkilled %2",_killer,_killed];};};
		_killreport = format ["KILL REPORT // Time : %1, Killer : %2, Killer UID : %3",_nowtime,_killer,_killeruid];
		["write", ["normal_kill_maindb", _nowtime, _killreport]] call _inidbi;
		_nowscore = (["read", [_killeruid, "kill_score", 0]] call _inidbi) + 1;
		["write", [_killeruid, "kill_score", _nowscore]] call _inidbi;
		};
	};
};
		