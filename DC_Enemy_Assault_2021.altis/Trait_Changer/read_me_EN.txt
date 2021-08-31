Trait Changer by UNIT_normal
This allows you to change between default traits and custome traits.

Known Issues
- This don't change actual unit class.

Installation
1. Put Trait_Changer folder on your mission folder.
2. Put stringtable.xml or copy & paste contents to your stringtable.xml.
3. Add this to init.sqf.
[] execVM "Trait_Changer\TC_init.sqf";

4. Add this to object that you want.
0 = this execVM "Trait_Changer\functions\fnc_TC_object.sqf";

5. Add this to description.ext.
#include "Trait_Changer\defines.hpp"
#include "Trait_Changer\TC_GUI_controls.hpp"
#include "Trait_Changer\TC_GUI_classes.hpp"

Option
- In TC_init.sqf, you can set trait limit on server.

Changelog
1.0
Released

Special Thanks
DCinside ARMA Minor Gallery for helping so many test and server test