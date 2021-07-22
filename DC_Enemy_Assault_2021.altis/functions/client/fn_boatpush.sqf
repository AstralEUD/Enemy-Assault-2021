/*
V1 Created by: Ghost - Boat push function. Pushes the boat in the direction the player is looking

this addAction ["<t size='1.5' shadow='2' color='#FF9900'>Push</t>","call ghst_fnc_BoatPush",[],-1,false,true,"","_this distance _target < 8 and !(_this in _target)"];  
*/
private ["_boat","_unit","_isWater"];
_boat = _this select 0;//boat to have action on
_unit = _this select 1;//person pushing boat
_isWater = surfaceIsWater getposasl _unit;
if (_isWater) exitwith {hint "You cannot push from in the water";};
if (_unit in _boat) exitwith {hint "You cannot push from inside the vehicle";};
_boat setOwner clientOwner;//(owner _unit);
_dir = getdir _unit;
_boat setVelocity [(sin(_dir))*3, (cos(_dir))*3, 0];