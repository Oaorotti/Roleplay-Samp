#include <YSI-Includes\YSI_Coding\y_hooks>

#pragma warning disable 213

new PlayerText:backBox[MAX_PLAYERS];
new PlayerText:playerMoney[MAX_PLAYERS];
new PlayerText:playerArmour[MAX_PLAYERS];
new PlayerText:playerChar[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    backBox[playerid] = CreatePlayerTextDraw(playerid, 577.000000, 6.000000, "_");
    PlayerTextDrawFont(playerid, backBox[playerid], 1);
    PlayerTextDrawLetterSize(playerid, backBox[playerid], 0.600000, 10.300003);
    PlayerTextDrawTextSize(playerid, backBox[playerid], 300.500000, 84.500000);
    PlayerTextDrawSetOutline(playerid, backBox[playerid], 1);
    PlayerTextDrawSetShadow(playerid, backBox[playerid], 0);
    PlayerTextDrawAlignment(playerid, backBox[playerid], 2);
    PlayerTextDrawColour(playerid, backBox[playerid], -1);
    PlayerTextDrawBackgroundColour(playerid, backBox[playerid], 255);
    PlayerTextDrawBoxColour(playerid, backBox[playerid], 1296911871);
    PlayerTextDrawUseBox(playerid, backBox[playerid], 1);
    PlayerTextDrawSetProportional(playerid, backBox[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, backBox[playerid], 0);

    playerMoney[playerid] = CreatePlayerTextDraw(playerid, 549.000000, 76.000000, "$00000000");
    PlayerTextDrawFont(playerid, playerMoney[playerid], 3);
    PlayerTextDrawLetterSize(playerid, playerMoney[playerid], 0.279166, 1.399999);
    PlayerTextDrawTextSize(playerid, playerMoney[playerid], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, playerMoney[playerid], 2);
    PlayerTextDrawSetShadow(playerid, playerMoney[playerid], 0);
    PlayerTextDrawAlignment(playerid, playerMoney[playerid], 1);
    PlayerTextDrawColour(playerid, playerMoney[playerid], -1061109505);
    PlayerTextDrawBackgroundColour(playerid, playerMoney[playerid], 255);
    PlayerTextDrawBoxColour(playerid, playerMoney[playerid], 50);
    PlayerTextDrawUseBox(playerid, playerMoney[playerid], 0);
    PlayerTextDrawSetProportional(playerid, playerMoney[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, playerMoney[playerid], 0);

    playerArmour[playerid] = CreatePlayerTextDraw(playerid, 578.000000, 57.000000, "100");
    PlayerTextDrawFont(playerid, playerArmour[playerid], 2);
    PlayerTextDrawLetterSize(playerid, playerArmour[playerid], 0.241666, 0.899999);
    PlayerTextDrawTextSize(playerid, playerArmour[playerid], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, playerArmour[playerid], 1);
    PlayerTextDrawSetShadow(playerid, playerArmour[playerid], 0);
    PlayerTextDrawAlignment(playerid, playerArmour[playerid], 2);
    PlayerTextDrawColour(playerid, playerArmour[playerid], -1);
    PlayerTextDrawBackgroundColour(playerid, playerArmour[playerid], 255);
    PlayerTextDrawBoxColour(playerid, playerArmour[playerid], 50);
    PlayerTextDrawUseBox(playerid, playerArmour[playerid], 0);
    PlayerTextDrawSetProportional(playerid, playerArmour[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, playerArmour[playerid], 0);

    playerChar[playerid] = CreatePlayerTextDraw(playerid, 552.000000, 8.000000, "Preview_Model");
    PlayerTextDrawFont(playerid, playerChar[playerid], 5);
    PlayerTextDrawLetterSize(playerid, playerChar[playerid], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, playerChar[playerid], 50.000000, 43.000000);
    PlayerTextDrawSetOutline(playerid, playerChar[playerid], 0);
    PlayerTextDrawSetShadow(playerid, playerChar[playerid], 0);
    PlayerTextDrawAlignment(playerid, playerChar[playerid], 1);
    PlayerTextDrawColour(playerid, playerChar[playerid], -1);
    PlayerTextDrawBackgroundColour(playerid, playerChar[playerid], 1296911871);
    PlayerTextDrawBoxColour(playerid, playerChar[playerid], 1296911871);
    PlayerTextDrawUseBox(playerid, playerChar[playerid], 0);
    PlayerTextDrawSetProportional(playerid, playerChar[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, playerChar[playerid], 0);
    PlayerTextDrawSetPreviewModel(playerid, playerChar[playerid], 24);
    PlayerTextDrawSetPreviewRot(playerid, playerChar[playerid], -10.000000, 0.000000, -20.000000, 1.000000);
    PlayerTextDrawSetPreviewVehicleColours(playerid, playerChar[playerid], 1, 1);

    return 1;
}

hook OnPlayerSpawn(playerid)
{
    PlayerTextDrawShow(playerid, backBox[playerid]);
    PlayerTextDrawShow(playerid, playerMoney[playerid]);
    PlayerTextDrawShow(playerid, playerArmour[playerid]);
    PlayerTextDrawShow(playerid, playerChar[playerid]);

    PlayerTextDrawSetPreviewModel(playerid, playerChar[playerid], GetPlayerSkin(playerid));

    SetTimerEx("SetPlayerArmor", 500, true, "d", playerid);
    SetTimerEx("SetPlayerCurrentMoney", 500, true, "d", playerid);
    SetTimerEx("SetPlayerSkinHud", 60000, true, "d", playerid);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid, backBox[playerid]);
    PlayerTextDrawDestroy(playerid, playerMoney[playerid]);
    PlayerTextDrawDestroy(playerid, playerArmour[playerid]);
    PlayerTextDrawDestroy(playerid, playerChar[playerid]);
    return 1;
}

forward SetPlayerSkinHud(playerid);
public SetPlayerSkinHud(playerid)
{
    PlayerTextDrawSetPreviewModel(playerid, playerChar[playerid], GetPlayerSkin(playerid));
    PlayerTextDrawShow(playerid, playerChar[playerid]);
    return 1;
}

forward SetPlayerCurrentMoney(playerid);
public SetPlayerCurrentMoney(playerid)
{
    new currentMoney[40];

    format(currentMoney, sizeof(currentMoney), "%i", GetPlayerMoney(playerid));
    PlayerTextDrawSetString(playerid, playerMoney[playerid], currentMoney);

    return 1;
}

forward SetPlayerArmor(playerid);
public SetPlayerArmor(playerid)
{
    new currentArmor[40];
    new Float:dummyMelo;
    GetPlayerArmour(playerid, dummyMelo);
    format(currentArmor, sizeof(currentArmor), "%0.f", dummyMelo);

    PlayerTextDrawSetString(playerid, playerArmour[playerid], currentArmor);

    return 1;
}
