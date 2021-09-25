//Trait Changer
//Add this to init.sqf
//[] execVM "Trait_Changer\TC_init.sqf";
//Add this to object init.
//0 = this execVM "Trait_Changer\functions\fnc_TC_object.sqf";

TC_available_class = ["B_Soldier_F", "B_officer_F"];
if (!(typeOf player in TC_available_class) && !(isServer)) exitWith {}; 

//Custom Trait
//[string:trait name (should be string in stringtable.xml), [command:Number (0 is setUnitTrait), skillName:String, type:Number (Determine type of skill. 0 is Boolean, 1 is Boolean & Custom, 2 is Number), value:Number(Ignored when type is 0)]]
//[string:trait name (should be string in stringtable.xml), [command:Number (1 is setCustomAimCoef), coef:Number]]
//["STR_TC_something", [setUnitTrait something]...[setUnitTrait something], [setCustomAimCoef something]] is possible.
//Supports custom trait
TC_trait_array = [
	["STR_TC_MEDIC", [0, "medic", 0]],
	["STR_TC_REPAIR_SPECIALIST", [0, "engineer", 0]],
	["STR_TC_EXPLOSIVE_SPECIALIST", [0, "explosiveSpecialist", 0]],
	["STR_TC_UAV_OPERATOR", [0, "UAVHacker", 0]],
	["STR_TC_SNIPER", [0, "camouflageCoef", 2, 0.4285], [1, 0.55]],
	["STR_TC_MARKSMAN", [1, 0.7]],
	["STR_TC_INFILTRATOR", [0, "camouflageCoef", 2, 0.35], [0, "audibleCoef", 2, 0.6]],
	["STR_TC_PILOT", [0, "pilot", 1]]
];

//All skillNames
TC_trait_skillNames_boolean = [];
TC_trait_skillNames_boolean_custom = [];
TC_trait_skillNames_number = [];
{
	{
		if (_forEachIndex > 0) then {
			if (_x # 0 isEqualTo 0) then {
				if (_x # 2 isEqualTo 0) then {
					if (TC_trait_skillNames_boolean find _x # 1 isEqualTo -1) then {
						TC_trait_skillNames_boolean pushBack (_x # 1);
					};
				};
				if (_x # 2 isEqualTo 1) then {
					if (TC_trait_skillNames_boolean_custom find _x # 1 isEqualTo -1) then {
						TC_trait_skillNames_boolean_custom pushBack (_x # 1);
					};
				};
				if (_x # 2 isEqualTo 2) then {
					if (TC_trait_skillNames_number find _x # 1 isEqualTo -1) then {
						TC_trait_skillNames_number pushBack (_x # 1);
					};
				};
			};
		};
	} forEach _x;
} forEach TC_trait_array;

TC_trait_names = ["STR_TC_NO_TRAIT"];
TC_trait_options = [-1];
{
	_options = [];
	{
		if (_forEachIndex > 0) then {
			_options pushBack _x;
		};
	} forEach _x;
	TC_trait_names pushBack _x # 0;
	TC_trait_options pushBack _options;
} forEach TC_trait_array;

//Limit settings
TC_trait_limit = false;

//Make limited number of players to have same trait.
//These array should be matched with TC_trait_array. Each number on TC_trait_limit_array indicate maximum allowed players who have same trait. -1 is unlimited.
TC_trait_limit_max_array = [-1, 1, 1, 1, 1, 1, 1, 1];
TC_trait_status_array = [];
{TC_trait_status_array pushBack 0;} forEach TC_trait_limit_max_array;

if (isServer && TC_trait_limit) then {[] execVM "Trait_Changer\TC_initServer.sqf";};

fnc_TC_setup = compileFinal preprocessFileLineNumbers "Trait_Changer\functions\fnc_TC_setup.sqf";
fnc_TC_info = compileFinal preprocessFileLineNumbers "Trait_Changer\functions\fnc_TC_info.sqf";
fnc_TC_apply_0 = compileFinal preprocessFileLineNumbers "Trait_Changer\functions\fnc_TC_apply_0.sqf";
fnc_TC_apply_1 = compileFinal preprocessFileLineNumbers "Trait_Changer\functions\fnc_TC_apply_1.sqf";
fnc_TC_object = compileFinal preprocessFileLineNumbers "Trait_Changer\functions\fnc_TC_object.sqf";

player addEventHandler ["Respawn", {
	_last_trait_name = missionNamespace getVariable ["TC_current_trait_name", "STR_TC_NO_TRAIT"];
	_options_index = TC_trait_names find _last_trait;
	_options = TC_trait_options # _options_index;
	if !(_options isEqualTo -1) then {
		[_last_trait_name, _options, true] call fnc_TC_apply_1;
	};
}];

if (TC_trait_limit) then {
	TC_result_client = [];
	"TC_result_client" addPublicVariableEventHandler {
		TC_result_client_changed = true;
	};
};

systemChat "서버 스크립트 로드 성공! Windows 키를 눌러보세요.";