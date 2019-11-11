/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 * Exile.Malden by [FPS]kuplion
 */
if (!hasInterface || isServer) exitWith {};

// Load Status Bar
[] execVM "Custom\StatusBar\statusBar_init.sqf";

// Load Vehicle Claim System
[] execVM "ClaimVehicles_Client\ClaimVehicles_Client_init.sqf";

[] execVM "custom\intro\intro.sqf";

//[] execVM "Custom\motdRepeat.sqf";

[] execVM "Custom\Actions\fnc_showActions.sqf";

[] execVM "Custom\ExileClient_util_log_fps.sqf";

[] execVM "custom\paintshop\paintshop.sqf";

// 12 NPCs
private _npcs = [
    ["Exile_Trader_WasteDump", ["HubStandingUC_idle1","HubStandingUC_idle2","HubStandingUC_idle3","HubStandingUC_move1","HubStandingUC_move2"], "Exile_Trader_WasteDump", "WhiteHead_11", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [15247.4,16253.6,16.393], [-0.757876,-0.652398,0], [0, 0, 1]],
    ["Exile_Trader_WasteDump", ["HubStandingUC_idle1","HubStandingUC_idle2","HubStandingUC_idle3","HubStandingUC_move1","HubStandingUC_move2"], "Exile_Trader_WasteDump", "WhiteHead_11", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [5370.54,15519.3,47.0362], [0.938744,-0.344615,0], [0, 0, 1]],
    ["Exile_Trader_WasteDump", ["HubStandingUC_idle1","HubStandingUC_idle2","HubStandingUC_idle3","HubStandingUC_move1","HubStandingUC_move2"], "Exile_Trader_WasteDump", "WhiteHead_11", [[],[],[],["U_I_G_Story_Protagonist_F",[]],["V_Rangemaster_belt",[]],[],"H_MilCap_gry","",[],["","","","","",""]], [4179.69,4697.18,71.2039], [-0.994935,0.100516,0], [0, 0, 1]],
    ["Exile_Trader_Vehicle", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Vehicle", "AfricanHead_01", [[],[],[],["U_C_Driver_1_red",[]],[],[],"H_RacingHelmet_1_red_F","",[],["","","","","",""]], [15217.4,16243.5,16.393], [0.997302,0.0734067,0], [0, 0, 1]],
    ["Exile_Trader_Vehicle", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Vehicle", "AfricanHead_01", [[],[],[],["U_C_Driver_1_red",[]],[],[],"H_RacingHelmet_1_red_F","",[],["","","","","",""]], [5379.6,15551.3,43.8264], [0.0835081,-0.996507,0], [0, 0, 1]],
    ["Exile_Trader_Vehicle", ["HubBriefing_loop","HubBriefing_scratch","HubBriefing_stretch","HubBriefing_think"], "Exile_Trader_Vehicle", "AfricanHead_01", [[],[],[],["U_C_Driver_1_red",[]],[],[],"H_RacingHelmet_1_red_F","",[],["","","","","",""]], [4179.5,4669.45,71.5758], [0.15655,-0.98767,0], [0, 0, 1]],
    ["Exile_Trader_Office", ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"], "Exile_Trader_Office", "WhiteHead_09", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Tactical_Clear",[],["","","","","",""]], [15239.5,16263.5,16.393], [-0.7659,-0.64296,0], [0, 0, 1]],
    ["Exile_Trader_Office", ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"], "Exile_Trader_Office", "WhiteHead_09", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Tactical_Clear",[],["","","","","",""]], [4174.35,4698.68,70.8676], [0.900604,-0.434642,0], [0, 0, 1]],
    ["Exile_Trader_Office", ["HubSittingAtTableU_idle1","HubSittingAtTableU_idle2","HubSittingAtTableU_idle3"], "Exile_Trader_Office", "WhiteHead_09", [[],[],[],["U_I_G_resistanceLeader_F",[]],["V_Rangemaster_belt",[]],[],"H_Hat_brown","G_Tactical_Clear",[],["","","","","",""]], [5373.02,15514.8,47.0362], [0,1,0], [0, 0, 1]],
    ["Exile_Trader_CommunityCustoms", ["HubSittingHighB_idle2"], "Exile_Trader_CommunityCustoms", "AfricanHead_01", [["Exile_Weapon_LeeEnfield","","","optic_Hamr",["Exile_Magazine_10Rnd_303",10],[],""],[],[],["U_C_WorkerCoveralls",[["Exile_Magazine_10Rnd_303",3,10]]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Combat",[],["","","","","",""]], [15245.6,16255.6,16.390], [-0.792805,-0.609476,0], [0, 0, 1]],
    ["Exile_Trader_CommunityCustoms", ["HubSittingHighB_idle2"], "Exile_Trader_CommunityCustoms", "AfricanHead_01", [["Exile_Weapon_LeeEnfield","","","optic_Hamr",["Exile_Magazine_10Rnd_303",10],[],""],[],[],["U_C_WorkerCoveralls",[["Exile_Magazine_10Rnd_303",3,10]]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Combat",[],["","","","","",""]], [5369.13,15517.3,47.03062], [0.960617,0.277874,0], [0, 0, 1]],
    ["Exile_Trader_CommunityCustoms", ["HubSittingHighB_idle2"], "Exile_Trader_CommunityCustoms", "AfricanHead_01", [["Exile_Weapon_LeeEnfield","","","optic_Hamr",["Exile_Magazine_10Rnd_303",10],[],""],[],[],["U_C_WorkerCoveralls",[["Exile_Magazine_10Rnd_303",3,10]]],["V_BandollierB_rgr",[]],["B_UAV_01_backpack_F",[]],"H_Booniehat_khk_hs","G_Combat",[],["","","","","",""]], [4179.37,4699.49,71.0731], [-0.703142,-0.711049,0], [0, 0, 1]]
];

{
    private _logic = "Logic" createVehicleLocal [0, 0, 0];
    private _trader = (_x select 0) createVehicleLocal [0, 0, 0];
    private _animations = _x select 1;
    
    _logic setPosWorld (_x select 5);
    _logic setVectorDirAndUp [_x select 6, _x select 7];
    
    _trader setVariable ["BIS_enableRandomization", false];
    _trader setVariable ["BIS_fnc_animalBehaviour_disable", true];
    _trader setVariable ["ExileAnimations", _animations];
    _trader setVariable ["ExileTraderType", _x select 2];
    _trader disableAI "ANIM";
    _trader disableAI "MOVE";
    _trader disableAI "FSM";
    _trader disableAI "AUTOTARGET";
    _trader disableAI "TARGET";
    _trader disableAI "CHECKVISIBLE";
    _trader allowDamage false;
    _trader setFace (_x select 3);
    _trader setUnitLoadOut (_x select 4);
    _trader setPosWorld (_x select 5);
    _trader setVectorDirAndUp [_x select 6, _x select 7];
    _trader reveal _logic;
    _trader attachTo [_logic, [0, 0, 0]];
    _trader switchMove (_animations select 0);
    _trader addEventHandler ["AnimDone", {_this call ExileClient_object_trader_event_onAnimationDone}];
    diag_log format ["[InitPlayer] NPC createVehicle '%1' , at post '%2' ", _x select 0, _x select 5];
} forEach _npcs;

setTerrainGrid 12.5;
setViewDistance 6000;
setObjectViewDistance [2000, 50]; // ObjectViewDistance, shadowViewDistance