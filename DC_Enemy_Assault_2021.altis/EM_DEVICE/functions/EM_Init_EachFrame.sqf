addMissionEventHandler ["EachFrame",{ 
	if (currentWeapon player == "hgun_esd_01_F")then{
		EM_Hint_Flag1=true;
		_EM_antenna = (handgunItems player)#0;
		if (_EM_antenna != EM_antennaPrevious)then{
			_EM_Values = [ 0, 0, 0, 0 ];
			switch (_EM_antenna)	do	{
				case "muzzle_antenna_01_f":{_EM_Values = [ 78, 89, -60, -10 ]; EM_Hint_Flag2=true;};
				case "muzzle_antenna_02_f":{_EM_Values = [ 390, 500, -60, -10 ]; EM_Hint_Flag3=true;};
				case "muzzle_antenna_03_f":{_EM_Values = [ 430, 436, -60, -10 ]; EM_Hint_Flag4=true;};
				default {_EM_Values = [ 0, 0, -100, -100 ];};
			};
			missionNamespace setVariable["#EM_FMin", _EM_Values #0];
			missionNamespace setVariable["#EM_FMax", _EM_Values #1];
			missionNamespace setVariable["#EM_SMin", _EM_Values #2];
			missionNamespace setVariable["#EM_SMax", _EM_Values #3];
			missionNamespace setVariable["#EM_SelMin", (_EM_Values #0 + _EM_Values #1) / 2 - (_EM_Values #1 - _EM_Values #0) / 30];
			missionNamespace setVariable["#EM_SelMax", (_EM_Values #0 + _EM_Values #1) / 2 + (_EM_Values #1 - _EM_Values #0) / 30];
			EM_antennaPrevious = _EM_antenna;
		};				
		
		_EM_Progress = 0;
		if (!isNil "EM_TrigTime")then{
			_EM_Progress = 1 + time - EM_TrigTime;
			if (_EM_Progress > 1)	then{
				call EM_Mine_Detonator;
				_EM_Progress = 0;
				EM_TrigTime = nil;
			};
		};
		
		EM_AllowTransmit = (handgunItems player#0 == "muzzle_antenna_03_f") && !(dialog || visibleMap);
		missionNamespace setVariable["#EM_Values", EM_Signal_Inf + EM_Signal_Mine + EM_Signal_Veh + EM_Signal_Radio + EM_Signal_Obj];
		missionNamespace setVariable["#EM_Progress", _EM_Progress];		
	};
}];
