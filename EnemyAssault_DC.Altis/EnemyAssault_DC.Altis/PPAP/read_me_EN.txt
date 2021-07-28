Pylon Preset Allocator for Plane by UNIT_normal
This allows you to change between default presets and custom presets via GUI.

Known Issues
- If armament name is long, armament name will be displayed in 2 line.
- Pylon name could be displayed wrong.

Installation
1. Put PPAP folder on your mission folder.
2. Put stringtable.xml or copy & paste contents to your stringtable.xml.
3. Add this to init.sqf.
[] execVM "PPAP\PPAP_init.sqf";
4. Add this to description.ext.
#include "PPAP\defines.hpp"
#include "PPAP\PPAP_GUI_controls.hpp"
#include "PPAP\PPAP_GUI_classes.hpp"

Option
- In PPAP_init.sqf, you can enable multiple check systems.

Changelog
1.0
Released
1.01
Minor change
1.10
Action mechanism changed
1.11
Minor change
1.12
Locality problem fixed, some activation conditions has been changed.
1.13
Minor change
1.14
Bug fix. Due to locaility issue, to change pylon inside of vehicle, everyone inside vehicle except driver(pilot) should get out.
1.15
Bug fix, minor change. stringtable content has been changed.

Special Thanks
DCinside ARMA Minor Gallery for helping so many test and server test
JLD server for helping server test