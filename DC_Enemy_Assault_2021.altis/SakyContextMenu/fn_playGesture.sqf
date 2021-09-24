params["_action","_caption"];

player playAction _action;

_targets = [];
{
	{
		_targets pushBackUnique _x;
	}foreach crew _x;
}foreach (player nearEntities 30);

[player, _caption] remoteExec ["SCM_fnc_playGestureRemote", _targets];