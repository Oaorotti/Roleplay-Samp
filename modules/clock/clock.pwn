#include <YSI-Includes\YSI_Coding\y_hooks>

new Text:PublicTD[1];
new Text:clock;
new Text:bottomBox;

forward CreateClock();
public CreateClock()
{
    clock = TextDrawCreate(330.000000, 426.000000, "00:00");
    TextDrawFont(clock, 3);
    TextDrawLetterSize(clock, 0.554166, 2.449999);
    TextDrawTextSize(clock, 400.000000, 17.000000);
    TextDrawSetOutline(clock, 2);
    TextDrawSetShadow(clock, 0);
    TextDrawAlignment(clock, 2);
    TextDrawColor(clock, -1);
    TextDrawBackgroundColor(clock, 255);
    TextDrawBoxColor(clock, 50);
    TextDrawUseBox(clock, 0);
    TextDrawSetProportional(clock, 1);
    TextDrawSetSelectable(clock, 0);

    bottomBox = TextDrawCreate(330.000000, 433.000000, "_");
    TextDrawFont(bottomBox, 1);
    TextDrawLetterSize(bottomBox, 0.600000, 10.300003);
    TextDrawTextSize(bottomBox, 296.500000, 661.500000);
    TextDrawSetOutline(bottomBox, 1);
    TextDrawSetShadow(bottomBox, 0);
    TextDrawAlignment(bottomBox, 2);
    TextDrawColor(bottomBox, -1);
    TextDrawBackgroundColor(bottomBox, 255);
    TextDrawBoxColor(bottomBox, 135);
    TextDrawUseBox(bottomBox, 1);
    TextDrawSetProportional(bottomBox, 1);
    TextDrawSetSelectable(bottomBox, 0);

    PublicTD[0] = TextDrawCreate(29.000000, 436.000000, "00.00.0000");
    TextDrawFont(PublicTD[0], 3);
    TextDrawLetterSize(PublicTD[0], 0.266665, 1.299998);
    TextDrawTextSize(PublicTD[0], 400.000000, 17.000000);
    TextDrawSetOutline(PublicTD[0], 2);
    TextDrawSetShadow(PublicTD[0], 0);
    TextDrawAlignment(PublicTD[0], 2);
    TextDrawColor(PublicTD[0], -1);
    TextDrawBackgroundColor(PublicTD[0], 255);
    TextDrawBoxColor(PublicTD[0], 50);
    TextDrawUseBox(PublicTD[0], 0);
    TextDrawSetProportional(PublicTD[0], 1);
    TextDrawSetSelectable(PublicTD[0], 0);

    SetTimer("ProcessGameTime", 1000, true);

    return 1;
}

hook OnGameModeInit(playerid)
{
    CreateClock();
    return 1;
}
hook OnPlayerSpawn(playerid)
{
    TextDrawShowForAll(PublicTD[0]);
    TextDrawShowForAll(clock);
    TextDrawShowForAll(bottomBox);
    return 1;
}


hook OnPlayerDisconnect(playerid)
{
    TextDrawDestroy(PublicTD[0]);
    TextDrawDestroy(clock);
    TextDrawDestroy(bottomBox);
    return 1;
}

forward ProcessGameTime();
public ProcessGameTime()
{
    new year, months, days, hours, minutes, seconds, string[128], string2[128];
    gettime(hours, minutes, seconds);
    getdate(year, months, days);
    format(string, sizeof(string), "%02d/%02d/%d", days, months, year);
    TextDrawSetString(PublicTD[0], string);
    format(string2, sizeof(string2), "%02d:%02d", hours, minutes);
    TextDrawSetString(clock, string2);
    return 1;
}