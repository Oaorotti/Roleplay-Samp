#include <YSI-Includes\YSI_Coding\y_hooks>
#include <sscanf2>
#include <Pawn.Cmd>

#define     COR_ME                  0xC2A2DAFF
#define     COR_B                   0xAFAFAFFF
#define     AMARELO                 0xFFF01FFF
#define     COR_PM                  0xF7F62CFF
#define     VERDE_ESCURO            0x018217FF
#define     COR_ANUNCIO             0x3CA03EFF
#define     VERMELHO                0xFF4A4AFF
#define     AZUL                    0x3C4EEFF
#define     ROXO                    0x333399FF
#define     COR_PELE                0xFFBF70FF
#define     COLOR_BITEM             0xE1B0B0FF
#define     COLOR_GRAD1             0xB4B5B7FF
#define     COLOR_GRAD2             0xBFC0C2FF
#define     COLOR_GRAD3             0xCBCCCEFF
#define     COLOR_GRAD4             0xD8D8D8FF
#define     COLOR_GRAD5             0xE3E3E3FF
#define     COLOR_GRAD6             0xF0F0F0FF
#define     COLOR_GREY              0xAFAFAFAA
#define     COLOR_GREEN             0x33AA33AA
#define     COLOR_RED                 0xFF4A4AFF
#define     COLOR_BLACK             0x000001FF
#define     COLOR_BLUE              0x007BD0FF
#define     COLOR_LIGHTORANGE       0xFFA100FF
#define     COLOR_FLASH             0xFF000080
#define     COLOR_LIGHTRED          0xFF6347AA
#define     COLOR_LIGHTBLUE         0x33CCFFAA
#define     COLOR_LIGHTGREEN        0x9ACD32AA
#define     COLOR_YELLOW            0xFFFF00AA
#define     COLOR_LIGHTYELLOW       0xFFFF91FF
#define     COLOR_YELLOW2           0xF5DEB3AA
#define     COLOR_WHITE             0xFFFFFFAA
#define     COLOR_FADE1             0xE6E6E6E6
#define     COLOR_FADE2             0xC8C8C8C8
#define     COLOR_FADE3             0xAAAAAAAA
#define     COLOR_FADE4             0x8C8C8C8C
#define     COLOR_FADE5             0x6E6E6E6E
#define     COLOR_PURPLE            0xC2A2DAAA
#define     COLOR_DBLUE             0x2641FEAA
#define     COLOR_DOC               0xFF8282AA
#define     COLOR_DCHAT             0xF0CC00FF
#define     COLOR_NEWS              0xFFA500AA
#define     COLOR_OOC               0xE0FFFFAA
#define     TEAM_BLUE_COLOR         0x8D8DFF00
#define     TEAM_GROVE_COLOR        0x00AA00FF
#define     TEAM_AZTECAS_COLOR      0x01FCFFC8
#define     NEWBIE_COLOR            0x7DAEFFFF
#define     SAMP_COLOR              0xAAC4E5FF

#define     EMBED_GREEN             "{1EFF00}"
#define     EMBED_RED                 "{FF0000}"
#define     EMBED_WHITE             "{FFFFFF}"
#define     EMBED_LIGHT_GREEN         "{50FF50}"
#define     EMBED_LIGHT_RED         "{FF5050}"

new Text3D:PlayerIDName[MAX_PLAYERS];

CMD:me(playerid, params[])
{
    if (isnull(params)) return SendClientMessage(playerid, VERMELHO, "{FF4A4A}USE:{FFFFFF} /me [acao] de forma certa!");
    new string[128];
    format(string, sizeof(string), "* %s %s", GetPlayerNameEx(playerid), params);
    ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    return 1;
}

CMD:gritar(playerid, params[])
{
    new string[128];
    if (isnull(params)) return SendClientMessage(playerid, VERMELHO, "{FF4A4A}USE:{FFFFFF} /gritar [grito] de forma certa!");
    format(string, sizeof(string), "%s grita: %s!", GetPlayerNameEx(playerid), params);
    ProxDetector(30.0, playerid, string, COLOR_WHITE, COLOR_WHITE, COLOR_WHITE, COLOR_FADE1, COLOR_FADE2);
    return 1;
}

CMD:do(playerid, params[])
{
    if (isnull(params)) return SendClientMessage(playerid, VERMELHO, "{FF4A4A}USE:{FFFFFF} /do [ambiente] de forma certa!");
    new string[128];
    format(string, sizeof(string), "* %s (( %s ))", params, GetPlayerNameEx(playerid));
    ProxDetector(20.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    return 1;
}

CMD:b(playerid, params[])
{
    new text[128], string[128];
    if (sscanf(params, "s[128]", text)) return SendClientMessage(playerid, VERMELHO, "{FF4A4A}USE:{FFFFFF} /b [descrever] de forma certa!");
    format(string, sizeof(string), "(( [%d] %s: %s ))", playerid, GetPlayerNameEx(playerid), text);
    ProxDetector(10.0, playerid, string, 0xB3B3B3FF, 0xB3B3B3FF, 0xB3B3B3FF, 0xB3B3B3FF, 0xB3B3B3FF);
    return 1;
}

CMD:pm(playerid, params[])
{
    new str[128], text[128], targetid;
    if (sscanf(params, "us[128]", targetid, text)) return SendClientMessage(playerid, VERMELHO, "{FF4A4A}USE:{FFFFFF} /pm [player] [texto] de forma certa!");
    if (!IsPlayerConnected(targetid)) return SendClientMessage(playerid, VERMELHO, "{018217}SERVER:{FFFFFF} O jogador nao esta conectado!");
    format(str, sizeof(str), "PM para %s (%d): %s", GetPlayerNameEx(targetid), targetid, text);
    SendClientMessage(playerid, 0xE0E800FF, str);
    format(str, sizeof(str), "PM de %s (%d): %s", GetPlayerNameEx(playerid), playerid, text);
    SendClientMessage(targetid, 0xE8C900FF, str);
    return 1;
}

hook OnPlayerText(playerid, text[])
{
    new localText[256];

    new Float:X, Float:Y, Float:Z;

    GetPlayerPos(playerid, X, Y, Z);

    SetPlayerChatBubble(playerid, text, -1, 7.0, 1000);
    format(localText, sizeof(localText), "%s[%d] diz: %s", GetPlayerNameEx(playerid), playerid, text);
    ProxDetector(10.0, playerid, localText, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF);

    return 0;
}


forward ProxDetector(Float:radi, playerid, string[], col1, col2, col3, col4, col5);
public ProxDetector(Float:radi, playerid, string[], col1, col2, col3, col4, col5)
{
    if (IsPlayerConnected(playerid))
    {
        new Float:posx, Float:posy, Float:posz;
        new Float:oldposx, Float:oldposy, Float:oldposz;
        new Float:tempposx, Float:tempposy, Float:tempposz;
        GetPlayerPos(playerid, oldposx, oldposy, oldposz);
        for (new i = 0; i < MAX_PLAYERS; i++)
        {
            if (IsPlayerConnected(i) && (GetPlayerVirtualWorld(playerid) == GetPlayerVirtualWorld(i)))
            {
                GetPlayerPos(i, posx, posy, posz);
                tempposx = (oldposx - posx);
                tempposy = (oldposy - posy);
                tempposz = (oldposz - posz);
                if (((tempposx < radi / 16) && (tempposx > -radi / 16)) && ((tempposy < radi / 16) && (tempposy > -radi / 16)) && ((tempposz < radi / 16) && (tempposz > -radi / 16)))
                {
                    SendClientMessage(i, col1, string);
                }
                else if (((tempposx < radi / 8) && (tempposx > -radi / 8)) && ((tempposy < radi / 8) && (tempposy > -radi / 8)) && ((tempposz < radi / 8) && (tempposz > -radi / 8)))
                {
                    SendClientMessage(i, col2, string);
                }
                else if (((tempposx < radi / 4) && (tempposx > -radi / 4)) && ((tempposy < radi / 4) && (tempposy > -radi / 4)) && ((tempposz < radi / 4) && (tempposz > -radi / 4)))
                {
                    SendClientMessage(i, col3, string);
                }
                else if (((tempposx < radi / 2) && (tempposx > -radi / 2)) && ((tempposy < radi / 2) && (tempposy > -radi / 2)) && ((tempposz < radi / 2) && (tempposz > -radi / 2)))
                {
                    SendClientMessage(i, col4, string);
                }
                else if (((tempposx < radi) && (tempposx > -radi)) && ((tempposy < radi) && (tempposy > -radi)) && ((tempposz < radi) && (tempposz > -radi)))
                {
                    SendClientMessage(i, col5, string);
                }
            }
            else
            {
                SendClientMessage(i, col1, string);
            }
        }
    }
    return 1;
}

hook OnPlayerConnect(playerid)
{
    new str[1000];
    format(str, sizeof(str), "ID: [%d]", playerid);
    PlayerIDName[playerid] = Create3DTextLabel(str, 0xFFFFFFFF, 0, 0, 0, 10, 0);
    Attach3DTextLabelToPlayer(PlayerIDName[playerid], playerid, 0.0, 0.0, 0.1);
    return 1;
}

hook OnPlayerDisconnect(playerid, reason)
{
    Delete3DTextLabel(PlayerIDName[playerid]);
    return 1;
}