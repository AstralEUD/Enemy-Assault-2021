//SCRIPT BY JTS

/*

EN:
-----
Check this URL for HTML colors:
http://www.w3schools.com/html/html_colors.asp

RU:
-----
Чтобы узнать цвета HTML, идите по этой ссылки:
http://www.w3schools.com/html/html_colors.asp

*/

private ["_DC","_Version","_ColorName","_ColorHealth","_ColorDistance","_ColorVehicleType","_Visibility","_isNot","_isIn","_Mode","_AmountOfUnits","_NameOfUnit","_Man","_Who","_Distance","_Health","_Icon","_Screen","_Text","_NoVeh","_YesVeh","_CND","_isShown","_Display","_ManName"];

disableSerialization;

_DC = _this select 0;

// ---------- EDITABLE VARIABLES (BEGIN) ----------

_Version = "SP"; // Change this to SP for singleplayer mode or to MP for multiplayer mode

_ColorName = "#FFFF99";
_ColorHealth = "#33FF99";
_ColorDistance = "#CCFFFF";
_ColorVehicleType = "#33FF00";

_Visibility = 1000;
_AmountOfUnits = 30;
_NameOfUnit = "fg";

// ---------- EDITABLE VARIABLES (END) ----------

_isNot = "<t align='center'><t color='%5'>%1</t><br/><t color='%6'>[%2%3]</t><br/><t color='%7'>%4 m</t></t>";
_isIn = "<t align='center'><t color='%4'>%1</t><br/><t color='%5'>[%2]</t><br/><t color='%6'>%3 m</t></t>";

if (_Version == "SP") then
{
	_Mode = {(alive player && !isNull _Man && alive _Man && _Man != player && side _Man == playerSide)}
}

else
{
	if (_Version == "MP") then
	{
		_Mode = {(alive player && !isNull _Man && alive _Man && _Man != player && isPlayer _Man && side _Man == playerSide)}
	}

	else
	{
		if (_Version == "DEV") then
		{
			_Mode = {(alive player && !isNull _Man && alive _Man && _Man != player)};
			_isNot = _isNot + "<t align='center'><br/><img image='%8' size='1' shadow='true'/></t>";
			_isIn = _isIn + "<t align='center'><br/><img image='%7' size='1' shadow='true'/></t>";
		}

		else
		{
			_Mode = {(alive player && !isNull _Man && alive _Man && _Man != player && side _Man == playerSide)}
		};
	};
};


// Change condition 'true' to your own (if needed)

while {true} do
{
	sleep 0.03;

	for "_i" from 1 to _AmountOfUnits do
	{
		if (!isNil format ["%1%2", _NameOfUnit, _i]) then
		{
			_Man = (call compile format ["%1%2", _NameOfUnit, _i]);

			if (true && _Mode) then
			{
				_Who = (vehicle _Man);
				_Distance = round (_Man distance vehicle player);
				_Health = ceil ((1 - getDammage vehicle _Man) * 100);
				_Icon = format ["nt_icons\%1.paa", side _Who];

				if (_Distance < _Visibility) then
				{
					_ManName = name _Man;
					_Screen = (worldToScreen [(getPosATL _Man select 0), (getPosATL _Man select 1), (getPosATL _Man select 2) + 4.15]);
					_Text = getText (configFile >> "CfgVehicles" >> (typeOf _Who) >> "DisplayName");
					_NoVeh = parseText format [_isNot, _ManName, _Health, "%", _Distance, _ColorName, _ColorHealth, _ColorDistance, _Icon];
					_YesVeh = parsetext format [_isIn, _ManName, _Text, _Distance, _ColorName, _ColorVehicleType, _ColorDistance, _Icon];
					_CND = (if (_Who != _Man && alive _Who) then {if (_Man == effectiveCommander _Who) then {_YesVeh} else {parseText ""}} else {if (alive _Man) then {_NoVeh} else {parseText ""}});
					_isShown = (count _Screen);

					if (!isNull _Man && _Man != player && _isShown > 0 && !visibleMap) then
					{
						_Display = _DC displayCtrl (100 + _i);
						_Display ctrlSetPosition [(_Screen select 0)-0.2,(_Screen select 1)];
						_Display ctrlSetStructuredText _CND;
						_Display ctrlCommit 0;
					}

					else
					{
						_Display = _DC displayCtrl (100 + _i);
						_Display ctrlSetStructuredText parseText "";
						_Display ctrlCommit 0
					};
				}

				else
				{
					_Display = _DC displayCtrl (100 + _i);
					_Display ctrlSetStructuredText parseText "";
					_Display ctrlCommit 0
				}
			}

			else
			{
				_Display = _DC displayCtrl (100 + _i);
				_Display ctrlSetStructuredText parseText "";
				_Display ctrlCommit 0;
			}
		};
	};
};