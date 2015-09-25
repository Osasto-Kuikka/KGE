/*
 * Author: nikolauska
 *
 * Replace binoculars for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

params ["_configPath", "_loadoutTarget"];

if(getText _configPath == "") then {
    _loadoutTarget removeWeapon (binocular _loadoutTarget);
} else {
    _loadoutTarget addWeapon getText (_configPath);
};
