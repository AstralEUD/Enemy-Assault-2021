_attached_object = _this;
_action_name = localize "STR_TC_MAIN_MENU_NAME";
_attached_object addAction [
	_action_name,
	{
		0 = createDialog "TC_GUI";
	},
	[], 0.8, true, true, "",
	"typeOf vehicle _this in TC_available_class",
	5
];