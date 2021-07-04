//V1.1 By: Ghost - Spawn specified backpack with no dialog.
//ghst_spawnpack = _abox addAction ["<t color=""#ff0000"">Spawn Backpack</t>", "scripts\ghst_spawnpack.sqf", ["B_Bergen_sgg"], 1, false, false, "","alive _target"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_pack = _this select 3;

if (not alive _host) exitwith {
hint "Backpack Spawn Closed";

_host removeaction _id;
};

removebackpack _caller;
_caller addbackpack _pack;
clearAllItemsFromBackpack _caller;