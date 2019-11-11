private["_class","_className","_quality", "_arsenal"];//,"ExileArsenal_quality1Items","ExileArsenal_quality2Items","ExileArsenal_quality3Items","ExileArsenal_quality4Items","ExileArsenal_quality5Items","ExileArsenal_quality6Items"];
_arsenal = missionConfigFile >> "CfgExileArsenal";
ExileArsenal_quality1Items = []; 
ExileArsenal_quality2Items = []; 
ExileArsenal_quality3Items = [];
ExileArsenal_quality4Items = [];
ExileArsenal_quality5Items = []; 
ExileArsenal_quality6Items = [];
for "_i" from 0 to (count _arsenal)-1 do     
{     
    _class = _arsenal select _i; 
    _className = str(configName _class); 
    _quality = getNumber(_class >> "quality");
    switch (_quality) do
    {
        case 1: { ExileArsenal_quality1Items pushback _className; };
        case 2: { ExileArsenal_quality2Items pushback _className; };
        case 3: { ExileArsenal_quality3Items pushback _className; };
        case 4: { ExileArsenal_quality4Items pushback _className; };
        case 5: { ExileArsenal_quality5Items pushback _className; };
        case 6: { ExileArsenal_quality6Items pushback _className; };
    };
};

//ExileServerStartTime = (call compile ("extDB2" callExtension "9:LOCAL_TIME")) select 1;
//publicVariable "ExileServerStartTime"; // Now it's public..

publicVariable "ExileArsenal_quality1Items";
publicVariable "ExileArsenal_quality2Items";
publicVariable "ExileArsenal_quality3Items";
publicVariable "ExileArsenal_quality4Items";
publicVariable "ExileArsenal_quality5Items";
publicVariable "ExileArsenal_quality6Items";

"CfgExileArsenal Sorted" call ExileServer_util_log;