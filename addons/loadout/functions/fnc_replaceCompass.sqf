/*
 * Author: nikolauska
 *
 * Replace compass for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_configPath", "_loadoutTarget"];

if(getText _configPath == "") then {
    _loadoutTarget unlinkItem "ItemCompass";
} else {
    _loadoutTarget linkItem (getText _configPath call FUNC(fixer));
};
