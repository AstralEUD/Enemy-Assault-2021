[] spawn {
	while {true} do {
		if (currentWeapon player == "hgun_esd_01_F")then{EM_Hint_Flag1=true; systemChat "HINT1 FLAG UP"};	
		_EM_antenna = (handgunItems player)#0;
		if (_EM_antenna != EM_antennaPrevious)then{
			switch (_EM_antenna)	do	{
				case "muzzle_antenna_01_f":{EM_Hint_Flag2=true; systemChat "HINT2 FLAG UP"};
				case "muzzle_antenna_02_f":{EM_Hint_Flag3=true; systemChat "HINT3 FLAG UP"};
				case "muzzle_antenna_03_f":{EM_Hint_Flag4=true; systemChat "HINT4 FLAG UP"};
				default {};
			};
		};
		sleep 0.5;
	};
};