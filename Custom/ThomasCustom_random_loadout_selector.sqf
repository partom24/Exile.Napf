private ["_bambiLoadout", "_backpack", "_uniform", "_weapon", "_vest", "_headgear", "_ammo"];
private _bambiLoadout = [];
"Loadout Randomizer" call ExileServer_util_log;
selectBambiAmmo = { 
	/* 
		- selects ammo for weapons, each case "<weapon>" must match the _weapon selection line, or no ammo will be given
		- The amount of magazines in each _ammo array determines the amount given, typically set to give around 100 rounds
	*/
	private _ammo = "";
	switch (_this select 0) do
	{
		case "srifle_EBR_Hamr_pointer_F" : { _ammo = ["20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag"]; };
		case "srifle_DMR_07_ghex_F" : { _ammo = ["20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F","20Rnd_650x39_Cased_Mag_F"]; };
		case "arifle_CTARS_hex_F" : { _ammo = ["100Rnd_580x42_hex_Mag_F"]; };
		case "arifle_AKS_Gold" : { _ammo = ["30Rnd_762x39_AK47_M","30Rnd_762x39_AK47_M","30Rnd_762x39_AK47_M"]; };
		case "Exile_Weapon_PKP":{ _ammo = ["Exile_Magazine_100Rnd_762x54_PK_Green"]; }; 
	};
	_ammo;
};

_backpack = selectRandom ["B_OutdoorPack_tan","B_Kitbag_cbr","B_AssaultPack_cbr","B_OutdoorPack_blu"]; // randomly selects backpacks
_bambiLoadout pushback _backpack;
_uniform = selectRandom ["U_B_T_Soldier_AR_F","U_OrestesBody","arifle_CTARS_hex_F","U_B_CBRN_Suit_01_Tropic_F","Exile_Uniform_Woodland","U_OrestesBody"]; // randomly selects uniforms
_bambiLoadout pushback _uniform;
_weapon =  selectRandom ["srifle_EBR_Hamr_pointer_F","srifle_DMR_07_ghex_F","arifle_CTARS_hex_F","arifle_AKS_Gold","Exile_Weapon_PKP"]; // randomly selects weapon
_bambiLoadout pushback _weapon;
_vest =  selectRandom ["V_PlateCarrierH_CTRG","V_HarnessOGL_brn","V_TacVestIR_blk","V_HarnessOSpec_gry"]; // randomly selects vests
_bambiLoadout pushback _vest;
_headgear = selectRandom["H_Cap_tan_specops_US","H_MilCap_mcamo","H_HelmetIA","H_HelmetSpecB","H_Beret_grn_SF"]; // randomly selects Headgear
_bambiLoadout pushback _headgear;
_ammo = [_weapon] call selectBambiAmmo;

/*if(_weapon != "") then 
{
    _weaponMagazinesToAdd = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines");
    _weaponMagazineAmount = 2 + round random (1);
    for "_i" from 0 to _weaponMagazineAmount do
	{
    	_ammo pushback (_weaponMagazinesToAdd select 0);
	};
	_ammo call ExileServer_util_log;
    _ammo pushBack [_weaponMagazinesToAdd select 0,_weaponMagazineAmount];   
};*/
_bambiLoadout append _ammo;
_bambiLoadout append ["ItemCompass","ItemMap","Exile_Item_XM8","ItemRadio","Exile_Item_PlasticBottleFreshWater","Rangefinder"];

_bambiLoadout;