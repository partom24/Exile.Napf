class CfgExileDelayedActions
{
	class Abstract
	{
		duration = 10;
		abortInCombatMode = 1;
		durationFunction = "";
		animation = "";
		animationType = "switchMove";
		failChance = 0;
		conditionFunction = "";
		completedFunction = "";
		abortedFunction = "";
		failedFunction = "";
		repeatingCheckFunction = "";
	};
	class RepairVehicle: Abstract
	{
		duration = 30;
		animation = "Exile_Acts_RepairVehicle01_Animation01";
		conditionFunction = "ExileClient_action_repairVehicle_condition";
		completedFunction = "ExileClient_action_repairVehicle_completed";
	};
	class HotwireVehicle: Abstract
	{
		duration = "3 * 60";
		failChance = 50;
		animation = "Exile_Acts_RepairVehicle01_Animation01";
		conditionFunction = "ExileClient_action_hotwireVehicle_condition";
		completedFunction = "ExileClient_action_hotwireVehicle_completed";
		failedFunction = "ExileClient_action_hotwireVehicle_failed";
	};
	class StealFlag: Abstract
	{
		duration = 60;
		abortInCombatMode = 0;
		durationFunction = "ExileClient_action_stealFlag_duration";
		animation = "Exile_Acts_RepairVehicle01_Animation01";
		conditionFunction = "ExileClient_action_stealFlag_condition";
		completedFunction = "ExileClient_action_stealFlag_completed";
	};
	class HideBody: Abstract
	{
		duration = 10;
		animation = "Exile_Shovel_Dig01";
		conditionFunction = "ExileClient_action_HideBody_condition";
		completedFunction = "ExileClient_action_HideBody_completed";
	};
	class PlantChargeWood: Abstract
	{
		duration = "3 * 60";
		abortInCombatMode = 0;
		animation = "Exile_Acts_RepairVehicle01_Animation01";
		conditionFunction = "ExileClient_action_breaching_condition";
		completedFunction = "ExileClient_action_breaching_completed";
		failedFunction = "ExileClient_action_breaching_failed";
		abortedFunction = "ExileClient_action_breaching_aborted";
	};
	class PlantChargeMetal: PlantChargeWood
	{
		duration = "5 * 60";
	};
	class PlantChargeConcrete: PlantChargeWood
	{
		duration = "7 * 60";
	};
	class RepairConstruction: Abstract
	{
		animation = "Exile_Acts_RepairVehicle01_Animation01";
		durationFunction = "ExileClient_action_repairConstruction_duration";
		conditionFunction = "ExileClient_action_repairConstruction_condition";
		completedFunction = "ExileClient_action_repairConstruction_completed";
	};
	class GutAnimal: Abstract
	{
		duration = 10;
		animationType = "playMoveNow";
		animation = "AinvPknlMstpSnonWnonDr_medic5";
		conditionFunction = "ExileClient_action_GutAnimal_condition";
		completedFunction = "ExileClient_action_GutAnimal_completed";
	};
	class HackLock: Abstract
	{
		animationType = "switchMove";
		animation = "Acts_TerminalOpen";
		abortInCombatMode = 0;
		failChanceFunction = "ExileClient_action_hackLock_failChance";
		durationFunction = "ExileClient_action_hackLock_duration";
		conditionFunction = "ExileClient_action_hackLock_condition";
		completedFunction = "ExileClient_action_hackLock_completed";
		failedFunction = "ExileClient_action_hackLock_failed";
		abortedFunction = "ExileClient_action_hackLock_aborted";
	};
	class GrindLock: Abstract
	{
		animationType = "switchMove";
		animation = "Exile_Acts_RepairVehicle01_Animation01";
		abortInCombatMode = 0;
		failChanceFunction = "ExileClient_action_grindLock_failChance";
		durationFunction = "ExileClient_action_grindLock_duration";
		conditionFunction = "ExileClient_action_grindLock_condition";
		completedFunction = "ExileClient_action_grindLock_completed";
		failedFunction = "ExileClient_action_grindLock_failed";
		abortedFunction = "ExileClient_action_grindLock_aborted";
	};
};