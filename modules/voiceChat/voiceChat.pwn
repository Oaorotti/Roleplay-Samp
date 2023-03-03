#include <YSI-Includes\YSI_Coding\y_hooks>

new SV_GSTREAM:gstream = SV_NULL;
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };

forward SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid);
public SV_VOID:OnPlayerActivationKeyPress(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x5A && lstream[playerid]) SvAttachSpeakerToStream(lstream[playerid], playerid);
    if (keyid == 0x42 && gstream) SvAttachSpeakerToStream(gstream, playerid);

    return 1;
}

forward SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid);
public SV_VOID:OnPlayerActivationKeyRelease(SV_UINT:playerid, SV_UINT:keyid)
{
    if (keyid == 0x5A && lstream[playerid]) SvDetachSpeakerFromStream(lstream[playerid], playerid);
    if (keyid == 0x42 && gstream) SvDetachSpeakerFromStream(gstream, playerid);

    return 1;
}

hook OnPlayerConnect(playerid)
{
    if (SvGetVersion(playerid) == SV_NULL)
    {
        SendClientMessage(playerid, -1, "O SampVoice é necessario para melhorar sua experiencia no servidor.");
    }
    else if (SvHasMicro(playerid) == SV_FALSE)
    {
        SendClientMessage(playerid, -1, "The microphone could not be found.");
    }
    else if ((lstream[playerid] = SvCreateDLStreamAtPlayer(10.0, SV_INFINITY, playerid, 0xff0000ff, "Local")))
    {
        SendClientMessage(playerid, -1, "Pressione Z para falar no Microfone!");

        if (gstream) SvAttachListenerToStream(gstream, playerid);

        SvAddKey(playerid, 0x5A);
    }
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }

    return 1;
}

hook OnGameModeInit()
{
    //SvDebug(SV_TRUE);

    gstream = SvCreateGStream(0xffff0000, "Global");

    return 1;
}

hook OnGameModeExit()
{
    if (gstream) SvDeleteStream(gstream);
    return 1;
}