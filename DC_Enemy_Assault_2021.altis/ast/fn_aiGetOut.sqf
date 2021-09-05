private _list = fullCrew (vehicle player);
_seclist = [];
{
	if (!isPlayer _x) then {
		_seclist pushBack _x;
	};
} forEach _list;
if (count _seclist == 0) exitWith {hint "AI가 탑승하고 있지 않습니다. 다시 확인해 주세요!";};
{
	doGetOut _x;
} forEach _seclist;
hint "AI를 내리도록 하였습니다!";