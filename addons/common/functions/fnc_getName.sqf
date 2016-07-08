/*
 * Author: nikolauska
 *
 * Get unit saved name
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * String
 */

#include "script_component.hpp"

params ["_unit"];

[_unit] call ace_common_fnc_getName;
