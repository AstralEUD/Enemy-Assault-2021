/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: For check serverDB (Not player)        │
└──────────────────────────────────────────────────────*/

if (!isServer) exitWith {
    hint("Miscalled server-only function");
};

ASTAirArray = [];
publicVariable "ASTAirArray";

// inidbi2 variable check
if (isNil "inidbi") then {
    hint("Exist Failed");
    inidbi = ["new", "MainDB"] call OO_INIDBI;
    publicVariable "inidbi";
    _checkexist = "exists" call inidbi;
    if (_checkexist == False) then {
        diag_log "Error for INIDB2";
    };
};

