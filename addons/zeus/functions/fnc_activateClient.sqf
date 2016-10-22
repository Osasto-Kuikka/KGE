/*
 * Author: nikolauska
 *
 * Activate zeus for client
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit", "_changeAssigned"];

if(call EFUNC(common,isAdmin) && {!isNull _unit}) then {
  [QGVAR(activateEvent), [_unit, _changeAssigned]] call CBA_fnc_serverEvent;
};
