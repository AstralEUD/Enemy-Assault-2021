params ["_player","_key"];
if ((AST_debugKey find _key) != -1) then {
	{[_X,'succeeded'] call BIS_fnc_taskSetState;} foreach Ghst_Current_tasks;;
	AST_debugKey deleteAt (AST_debugKey find _key);
	["write", ["SERVER_KEY", "debug", AST_debugKey]] call inidbi;
	publicVariableServer AST_debugKey;
	"입력 성공! Task를 스킵합니다." remoteExec ["hint",_player];
} else {
	"입력된 키가 잘못되었습니다." remoteExec ["hint",_player];
};