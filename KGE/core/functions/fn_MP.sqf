/*
 * Author: commy2, Nikolauska
 *
 * Execute a function on a remote machine in mp.
 *
 * Argument:
 * 0: Function arguments (Array)
 * 1: Function to execute, has to be defined on the remote machine first (String)
 * 2: The function will be executed where this unit is local OR the mode were this function should be executed. (Object OR Number, optional default: 2)
 *     Mode 0: execute on this machine only
 *     Mode 1: execute on server
 *     Mode 2: execute on all clients + server
 *     Mode 3: execute on dedicated only
 *
 * Return value:
 * Nothing
 */

private ["_arguments", "_function", "_unit", "_id"];

KGE_Core_remoteFnc = _this;

_arguments = [_this, 0, [], [[]]] call BIS_fnc_param;
_function = call compile ([_this, 1, "", [""]] call BIS_fnc_param);
_unit = [_this, 2, 2, [0, objNull, WEST]] call BIS_fnc_param;

if (typeName _unit == "SCALAR") exitWith {
    switch (_unit) do {
        case 0 : {
            _arguments call _function;
        };
        case 1 : {
            if (isServer) then {
                _arguments call _function;
            } else {
                publicVariableServer "KGE_Core_remoteFnc";
            };
        };
        case 2 : {
            _arguments call _function;

            KGE_Core_remoteFnc set [2, 0];
            publicVariable "KGE_Core_remoteFnc";
        };
        case 3 : {
            if (isDedicated) then {
                _arguments call _function;
            } else {
                if (!isServer) then {publicVariableServer "KGE_Core_remoteFnc"};
            };
        };
    };
};

if(typeName _unit == "SIDE") exitWith {
    if (isServer) then {
        {
            _id = owner _unit;
            _id publicVariableClient "KGE_Core_remoteFnc";
        } forEach (_unit call KGE_Core_fnc_GetAllPlayers);
    } else {
        publicVariableServer "KGE_Core_remoteFnc";
    };
};

if (local _unit) then {
    _arguments call _function;
} else {
    if (isServer) then {
        _id = owner _unit;
        _id publicVariableClient "KGE_Core_remoteFnc";
    } else {
        publicVariableServer "KGE_Core_remoteFnc";
    };
};