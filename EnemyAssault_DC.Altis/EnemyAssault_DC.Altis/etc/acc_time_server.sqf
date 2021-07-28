//[] execVM "etc\acc_time_server.sqf";

while {true} do {
	if (daytime >= 7 && daytime <= 19) then {
		setTimeMultiplier 4;
		waitUntil {uisleep 1; daytime > 19};
	};
	if (daytime > 19 || daytime < 7) then {
		setTimeMultiplier 8;
		if (daytime > 19) then {
			waitUntil {uisleep 1; daytime < 7};
			waitUntil {uisleep 1; daytime > 7};
		} else {
			waitUntil {uisleep 1; daytime > 7};
		};
		setDate [2040, 5, 5, 7, 0];
	};
};