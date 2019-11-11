//////////////Added by [_ZEN_]happydayz/////////////////

class Revive: ExileAbstractAction
{
	title = "Perform CPR";
	condition = "(!(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['EnigmaRevivePermitted', true]) && (magazines player find 'Exile_Item_Defibrillator' >= 0))";
	action = "_this spawn Enigma_RevivePlyr";
};
