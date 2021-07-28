private ["_units","_rating","_score","_x"];
_units = _this select 0;
_rating = _this select 1;
_score = _this select 2;
{
	_x addrating _rating;
	_x addScore _score;
} foreach _units;