/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For check serverDB (Not player)        │
└──────────────────────────────────────────────────────*/

if (!isServer) exitWith {
    hint("Miscalled server-only function");
};

// inidbi2 variable check
if (isNil "_inidbi") then {
    hint("Exist Failed");
    _inidbi = ["new", "MainDB"] call OO_INIDBI;
    publicVariable "inidbi";
    _checkexist = "exists" call _inidbi;
    if (_checkexist == False) then {
        diag_log "Error for INIDB2";
    };
};

