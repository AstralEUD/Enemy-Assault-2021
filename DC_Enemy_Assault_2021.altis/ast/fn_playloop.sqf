/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For give playtime reward               │
└──────────────────────────────────────────────────────*/

params ["_nowmoney","_tobe","_nowuid"];
playerConnectArr = [];
publicVariable "_playerConnectArr";
while {true} do {
	if (count playerConnectArr > 1) then {
		for "_i" from 0 to ((count playerConnectArr)) do {
			_nowuid = playerConnectArr select _i;
			_nowmoney = ["read", [_nowuid, "kill_score", 0]] call inidbi;
			_tobe = _nowmoney + 2;
			["write", [_nowuid, "kill_score", _tobe]] call inidbi;
		};
	sleep 900;
	};
};
			
