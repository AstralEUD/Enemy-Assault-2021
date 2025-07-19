/*────────────────────────────────────────────────────────────────────┐
│   Author: Enemy Assault Team                                         │
│                                                                     │
│   Description: Rewards players for successful return to base after  │
│   mission completion                                                │
│   Call Example:                                                     │
│   [] call AST_fnc_rtbReward;                                        │
└─────────────────────────────────────────────────────────────────────*/

SAKY_Reward = 0;

SAKY_RTBReward_GiveReward = {
	if((position player) inArea "AST_basePositions") then {
		if(SAKY_Reward > 0 && (vehicle player == player)) then {
			_player = player;
			_increase = SAKY_Reward;
			//AST_gotcha_ticket = AST_gotcha_ticket + _increase;
			systemChat format ["성공적으로 복귀하여 %1의 자원을 획득하였습니다.",_increase*30];
			AST_kill_score = AST_kill_score + (_increase * 30);
			[_increase * 30] call AST_fnc_hud_plus;
			SAKY_Reward = 0;
		};
	};
};

if (hasInterface) then {
	[] spawn {
		while {true} do {
			sleep 10;
			call SAKY_RTBreward_GiveReward;
		};
	};
	player addEventHandler ["Killed", {
		if (SAKY_Reward > 0) then {
			systemChat ("사망으로 인해 복귀 보너스가 초기화되었습니다.");
			SAKY_Reward = 0;
		};
	}];
};