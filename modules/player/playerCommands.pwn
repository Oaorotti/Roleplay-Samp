#include <YSI-Includes\YSI_Coding\y_hooks>

CMD:rg(playerid, params[])
{
    new rg[256];
    new string[128];

    format(string, sizeof(string), "* %s abre sua carteira e confere seu RG.", GetPlayerNameEx(playerid));
    format(rg, sizeof(rg), "NOME: %s\nLevel: 100\nKills: %s", GetPlayerMoney(playerid), GetPlayerScore(playerid));

    ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
    ShowPlayerDialog(playerid, 3, DIALOG_STYLE_MSGBOX, "REGISTRO DO CIDADAO", rg, "OK", "");

    return 1;
}