disableSerialization;

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {
    private _object = objNull;
    private _data = lbData [RscAdminToolkitDetailList_IDC, lbCurSel RscAdminToolkitDetailList_IDC];
    private _userInput = ctrlText RscAdminToolkitParam_IDC;

    switch (AdminToolkit_Action) do {
        //case 'occ_spawnraid';
        //case "exile_repvehicle";
        //case "exile_destvehicle";
        //case "exile_delvehicle": {
          //  [AdminToolkit_Action, _data] call AdminToolkit_doAction;
        //};
        //case "exile_setvehiclepin": {
          //  [AdminToolkit_Action, [_data, _userInput]] call AdminToolkit_doAction;
        //};
        //case "exile_getvehicle": {
            //[AdminToolkit_Action, _data] call AdminToolkit_doAction;
        //};
        //case 'exile_sendmoney';
		//case 'exile_sendscore': {
            //[AdminToolkit_Action, [_data, parseNumber _userInput]] call AdminToolkit_doAction;
		//};
        //case "exile_getmoney": {
            //['exile_getmoney', parseNumber _userInput] call AdminToolkit_doAction;
        //};
        //case "exile_getscore": {
            //['exile_getscore', parseNumber _userInput] call AdminToolkit_doAction;
        //};
        //case "exile_getheal": {
            //['exile_getheal', ""] call AdminToolkit_doAction;
        //};
        default {
            systemChat format["Unknown action %1", AdminToolkit_Action];
         };
    };
};