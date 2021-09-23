SCM_Attached=SCM_Attached-[objNull];
{
	SCM_Attached=SCM_Attached-[_x];
	deleteVehicle _x;
}forEach SCM_Attached;