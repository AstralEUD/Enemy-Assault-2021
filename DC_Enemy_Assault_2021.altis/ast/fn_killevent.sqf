/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralEUD                │
│                                                       │
│   Description: For record Kill / TeamKill by iniDB2   │
│   Note: Need Optimization                             │
└──────────────────────────────────────────────────────*/
ASTAirArray = [];
publicVariable "ASTAirArray";
//Air Array

addMissionEventHandler ["EntityKilled",{
	params ["_killed", "_killer", "_instigator"];
	if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0};
	if (isNull _instigator) then {_instigator = _killer};
	if (_killer == _killed) exitWith {};
	if (_killeruid == "") exitWith {};
	if (side group _killed == civilian) exitWith {
		[5] remoteExec ["ast_fnc_minusMoney", owner _killer];
	};
	if (isPlayer _killed) then {
		if (_killed isKindOf "Man" && {((side group _killed) == west or (side group _killed) == civilian)}) exitWith {
			private _killeruid = getPlayerUID _killer;
			private _nowtime = "getTimeStamp" call inidbi;
			private _tkreport = format ["TEAMKILL REPORT // Time : %1, Killer : %2, Killed : %3, Killer UID : %4",_nowtime,_killer,_killed,_killeruid];
			["write", ["team_kill_maindb", _nowtime, _tkreport]] call inidbi;
			["write", [_killeruid, "teamkill", _tkreport]] call inidbi;
			hint parseText format ["<t size='2.0' color='#ff781f'> Attentions! </t><br/>%1 teamkilled %2",_killer,_killed];
		};
	if (_killed isKindOf "Man") then {
		[3] remoteExec ["ast_fnc_addMoney", owner _killer];
	};
	};
}
];
