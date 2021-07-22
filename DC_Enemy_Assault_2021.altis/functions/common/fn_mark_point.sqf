private ["_markwps","_mcolor","_mtext","_mtype","_msize","_mshape","_mbrush","_markname","_marker"];

_markwps = _this select 0;
_mcolor = [_this, 1, "ColorBlack", [""]] call BIS_fnc_param;
_mtext = [_this, 2, "", [""]] call BIS_fnc_param;
_mtype = [_this, 3, "mil_DOT", [""]] call BIS_fnc_param;
_msize = [_this, 4, [0.5,0.5], [[]],[2]] call BIS_fnc_param;
_mshape = [_this, 5, "ICON", [""]] call BIS_fnc_param;
_mbrush = [_this, 6, "Border", [""]] call BIS_fnc_param;

_markname = "ghst_mark" + str (_markwps) + str (random 99999);
_marker = createMarker [_markname, _markwps]; 
_marker setMarkerShape _mshape;
if !(_mshape == "ICON") then {_marker setMarkerBrush _mbrush;};
_marker setmarkertype _mtype;
_marker setmarkersize _msize;
_marker setmarkercolor _mcolor;
_marker setmarkertext _mtext;

_marker