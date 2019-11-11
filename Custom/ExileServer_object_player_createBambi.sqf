/**
 * ExileServer_object_player_createBambi
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID", "_requestingPlayer", "_spawnLocationMarkerName", "_bambiPlayer", "_accountData", "_escapeEnabled", "_direction", "_position", "_spawnAreaPosition", "_spawnAreaRadius", "_clanID", "_clanData", "_clanGroup", "_escapeAccountdata", "_devFriendlyMode", "_devs", "_parachuteNetID", "_spawnType", "_parachuteObject"];
_sessionID = _this select 0;
_requestingPlayer = _this select 1;
_spawnLocationMarkerName = _this select 2;
_bambiPlayer = _this select 3;
_accountData = _this select 4;
_escapeEnabled = getNumber(configFile >> "CfgSettings" >> "Escape" >> "enableEscape") isEqualTo 1;
_direction = random 360;
if (_escapeEnabled) then 
{
	_position = getArray(configFile >> "CfgSettings" >> "Escape" >> worldName >> "startingLocation");
	(uniformContainer _bambiPlayer) call ExileClient_util_containerCargo_clear;
	_bambiPlayer linkItem "ItemGPS";
}
else
{
	if ((count ExileSpawnZoneMarkerPositions) isEqualTo 0) then 
	{
		_position = call ExileClient_util_world_findCoastPosition;
		if ((toLower worldName) isEqualTo "namalsk") then 
		{
			while {(_position distance2D [76.4239, 107.141, 0]) < 100} do 
			{
				_position = call ExileClient_util_world_findCoastPosition;
			};
		};
	}
	else 
	{
		_spawnAreaPosition = getMarkerPos _spawnLocationMarkerName;
		_spawnAreaRadius = getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "spawnZoneRadius");
		_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
		while {surfaceIsWater _position} do 
		{
			_position = [_spawnAreaPosition, _spawnAreaRadius] call ExileClient_util_math_getRandomPositionInCircle;
		};
	};
};
_name = name _requestingPlayer;
_clanID = (_accountData select 3);
if !((typeName _clanID) isEqualTo "SCALAR") then
{
	_clanID = -1;
	_clanData = [];
}
else
{
	_clanData = missionNamespace getVariable [format ["ExileServer_clan_%1",_clanID],[]];
	if(isNull (_clanData select 5))then
	{
		_clanGroup = createGroup independent;
		_clanData set [5,_clanGroup];
		_clanGroup setGroupIdGlobal [_clanData select 0];
		missionNameSpace setVariable [format ["ExileServer_clan_%1",_clanID],_clanData];
	}
	else
	{
		_clanGroup = (_clanData select 5);
	};
	[_bambiPlayer] joinSilent _clanGroup;
};
_bambiPlayer setPosATL [_position select 0,_position select 1,0];
_bambiPlayer disableAI "FSM";
_bambiPlayer disableAI "MOVE";
_bambiPlayer disableAI "AUTOTARGET";
_bambiPlayer disableAI "TARGET";
_bambiPlayer disableAI "CHECKVISIBLE";
_bambiPlayer setDir _direction;
_bambiPlayer setName _name;
_bambiPlayer setVariable ["ExileMoney", 0, true]; 
_bambiPlayer setVariable ["ExileScore", (_accountData select 0)];
_bambiPlayer setVariable ["ExileKills", (_accountData select 1)];
_bambiPlayer setVariable ["ExileDeaths", (_accountData select 2)];
_bambiPlayer setVariable ["ExileClanID", _clanID];
_bambiPlayer setVariable ["ExileClanData", _clanData];
_bambiPlayer setVariable ["ExileHunger", 100];
_bambiPlayer setVariable ["ExileThirst", 100];
_bambiPlayer setVariable ["ExileTemperature", 37];
_bambiPlayer setVariable ["ExileWetness", 0];
_bambiPlayer setVariable ["ExileAlcohol", 0]; 
_bambiPlayer setVariable ["ExileName", _name]; 
_bambiPlayer setVariable ["ExileOwnerUID", getPlayerUID _requestingPlayer]; 
_bambiPlayer setVariable ["ExileIsBambi", !_escapeEnabled];
_bambiPlayer setVariable ["ExileXM8IsOnline", false, true];
_bambiPlayer setVariable ["ExileLocker", (_accountData select 4), true];
if (_escapeEnabled) then 
{
	_escapeAccountdata = format["getEscapeAccountStats:%1", getPlayerUID _requestingPlayer] call ExileServer_system_database_query_selectSingle;
	_bambiPlayer setVariable ["ExileWins", (_escapeAccountdata select 0)];
	_bambiPlayer setVariable ["ExileMatches", (_escapeAccountdata select 1)];
};
_devFriendlyMode = getNumber (configFile >> "CfgSettings" >> "ServerSettings" >> "devFriendyMode");
if (_devFriendlyMode isEqualTo 1) then 
{
	_devs = getArray (configFile >> "CfgSettings" >> "ServerSettings" >> "devs");
	{
		if ((getPlayerUID _requestingPlayer) isEqualTo (_x select 0))exitWith 
		{
			if ((name _requestingPlayer) isEqualTo (_x select 1))then
			{
				_bambiPlayer setVariable ["ExileMoney", 500000, true];
				_bambiPlayer setVariable ["ExileScore", 100000];
			};
		};
	}
	forEach _devs;
};
_parachuteNetID = "";

_spawnRandom = {
	scriptRunning = true;
	while {scriptRunning} do
	{
		private ["_unit", "_saveLoadOut","_chemLight"]; //["_unit","_vehicle","_saveLoadOut","_chemLight"]; 
		_unit 	 	 = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		//_vehicle 	 = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
		_saveLoadOut = [_this, 2, true, [true]] call BIS_fnc_param;
		_chemLight	 = [_this, 3, false, [false]] call BIS_fnc_param;

		//Validate parameters
		if (isNull _unit) exitWith {"Unit parameter must not be objNull. Accepted: OBJECT" call ExileServer_util_log};
		//if (isNull _vehicle) exitWith {"Vehicle parameter must not be objNull. Accepted: OBJECT" call BIS_fnc_error};

		//create a log entry
		["Paradrop function has started"] call ExileServer_util_log;

		//save the backpack and its contents, also adds fake pack to front of unit
		if (_saveLoadOut && !isNull (unitBackpack _unit)) then {
			private ["_pack","_class","_magazines","_weapons","_items"];
			_pack	   = unitBackpack _unit;
			_class	   = typeOf _pack;
			_magazines = getMagazineCargo _pack;
			_weapons   = getWeaponCargo _pack;
			_items	   = getItemCargo _pack;

			removeBackpack _unit; //remove the backpack
			_unit addBackpack "b_parachute";

			//attach the bacpack to the unit
			[_unit,_class,_magazines,_weapons,_items] spawn {
				private ["_unit","_class","_magazines","_weapons","_items"];
				_unit		= _this select 0;
				_class		= _this select 1;
				_magazines	= _this select 2;
				_weapons 	= _this select 3;
				_items 		= _this select 4;
				
				private "_packHolder";
				_packHolder = createVehicle ["groundWeaponHolder", [0,0,0], [], 0, "can_collide"];
				_packHolder addBackpackCargoGlobal [_class, 1];

				format["Backback Unit: %1", _unit] call ExileServer_util_log;
				format["Backback Class: %1", _class] call ExileServer_util_log;
				format["Backback Mags: %1", _magazines] call ExileServer_util_log;
				format["Backback Weapons: %1", _weapons] call ExileServer_util_log;
				format["Backback Items: %1", _items] call ExileServer_util_log;
				format["Packholder : %1", _packholder] call ExileServer_util_log;
				
				_unitAnimationState = animationState _unit;
				while {_unitAnimationState != "para_pilot"} do {
					_unitAnimationState = animationState _unit;
					sleep .1;
				};

				//waitUntil {animationState _unit == "para_pilot"};
				_packHolder attachTo [vehicle _unit,[-0.07,0.67,-0.13],"pelvis"]; 
				_packHolder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
						
				_unitTouchingGround = isTouchingGround _unit;
				_unitZPos = getPos _unit select 2;

				while {!_unitTouchingGround || _unitZPos >1} do 
				{
					_unitTouchingGround = isTouchingGround _unit;
					_unitZPos = getPos _unit select 2;
					sleep .1;
				};

				//waitUntil {isTouchingGround _unit || (getPos _unit select 2) < 1};
				deleteVehicle _packHolder; //delete the backpack in front
				"removing packHolder" call ExileServer_util_log;
				_unit addBackpackGlobal _class;//return the backpack
				"returned backpack" call ExileServer_util_log;
				clearAllItemsFromBackpack _unit; //clear all gear from new backpack
				"cleared backpack items" call ExileServer_util_log;

				for "_i" from 0 to (count (_magazines select 0) - 1) do {
					(unitBackpack _unit) addMagazineCargoGlobal [
						(_magazines select 0) select _i,
						(_magazines select 1) select _i]; //return the magazines
				};
				"returned mags to backpack" call ExileServer_util_log;
				for "_i" from 0 to (count (_weapons select 0) - 1) do {
					(unitBackpack _unit) addWeaponCargoGlobal [(_weapons select 0) select _i,(_weapons select 1) select _i]; //return the weapons
				};
				"returned weapons to backpack" call ExileServer_util_log;
				for "_i" from 0 to (count (_items select 0) - 1) do {
					(unitBackpack _unit) addItemCargoGlobal [(_items select 0) select _i,(_items select 1) select _i]; //return the items
				};
				"returned items backpack" call ExileServer_util_log;
				/*
				{
					if((_x select 0) || (_x select 1)) then
					{
						_item0 = _x select 0;
						_item1 = _x select 1;
						(unitBackpack _unit) addMagazineCargoGlobal[_item0,_item1];
					};
				} foreach _magazines;
				"returned mags to backpack" call ExileServer_util_log;
				{
					if((_x select 0) || (_x select 1)) then
					{
						_item0 = _x select 0;
						_item1 = _x select 1;
						(unitBackpack _unit)  addWeaponCargoGlobal[_item0,_item1];
					};
				} foreach _weapons;
				"returned weapons to backpack" call ExileServer_util_log;
				{	
					if((_x select 0) || (_x select 1)) then
					{
						_item0 = _x select 0;
						_item1 = _x select 1;
						(unitBackpack _unit)  addItemCargoGlobal [_item0,_item1];
					};
				} foreach _items;
				"returned items backpack" call ExileServer_util_log;*/
			};
		} else {
			if ((backpack _unit) != "b_parachute") then {_unit addBackpack "B_parachute"; "added parachute to unit" call ExileServer_util_log;}; //add the parachute if unit has no backpack
		};
		scriptRunning = false;
	};
};

if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteSpawning")) isEqualTo 1 && {!(_escapeEnabled)}) then
{
	_position set [2, getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "parachuteDropHeight")]; 
	if ((getNumber(configFile >> "CfgSettings" >> "BambiSettings" >> "haloJump")) isEqualTo 1) then
	{
		//_bambiPlayer addBackpackGlobal "B_Parachute";
		//[] spawn {
		//waitUntil {PublicServerIsLoaded && _usePersistentTime};
		//while {true} do
		//{
		//	_curDate = date;
		//	profileNamespace setVariable ["date_time",_curDate];
		//	sleep 60;
		//};
	//};
//		[_bambiPlayer] spawn { [(_this select 0)] call ExileServer_set_bambi_para_drop; };
		[_bambiPlayer] call _spawnRandom;
		_bambiPlayer setPosATL _position;
		_spawnType = 2;
	}
	else 
	{
		_parachuteObject = createVehicle ["Steerable_Parachute_F", _position, [], 0, "CAN_COLLIDE"];
		_parachuteObject setDir _direction;
		_parachuteObject setPosATL _position;
		_parachuteObject enableSimulationGlobal true;
		_parachuteNetID = netId _parachuteObject;
		_spawnType = 1;
	};
}
else
{
	_spawnType = 0;
};
if (getNumber(missionConfigFile >> "CfgSimulation" >> "enableDynamicSimulation") isEqualTo 1) then 
{
	if ((canTriggerDynamicSimulation _bambiPlayer) isEqualTo false) then
	{
		_bambiPlayer triggerDynamicSimulation true;
	  	_bambiPlayer enableDynamicSimulation true;
	};
};
_bambiPlayer addMPEventHandler ["MPKilled", {_this call ExileServer_object_player_event_onMpKilled}];
if !(_escapeEnabled) then 
{
	_bambiPlayer call ExileServer_object_player_database_insert;
	_bambiPlayer call ExileServer_object_player_database_update;
};
[
	_sessionID, 
	"createPlayerResponse", 
	[
		_bambiPlayer, 
		_parachuteNetID, 
		str (_accountData select 0),
		(_accountData select 1),
		(_accountData select 2),
		100,
		100,
		0,
		(getNumber (configFile >> "CfgSettings" >> "BambiSettings" >> "protectionDuration")) * 60, 
		_clanData,
		_spawnType
	]
] 
call ExileServer_system_network_send_to;
if (_escapeEnabled) then 
{
	[
		_sessionID, 
		"escapeVariables", 
		[
			(_escapeAccountdata select 0),
			(_escapeAccountdata select 1)
		]
	] 
	call ExileServer_system_network_send_to;
};
[_sessionID, _bambiPlayer] call ExileServer_system_session_update;
true