/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Enables damage for a mission vehicle                  │
│   Call Example:                                                     │
│   [_taskName] call AST_fnc_damageControl;                           │
└─────────────────────────────────────────────────────────────────────*/

params ["_tsk"];
_veh = missionNameSpace getVariable [_tsk, objNull];
_veh allowDamage true;
_veh allowDammage true;