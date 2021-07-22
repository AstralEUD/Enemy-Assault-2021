private ["_all_build_positions","_pIsEmpty","_i","_p","_x"];

_all_build_positions = [];

{

	private ["_i","_p"];
	
	_i = 0;
	_pIsEmpty = false;

		while { ! _pIsEmpty } do 
		{
			_p = _x buildingPos _i;

			if (( str _p != "[0,0,0]" ) and !(_x iskindof "Piers_base_F")) then
			{
				//_all_build_positions = _all_build_positions + [_p];
				_all_build_positions pushback _p;
			}
			else
			{
				_pIsEmpty = true;
			};
			
			_i = _i + 1;
		};
		
} foreach _this;

_all_build_positions