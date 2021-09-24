SCM_Attached=[];
SCM_FlagTexture="";
SCM_DisplayIDD=10001;
SCM_CaptionRscLayerInc=0;
SCM_EarPlugVolume=0;

_SCM_OpenEventHandler = {   
	_keyInputEH = findDisplay 46 displayaddEventHandler ["KeyDown", {   
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];   
		if(_key==0xDB) then {   
			/*
			if(isNull(findDisplay SCM_DisplayIDD))then{   
				if(!visibleMap)then{setMousePosition [0.5,0.5]};   
				createDialog "SakyContextMenuBase";
			};   			
			*/
			if(!visibleMap)then{setMousePosition [0.5,0.5]}; 
			findDisplay 46 createDisplay "SakyContextMenuBase";			
		};   
	}];   
}; 

_SCM_VehicleEventHandler={
	player addEventHandler ["GetInMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		call SCM_fnc_removeChemStrobes;
		if (driver _vehicle == player) then {SCM_FlagTexture call SCM_fnc_forceFlagTexture};
	}];	
	player addEventHandler ["GetOutMan", {
		params ["_unit", "_role", "_vehicle", "_turret"];
		SCM_FlagTexture call SCM_fnc_forceFlagTexture;
	}];	
	player addEventHandler ["Respawn", {
		params ["_unit", "_corpse"];
		SCM_FlagTexture="";		
	}];
	addMissionEventHandler ["HandleChatMessage", {
		params ["_channel", "_owner", "_from", "_text", "_person", "_name", "_strID", "_forcedDisplay", "_isPlayerMessage", "_sentenceType", "_chatMessageType"];	
		if ((_person distance player)<30) then {[_person, _text] spawn SCM_fnc_playGestureRemote};
	}];
};

[] spawn {
	waitUntil{!isNull findDisplay 46};
	call _SCM_OpenEventHandler;
	call _SCM_VehicleEventHandler;
	systemChat "CTME Init";
};