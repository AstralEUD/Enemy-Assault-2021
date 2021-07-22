private ["_playtime","_h","_m","_s","_hh","_mm","_ss","_playtimeHMS"];
_timer = _this / 3600;
_h = (_timer-(_timer % 1));
_m = ((_timer % 1)*60)-((_timer % 1)*60) % 1;
_s = (((_timer % 1)*3600)-((_timer % 1)*3600) % 1) - (_m*60);
_hh = "";
if (_h < 10) then {_hh = "0"};
_mm = "";
if (_m < 10) then {_mm = "0"};
_ss = "";
if (_s < 10) then {_ss = "0"};
_timerHMS = format ["%1%2h:%3%4m:%5%6s",_hh,_h,_mm,_m,_ss,_s];
_timerHMS