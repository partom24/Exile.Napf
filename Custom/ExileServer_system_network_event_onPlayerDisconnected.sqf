/**
 * ExileServer_system_network_event_onPlayerDisconnected
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

//["error", "message", [format["Player %1 disconnected. :(", _name]]] call ESM_fnc_logToDiscord;

_message = format["Player %1 disconnected. :(", _name];
["error", "message", [_message]] call ESM_fnc_logToDiscord;
format["[Overwright]::Player %1 disconnected!", _name] call ExileServer_util_log;	
true