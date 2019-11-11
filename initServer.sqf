/**
 * Created with Exile Mod 3DEN Plugin
 * www.exilemod.com
 */

ExileRouletteChairs = [];
ExileRouletteChairPositions = [];

// 29 Vehicles
private _vehicles = [
["Exile_Sign_Office", [15239.5, 16263.6, 17.5217], [0.754507, 0.656292, 0], [0, 0, 1], true],
["Land_ConnectorTent_01_NATO_tropic_cross_F", [15238.6, 16262.7, 17.6539], [0.597633, -0.801769, 0], [0, 0, 1], true],
["CUP_lobby_chair", [15239.5, 16263.6, 16.4806], [0.795704, 0.605685, 0], [0, 0, 1], true],
["CUP_Dhangar_psacistul", [15238.7, 16262.9, 16.1915], [0.617256, -0.786763, 0], [0, 0, 1], true],
["Exile_Sign_Armory", [15245.1, 16257.2, 17.4326], [0.774603, 0.632448, 0], [0, 0, 1], true],
["Exile_Sign_WasteDump", [15247.5, 16254.4, 17.4326], [0.778534, 0.627603, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [15217.1, 16242.9, 17.4326], [-0.999367, -0.0355826, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [5379.13, 15551.7, 44.8514], [-0.0135364, -0.999908, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [5379.13, 15551.7, 44.8517], [-0.0137199, -0.999906, 0], [0, 0, 1], true],
["Exile_Sign_Office", [5372.25, 15514.7, 47.5471], [-0.537594, -0.843204, 0], [0, 0, 1], true],
["OfficeTable_01_new_F", [5373.2, 15515.5, 47.453], [0, 1, 0], [0, 0, 1], true],
["CUP_ch_mod_d", [5373.16, 15515, 47.0347], [0.0815051, -0.996673, 0], [0, 0, 1], true],
["Exile_Sign_Armory", [5369.29, 15516.4, 47.7317], [-0.515128, -0.857113, 0], [0, 0, 1], true],
["Exile_Construction_StorageCrate_Preview", [5369.03, 15517.2, 47.0347], [0, 1, 0], [0, 0, 1], true],
["Exile_Sign_WasteDump", [5369.74, 15519.1, 47.7317], [-0.858361, 0.513047, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [4179.01, 4669.97, 72.6154], [-0.0129227, 0.999916, 0], [0, 0, 1], true],
["Exile_Sign_Vehicles", [4179.01, 4669.97, 72.6154], [0.0140621, -0.999901, 0], [0, 0, 1], true],
["Exile_Sign_TraderCity", [4193.94, 4693.94, 73.1203], [-0.904809, 0.425817, 0], [0, 0, 1], true],
["Exile_Sign_WasteDump", [4180.77, 4695.61, 72.3347], [-0.283622, 0.958936, 0], [0, 0, 1], true],
["Exile_Sign_Office", [4174.12, 4697.85, 71.9347], [-0.997944, -0.0640863, 0], [0, 0, 1], true],
["CUP_ch_mod_d", [4174.44, 4698.51, 70.8763], [-0.967853, 0.244328, -0.059699], [-0.0489402, 0.0498763, 0.997556], true],
["Desk", [4174.9, 4698.31, 71.2672], [-0.962991, 0.262684, -0.0603736], [-0.0489369, 0.0498707, 0.997556], true],
["AmmoCrate_NoInteractive_", [4179.39, 4699.41, 71.296], [0.526623, -0.847359, 0.0682028], [-0.0489402, 0.0498763, 0.997556], true],
["AmmoCrate_NoInteractive_", [4179.37, 4699.41, 71.734], [0, 0.998721, -0.0505604], [-0.0493895, 0.0504987, 0.997502], true],
["Exile_Sign_Armory_Small", [4178.36, 4699.96, 71.4378], [-0.174593, 0.984641, 0], [0, 0, 1], true],
["Land_LampAirport_F", [4204.44, 4701.77, 83.7991], [0, 0.994005, -0.109337], [0, 0.109337, 0.994005], true],
["Land_LampAirport_F", [4133.82, 4694.43, 80.6686], [0, 0.991401, -0.130861], [-0.0549147, 0.130663, 0.989905], true],
["Land_LampAirport_F", [5372.66, 15513.1, 59.1917], [-0.475651, -0.878769, 0.0390005], [0.0817198, 0, 0.996655], true],
["Land_LampAirport_F", [15250.6, 16252.5, 28.8106], [0.699688, 0.714449, 0], [0, 0, 1], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
    
    if (_vehicle isKindOf "Exile_RussianRouletteChair") then
    {
        ExileRouletteChairs pushBack _vehicle;
        ExileRouletteChairPositions pushBack [_x select 1, getDir _vehicle];
    };
}
forEach _vehicles;

// 2 Simple Objects
private _invisibleSelections = ["zasleh", "zasleh2", "box_nato_grenades_sign_f", "box_nato_ammoord_sign_f", "box_nato_support_sign_f"];
private _simpleObjects = [
["rhsafrf\addons\rhs_weapons\crates\rhs_3ya40_1.p3d", [15245.4, 16255.6, 16.8095], [0.725844, 0.687859, 0], [0, 0, 1]],
["a3\structures_f_heli\items\luggage\plasticcase_01_medium_f.p3d", [5369.19, 15517.1, 47.733], [0, 1, 0], [0, 0, 1]]
];

{
    private _simpleObject = createSimpleObject [_x select 0, _x select 1];
    _simpleObject setVectorDirAndUp [_x select 2, _x select 3];
    
    {
        if ((toLower _x) in _invisibleSelections) then 
        {
            _simpleObject hideSelection [_x, true];
        };
    }
    forEach (selectionNames _simpleObject);
}
forEach _simpleObjects;