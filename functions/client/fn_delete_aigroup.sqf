//Deletes AI from players group
if (leader group player == player) then {
_grp = group player;
{if !(isplayer _x) then {deletevehicle _x};} foreach units _grp;
} else {
hint "You are not leader of group";
};