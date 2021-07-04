HCPresent = if ( isNil  "HC")  then {False} else {true};
if (((_this select 0) == 1) and HCPresent) then {
	// Run on the HC only
	if !(isServer or hasInterface) then {
		execVM "init_HC.sqf";
	};
} else {
	// Run on the server only
	if isServer then {
		execVM "init_HC.sqf";
	};
};