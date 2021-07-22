/*
 Ace Full Heal
*/
_ESU = _this select 1;
_unit = _this select 0;
_ESU playMove "AinvPknlMstpSlayWrflDnon_medic";
waitUntil {animationstate _ESU ==  "AinvPknlMstpSlayWrflDnon_medic"};
while { animationstate _ESU ==  "AinvPknlMstpSlayWrflDnon_medic"} do {
 
call ACE_medical_fnc_treatmentAdvanced_fullHeal
};