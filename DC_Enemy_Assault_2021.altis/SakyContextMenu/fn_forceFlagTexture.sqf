params["_texture"];

if(!((vehicle player) isKindOf 'AIR') && (driver vehicle player == player))then{
	vehicle player forceFlagTexture _texture;
	SCM_FlagTexture = _texture;
};