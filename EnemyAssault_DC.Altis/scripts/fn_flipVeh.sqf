
params ["_veh"];

fn_flip = {
  params ["_tgt","_plyr","_id"];
  _tgt allowDamage false;
  _tgt setPos (getPos _tgt vectorAdd [0,0,2]);
  _tgt setVectorUp (surfaceNormal getpos _tgt);
  uisleep 0.5;
  _tgt allowDamage true;
};

_veh addAction [
		"<t color='#ff5555' size='1.2'>정방향으로 원위치</t>",
		{call fn_flip},
  	[],
  	12,
  	false,
  	true,
  	"",
  	"(vectorUp _target) vectorCos (surfaceNormal getPos _target) <0.5 && {vehicle _this distance2D _target < 15 && isNull objectParent _this}"
  ];  // remoteExec useless if run everywhere
