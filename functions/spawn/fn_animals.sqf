/*V1 By: Ghost - spawn random animals around position
ghst_animals = [(getmarkerpos "center"),1000,10,["Alsatian_Random_F","Goat_Base_F"]] call ghst_fnc_animals;

["Animal_Base_F","Fish_Base_F","Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Rabbit_F","Snake_random_F","Turtle_F","Fowl_Base_F","Hen_random_F","Cock_random_F","Cock_white_F","Dog_Base_F","Fin_Base_F","Fin_sand_F","Fin_blackwhite_F","Fin_ocherwhite_F","Fin_tricolour_F","Fin_random_F","Alsatian_Base_F","Alsatian_Sand_F","Alsatian_Black_F","Alsatian_Sandblack_F","Alsatian_Random_F","Goat_Base_F","Goat_random_F","Sheep_random_F"]
nul = [player,["Alsatian_Random_F"],200] call bis_fnc_animalSiteSpawn;
*/
_sitePos = _this select 0;//center position
_rad = _this select 1;//radius around position to spawn animals
_maxnum = _this select 2;//max number of animals to spawn
_animalarray = _this select 3;//array of animals to spawn

ghst_animal_array = [];

for "_x" from 0 to (_maxnum) do {
	_pos = [((_sitePos select 0) - _rad + random (_rad * 2)), ((_sitePos select 1) - _rad + random (_rad * 2)), 0];
	_animalsel = selectRandom _animalarray;
	_unit = createAgent [_animalsel,_pos,[],0,"NONE"];
	_unit setDir (random 360);
	
	ghst_animal_array pushBack _unit;
};