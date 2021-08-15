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
//Air Array 

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

addMissionEventHandler ["PlayerConnected",
{
	params ["_id", "_uid", "_name", "_jip", "_owner"];
    _score = ["read", [_uid, "kill_score", 15]] call inidbi;
    [_score] remoteExec ["ast_fnc_addMoney", _owner];
}];
