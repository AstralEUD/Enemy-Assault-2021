if (ghst_acemod) then {
	//ace arsenal
	player addaction ["<t size='1.4' shadow='2' color='#FF8C00'>ACE Arsenal</t>", { [player, player, true] call ace_arsenal_fnc_openBox; }, [], 1, false, true, "","alive _target and ((getpos player distance getpos base) < 350 or (getpos player distance getpos liberty) < 250)"];
} else {/*
	ghst_demo_array = [];
	player addAction ["<t size='1.2' shadow='2' color='#FEE093'>Attach C4</t> <img size='2' shadow='2' image='\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa'/>", {call ghst_fnc_attachdemo}, ["DemoCharge_Remote_Ammo_Scripted","DemoCharge_Remote_Mag"], 1, false, true, "","'DemoCharge_Remote_Mag' in magazines _target and vehicle _this == _target"];

	player addAction ["<t size='1.2' shadow='2' color='#FEE093'>Attach Satchel</t> <img size='2' shadow='2' image='\A3\Weapons_f\data\UI\gear_satchel_CA.paa'/>", {call ghst_fnc_attachdemo}, ["SatchelCharge_Remote_Ammo_Scripted","SatchelCharge_Remote_Mag"], 1, false, true, "","'SatchelCharge_Remote_Mag' in magazines _target and vehicle _this == _target"];

	player addAction ["<t size='1.2' shadow='2' color='#FEE093'>Attach M112</t> <img size='2' shadow='2' image='\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa'/>", {call ghst_fnc_attachdemo}, ["rhsusf_m112_ammo_scripted","rhsusf_m112_mag"], 1, false, true, "","'rhsusf_m112_mag' in magazines _target and vehicle _this == _target"];

	player addAction ["<t size='1.2' shadow='2' color='#FEE093'>Attach M112x4</t> <img size='2' shadow='2' image='\A3\Weapons_f\data\UI\gear_satchel_CA.paa'/>", {call ghst_fnc_attachdemo}, ["rhsusf_m112x4_ammo_scripted","rhsusf_m112x4_mag"], 1, false, true, "","'rhsusf_m112x4_mag' in magazines _target and vehicle _this == _target"];*/
};

player addaction ["<t size='1.2' shadow='2' color='#FF0000'>Move Unit</t>", { call ghst_fnc_drag; }, [], 1, false, false, "","alive _target and _this == _target and cursorTarget iskindof 'MAN' and cursorTarget distance _this < 2 and alive cursorTarget"];

//this addaction ["Open Virtual Arsenal", { ["Open",true] call BIS_fnc_arsenal; }];  
player addaction ["<t size='1.4' shadow='2' color='#FF8C00'>Virtual Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }, [], 1, false, true, "","alive _target and ((getpos player distance getpos base) < 350 or (getpos player distance getpos liberty) < 250)"];

player addAction ["<t size='1.5' shadow='2' color='#00ff00'>Open Chute</t> <img size='1.5' color='#00ff00' shadow='2' image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa'/>", {call ghst_fnc_deploychute; }, [], 6, true, true, "","_this == _target and ((getpos _this select 2) > 100)"];

if ((player iskindof "B_Soldier_SL_F") or (player iskindof "B_recon_JTAC_F")) then {
	ghst_support synchronizeObjectsAdd [player];
	player synchronizeObjectsAdd [ghst_support];
};