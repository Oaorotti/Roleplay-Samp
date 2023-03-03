#include <YSI-Includes\YSI_Coding\y_hooks>
hook OnPlayerPrepareDeath(playerid, animlib[32], animname[32], &anim_lock, &respawn_time)
{
    Player[playerid][pDead] = true;
    return 1;
}


hook OnPlayerDeathFinished(playerid)
{
    if (Player[playerid][pDead] == true)
    {
        new Float:pos[3];
        GetPlayerPos(playerid, pos[0], pos[1], pos[2]);
        SetPlayerPos(playerid, pos[0], pos[1], pos[2]);
        ApplyAnimation(playerid, "CRACK", "CRCKIDLE2", 4.0, 1, 0, 0, 0, 0, 1);
        SendClientMessage(playerid, 0xFF0000, "Você está sangrando aguarde o socorro chegar!");
        Notificacao(playerid, "FERIDO", "AGUARDE O SOCORRO, OU USE /ACEITARMORTE");
    }

    return 1;
}