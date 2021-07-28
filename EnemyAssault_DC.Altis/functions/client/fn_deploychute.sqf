/*
V1 Script by: Ghost put this in an objects init line - player addAction ["<t size='1.5' shadow='2' color='#00ff00'>Open Chute</t> <img size='1.5' color='#00ff00' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", {call ghst_fnc_deploychute; }, [], 6, true, true, "","_this == _target and ((getpos _this select 2) > 100)"];
*/

_host = _this select 0;
_unit = _this select 1;
_id = _this select 2;
_params = _this select 3;

titleCut ["", "BLACK IN", 2];

_para = "Steerable_Parachute_F" createVehicle position _unit;
_para setpos position _unit;
_para setdir direction _unit;
_vel = velocity _unit;
_unit moveindriver _para;
_para lock false;
