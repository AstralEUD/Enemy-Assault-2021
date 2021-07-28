waitUntil { !(isNull player) };
waitUntil { time > 0 };

if (isNil "isJIP") then {
	isJIP = false;
	player setVariable ["isJIP", false, true];
} else {
	if (isJIP) then {
		player setVariable ["isJIP", true, true];
	} else {
		player setVariable ["isJIP", false, true];
	};
};

[] Call StrobeOFF;

if (!isServer) exitWith {};







