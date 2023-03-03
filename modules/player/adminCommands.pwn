#include <YSI-Includes\YSI_Coding\y_hooks>

CMD:spawncar(playerid, params[])
{
    if (!IsPlayerAdmin(playerid)) return 0;
    new float:pos[4];
    new id;

    if (sscanf(params, "d", id))
    {
        return SendClientMessage(playerid, -1, "/spawncar id");
    }

    GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
    GetPlayerFacingAngle(playerid, pos[3]);
    CreateVehicle(id, pos[0], pos[1], pos[2], pos[3], -1, -1, -1, 0);
    SendClientMessage(playerid, -1, "Veiculo criado com sucesso, id: %i", id);
    return 1;
}

CMD:setarmour(playerid, params[])
{
    if (!IsPlayerAdmin(playerid)) return 0;

    new Float:armorValue;

    if (sscanf(params, "%.f", armorValue))
    {
        return SendClientMessage(playerid, -1, "/setarmour value");
    }

    SendClientMessage(playerid, -1, "%f", armorValue);
    SetPlayerArmour(playerid, armorValue);

    return 1;
}

CMD:giveweapon(playerid, params[])
{
    if (!IsPlayerAdmin(playerid)) return 0;

    new weaponID;

    if (sscanf(params, "d", weaponID))
    {
        return SendClientMessage(playerid, -1, "/giveweapon id");
    }

    GivePlayerWeapon(playerid, weaponID, 1000);
    return 1;
}