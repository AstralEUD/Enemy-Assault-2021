if !( isServer ) exitWith {};

//Group to place client curator in
zeusGroup = createGroup sideLogic;

//create a zeus at server intialisation
ghst_zeus = zeusGroup createUnit [ "ModuleCurator_F", [0, 0, 0], [], 0, "NONE" ];