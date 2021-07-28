params [
	"_uav",
	"_lockLaser","_pauseDisplay",
	"_uavPos_a","_uavPos_b","_laserPos_a","_laserPos_b","_laserDistance","_laserDirection","_intelB"
];

_uav setVariable [format["MIL_%1_IntelPaused",_uav],false];

_lockLaser = _uav addAction [
	"<t color='#88B985' shadow='2'>Lock/Unlock Laser</t>",
	{
		params [
			"","","","_uav",
			"_uavSTR"
		];
		if ((str _uav find "REMOTE") != -1) then {
			_uavSTR = [str _uav,0,((str _uav) find "REMOTE") - 2] call BIS_fnc_trimString;
			} else {
			_uavSTR = str _uav;
		};
		if (!(_uav getVariable [format["MIL_%1_LaserLocked",_uavSTR],false])) then {
			private _lockPos = getPosASL (laserTarget _uav);
			if ((_lockPos select 2) < 0) then {
				_lockPos set [2,0];
			};
			[_uav,[_lockPos,[0]]] remoteExec ["lockCameraTo",0];
			_uav setVariable [format["MIL_%1_LaserLocked",_uavSTR],true,true];
			} else {
			[_uav,[objNull,[0]]] remoteExec ["lockCameraTo",0];
			_uav setVariable [format["MIL_%1_LaserLocked",_uavSTR],false,true];
		};
	},
	_uav,
	1.6,
	false,
	true,
	"",
	"isLaserOn _target"
];
_pauseDisplay = _uav addAction [
	"<t color='#88B985' shadow='2'>Pause/Un-pause Laser Intel</t>",
	{
		params ["_uav"];
		if (!(_uav getVariable [format["MIL_%1_IntelPaused",_uav],false])) then {

			_uav setVariable [format["MIL_%1_IntelPaused",_uav],true];
			[
				"<t color='#ffffff' size='0.5' font='EtelkaNarrowMediumPro' align='left' shadow='0'>| |</t>",
				(safeZoneXABS + (safeZoneWABS * 0.618)), 
				(safeZoneY + (safeZoneH * 0.38)),
				99999,
				0,
				0,
				"MIL_EUAVI_PausedDisplay"
			] spawn BIS_fnc_dynamicText;

			} else {

			_uav setVariable [format["MIL_%1_IntelPaused",_uav],false];
			["",-1,-1,1,0,0,"MIL_EUAVI_PausedDisplay"] spawn BIS_fnc_dynamicText;
		};
	},
	nil,
	1.7,
	false,
	true,
	"",
	"isLaserOn _target"
];

_intelB = [_uav] spawn {
	params ["_uav","_targetObject"];
	while {true} do {
		waitUntil {isLaserOn _uav};
		if (({cursorObject isKindOf _x} count ["LandVehicle","Ship","Air"]) > 0) then {
			_targetObject = getText (configfile >> "CfgVehicles" >> typeOf cursorObject >> "displayName");
			
			[
				format["<t color='#ffffff' size='0.5' font='EtelkaMonospacePro' align='left' shadow='0'>%1</t>",_targetObject],
				(safeZoneXABS + (safeZoneWABS * 0.615)),
				(safeZoneY + (safeZoneH * 0.332)),
				11,
				0,
				0,
				"MIL_EUAVI_IntelB"
			] spawn BIS_fnc_dynamicText;
		};
		sleep 0.1;
		["",-1,-1,1,0,0,"MIL_EUAVI_IntelB"] spawn BIS_fnc_dynamicText;
	};
};

while {(UAVControl _uav) select 1 == "GUNNER"} do {
	waitUntil {(isLaserOn _uav) || ((UAVControl _uav) select 1 != "GUNNER")};
	if ((UAVControl _uav) select 1 != "GUNNER") exitWith {};
	_uavPos_a = [(mapGridPosition (getPosASL _uav)),0,((count (mapGridPosition (getPosASL _uav)))/2) - 1] call BIS_fnc_trimString;
	_uavPos_b = [(mapGridPosition (getPosASL _uav)),(count (mapGridPosition (getPosASL _uav)))/2,(count (mapGridPosition (getPosASL _uav))) - 1] call BIS_fnc_trimString;
	_laserPos_a = [(mapGridPosition (laserTarget _uav)),0,((count (mapGridPosition (laserTarget _uav)))/2) - 1] call BIS_fnc_trimString;
	_laserPos_b = [(mapGridPosition (laserTarget _uav)),(count (mapGridPosition (laserTarget _uav)))/2,(count (mapGridPosition (laserTarget _uav))) - 1] call BIS_fnc_trimString;
	_laserDistance = round (_uav distance2D (laserTarget _uav));
	_laserDirection = round (_uav getDir (laserTarget _uav));

	[
		format["<t color='#ffffff' size='0.5' font='EtelkaMonospacePro' align='left' shadow='0'>UAV<br/>GRID: %1 %2<br/><br/>LASER<br/>GRID: %3 %4<br/>DISTANCE: %5m<br/>DIRECTION: %6</t>",
			_uavPos_a,_uavPos_b,_laserPos_a,_laserPos_b,_laserDistance,_laserDirection
		],
		(safeZoneXABS + (safeZoneWABS * 0.618)), 
		(safeZoneY + (safeZoneH * 0.4175)),
		99999,
		0,
		0,
		"MIL_EUAVI_IntelA"
	] spawn BIS_fnc_dynamicText;

	if (_uav getVariable (format["MIL_%1_IntelPaused",_uav])) then {
		waitUntil {
			!(_uav getVariable (format["MIL_%1_IntelPaused",_uav])) ||
			((UAVControl _uav) select 1 != "GUNNER")
		};
		} else {
		sleep 0.1;
	};
	["",-1,-1,1,0,0,"MIL_EUAVI_IntelA"] spawn BIS_fnc_dynamicText;
};

MIL_EUAVI_ConnectedUAVs = MIL_EUAVI_ConnectedUAVs - [_uav];
publicVariable "MIL_EUAVI_ConnectedUAVs";

{
	_uav removeAction _x;
} forEach [
	_lockLaser,
	_pauseDisplay
];
["",-1,-1,1,0,0,"MIL_EUAVI_IntelA"] spawn BIS_fnc_dynamicText;
["",-1,-1,1,0,0,"MIL_EUAVI_PausedDisplay"] spawn BIS_fnc_dynamicText;
terminate _intelB;
_uav setVariable [format["MIL_%1_IntelPaused",_uav],false];