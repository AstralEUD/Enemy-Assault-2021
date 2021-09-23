call SCM_fnc_detachStrobe; 
 
if (vehicle player != player) exitwith {true};   
 
_strobe = 'LaserTargetW' createVehicle position player;    
_strobe attachTo [player, [0,-.17,-.1], "pilot", true];  
_strobe setPosASL getPosASL _strobe; 
SCM_Attached pushBack _strobe;

_strobe = 'NVG_TargetW' createVehicle position player;    
_strobe attachTo [player, [0,-.17,-.1], "pilot", true];  
_strobe setPosASL getPosASL _strobe;  
SCM_Attached pushBack _strobe;