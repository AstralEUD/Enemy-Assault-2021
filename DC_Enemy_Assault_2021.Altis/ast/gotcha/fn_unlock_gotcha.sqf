params["_result"];
switch _result do 
{
	case "vorona": {
		if ((AST_purchased find "launch_O_Vorona_green_F") == -1) then {
			_hintformat = format ["%1님이 보로나 뽑기에 성공하셨습니다!",name player];
			["아스널 언락 축하 알림",_hintformat] remoteExec ["BIS_fnc_showSubtitle",0];
			AST_purchased pushBackUnique "launch_O_Vorona_green_F";
			AST_purchased pushBackUnique "launch_O_Vorona_brown_F";
			[player, "weaponlist", AST_purchased] remoteExec ['AST_fnc_db_save', 2, false];
			AST_limitedItems = AST_limitedItems - ["launch_O_Vorona_green_F"];
			AST_limitedItems = AST_limitedItems - ["launch_O_Vorona_brown_F"];
			call ast_fnc_arsenal_search;
		} else {
			["뽑기 알림","이미 구매하신 아이템 (보로나)를 뽑으셔서 뽑기 돈의 절반을 돌려드립니다."] spawn BIS_fnc_showSubtitle;
			[250] call AST_fnc_hud_plus;
			AST_kill_score = AST_kill_score + 250;
		};
	};
	case "MRPL": {
		if ((AST_purchased find "launch_O_Titan_short_F") == -1) then {
			_hintformat = format ["%1님이 타이탄 MRPL 단축형 뽑기에 성공하셨습니다!",name player];
			["아스널 언락 축하 알림",_hintformat] remoteExec ["BIS_fnc_showSubtitle",0];
			private _toget = ["launch_O_Titan_short_F","launch_O_Titan_short_ghex_F","launch_I_Titan_short_F","launch_B_Titan_short_F","launch_B_Titan_short_tna_F"];
			{
				AST_purchased pushBackUnique _x;
				AST_limitedItems = AST_limitedItems - _x;
			} forEach _toget;
			[player, "weaponlist", AST_purchased] remoteExec ['AST_fnc_db_save', 2, false];
			call ast_fnc_arsenal_search;
		} else {
			["뽑기 알림","이미 구매하신 아이템 (타이탄 단축형)를 뽑으셔서 뽑기 돈의 절반을 돌려드립니다."] spawn BIS_fnc_showSubtitle;
			[250] call AST_fnc_hud_plus;
			AST_kill_score = AST_kill_score + 250;
		};
	};
	case "MAAWS": {
		if ((AST_purchased find "launch_MRAWS_green_rail_F") == -1) then {
			_hintformat = format ["%1님이 MAAWS (기본형) 뽑기에 성공하셨습니다!",name player];
			["아스널 언락 축하 알림",_hintformat] remoteExec ["BIS_fnc_showSubtitle",0];
			private _toget = ["launch_MRAWS_green_rail_F","launch_MRAWS_olive_rail_F","launch_MRAWS_sand_rail_F"];
			{
				AST_purchased pushBackUnique _x;
				AST_limitedItems = AST_limitedItems - _x;
			} forEach _toget;
			[player, "weaponlist", AST_purchased] remoteExec ['AST_fnc_db_save', 2, false];
			call ast_fnc_arsenal_search;
		} else {
			["뽑기 알림","이미 구매하신 아이템 (MAAWS 기본형)를 뽑으셔서 뽑기 돈의 절반을 돌려드립니다."] spawn BIS_fnc_showSubtitle;
			[250] call AST_fnc_hud_plus;
			AST_kill_score = AST_kill_score + 250;
		};
	};
	case "3GLHE": {
		if ((AST_purchased find "3Rnd_HE_Grenade_shell") == -1) then {
			_hintformat = format ["%1님이 3GL HE고폭탄 뽑기에 성공하셨습니다!",name player];
			["아스널 언락 축하 알림",_hintformat] remoteExec ["BIS_fnc_showSubtitle",0];
			private _toget = ["3Rnd_HE_Grenade_shell"];
			{
				AST_purchased pushBackUnique _x;
				AST_limitedItems = AST_limitedItems - _x;
			} forEach _toget;
			[player, "weaponlist", AST_purchased] remoteExec ['AST_fnc_db_save', 2, false];
			call ast_fnc_arsenal_search;
		} else {
			["뽑기 알림","이미 구매하신 아이템 (3GL HE고폭탄)를 뽑으셔서 뽑기 돈의 절반을 돌려드립니다."] spawn BIS_fnc_showSubtitle;
			[250] call AST_fnc_hud_plus;
			AST_kill_score = AST_kill_score + 250;
		};
	};
	case "3GLMISC": {
		if ((AST_purchased find "3Rnd_UGL_FlareWhite_F") == -1) then {
			_hintformat = format ["%1님이 3GL 기타유탄 뽑기에 성공하셨습니다!",name player];
			["아스널 언락 축하 알림",_hintformat] remoteExec ["BIS_fnc_showSubtitle",0];
			private _toget = ["3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareYellow_F","3Rnd_UGL_FlareCIR_F","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell"];
			{
				AST_purchased pushBackUnique _x;
				AST_limitedItems = AST_limitedItems - _x;
			} forEach _toget;
			[player, "weaponlist", AST_purchased] remoteExec ['AST_fnc_db_save', 2, false];
			call ast_fnc_arsenal_search;
		} else {
			["뽑기 알림","이미 구매하신 아이템 (3GL 기타유탄)를 뽑으셔서 뽑기 돈의 절반을 돌려드립니다."] spawn BIS_fnc_showSubtitle;
			[250] call AST_fnc_hud_plus;
			AST_kill_score = AST_kill_score + 250;
		};
	};
	case "SPEED": {
		hint "10분간 속도상승 포션을 획득하였습니다. 죽으면 초기화됩니다.";
		[player] spawn {
			params ["_player"];
			_player setAnimSpeedCoef 1.8;
			sleep 600;
			_player setAnimSpeedCoef 1;
		};
	};
	case "MONEY": {
		hint "돈을 획득하였습니다!";
		[750] call AST_fnc_hud_plus;
		AST_kill_score = AST_kill_score + 750;
	};
	case "GGWANG": {
		hint "꽝!";
	};
};