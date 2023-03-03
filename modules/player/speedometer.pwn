#include <YSI-Includes\YSI_Coding\y_hooks>

new PlayerText:Speedometer[MAX_PLAYERS][3];
new PlayerBar:GasBar[MAX_PLAYERS][1];

new VehicleNames[212][] =
{
    {"Landstalker"}, {"Bravura"}, {"Buffalo"}, {"Linerunner"}, {"Perrenial"}, {"Sentinel"}, {"Dumper"},
    {"Firetruck"}, {"Trashmaster"}, {"Stretch"}, {"Manana"}, {"Infernus"}, {"Voodoo"}, {"Pony"}, {"Mule"},
    {"Cheetah"}, {"Ambulance"}, {"Leviathan"}, {"Moonbeam"}, {"Esperanto"}, {"Taxi"}, {"Washington"},
    {"Bobcat"}, {"Mr Whoopee"}, {"BF Injection"}, {"Hunter"}, {"Premier"}, {"Enforcer"}, {"Securicar"},
    {"Banshee"}, {"Predator"}, {"Bus"}, {"Rhino"}, {"Barracks"}, {"Hotknife"}, {"Trailer 1"}, {"Previon"},
    {"Coach"}, {"Cabbie"}, {"Stallion"}, {"Rumpo"}, {"RC Bandit"}, {"Romero"}, {"Packer"}, {"Monster"},
    {"Admiral"}, {"Squalo"}, {"Seasparrow"}, {"Pizzaboy"}, {"Tram"}, {"Trailer 2"}, {"Turismo"},
    {"Speeder"}, {"Reefer"}, {"Tropic"}, {"Flatbed"}, {"Yankee"}, {"Caddy"}, {"Solair"}, {"Berkley's RC Van"},
    {"Skimmer"}, {"PCJ-600"}, {"Faggio"}, {"Freeway"}, {"RC Baron"}, {"RC Raider"}, {"Glendale"}, {"Oceanic"},
    {"Sanchez"}, {"Sparrow"}, {"Patriot"}, {"Quad"}, {"Coastguard"}, {"Dinghy"}, {"Hermes"}, {"Sabre"},
    {"Rustler"}, {"ZR-350"}, {"Walton"}, {"Regina"}, {"Comet"}, {"BMX"}, {"Burrito"}, {"Camper"}, {"Marquis"},
    {"Baggage"}, {"Dozer"}, {"Maverick"}, {"News Chopper"}, {"Rancher"}, {"FBI Rancher"}, {"Virgo"}, {"Greenwood"},
    {"Jetmax"}, {"Hotring"}, {"Sandking"}, {"Blista Compact"}, {"Police Maverick"}, {"Boxville"}, {"Benson"},
    {"Mesa"}, {"RC Goblin"}, {"Hotring Racer A"}, {"Hotring Racer B"}, {"Bloodring Banger"}, {"Rancher"},
    {"Super GT"}, {"Elegant"}, {"Journey"}, {"Bike"}, {"Mountain Bike"}, {"Beagle"}, {"Cropdust"}, {"Stunt"},
    {"Tanker"}, {"Roadtrain"}, {"Nebula"}, {"Majestic"}, {"Buccaneer"}, {"Shamal"}, {"Hydra"}, {"FCR-900"},
    {"NRG-500"}, {"HPV1000"}, {"Cement Truck"}, {"Tow Truck"}, {"Fortune"}, {"Cadrona"}, {"FBI Truck"},
    {"Willard"}, {"Forklift"}, {"Tractor"}, {"Combine"}, {"Feltzer"}, {"Remington"}, {"Slamvan"},
    {"Blade"}, {"Freight"}, {"Streak"}, {"Vortex"}, {"Vincent"}, {"Bullet"}, {"Clover"}, {"Sadler"},
    {"Firetruck LA"}, {"Hustler"}, {"Intruder"}, {"Primo"}, {"Cargobob"}, {"Tampa"}, {"Sunrise"}, {"Merit"},
    {"Utility"}, {"Nevada"}, {"Yosemite"}, {"Windsor"}, {"Monster A"}, {"Monster B"}, {"Uranus"}, {"Jester"},
    {"Sultan"}, {"Stratum"}, {"Elegy"}, {"Raindance"}, {"RC Tiger"}, {"Flash"}, {"Tahoma"}, {"Savanna"},
    {"Bandito"}, {"Freight Flat"}, {"Streak Carriage"}, {"Kart"}, {"Mower"}, {"Duneride"}, {"Sweeper"},
    {"Broadway"}, {"Tornado"}, {"AT-400"}, {"DFT-30"}, {"Huntley"}, {"Stafford"}, {"BF-400"}, {"Newsvan"},
    {"Tug"}, {"Trailer 3"}, {"Emperor"}, {"Wayfarer"}, {"Euros"}, {"Hotdog"}, {"Club"}, {"Freight Carriage"},
    {"Trailer 3"}, {"Andromada"}, {"Dodo"}, {"RC Cam"}, {"Launch"}, {"Police Car (LSPD)"}, {"Police Car (SFPD)"},
    {"Police Car (LVPD)"}, {"Police Ranger"}, {"Picador"}, {"S.W.A.T. Van"}, {"Alpha"}, {"Phoenix"}, {"Glendale"},
    {"Sadler"}, {"Luggage Trailer A"}, {"Luggage Trailer B"}, {"Stair Trailer"}, {"Boxville"}, {"Farm Plow"},
    {"Utility Trailer"}
};

hook OnPlayerConnect(playerid)
{
    Speedometer[playerid][0] = CreatePlayerTextDraw(playerid, 400.000000, 279.000000, "BUFFALO");
    PlayerTextDrawFont(playerid, Speedometer[playerid][0], 2);
    PlayerTextDrawLetterSize(playerid, Speedometer[playerid][0], 0.337500, 1.500000);
    PlayerTextDrawTextSize(playerid, Speedometer[playerid][0], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, Speedometer[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Speedometer[playerid][0], 1);
    PlayerTextDrawAlignment(playerid, Speedometer[playerid][0], 1);
    PlayerTextDrawColor(playerid, Speedometer[playerid][0], 1296911871);
    PlayerTextDrawBackgroundColor(playerid, Speedometer[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, Speedometer[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, Speedometer[playerid][0], 0);
    PlayerTextDrawSetProportional(playerid, Speedometer[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, Speedometer[playerid][0], 0);

    Speedometer[playerid][1] = CreatePlayerTextDraw(playerid, 515.000000, 304.000000, "KM/h: 100");
    PlayerTextDrawFont(playerid, Speedometer[playerid][1], 2);
    PlayerTextDrawLetterSize(playerid, Speedometer[playerid][1], 0.337500, 1.500000);
    PlayerTextDrawTextSize(playerid, Speedometer[playerid][1], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, Speedometer[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, Speedometer[playerid][1], 1);
    PlayerTextDrawAlignment(playerid, Speedometer[playerid][1], 3);
    PlayerTextDrawColor(playerid, Speedometer[playerid][1], -65281);
    PlayerTextDrawBackgroundColor(playerid, Speedometer[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, Speedometer[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, Speedometer[playerid][1], 0);
    PlayerTextDrawSetProportional(playerid, Speedometer[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, Speedometer[playerid][1], 0);

    Speedometer[playerid][2] = CreatePlayerTextDraw(playerid, 450.000000, 212.000000, "Preview_Model");
    PlayerTextDrawFont(playerid, Speedometer[playerid][2], 5);
    PlayerTextDrawLetterSize(playerid, Speedometer[playerid][2], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, Speedometer[playerid][2], 70.500000, 92.500000);
    PlayerTextDrawSetOutline(playerid, Speedometer[playerid][2], 0);
    PlayerTextDrawSetShadow(playerid, Speedometer[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, Speedometer[playerid][2], 1);
    PlayerTextDrawColor(playerid, Speedometer[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, Speedometer[playerid][2], 0);
    PlayerTextDrawBoxColor(playerid, Speedometer[playerid][2], 255);
    PlayerTextDrawUseBox(playerid, Speedometer[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, Speedometer[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, Speedometer[playerid][2], 0);
    PlayerTextDrawSetPreviewModel(playerid, Speedometer[playerid][2], 567);
    PlayerTextDrawSetPreviewRot(playerid, Speedometer[playerid][2], -21.000000, 0.000000, -22.000000, 1.099997);
    PlayerTextDrawSetPreviewVehCol(playerid, Speedometer[playerid][2], 105, 1);

    GasBar[playerid][0] = CreatePlayerProgressBar(playerid, 403.000000, 296.000000, 113.500000, -1.500000, -764862721, 100.000000, 0);
    SetPlayerProgressBarValue(playerid, GasBar[playerid][0], 100.000000);

    return 1;
}

hook OnPlayerStateChange(playerid, newstate, oldstate)
{
    if (oldstate == PLAYER_STATE_ONFOOT && newstate == PLAYER_STATE_DRIVER)
    {

        PlayerTextDrawSetPreviewModel(playerid, Speedometer[playerid][2], GetVehicleModel(GetPlayerVehicleID(playerid)));

        new vehicleName[40];
        format(vehicleName, sizeof(vehicleName), "%s", GetVehicleName(GetPlayerVehicleID(playerid)));
        PlayerTextDrawSetString(playerid, Speedometer[playerid][0], vehicleName);

        new vehicleSpeed[30];
        format(vehicleSpeed, sizeof(vehicleSpeed), "KM/h %d", GetVehicleRoundedVelocity(GetPlayerVehicleID(playerid)));
        PlayerTextDrawSetString(playerid, Speedometer[playerid][1], vehicleSpeed);
        for (new i = 0; i < 3; i++)
        {
            PlayerTextDrawShow(playerid, Speedometer[playerid][i]);
            ShowPlayerProgressBar(playerid, GasBar[playerid][0]);
        }

    }
    else if (oldstate == PLAYER_STATE_DRIVER && newstate == PLAYER_STATE_ONFOOT)
    {
        for (new i = 0; i < 3; i++)
        {
            PlayerTextDrawHide(playerid, Speedometer[playerid][i]);
            HidePlayerProgressBar(playerid, GasBar[playerid][0]);
        }
    }
    SetTimerEx("UpdateSpeedometer", 300, true, "d", playerid);
    SetTimerEx("UpdateVehicleGasoline", 1000, true, "d", playerid);
    return 1;
}

forward UpdateSpeedometer(playerid);
public UpdateSpeedometer(playerid)
{
    new vehicleSpeed[30];
    format(vehicleSpeed, sizeof(vehicleSpeed), "KM/h %d", GetVehicleRoundedVelocity(GetPlayerVehicleID(playerid)));
    PlayerTextDrawSetString(playerid, Speedometer[playerid][1], vehicleSpeed);
    return 1;
}

hook OnPlayerDisconnect(playerid)
{
    for (new i = 0; i < 3; i++)
    {
        PlayerTextDrawDestroy(playerid, Speedometer[playerid][i]);
        DestroyPlayerProgressBar(playerid, GasBar[playerid][0]);
    }
    return 1;
}

stock GetVehicleName(vehicleid)
{
    new vehmodel = GetVehicleModel(vehicleid);
    new vehicleName[75];

    if (vehmodel < 400 || vehmodel > 611)
    {
        strcat(vehicleName, "NONE");
        return vehicleName;
    }
    strcat(vehicleName, VehicleNames[vehmodel - 400]);
    return vehicleName;
}


// random pasted func
stock GetVehicleRoundedVelocity(vehicleid)
{
    new Float:xPos[3];
    GetVehicleVelocity(vehicleid, xPos[0], xPos[1], xPos[2]);
    return floatround(floatsqroot(xPos[0] * xPos[0] + xPos[1] * xPos[1] + xPos[2] * xPos[2]) * 170.00);
}