params ["_point","_killer"];
[_point] remoteExec ["ast_fnc_addMoney", _killer];
"적 차량/항공기를 무사히 파괴시켜 추가 포인트를 획득하셨습니다." remoteExec ["systemChat", _killer];