//Automatically adds various actions to specified vehicles

//ghst_Supported_Vehicles_All = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F"];
ghst_boat_Array = [];
ghst_Supported_Vehicles_Boat = ["B_Boat_Transport_01_F","B_Lifeboat","B_Boat_Armed_01_minigun_F","I_Boat_Transport_01_F","I_Boat_Armed_01_minigun_F","O_Boat_Transport_01_F","O_Lifeboat","O_Boat_Armed_01_minigun_F"];
ghst_AmmoBoxes_Array = [];
ghst_Supported_AmmoBoxes = ["Box_NATO_AmmoVeh_F","B_supplyCrate_F","B_Slingload_01_Ammo_F","B_Slingload_01_Cargo_F","O_supplyCrate_F","Land_Pod_Heli_Transport_04_ammo_F","Land_Pod_Heli_Transport_04_box_F","Box_East_AmmoVeh_F"];
ghst_bobcat_array = [];
ghst_support_vehicles_bobcat = ["B_APC_Tracked_01_CRV_F","O_Truck_02_box_F"];

while {true} do 
{
	
	{
		if !(_x in vehicles) then
		{
			ghst_boat_Array deleteAt (ghst_boat_Array find _x);
		};
	} forEach (ghst_boat_Array);
	
	{
		if !(_x in vehicles) then
		{
			ghst_AmmoBoxes_Array deleteAt (ghst_AmmoBoxes_Array find _x);
		};
	} forEach (ghst_AmmoBoxes_Array);
	
	{
		if !(_x in vehicles) then
		{
			ghst_bobcat_array deleteAt (ghst_bobcat_array find _x);
		};
	} forEach (ghst_bobcat_array);
	
	{
		if (((typeOf _x) in (ghst_Supported_Vehicles_Boat)) and !(_x in ghst_boat_Array)) then
		{
			ghst_boat_Array pushback _x;
			_x addAction ["<t size='1.2' shadow='2' color=""#FF9900"">Push Boat</t>", "call ghst_fnc_BoatPush", [], 1, false, true, "", "_this distance _target < 8 and !(_this in _target)"];  
		};
		if (((typeOf _x) in (ghst_Supported_AmmoBoxes)) and !(_x in ghst_AmmoBoxes_Array)) then
		{/*
			ghst_AmmoBoxes_Array pushback _x;
			_x addaction ["<t size='1.4' shadow='2' color='#FF8C00'>Virtual Arsenal</t>", { ["Open",true] call BIS_fnc_arsenal; }, [], 1, false, true, "","alive _target"];
			if (ghst_acemod) then {
				//ace arsenal
				_x addaction ["<t size='1.4' shadow='2' color='#FF8C00'>ACE Arsenal</t>", { [player, player, true] call ace_arsenal_fnc_openBox; }, [], 1, false, true, "","alive _target"];
			};*/
		};
		
		if (((typeOf _x) in (ghst_support_vehicles_bobcat)) and !(_x in ghst_bobcat_array)) then
		{
			ghst_bobcat_array pushback _x;
			_x addaction ["<t size='1.4' shadow='2' color='#FF0000'>Clear Obstruction</t>", { [] call ghst_fnc_obstruction_clear; }, [], 1, false, false, "","alive _target and _this == driver _target"];
		};
		
	} forEach (vehicles);
	
	sleep 30;
	
};