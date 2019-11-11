
_motdInterval = 5; //time between messages
_motdSleep = 1800;
_motd = [
	"Welcome to [CHB] Exile!",
	"","",
	"Join us at discord.gg/tcDyvSQ",
	"","",
	"Join our Exile Server Manager Community at chb_altis"
];

while {true} do
{
	sleep _motdSleep;
	{
		systemChat format ["%1", _x];
		sleep _motdInterval;
	} forEach _motd;
	"[MOTDRepeater] :: MOTD Broadcasted" call ExileServer_util_log;
};