/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Test the HUD plus/minus notifications                 │
│   Call Example:                                                     │
│   [] execVM "ast\hud\test_hud.sqf";                                 │
└─────────────────────────────────────────────────────────────────────*/

// Wait for HUD to initialize
waitUntil {!isNil "AST_kill_score"};
sleep 3;

// Test positive notifications
systemChat "테스트: 양수 알림";
[100] call AST_fnc_hud_plus;
sleep 5;
[1000] call AST_fnc_hud_plus;
sleep 5;
[10000] call AST_fnc_hud_plus;
sleep 5;

// Test negative notifications
systemChat "테스트: 음수 알림";
[100] call AST_fnc_hud_minus;
sleep 5;
[1000] call AST_fnc_hud_minus;
sleep 5;
[10000] call AST_fnc_hud_minus;
sleep 5;

systemChat "HUD 테스트 완료";
