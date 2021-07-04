private ["_markwps","_mcolor","_mtext","_mtype","_msize","_mshape","_mbrush","_markname","_marker"];

_markwps = _this select 0;
_mcolor = [_this, 1, "ColorBlack", [""]] call BIS_fnc_param;
_markname = _this select 2;
_mtext = [_this, 3, "", [""]] call BIS_fnc_param;
_mtype = [_this, 4, "mil_DOT", [""]] call BIS_fnc_param;
_msize = [_this, 5, [0.5,0.5], [[]],[2]] call BIS_fnc_param;
_mshape = [_this, 6, "ICON", [""]] call BIS_fnc_param;
_mbrush = [_this, 7, "Border", [""]] call BIS_fnc_param;

_marker = createMarker [_markname, _markwps]; 
_marker setMarkerShape _mshape;
if !(_mshape == "ICON") then {_marker setMarkerBrush _mbrush;};
_marker setmarkertype _mtype;
_marker setmarkersize _msize;
_marker setmarkercolor _mcolor;
_marker setmarkertext _mtext;

_marker