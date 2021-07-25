params ["_player", "_data", "_value"];
_uid = getPlayeruiD _player;
["write", [_uid, _data, _value]] call inidbi;