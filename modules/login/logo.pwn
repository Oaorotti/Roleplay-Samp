#include <YSI-Includes\YSI_Coding\y_hooks>

new PlayerText:Logo[MAX_PLAYERS][1];

hook OnPlayerConnect(playerid)
{
    Logo[playerid][0] = CreatePlayerTextDraw(playerid, 330.000000, 8.000000, "Essential Roleplay");
    PlayerTextDrawFont(playerid, Logo[playerid][0], 0);
    PlayerTextDrawLetterSize(playerid, Logo[playerid][0], 0.358333, 1.500000);
    PlayerTextDrawTextSize(playerid, Logo[playerid][0], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, Logo[playerid][0], 1);
    PlayerTextDrawSetShadow(playerid, Logo[playerid][0], 1);
    PlayerTextDrawAlignment(playerid, Logo[playerid][0], 2);
    PlayerTextDrawColor(playerid, Logo[playerid][0], -1);
    PlayerTextDrawBackgroundColor(playerid, Logo[playerid][0], 107);
    PlayerTextDrawBoxColor(playerid, Logo[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, Logo[playerid][0], 0);
    PlayerTextDrawSetProportional(playerid, Logo[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, Logo[playerid][0], 0);
    return 1;
}

hook OnPlayerSpawn(playerid)
{
    PlayerTextDrawShow(playerid, Logo[playerid][0]);
    return 1;
}
hook OnPlayerDisconnect(playerid, reason)
{
    PlayerTextDrawDestroy(playerid, Logo[playerid][0]);
    return 1;
}