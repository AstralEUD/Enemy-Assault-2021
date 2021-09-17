[] spawn {
	private _hc = entities "HeadlessClient_F";
	private _vPlayers = allPlayers - _hc;
	private _firearray = [];
	private _Players = [];
	{
		private _check2 = vehicle _x;
		if (!(_check2 isKindOf "Plane") or !(_check2 isKindOf "Helicopter")) then 
		{
			_Players pushBackUnique _x;
		};
	} forEach _vPlayers;
	[[blufor, "HQ"], "작전지를 정리하겠다. 아군들은 베이스로 빠른 대피바란다."] remoteExec ["sideChat"];
	_fireOK = true;
	while {_fireOk == true} do {
		_firearray = [];
		{
			private _check = (getPos _x) inArea "AST_basePositions"; 
			if (_check == true) then {
				_firearray append _x;
			};
		} forEach _Players;
	};
};