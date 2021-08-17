// From JLD (SAKY)

while {true} do {
	_blockedItemsAll = [];
	_blockedAssignedItems = (assignedItems player) arrayIntersect AST_limitedItems;
	_blockedUniformItems = []; 
	{
		if (_x in AST_limitedItems)
			then {
				_blockedUniformItems pushBack _x;
			};
	}
	foreach uniformItems player;
	_blockedVestItems = []; 
	{
		if (_x in AST_limitedItems)
			then {
				_blockedVestItems pushBack _x;
			};
	}
	foreach vestItems player;
	_blockedBackpackItems = []; 
	{
		if (_x in AST_limitedItems)
			then {
				_blockedBackpackItems pushBack _x;
			};
	}
	foreach backpackItems player;
	_blockedItemsAll = _blockedAssignedItems + _blockedUniformItems + _blockedVestItems + _blockedBackpackItems; {
		player unassignItem _x;
		player removeItem _x;
	}
	foreach _blockedAssignedItems;

	if (uniform player in AST_limitedItems)
		then {
			_blockedItemsAll pushBack uniform player;
			removeUniform player;
		}
	else { {
			player removeItemFromUniform _x;
		}
		foreach _blockedUniformItems;
	};

	if (vest player in AST_limitedItems)
		then {
			_blockedItemsAll pushBack vest player;
			removeVest player;
		}
	else { {
			player removeItemFromVest _x;
		}
		foreach _blockedVestItems;
	};

	if (backpack player in AST_limitedItems)
		then {
			_blockedItemsAll pushBack backpack player;
			removeBackpack player;
		}
	else { {
			player removeItemFromBackpack _x;
		}
		foreach _blockedBackpackItems;
	};

	_blockedItemsAll sort true;

	if (count _blockedItemsAll != 0)
		then {
			_blockedItemsAllText = ""; {
				_blockedItemsAllText = _blockedItemsAllText + _x + "\n";
			}
			foreach _blockedItemsAll;
			hint format["아래의 항목들이 인벤토리에서 삭제되었습니다.\n%1", _blockedItemsAllText];
		};
	sleep 0.5;
};