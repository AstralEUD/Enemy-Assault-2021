/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For check serverDB (Not player)        │
└──────────────────────────────────────────────────────*/

if (!isServer) exitWith {
    hint("Miscalled server-only function");
};

_checkexist = "exists" call _inidbi;
if (_checkexist == False) then {
	hint("Exist Failed")
	["new", "MainDB"] call OO_INIDBI;
	};
