_usePersistentTime = 1;
_useFastTime = 1;
_timeMultiplier = 3;
_serverShutdownRecorded = isNil {profileNamespace getVariable "date_time"};

if(!_serverShutdownRecorded) then
{
	_time = profileNamespace getVariable "date_time";
	setDate _time;
	format["[ExileServerTimeInit] :: Exile time set to %1", _time] call ExileServer_util_log;
} else {
	format["[ExileServerTimeInit] :: Exile time set to %1", date] call ExileServer_util_log;
};

if (_useFastTime isEqualTo 1) then
{
	setTimeMultiplier _timeMultiplier;
	format["[ExileServerTimeInit] :: Exile timeMultiplier to %1", _timeMultiplier] call ExileServer_util_log;	
}else{
format["[ExileServerTimeInit] :: Exile timeMultiplier set to %1", _timeMultiplier] call ExileServer_util_log;	
	setTimeMultiplier 1;
};

[] spawn {
	waitUntil {PublicServerIsLoaded};
	while {true} do
	{	
		_curDate = date;
		profileNamespace setVariable ["date_time",_curDate];
		sleep 30;
	};
};

