if (isDedicated) exitWith {};
waitUntil {!isNull player};

(findDisplay 46) displayAddEventHandler ["KeyDown", {
	params ["_control", "_dikCode", "_shift", "_ctrl", "_alt"];

	private _handled = false;

	switch (_dikCode) do {
		// Key 0
		case 13: {
			if (isNil "AR_active") then {AR_active = false;};
			if (AR_active) exitWith {AR_active = false; _handled = true;};

			if (!isNull objectParent player) exitWith {};
			if (surfaceIsWater (getPos player)) exitWith {};

			AR_active = true;
			AR_weapon = currentWeapon player;
			AR_animation = switch (true) do {
				case (AR_weapon isEqualTo ""): {"AmovPercMevaSnonWnonDf"};
				case (AR_weapon isEqualTo (primaryWeapon player)): {"AmovPercMevaSlowWrflDf"};
				case (AR_weapon isEqualTo (secondaryWeapon player)): {"AmovPercMevaSlowWrflDf"};
				case (AR_weapon isEqualTo (handgunWeapon player)): {"AmovPercMevaSlowWpstDf"};
			};

			player playMoveNow AR_animation;

			player addEventHandler ["AnimChanged", {
				if ((!AR_active) || {!((currentWeapon player) isEqualTo AR_weapon)} || {!isNull objectParent player} || {surfaceIsWater (getPos player)}) exitWith {
					player removeEventHandler ["AnimChanged", _thisEventHandler];

					AR_weapon = currentWeapon player;
					AR_animation = switch (true) do {
						case (AR_weapon isEqualTo ""): {"AmovPercMstpSnonWnonDnon"};
						case (AR_weapon isEqualTo (primaryWeapon player)): {"AmovPercMstpSlowWrflDnon"};
						case (AR_weapon isEqualTo (secondaryWeapon player)): {"AmovPercMevaSlowWlnrDf"};
						case (AR_weapon isEqualTo (handgunWeapon player)): {"AmovPercMstpSlowWpstDnon"};
					};

					player playMoveNow AR_animation;

					AR_active = false;
					AR_weapon = nil;
					AR_animation = nil;
				};

				player playMoveNow AR_animation;
			}];

			_handled = true;
		};
	};

	_handled
}];