Created_Crew=[];

Tankboy_Init = {
	player addAction 
	[
	"승무원 추가", 
	{
		params ["_target", "_caller", "_actionId", "_arguments", "_agent"];	
		{
			_agent = createAgent ["B_T_crew_F", [0,0,0], [], 0, "FORM"];
			_agent assignAsTurret [vehicle player, _x];
			_agent moveInTurret [vehicle player, _x];
			Created_Crew pushBackUnique _agent;
		}forEach ((vehicle player) call BIS_fnc_vehicleCrewTurrets);	
		vehicle player vehicleChat "승무원 탑승완료!";	
	},
	[],
	15, 
	true, 
	true, 
	"",
	"(driver vehicle player == player) && (count ((vehicle player) call BIS_fnc_vehicleCrewTurrets) > 0) && ((vehicle player isKindOf ""Air"") || (vehicle player isKindOf ""Tank"") || (vehicle player isKindOf ""Wheeled_APC_F""))" // _target, _this, _originalTarget
	];

	player addAction 
	[
	"승무원 하차", 
	{
		// {deleteVehicle _x}forEach ([(crew vehicle player), {!isPlayer _x}] call BIS_fnc_conditionalSelect);
		call DeleteAllCrew;
		{
			if (isTouchingGround vehicle player) then {
				unassignVehicle _x;
				doGetOut _x;
			};		
		}forEach ([(crew vehicle player), {!isPlayer _x}] call BIS_fnc_conditionalSelect);
		vehicle player vehicleChat "승무원 하차!";	
	},
	[],
	15, 
	true, 
	true, 
	"",
	"(driver vehicle player == player) && (count ([(crew vehicle player), {!isPlayer _x}] call BIS_fnc_conditionalSelect) > 0) && ((vehicle player isKindOf ""Air"") || (vehicle player isKindOf ""Tank"") || (vehicle player isKindOf ""Wheeled_APC_F""))" // _target, _this, _originalTarget
	];

	player addEventHandler ["SeatSwitchedMan",{
		params ["_unit1", "_unit2", "_vehicle"];
		call DeleteAllCrew;
	}];	

	player addEventHandler ["GetOutMan",{
		params ["_unit", "_role", "_vehicle", "_turret"];
		call DeleteAllCrew;
	}];	

	player addEventHandler ["Killed",{
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		call DeleteAllCrew;
	}];	
};

DeleteAllCrew = {
	{deleteVehicle _x;}forEach Created_Crew;
};

call Tankboy_Init;

player addEventHandler ["Respawn", {
	call Tankboy_Init;
}];