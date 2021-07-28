private ["_aiSkill","_man"];

_man = _this select 0;
_aiSkill = _this select 1;

_man setskill ["general",(_aiSkill + ((floor(random 4)) / 10))];//(0.4 + ((round(random 4)) / 10))
_man setSkill ["aimingAccuracy",_aiSkill];
_man setSkill ["aimingSpeed",_aiSkill];
_man setSkill ["aimingShake",_aiSkill];
_man setSkill ["reloadSpeed",_aiSkill];
_man setSkill ["spotDistance",(_aiSkill + ((floor(random 4)) / 10))];
_man setSkill ["spotTime",_aiSkill];
_man setSkill ["courage",(_aiSkill + ((floor(random 4)) / 10))];
_man setSkill ["commanding",(_aiSkill + ((floor(random 4)) / 10))];