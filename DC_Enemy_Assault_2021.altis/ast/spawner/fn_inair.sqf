params ["_airclass","_player"];
"ASTAIR" cutText ["고정익을 생성하고 탑승하는 중입니다..","BLACK",1];
sleep 2;
_markerpos = getMarkerPos (selectRandom ["bairspawn","bairspawn2"]);
_randomheight = 1500;
_spawnpos = [(_markerpos select 0),(_markerpos select 1), (_randomheight)];
_air = createVehicle [_airclass, _spawnpos,[],0,"FLY"];
_air allowDamage false;
player moveInAny _air;
_air setPosASL [(_markerpos select 0),(_markerpos select 1), (_randomheight)];
ASTAirArray pushBack _air;
publicVariable "ASTAirArray";
_playeruid = getPlayerUID player;
_air setVariable ["spawner",_playeruid,true];
_VarName = "ghst_air" + str((count ghst_vehicles) + 1);
_dir = 180;
//_air setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];
missionNamespace setVariable [_VarName,_air];
ghst_vehicles pushBack _VarName;
_air allowDamage true;
"ASTAIR" cutFadeOut 1;