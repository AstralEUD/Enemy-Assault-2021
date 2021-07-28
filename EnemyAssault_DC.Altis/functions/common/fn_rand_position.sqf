private ["_pos_mark","_radarray","_wateronly","_dir","_position_mark","_radx","_rady","_pos","_xpos","_ypos","_rx","_ry","_loop","_time"];

_pos_mark = _this select 0;//position or marker
_radarray = _this select 1;//array of x,y radius and direction
_wateronly = param [2, false, [true]];//get position in water only

if (typename _pos_mark == typename []) then {

	_position_mark = _pos_mark;//position array
	_radx = _radarray select 0;//radius A if position is Not a marker
	_rady = _radarray select 1;//radius B if position is Not a marker
	_dir = _radarray select 2;
	if (isnil "_dir") then {
	_dir = (random 360) * -1;//random direction if not given
	} else {
	_dir = (_radarray select 2) * -1;//specified direction
	};
	
} else {

	_position_mark = (getmarkerpos _pos_mark);//getmarker position
	_radx = (getMarkerSize _pos_mark) select 0;//radius A if position is a marker
	_rady = (getMarkerSize _pos_mark) select 1;//radius b if position is a marker
	_dir = (markerDir _pos_mark) * -1;//Marker Direction
	
};

_loop = true;
_time = time;

while {_loop} do {

	_rx = (random (_radx * 2)) - _radx;
	_ry = (random (_rady * 2)) - _rady;
	
	if (_dir != 0) then {

		_xpos = (abs(_position_mark select 0)) + ((cos _dir) * _rx - (sin _dir) * _ry);	
		_ypos = (abs(_position_mark select 1)) + ((sin _dir) * _rx + (cos _dir) * _ry);

	} else {
	
		_xpos = (abs(_position_mark select 0)) + _rx;
		_ypos = (abs(_position_mark select 1)) + _ry;	
	
	};	
	
	_pos = [_xpos,_ypos,0];
	
	if (!_wateronly and !(surfaceIsWater [_pos select 0,_pos select 1])) then {_loop = false};
	if (_wateronly and (surfaceIsWater [_pos select 0,_pos select 1])) then {_loop = false};
	if (_wateronly and ((_time + 3) < time)) exitwith {_pos = [];};
};

_pos