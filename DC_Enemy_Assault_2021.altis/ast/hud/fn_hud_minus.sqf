/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Shows a negative value in the HUD with fade-out      │
│   Call Example:                                                     │
│   [amount] call AST_fnc_hud_minus;                                  │
└─────────────────────────────────────────────────────────────────────*/

// [숫자] call AST_fnc_hud_minus;
params ["_input"];
AST_HUD_STATUS = "-" + str(_input);
[] call AST_fnc_hud_update;

