class GHST
{
	tag = "GHST";
/*
	class functions
	{
		file = "functions";
		class functions {description = "core functions, called on mission start."; preInit = 1;};
	};
*/
	class common
	{
		file = "functions\common";
		class addaction {description = "global addaction using remoteExec";};
		class addscore {description = "global addscore using remoteExec";};
		class aimsway {description = "adjusts players sway";};
		class aiskill {description = "sets ai skills";};
		class all_positions {description = "gets all building positions";};
		class cleanup {description = "simple cleanup";};
		class create_unit {description = "creates units";};
		class createwaypoint {description = "creates a single waypoint";};
		class full_cleanup {description = "full cleanup";};
		class global_hint {description = "global hint";};
		class global_sidechat {description = "global sidechat";};
		class global_switchmove {description = "global switchmove";};
		class headlessclient {description = "headless client check";};
		class loadgear {description = "loads gear for respawns";};
		class mark_local {description = "creates marker local";};
		class mark_global {description = "creates marker global";};
		class mark_point {description = "creates marker global";};
		class pmarkcolor {description = "gets color of side for markers";};
		class pmarkers {description = "creates tracking markers for players";};
		class rand_position {description = "finds random position on water only or land only";};
		class savegear {description = "saves gear for respawn";};
		class stamina {description = "adjusts players stamina";};
		class timer {description = "creates timer format in hh:mm:ss";};
		class tsk_complete {description = "completes task";};
		class updateweather {description = "random weather";};
		class vehmarkers {description = "creates tracking markers for vehicles placed using editor";};
		class waypoints {description = "creates waypoints with cycle";};
		class waypoints_unload {description = "create a waypoint that unloads then a set of patrol waypoints on cycle";};
		class tracker {description = "tracking player spawned vehicles locally";};
		class countai {description = "counts ai numbers";};
	};
	class vehlists
	{
		file = "functions\vehlists";
		class aircraftlist {description = "generates a list of aircraft";};
		class boatlist {description = "generates a list of boats";};
		class vehiclelist {description = "generates a list of vehicles";};
		class rhs_aircraftlist {description = "generates a list of rhs aircraft";};
		class rhs_boatlist {description = "generates a list of rhs boats";};
		class rhs_vehiclelist {description = "generates a list of rhs vehicles";};
		//class infantrylist {description = "generates a list of blufor infantry";};
		//class rhs_infantrylist {description = "generates a list of rhs infantry";};
	};
	class unitlists
	{
		file = "functions\unitlists";
		class unitlist {description = "list of available enemy units";};
		class vehlist {description = "generates a list of vehicles"; preInit = 1;};
		class rhs_vehlist {description = "generates a list of rhs vehicles"; preInit = 1;};
		class rhs_menlist {description = "generates rhs unit lists"; preInit = 1;};
		class menlist {description = "generates stock unit lists"; preInit = 1;};
	};
	class objectives
	{
		file = "functions\objectives";
		class acquirelocations {description = "get locations on map for objectives and tasks";};
		class randomobj {description = "select random location for main objective area";};
		class rescue {description = "rescue task";};
		class intel {description = "intel task";};
		class randomwreck {description = "random sea wreck task";};
		class randombuild {description = "random building task";};
		class sideobj {description = "random side location objective area";};
		class randomobjectives {description = "selection of random tasks and loop for checking when all tasks are complete";};
		class randomloc {description = "random destroy object placement task";};
		class randomcrash {description = "random crash task";};
		class objinbuild {description = "random object in building to be destroyed task";};
		class assassinate {description = "kill someone task";};
		class hostjoin {description = "part of rescue task so pow will join players group";};
		class itemfound {description = "part of intel task for item found";};
		class clear {description = "clear area task";};
		class putinbuild {description = "for putting all objects specified in buildings and placing random markers";};
		class randomacquire {description = "random object you have to bring back to base";};
		class dataterminal {description = "data terminal task";};
		class disableterminal {description = "complete terminal task";};
		class convoy {description = "destroy convoy";};
	};
	class spawn
	{
		file = "functions\spawn";
		class randespawn {description = "random enemy infantry patrol spawn near random players";};
		class eparadrop {description = "enemy para drop";};
		class ecounter {description = "enemy counter attack";};
		class eair {description = "random enemy air patrol";};
		class bair {description = "random friendly air patrol";};
		class mines {description = "random mines";};
		class roofmgs2 {description = "random static weapons in buildings alternate version";};
		class ediverspawn {description = "random enemy diver spawn";};
		class espawn {description = "random enemy infantry patrol spawn at location";};
		class evehsentryspawn {description = "random enemy vehicle spawn near roads if available";};
		class civcars {description = "random civilian cars - vbieds";};
		class civhpads {description = "random civilian helis on helipads";};
		class ieds {description = "random ieds";};
		class fillbuild {description = "fill random buildings at location with units";};
		class basedef {description = "static base defence vehicles";};
		class eboatspawn {description = "random enemy boat spawn";};
		class evehspawn {description = "random vehicle patrol spawn";};
		class animals {description = "random animal spawn";};
		class basearty {description = "static base arty vehicles";};
	};
	class client
	{
		file = "functions\client";
		class halo {description = "player halo";};
		class deploychute {description = "player deploy parachute";};
		class ptracker {description = "tracking mission vehicles";};
		class remotedesignator {description = "deploys remote designator";};
		class ammodrop {description = "player ammo crate call in";};
		class airsupport {description = "player air support call in";};
		class ugvsupport {description = "player ugv call in";};
		class uavsupport {description = "player uav call in";};
		class respawntent {description = "player deploy respawn tent";};
		class puavsupport {description = "player AR-2 Darter call in";};
		class reload {description = "repair, rearm, refuel";};
		class playeraddactions {description = "adds various player actions on call";};
		class magazines {description = "compiles all magazines and loads them into cargo";};
		class boatpush {description = "ability to push a boat";};
		class obstruction_clear {description = "clears obstructions in front of specified vehicle";};
		class vehicle_actioninit {description = "adds various actions to specified vehicles";};
		class clear_respawn_tents {description = "clear respawn tents";};
		class spawninf {description = "creates friendly AI for players group";};
		class delete_aigroup {description = "deletes AI from players group";};
		class aceheal {description = "ace full heal";};
		class clear_ugv {description = "clear pelter ugv";};
	};
	class demo
	{
		file = "functions\demo";
		class attachdemo {description = "attach demo";};
		class detdemo {description = "detonate demo";};
		class pickupdemo {description = "pickup demo";};
		class timerdemo {description = "demo timer";};
		class demoplacement {description = "demo placement";};
	};
	class moveunits
	{
		file = "functions\moveunits";
		class drag {description = "adds drag option";};
		class release {description = "adds release drag option";};
		class loadvehicle {description = "adds load unit into vehicle option";};
	};
	class transport
	{
		file = "functions\transport";
		class init_transport {description = "init transport option";};
		class dest_transport {description = "transport destination";};
		class rtb_transport {description = "transport rtb";};
		class mappos {description = "gets pos from mapclick";};
		class transportserver {description = "server function for airlift";};
		class init_airlift {description = "init airlift option";};
		class airliftserver {description = "server function for airlift";};
	};
	class gunship
	{
		file = "functions\gunship";
		class gunship {description = "Gunship Support";};
		class dest_gunship {description = "set new position for gunship";};
	};
	class crate
	{
		file = "functions\crate";
		class mags {description = "only mags for crate";};
		//class meds {description = "only meds for crate";};
		class arsenal {description = "arsenal for crate";};
	};
	class dlg
	{
		file = "functions\dlg";
		class cargodrop {description = "cargo drop call in";};
		class spawnboat {description = "spawn boat dialog";};
		class spawnair {description = "spawn aircraft dialog";};
		class spawnveh {description = "spawn vehicle dialog";};
		class objlist {description = "dialog for list of vehicles to choose";};
	};
	class server
	{
		file = "functions\server";
		class randweather {description = "random weather to be spawned on server";};
		class debugtasks {description = "debug to set tasks to complete";};
		class addzeusobjs {description = "adds all mission objects to zeus";};
		class addzeus {description = "adds players to zeus";};
		//class initzeus {description = "starts zeus"; preInit = 1;};
	};
};