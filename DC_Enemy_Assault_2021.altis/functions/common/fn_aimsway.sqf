private ["_unit","_coef"];
_unit = _this select 0;
_coef = ("PARAM_AimSway" call BIS_fnc_getParamValue) / 10;

_unit setCustomAimCoef _coef;
_unit setUnitRecoilCoefficient 0.2 + _coef;