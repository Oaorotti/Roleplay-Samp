#include <YSI-Includes\YSI_Coding\y_hooks>
#include <YSI-Includes\YSI_Coding\y_timers>

new PlayerText:HungerSystem[MAX_PLAYERS][4];
new FoodValue[MAX_PLAYERS];
new ThirstValue[MAX_PLAYERS];

hook OnPlayerConnect(playerid)
{
    HungerSystem[playerid][0] = CreatePlayerTextDraw(playerid, 532.000000, 431.000000, "HUD:radar_burgershot");
    PlayerTextDrawFont(playerid, HungerSystem[playerid][0], 4);
    PlayerTextDrawLetterSize(playerid, HungerSystem[playerid][0], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, HungerSystem[playerid][0], 17.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, HungerSystem[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, HungerSystem[playerid][0], 0);
    PlayerTextDrawAlignment(playerid, HungerSystem[playerid][0], 1);
    PlayerTextDrawColor(playerid, HungerSystem[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, HungerSystem[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, HungerSystem[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, HungerSystem[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, HungerSystem[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, HungerSystem[playerid][0], 0);

    HungerSystem[playerid][1] = CreatePlayerTextDraw(playerid, 554.000000, 430.000000, "HUD:radar_diner");
    PlayerTextDrawFont(playerid, HungerSystem[playerid][1], 4);
    PlayerTextDrawLetterSize(playerid, HungerSystem[playerid][1], 0.600000, 2.000000);
    PlayerTextDrawTextSize(playerid, HungerSystem[playerid][1], 17.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, HungerSystem[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, HungerSystem[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, HungerSystem[playerid][1], 1);
    PlayerTextDrawColor(playerid, HungerSystem[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, HungerSystem[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, HungerSystem[playerid][1], 50);
    PlayerTextDrawUseBox(playerid, HungerSystem[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, HungerSystem[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, HungerSystem[playerid][1], 0);

    HungerSystem[playerid][2] = CreatePlayerTextDraw(playerid, 541.000000, 422.000000, "100%");
    PlayerTextDrawFont(playerid, HungerSystem[playerid][2], 1);
    PlayerTextDrawLetterSize(playerid, HungerSystem[playerid][2], 0.129166, 0.649999);
    PlayerTextDrawTextSize(playerid, HungerSystem[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, HungerSystem[playerid][2], 1);
    PlayerTextDrawSetShadow(playerid, HungerSystem[playerid][2], 0);
    PlayerTextDrawAlignment(playerid, HungerSystem[playerid][2], 2);
    PlayerTextDrawColor(playerid, HungerSystem[playerid][2], -1);
    PlayerTextDrawBackgroundColor(playerid, HungerSystem[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, HungerSystem[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, HungerSystem[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, HungerSystem[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, HungerSystem[playerid][2], 0);

    HungerSystem[playerid][3] = CreatePlayerTextDraw(playerid, 562.000000, 422.000000, "100%");
    PlayerTextDrawFont(playerid, HungerSystem[playerid][3], 1);
    PlayerTextDrawLetterSize(playerid, HungerSystem[playerid][3], 0.129166, 0.649999);
    PlayerTextDrawTextSize(playerid, HungerSystem[playerid][3], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, HungerSystem[playerid][3], 1);
    PlayerTextDrawSetShadow(playerid, HungerSystem[playerid][3], 0);
    PlayerTextDrawAlignment(playerid, HungerSystem[playerid][3], 2);
    PlayerTextDrawColor(playerid, HungerSystem[playerid][3], -1);
    PlayerTextDrawBackgroundColor(playerid, HungerSystem[playerid][3], 255);
    PlayerTextDrawBoxColor(playerid, HungerSystem[playerid][3], 50);
    PlayerTextDrawUseBox(playerid, HungerSystem[playerid][3], 0);
    PlayerTextDrawSetProportional(playerid, HungerSystem[playerid][3], 1);
    PlayerTextDrawSetSelectable(playerid, HungerSystem[playerid][3], 0);

    return 1;
}

hook OnPlayerSpawn(playerid)
{
    PlayerTextDrawShow(playerid, HungerSystem[playerid][0]);
    PlayerTextDrawShow(playerid, HungerSystem[playerid][1]);
    PlayerTextDrawShow(playerid, HungerSystem[playerid][2]);
    PlayerTextDrawShow(playerid, HungerSystem[playerid][3]);

    FoodValue[playerid] = 100;
    ThirstValue[playerid] = 100;

    SetTimerEx("UpdateFood", 300000, true, "i", playerid);
    SetTimerEx("UpdateThirst", 300000, true, "i", playerid);

    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid, HungerSystem[playerid][0]);
    PlayerTextDrawDestroy(playerid, HungerSystem[playerid][1]);
    PlayerTextDrawDestroy(playerid, HungerSystem[playerid][2]);
    PlayerTextDrawDestroy(playerid, HungerSystem[playerid][3]);
    return 1;
}

stock CheckThirst(playerid)
{
    if (ThirstValue[playerid] <= 0)
    {
        SetPlayerHealth(playerid, 0);
    }
    return 1;
}

stock CheckFood(playerid)
{
    if (FoodValue[playerid] <= 0)
    {
        SetPlayerHealth(playerid, 0);
    }
    return 1;
}

forward UpdateThirst(playerid);
public UpdateThirst(playerid)
{
    ThirstValue[playerid] -= 1;
    new thirstString[100];
    format(thirstString, sizeof(thirstString), "%d", ThirstValue[playerid]);
    PlayerTextDrawSetString(playerid, HungerSystem[playerid][3], thirstString);
    PlayerTextDrawShow(playerid, HungerSystem[playerid][3]);

    CheckThirst(playerid);
    return 1;
}

forward UpdateFood(playerid);
public UpdateFood(playerid)
{
    FoodValue[playerid] -= 1;
    new foodString[100];
    format(foodString, sizeof(foodString), "%d", FoodValue[playerid]);
    PlayerTextDrawSetString(playerid, HungerSystem[playerid][2], foodString);
    PlayerTextDrawShow(playerid, HungerSystem[playerid][2]);

    CheckFood(playerid);
    return 1;
}