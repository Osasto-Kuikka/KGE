/*
 * Author: nikolauska
 *
 * Add item to units vest
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

{ _loadoutTarget addItemToVest (_x call FUNC(fixer)); } forEach getArray (_configPath);
