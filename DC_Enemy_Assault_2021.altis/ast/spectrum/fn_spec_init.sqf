[] spawn {
	objectList = ["Land_DataTerminal_01_F","Land_Suitcase_F","Land_PlasticCase_01_large_F","Land_PlasticCase_01_medium_F","Land_PlasticCase_01_small_F","Land_MetalCase_01_large_F","Land_MetalCase_01_medium_F","Land_MetalCase_01_small_F","Land_PCSet_01_case_F","CBRNContainer_01_closed_yellow_F","CBRNContainer_01_closed_olive_F","Land_PlasticCase_01_large_black_F","Land_PlasticCase_01_large_black_CBRN_F","Land_PlasticCase_01_large_CBRN_F","Land_PlasticCase_01_large_olive_F","Land_PlasticCase_01_large_olive_CBRN_F","Land_PlasticCase_01_medium_black_F","Land_PlasticCase_01_medium_black_CBRN_F","Land_PlasticCase_01_medium_CBRN_F","Land_PlasticCase_01_medium_olive_F","Land_PlasticCase_01_medium_olive_CBRN_F","Land_PlasticCase_01_small_black_F","Land_PlasticCase_01_small_black_CBRN_F","Land_PlasticCase_01_small_CBRN_F","Land_PlasticCase_01_small_olive_F","Land_PlasticCase_01_small_olive_CBRN_F"];
	missionNamespace setVariable ["#EM_FMin",0];
	missionNamespace setVariable ["#EM_FMax", 360];
	maxdistance = 200;
	missionNamespace setVariable ["#EM_SMin", 0];
	missionNamespace setVariable ["#EM_SMax", maxdistance];
	while {true} do {
		while {(primaryWeapon player) == "hgun_esd_01_F"} do {
			private _nearObject = nearestObjects [player,[objectList],maxdistance, true];
			private _playerpos = position player;
			_nearObject = _nearObject apply {(_x select 0) = _playerpos getDir (_x select 0)};
			missionNamespace setVariable ["#EM_Value", _nearObject];
			sleep 3;
		};
	};
};