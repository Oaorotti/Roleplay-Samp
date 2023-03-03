#define FILTERSCRIPT
#include <open.mp>

#if defined FILTERSCRIPT

new SomCarid[MAX_PLAYERS];
new Musica[MAX_PLAYERS];
new vMusica[MAX_PLAYERS];
new VSomVeiculo[MAX_PLAYERS];


public OnFilterScriptInit()
{
    for (new i = 0; i < MAX_PLAYERS; i++)
    {
        VSomVeiculo[i] = SetTimerEx("ReceberSomVeiculo", 5000, true, "i", i);
    }
    return 1;
}

public OnFilterScriptExit()
{
    return 1;
}

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    vMusica[playerid] = 0;
    Musica[playerid] = 0;
    KillTimer(VSomVeiculo[playerid]);
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    if (strcmp(cmdtext, "/radio1", true) == 0)
    {
        if (IsPlayerInAnyVehicle(playerid))
        {
            Musica[playerid] = 1;
            vMusica[playerid] = 0;
        }
        else
        {
            SendClientMessage(playerid, 0xFFFF59AA, "| INFO | Você não esta em um veiculo !");
        }
        return 1;
    }

    if (strcmp(cmdtext, "/radio2", true) == 0)
    {
        if (IsPlayerInAnyVehicle(playerid))
        {
            Musica[playerid] = 2;
            vMusica[playerid] = 0;
        }
        else
        {
            SendClientMessage(playerid, 0xFFFF59AA, "| INFO | Você não esta em um veiculo !");
        }
        return 1;
    }
    return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    return 1;
}

forward ReceberSomVeiculo(playerid);
public ReceberSomVeiculo(playerid)
{
    EnviarSomVeiculo(playerid);
    new Float:X, Float:Y, Float:Z;
    GetVehiclePos(SomCarid[playerid], X, Y, Z);
    if (IsPlayerInRangeOfPoint(playerid, 15.0, X, Y, Z))
    {
        if (Musica[playerid] == 1)
        {
            if (vMusica[playerid] == 0)
            {
                PlayAudioStreamForPlayer(playerid, "http://live.hunterfm.com/live"); // URL 1 /Radio1
                vMusica[playerid] = 1;
            }
        }
        if (Musica[playerid] == 2)
        {
            if (vMusica[playerid] == 0)
            {
                PlayAudioStreamForPlayer(playerid, "URL");// URL 2 /Radio2
                vMusica[playerid] = 1;
            }
        }
    }
    else
    {
        if (vMusica[playerid] == 1)
        {
            StopAudioStreamForPlayer(playerid);
            Musica[playerid] = 0;
            vMusica[playerid] = 0;
        }
    }
}

forward EnviarSomVeiculo(playerid);
public EnviarSomVeiculo(playerid)
{
    if (IsPlayerInAnyVehicle(playerid))
    {
        new IdCar, id = -1;
        IdCar = GetPlayerVehicleID(playerid);
        for (new i = 0; i < MAX_PLAYERS; i++)
        {
            if (GetDistanceBetweenPlayers(playerid, i) < 15)
            {
                id = i;
                if (Musica[playerid] == 2)
                {
                    Musica[id] = 2;
                }
                if (Musica[playerid] == 1)
                {
                    Musica[id] = 1;
                }
                SomCarid[id] = IdCar;
                if (vMusica[playerid] == 0)
                {
                    vMusica[id] = 0;
                }
            }
        }
    }
}
stock GetDistanceBetweenPlayers(playerid, playerid2)
{
    new Float:x1, Float:y1, Float:z1, Float:x2, Float:y2, Float:z2;
    new Float:dis;
    GetPlayerPos(playerid, x1, y1, z1);
    GetPlayerPos(playerid2, x2, y2, z2);
    dis = floatsqroot(floatpower(floatabs(floatsub(x2, x1)), 2) + floatpower(floatabs(floatsub(y2, y1)), 2) + floatpower(floatabs(floatsub(z2, z1)), 2));
    return floatround(dis);
}
#endif