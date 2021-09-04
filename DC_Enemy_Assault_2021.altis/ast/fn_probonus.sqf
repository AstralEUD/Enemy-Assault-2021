params ["_killedpos"];
private _mypos = position player;
private _dist = _killedpos distance2D _mypos;
if (_dist < 200) then {
	AST_kill_score = AST_kill_score + 1;
};