waitUntil { !(isNull player) };
waitUntil { time > 0 };
WaitUntil{not isNull player};
player addEventHandler ["killed", {strobe = false}];

Strobe = false;

StrobeON = 

{

		Strobe = true;
		hint "Strobe ON";
		while {Strobe} do 
	{
		if (vehicle player != player) then {StrobeOFF} else 
		{
		Sleep 0.9;
		IRST = "NVG_TargetC" createVehicle getPos player;
		IRST attachTo [player,[0,0,0.19],"neck"];
		sleep 0.5;
		detach IRST;
		IRST setPosATL [-10000,-10000,100000];		
		Sleep 0.5;
		IRST attachTo [player,[0,0,0.19],"neck"];
		sleep 0.5;
		detach IRST;
		IRST setPosATL [-10000,-10000,100000];	
		deleteVehicle IRST;
		Sleep 0.1;
		};
	};

};
	
	
StrobeOFF = 

{

		Strobe = false;
		hint "Strobe OFF";

		detach IRST;
		IRST setPosATL [-10000,-10000,100000];
		deleteVehicle IRST;

};


StrobeMenu = 

{

		if (Strobe) exitWith {_handle = createDialog "MS2000_DIALOGON";};
		_handle = createDialog "MS2000_DIALOG";

};
		
		
player addAction ["<t color=""#e5b348"">피아식별 장치",StrobeMenu,1,0,false,false,"","player ==_target"];


if (!isServer) exitWith {};







