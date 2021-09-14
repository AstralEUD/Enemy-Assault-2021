//INFANTRY
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_Inf = [];
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{	
			_f=(_x) getVariable ["EM_FREQ",0];
			if (_f==0) then{
				(_x) setVariable ["EM_FREQ", 78+(random 1)*11, true];
			};						
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(AGLToASL unitAimPosition _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalPowerLog = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower) call EM_Log;				
			_EM_Signal_Inf append [((_x) getVariable "EM_FREQ"), _signalPowerLog];				
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, unitAimPositionVisual _x, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], unitAimPositionVisual _x, 0, 0, 0, str round(_signalPowerLog), 1, 0.05, "PuristaMedium"];
			};		
		}forEach(ASLToAGL getPosASL player nearEntities [EM_Infantry_List, 1000]);
		EM_Signal_Inf = _EM_Signal_Inf;
	};
}];

//VEHICLES
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_Veh = [];
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{			
			_f=_x getVariable ["EM_FREQ",0];
			if (_f==0) then{
				_x setVariable ["EM_FREQ", 78+(random 1)*11, true];
			};					
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(AGLToASL unitAimPosition _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalPowerLog = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower) call EM_Log;			
			_EM_Signal_Veh append [(_x getVariable "EM_FREQ"), _signalPowerLog];			
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, unitAimPositionVisual _x, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], unitAimPositionVisual _x, 0, 0, 0, str round(_signalPowerLog), 1, 0.05, "PuristaMedium"];
			};			
		}forEach((player nearEntities["LandVehicle", 3000]));
		EM_Signal_Veh = _EM_Signal_Veh;
	};
}];

//MINES
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")	then{
		_EM_Signal_Mine = [];
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{
			_f=0;
			if (typeOf _x in EM_Mines_Mines) then {_f=random [430.9,431,431.1]};
			if (typeOf _x in EM_Mines_Remote) then {_f=random [432.9,433,433.1]};
			if (typeOf _x in EM_Mines_IED) then {_f=random [434.5,435,435.5]};
			if (typeOf _x in EM_Mines_IEDs) then {_f=random [434.8,435,435.2]};
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(getPosASL _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalPowerLog = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower) call EM_Log;
			_EM_Signal_Mine append [_f, _signalPowerLog];
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLtoAGL _gunPosASL, ASLToAGL getPosASLVisual _x, [ _cosine, 0, 1 - _cosine, 1 ]];
				drawIcon3D["", [ _cosine, 0, 1 - _cosine, 1 ], ASLToAGL getPosASLVisual _x, 0, 0, 0, str round(_signalPowerLog), 1, 0.05, "PuristaMedium"];
			};
		}forEach allMines;
		EM_Signal_Mine = _EM_Signal_Mine;
	};
}];

//Radio Towers
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_Radio = [];
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{			
			_towerHealth = 1-(getDammage (_x));			
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(getPosASL _x));
			_distance = player distance getPos _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalPowerLog = (_towerHealth * ([ _distance, EM_Power_Tower, _cosine ] call EM_CalcPower)) call EM_Log;			
			_EM_Signal_Radio append [(_x getVariable "EM_FREQ"), _signalPowerLog];		
			if(_signalPowerLog>-30)then{EM_Hint_Flag5=true;};
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, ASLToAGL getPosASL _x, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], ASLToAGL getPosASL _x, 0, 0, 0, str round(_signalPowerLog), 1, 0.05, "PuristaMedium"];
			};
		}forEach EM_Radios;
		EM_Signal_Radio = _EM_Signal_Radio;
	};
}];

//OBJECTIVES
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_Obj = [];
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{			
			_f=_x getVariable ["EM_FREQ",0];
			if (_f==0) then{
				_x setVariable ["EM_FREQ", 390+(random 1)*110, true];
			};					
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(AGLToASL unitAimPosition _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalPowerLog = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower) call EM_Log;			
			_EM_Signal_Obj append [(_x getVariable "EM_FREQ")+random [-1,0,1], _signalPowerLog];			
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, unitAimPositionVisual _x, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], unitAimPositionVisual _x, 0, 0, 0, str round(_signalPowerLog), 1, 0.05, "PuristaMedium"];
			};			
		}forEach(nearestObjects[player,EM_Object_List,1000,true]);
		EM_Signal_Obj = _EM_Signal_Obj;
	};
}];
