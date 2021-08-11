/*──────────────────────────────────────────────────────┐
│   Author: Astral                                      │
│   Github: https://github.com/AstralKG                 │
│                                                       │
│   Description: Rearm & Refuel module                  │
└──────────────────────────────────────────────────────*/

params ["_playerVehicle","_nowmoney","_tobe","_playerUID"];
[player] remoteExec ["AST_fnc_fetch_money", 2, false];
if (AST_kill_score < 5) exitWith {hint "Not enough Minerals!";};
if (vehicle player == player) exitWith {hint "Rearm can be used while you're in a vehicle!";};
_vec = (vehicle player);
_type = typeOf vehicle player;
titleText [localize "STR_M04t83", "PLAIN DOWN",0.3];
for [{_loop2=0}, {_loop2<1}, {_loop2=_loop2}] do {
	sleep 0.200;	    		    
	if (getDammage _vec > 0) then {_vec setDammage ((getDammage _vec)-0.0125);};
	if (Fuel _vec < 1) then {_vec setFuel ((Fuel _vec)+0.0125);};
	if (getDammage _vec == 0 and Fuel _vec == 1) then {_loop2=1;};
	if(_vec != vehicle player or speed _vec < -2 or speed _vec > 2 or position _vec select 2 > 2.0) then {_loop2=1;titleText [localize "STR_M04t84", "PLAIN DOWN",0.3];};
	_dam = (getDammage _vec)*100;
	_ful = (Fuel _vec)*100;
	hint format["Damage: %1\nFuel: %2",Round _dam,Round _ful];
};
_tobe = AST_kill_score - 5;
[player, "kill_score", _tobe] remoteExecCall ["AST_fnc_db_save", 2, false];
_vec setVehicleAmmo 1;	
