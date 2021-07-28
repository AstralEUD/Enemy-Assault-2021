player createDiaryRecord ["Diary", ["Credits","Enemy Assault with Personal Money <br/> Dev Lead by astral, with lululala22<br/> Thx to KingChiRoll, CrimyStickyR, SAKY <br/>[ORIGINAL CREDIT]<br/><br/>Author - Ghost <br/>Ideas and Support by Dixon <br/>Thanks to Kylania, WardenMac and the rest of the Ghostland Team"]];

player createDiarySubject ["MissionFeatures","Mission Features"];

player createDiaryRecord ["MissionFeatures", ["Settings","
	You can change your view distance via the com menu 0-8. These are saved to your profile and will be set automatically every time you play
  "]];	
player createDiaryRecord ["MissionFeatures", ["Revive","
	Move to the red medical icon on the hud and look at the incapacitated player. Hold space while continuing to revive. If the person dies or bleeds out then they will have a skull over them instead.
  "]];	
player createDiaryRecord ["MissionFeatures", ["Squad Management","
	Press the 'Team Switch' key, default 'U' to access the Squad Management system. Create, join, leave groups as you need.
  "]];	
  
player createDiaryRecord ["MissionFeatures", ["Support","
	-----------------------------------------------------------------------------------------------
	<br />	
	<img image='\A3\Air_F_Exp\VTOL_01\Data\UI\VTOL_01_armed_CA.paa' />
	<br />	
	JTAC can call in gunship support from the 0-8 Menu. V-44 X Blackfish will loiter around until fuel is low or out of ammo or 30 minutes on station then RTB for resupply. This will take at least 30 minutes. Once the gunship is on station the call can remote the gunner seats using the action menu. If the player dies the gunship is lost and will have to be called again. To get more accurate fire make sure to lock on target first and follow the targeting guides.
	Any player can call in a gunship at the base terminal computer.
	<br />
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Air_F_Beta\Heli_Attack_01\Data\UI\Heli_Attack_01_CA.paa' />
	<br />
	SL, JTAC and UAV Operators can call for support from the 0-8 Menu. AH-99 and A-164 Air support will loiter around until fuel is low or out of ammo or 30 minutes on station then RTB for resupply. This will take at least 30 minutes. UAV support starts at base and will fly from base towards the position on map where you selected so take control of it sometime after you call it in and give it some kind of waypoint or you might lose the UAV. UGV parachutes in and moves to position selected on map. 
	<br />
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Drones_F\Air_F_Gamma\UAV_01\Data\UI\UAV_01_CA.paa' widwidth='64' height='64'/>
	<br />
	AR-2 Darter can be called by the Team Leaders and UAV Operators. AR-2 Darter, UAV and UGV will automatically connect to you if you have the uav terminal when they are called in. 
	<br />
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa' />
	<br />
	Only the Squad Leader can call in an Ammo Crate air drop. 
	<br />
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Soft_F\MRAP_01\Data\UI\MRAP_01_Base_ca.paa' />
	<br />
	Vehicle air drop can be called by any player and uses the same dialog for spawning vehicles at base. The aircraft will be a heavy helicopter or a C-130 if that mod is used. 
	<br />
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Static_F_Mark\Designator_01\Data\UI\Designator_01_CA.paa' />
	<br />
	JTAC and UAV OPerators can deploy Remote Designators at there location. Just face the direction and call it in via 0-8 menu to deploy it in front of player. If player has a uav terminal the remote designator will automatically connect.
	<br />
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Armor_F_Gamma\MBT_01\Data\UI\Slammer_Scorcher_M4_Base_ca.paa' />
	<br />
	Artillery can be called in via 0-8 Menu by SL and JTAC. You have to have eyes on target and where you point your cursor is where the rounds will fall.
  "]];
  
player createDiaryRecord ["MissionFeatures", ["Virtual Arsenal","
	Vehicle Ammo and Supply crates, the Ammo and Cargo Huron containers, and within 350m of the airport terminal at base will have virtual Arsenal. You can adjust your loadout, save it and load it as needed from these points.
  "]];
  
player createDiaryRecord ["MissionFeatures", ["Vehicles","
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Soft_F\MRAP_01\Data\UI\MRAP_01_Base_ca.paa' />
	<br />
	All vehicles will respawn after 5 minutes if they can no longer move and no one is inside or they are destroyed. Alive vehicles require players to be beyond 300 meters in order for them to respawn. You can spawn ground vehicles, aircraft and boats at the signs marked on map. Vehicles spawned by the player do not respawn and are tracked locally. You can only have the specified number of vehicles at any one time. This is set at mission start under the mission parameters. Huron containers are not counted but all other spawn vehicles are. If you have vehicles that are not alive or cannot move then they will be deleted once you open the Spawn Vehicle dialog. Vehicles have cargo capacity and can load up other vehicles or ammo crates depending on the size. 
	<br />
	<br />
	If a vehicle is on a spawn pad area and no one is inside it will be deleted no matter who spawned it. 
	<br />
	<br />
	If you beach a boat you can push it off via the action menu. 
	<br />
	<br />
	The CRV-6e Bobcat can clear obstructions on the airfield via action menu. It will clear empty vehicles that cannot move or are dead and craters 10m in front.
  "]];
  
player createDiaryRecord ["MissionFeatures", ["IEDs","  
	Explosive Experts can crouch or crawl slowly up to ieds to disarm them. Move slowly and try not to stand up. If you do not have a EOD available then just blow it up in place.
  "]]; 

player createDiaryRecord ["MissionFeatures", ["Respawn","
	If you die you can respawn at BASE or UH80 if you are killed. Team leaders can deploy a respawn tent every 10 minutes. When deploying a new tent the old one will be removed. Any player can remove all respawn tents at the base HALO map board via action menu. Tents will be removed once an objective is completed.
  "]]; 

player createDiaryRecord ["MissionFeatures", ["HALO","
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\Air_F_Beta\Parachute_01\Data\UI\Portrait_Parachute_01_CA.paa' />
	<br />
	You Can HALO at the Map of the island inside the main building at BASE. Initiate HALO from Action Menu while looking at map and left click where you want to HALO in once your map comes up. Map will automatically close a moment after clicking the location. If you decide that you do not want to HALO then escape or press your map key to close the map and quit the HALO. Your chute will open automatically once you are below 60 altitude. You can manually open your chute earlier via the action menu.
  "]]; 

player createDiaryRecord ["MissionFeatures", ["Teleport","
	You can teleport from the base spawn area to the base port via the 'Move to Port' and 'Boat Spawn and Move to Base' billboards.
  "]]; 

player createDiaryRecord ["MissionFeatures", ["Helicopter Transport","
	-----------------------------------------------------------------------------------------------
	<br />
	<img image='\A3\air_f_beta\Heli_Transport_01\Data\UI\Heli_Transport_01_base_CA.paa' />
	<br />
	You can call for a helicopter Transport from the 0-8 Menu. The Helicopter can come pick you up along with other teammates. Then when ordered via the action menu will bring you to whatever destination you would like. If you would like a pickup on a flat roof top be at the pickup site then call the transport in for better success. Once all teammates are out order the Helicopter to takeoff via action menu again. This helicopter is available about every 30 minutes. RTB action sends the helicopter back to base and will delete after short delay along with escort choppers.
  "]];
  
player createDiaryRecord ["Diary", ["Situation","Enemy forces control most of the island. Be ready for a fight."]];