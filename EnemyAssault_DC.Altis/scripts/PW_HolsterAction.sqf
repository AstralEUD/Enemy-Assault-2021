/*_______________________________________

Author: Phantom Wolf , modify DCINSIDE ARMA m.gall

Parameters: Nil

Syntax: [] execVM "PW_holsterAction.sqf";

Usage: init.sqf, onPlayerRespawn.sqf or via Trigger

__________________________________________*/

while {true} do {
    if (alive player) then {
        waitUntil {sleep 0.1; primaryWeapon player != "" or handgunWeapon player != ""};
        _unitholsteraction = player addAction [
            "<t color=""#C39BD3"">소총 어깨에 매기</t>",
            {
                player action ["SWITCHWEAPON",player,player,-1];
            },
            nil,6,false,true];
        waitUntil {sleep 0.1; currentWeapon player == "" or {primaryWeapon player == "" && handgunWeapon player == ""}};
        // player removeAction { Goano, Do you have no parents }
        if (primaryWeapon player == "" && handgunWeapon player == "") exitWith {
            player removeAction _unitholsteraction;
        };
        player removeAction _unitholsteraction;
        _unitequipprimaryactiontext = "Weapon " + getText (configfile >> "CfgWeapons" >> primaryWeapon player >> "displayName");
        _unitequipprimaryaction = player addAction [
            _unitequipprimaryactiontext,
            {
                player action ["SWITCHWEAPON",player,player,0];
            },
            nil,6,false,true];
        waitUntil {sleep 0.1; currentWeapon player != "" or primaryWeapon player == ""};
        player removeAction _unitequipprimaryaction;
   };
   sleep 0.2;
};

// PBO 열어서 스크립트좀 가져가지마 개새끼들아, 원본파일 쓰라고, 고아니??