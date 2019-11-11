
_name = name player;
while {true} do 
{
	_fps = diag_fps;
	format["[FPS Monitor] :: %1:%2",_name,_fps] call ExileServer_util_log;
	sleep 30;
}