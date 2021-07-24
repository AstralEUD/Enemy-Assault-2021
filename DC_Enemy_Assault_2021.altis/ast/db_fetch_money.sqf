params ["_player"];
_id = owner _player;
_uid = getPlayerUID _player;
AST_kill_score = ["read", [_uid, "kill_score", nil]] call inidbi;
_id publicVariableClient "AST_kill_score";
