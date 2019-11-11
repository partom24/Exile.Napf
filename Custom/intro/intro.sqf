waitUntil{!isNull (findDisplay 46)};
sleep 10;
_onScreenTime = 8;
//playsound "intro";

_role1 = "Welcome to CHB Exile";
_role1names = ["Survival isn't easy here","Go to XM8 for more info"];
_role2 = "Aim of the Game:";
_role2names = ["Have fun","Don't die"];
_role3 = "Admin support on CHB's Discord";
_role3names = ["https://discord.gg/tcDyvSQ"];
_role4 = "Exile Server Manager Community";
_role4names = ["chb_napf"];
_role5 = "Admins:";
_role5names = ["SuperBill","Hart"];
_role6 = "Additional info in XM8's Server Rules";
_role7names = ["No really, checkout XM8's Server Rules","Press 6 above the keyboard, and click the button"];

{
	sleep 2;
	_memberFunction = _x select 0;
	_memberNames = _x select 1;
	_finalText = format ["<t size='0.50' color='#EC0118' align='right'>%1<br /></t>", _memberFunction];
	_finalText = _finalText + "<t size='0.75' color='#FFFFFF' align='right'>";
	{_finalText = _finalText + format ["%1<br />", _x]} forEach _memberNames;
	_finalText = _finalText + "</t>";
	_onScreenTime + (((count _memberNames) - 1) * 0.5);
	[
		_finalText,
		[safezoneX + safezoneW - 0.75,0.7],  //DEFAULT: 0.8,0.35 
  		[safezoneY + safezoneH - 0.45,0.9],  //DEFAULT: 0.8,0.7 
		_onScreenTime,
		0.5
	] spawn BIS_fnc_dynamicText;
	sleep (_onScreenTime);
} forEach [
	//The list below should have exactly the same amount of roles as the list above
	[_role1, _role1names],
	[_role2, _role2names],
	[_role3, _role3names],
	[_role4, _role4names],
	[_role5, _role5names],			
	[_role6, _role6names]
];


