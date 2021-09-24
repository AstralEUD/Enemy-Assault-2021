params["_clc"];

call SCM_fnc_detachChemlight;

if (vehicle player != player) exitwith {true};  

_chem = _clc createVehicle position player;   
_chem attachTo [player, [0.13,-0.11,0.05], "Pelvis", true]; 
_chem setVectorDirAndUp [[0,-0.2,1], [0,1,0]];
_chem setPosASL getPosASL _chem;

SCM_Attached pushBack _chem;