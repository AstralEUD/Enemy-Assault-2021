/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For give playtime reward               │
└──────────────────────────────────────────────────────*/

params ["_nowmoney","_tobe","_nowuid"];

while {true} do {
	if (count _playerConnectArr > 1) then {
		for "_i" from 0 to ((count _playerConnectArr)) do {
			_nowuid = _playerConnectArr select _i;
			_tobe = (["read", [_nowuid, "kill_score", 0]] call _inidbi) + 2;
			["write", [_nowuid, "kill_score", _nowscore]] call _inidbi;
		};
	sleep 900;
	};
};
			
