/*────────────────────────────────────────────────────────────────────┐
│   Author: Bryan "Tonic" Boardwine                                   │
│   Modified By: Astral                                               │
│                                                                     │
│   Description: Monitors when the ESC menu is pulled up and blocks   │
│   off certain controls when conditions meet.                        │
└─────────────────────────────────────────────────────────────────────*/

disableSerialization;

private _escSync = { 
    disableSerialization;
    private _abortButton = ((findDisplay 49) displayCtrl 104);
    private _abortTime = 5;
    private _timeStamp = time + _abortTime;

    waitUntil {
        _abortButton ctrlSetText format [localize "STR_AST_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
        _abortButton ctrlCommit 0;
        if (dialog && {isNull (findDisplay 7300)}) then {closeDialog 0};

        round(_timeStamp - time) <= 0 || {isNull (findDisplay 49)}
    };

    _abortButton ctrlSetText format ["접속 종료"];
    _abortButton ctrlCommit 0;
    _abortButton ctrlEnable true;
};

private _canUseControls = true;

for "_i" from 0 to 1 step 0 do {
    waitUntil {!isNull (findDisplay 49)};
	private _abortButton = ((findDisplay 49) displayCtrl 104);
    _abortButton buttonSetAction "
        [true] call AST_fnc_savePlaytime; 
        [player, 'kill_score', AST_kill_score] remoteExec ['AST_fnc_db_save', 2, false];
        systemChat '플레이 시간이 저장되었습니다.';
    ";
    private _respawnButton = ((findDisplay 49) displayCtrl 1010);
    private _fieldManual = ((findDisplay 49) displayCtrl 122);
    private _saveButton = ((findDisplay 49) displayCtrl 103);
    _saveButton ctrlSetText "";

    //Extras
	private _topButton = ((findDisplay 49) displayCtrl 2);
	_topButton ctrlEnable false;
	_topButton ctrlSetText format ["ENEMY ASSAULT 2021"];
	_saveButton ctrlEnable false;
	_saveButton ctrlSetText format ["Player UID: %1",getPlayerUID player];

    //Block off our buttons first.
    _abortButton ctrlEnable false;
    //_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
    //_fieldManual ctrlShow false;

    [] spawn _escSync;

    waitUntil {isNull (findDisplay 49) || {!alive player}};
    if (!isNull (findDisplay 49) && {!alive player}) then {
        (findDisplay 49) closeDisplay 2;
    };
};