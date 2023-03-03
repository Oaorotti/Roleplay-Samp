#include <YSI-Includes\YSI_Coding\y_hooks>
#include <a_mysql>

#define HOST "localhost"
#define PASSWORD ""
#define USER "root"
#define DATABASE "roleplay"

#define DIALOG_LOGIN 1
#define DIALOG_REGISTER 2

#pragma warning disable 219
#pragma warning disable 234
#pragma warning disable 213

enum PlayerInfos
{
    pID,
    pPassword[24],
    pMoney,
    pScore,
    pSkin,

    Float:pPosX,
    Float:pPosY,
    Float:pPosZ,
    Float:pAngles,
    bool:pAdmin,
    bool:pLoggedIn,
    bool:pDead
};

new Query[512];

new Player[MAX_PLAYERS][PlayerInfos];

new MySQL:DBConnection;

new PlayerText:PlayerTD[MAX_PLAYERS][3];
new PlayerText:loginBox[MAX_PLAYERS];

hook OnGameModeInit(playerid)
{
    DBConnection = mysql_connect(HOST, USER, PASSWORD, DATABASE);

    if (mysql_errno(DBConnection) != 0)
    {
        printf("[MySQL] Falha ao conectar ao banco de dados.");
    }
    else
    {
        mysql_query(DBConnection, "CREATE TABLE IF NOT EXISTS `players` (\
        `id` int NOT NULL AUTO_INCREMENT,\
        `name` varchar(25) NOT NULL,\
        `password` varchar(255) NOT NULL,\
        `admin` int DEFAULT 0,\
        `skin` int DEFAULT 250,\
        `money` int DEFAULT 1000,\
        `score` int,\
        `posX` float DEFAULT 1722.5123,\
        `posY` float DEFAULT -1912.7931,\
        `posZ` float DEFAULT 13.5647,\
        `angles` float DEFAULT 269.15,\
        PRIMARY KEY(id));", false);
        printf("[MySQL] Conectado ao banco de dados.");
    }

    return 1;
}

forward onPasswordHashCallback(playerid);
public onPasswordHashCallback(playerid)
{
    new hashDst[BCRYPT_HASH_LENGTH];
    bcrypt_get_hash(hashDst);

    mysql_format(DBConnection, Query, sizeof(Query), "INSERT INTO `players`(`name`, `password`) VALUES ('%e', '%e')", GetPlayerNameEx(playerid), hashDst);
    mysql_tquery(DBConnection, Query, "InsertSQLData", "i", playerid);
    SendClientMessage(playerid, 0x80FF00AA, "[Server] Registrado com sucesso.");
    Notificacao(playerid, "CONECTADO", "Você se registrou com sucesso!");

    return 1;
}

forward OnPasswordVerifyCallback(playerid, bool:success);
public OnPasswordVerifyCallback(playerid, bool:success)
{
    if (success)
    {
        mysql_format(DBConnection, Query, sizeof(Query), "SELECT * FROM `players` WHERE `name`='%e'", GetPlayerNameEx(playerid));
        mysql_tquery(DBConnection, Query, "LoadMYSQLAccounts", "i", playerid);
        SendClientMessage(playerid, 0x80FF00AA, "[Server] Logado com sucesso.");
        Notificacao(playerid, "CONECTADO", "Você logou com sucesso!");
    }
    else
    {
        SendClientMessage(playerid, 1, "[SERVER] Senha incorreta, tente novamente.");
        new Query[90];
        mysql_format(DBConnection, Query, sizeof(Query), "SELECT `password`, `id` FROM `players` WHERE `name` = '%e'", GetPlayerNameEx(playerid));
        mysql_tquery(DBConnection, Query, "VerifyAccountSQL", "i", playerid);
    }

    return 1;
}

hook OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    switch (dialogid)
    {
        case DIALOG_REGISTER:
        {
            if (!response)
                return Kick(playerid);
            if (strlen(inputtext) < 4 || strlen(inputtext) > 24)
            {
                SendClientMessage(playerid, 0xFF0000AA, "[SERVER] Escolha uma senha entre 4 a 24 caracteres.");
                ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "Registro", "Ops, parece que você não tem conta.\n digite uma {03fc39}senha abaixo", "Criar", "{fc1c03}Sair");
            }
            else
            {
                bcrypt_hash(playerid, "onPasswordHashCallback", inputtext, BCRYPT_COST);
                // mysql_format(DBConnection, Query, sizeof(Query), "INSERT INTO `players`(`name`, `password`) VALUES ('%e', '%e')", GetPlayerNameEx(playerid), inputtext);
                // mysql_tquery(DBConnection, Query, "InsertSQLData", "i", playerid);
                // SendClientMessage(playerid, -1, "Por favor, relogue para evitar erros.");
            }
        }

        case DIALOG_LOGIN:
        {
            if (!response)
                return Kick(playerid);
            bcrypt_verify(playerid, "OnPasswordVerifyCallback", inputtext, Player[playerid][pPassword]);
        }
    }

    return 1;
}


hook OnPlayerConnect(playerid)
{
    loginBox[playerid] = CreatePlayerTextDraw(playerid, 328.000000, 3.000000, "_");
    PlayerTextDrawFont(playerid, loginBox[playerid], 1);
    PlayerTextDrawLetterSize(playerid, loginBox[playerid], 0.641666, 10.300003);
    PlayerTextDrawTextSize(playerid, loginBox[playerid], 407.000000, 739.500000);
    PlayerTextDrawSetOutline(playerid, loginBox[playerid], 1);
    PlayerTextDrawSetShadow(playerid, loginBox[playerid], 0);
    PlayerTextDrawAlignment(playerid, loginBox[playerid], 2);
    PlayerTextDrawColor(playerid, loginBox[playerid], -1);
    PlayerTextDrawBackgroundColor(playerid, loginBox[playerid], 255);
    PlayerTextDrawBoxColor(playerid, loginBox[playerid], 226);
    PlayerTextDrawUseBox(playerid, loginBox[playerid], 1);
    PlayerTextDrawSetProportional(playerid, loginBox[playerid], 1);
    PlayerTextDrawSetSelectable(playerid, loginBox[playerid], 0);

    PlayerTD[playerid][0] = CreatePlayerTextDraw(playerid, 328.000000, 21.000000, "ESSENTIAL ROLEPLAY");
    PlayerTextDrawFont(playerid, PlayerTD[playerid][0], 3);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][0], 1.087500, 2.599999);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][0], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][0], 4);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][0], 1);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][0], 2);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][0], -1094795521);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][0], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][0], 50);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][0], 0);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][0], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][0], 0);

    PlayerTD[playerid][1] = CreatePlayerTextDraw(playerid, 328.000000, 361.000000, "_");
    PlayerTextDrawFont(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][1], 0.641666, 10.300003);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][1], 407.000000, 739.500000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][1], 0);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][1], 2);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][1], -1);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][1], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][1], 226);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][1], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][1], 0);

    PlayerTD[playerid][2] = CreatePlayerTextDraw(playerid, 328.000000, 382.000000, "essentialroleplay.com.br");
    PlayerTextDrawFont(playerid, PlayerTD[playerid][2], 3);
    PlayerTextDrawLetterSize(playerid, PlayerTD[playerid][2], 1.087500, 2.599999);
    PlayerTextDrawTextSize(playerid, PlayerTD[playerid][2], 400.000000, 17.000000);
    PlayerTextDrawSetOutline(playerid, PlayerTD[playerid][2], 4);
    PlayerTextDrawSetShadow(playerid, PlayerTD[playerid][2], 1);
    PlayerTextDrawAlignment(playerid, PlayerTD[playerid][2], 2);
    PlayerTextDrawColor(playerid, PlayerTD[playerid][2], -1094795521);
    PlayerTextDrawBackgroundColor(playerid, PlayerTD[playerid][2], 255);
    PlayerTextDrawBoxColor(playerid, PlayerTD[playerid][2], 50);
    PlayerTextDrawUseBox(playerid, PlayerTD[playerid][2], 0);
    PlayerTextDrawSetProportional(playerid, PlayerTD[playerid][2], 1);
    PlayerTextDrawSetSelectable(playerid, PlayerTD[playerid][2], 0);

    new Query[90];
    mysql_format(DBConnection, Query, sizeof(Query), "SELECT `password`, `id` FROM `players` WHERE `name` = '%e'", GetPlayerNameEx(playerid));
    mysql_tquery(DBConnection, Query, "VerifyAccountSQL", "i", playerid);

    return 1;
}

// keep saving account in case server crash
hook OnPlayerSpawn(playerid)
{
    if (Player[playerid][pLoggedIn] == true)
    {
        SetTimerEx("SaveSQLAccount", 300000, true, "d", playerid);
    }
    return 1;
}

stock FixText(const string[])
{
    new szFixed[1024], iPos, iLen;

    for (iLen = strlen(string); iPos < iLen; iPos ++)
        switch (string[iPos])
        {
            case '%': szFixed[iPos] = 37;
            case '&': szFixed[iPos] = 38;
            case '¡': szFixed[iPos] = 64;
            case '°': szFixed[iPos] = 124;
            case 'À': szFixed[iPos] = 128;
            case 'Á': szFixed[iPos] = 129;
            case 'Â': szFixed[iPos] = 130;
            case 'Ä', 'Ã':
                szFixed[iPos] = 131;
            case 'Ç': szFixed[iPos] = 133;
            case 'È': szFixed[iPos] = 134;
            case 'É': szFixed[iPos] = 135;
            case 'Ê': szFixed[iPos] = 136;
            case 'Ë': szFixed[iPos] = 137;
            case 'Ì': szFixed[iPos] = 138;
            case 'Í': szFixed[iPos] = 139;
            case 'Î': szFixed[iPos] = 140;
            case 'Ï': szFixed[iPos] = 141;
            case 'Ò': szFixed[iPos] = 142;
            case 'Ó': szFixed[iPos] = 143;
            case 'Ô': szFixed[iPos] = 144;
            case 'Ö', 'Õ':
                szFixed[iPos] = 145;
            case 'Ù': szFixed[iPos] = 146;
            case 'Ú': szFixed[iPos] = 147;
            case 'Û': szFixed[iPos] = 148;
            case 'Ü': szFixed[iPos] = 149;
            case 'à': szFixed[iPos] = 151;
            case 'á': szFixed[iPos] = 152;
            case 'â': szFixed[iPos] = 153;
            case 'ä', 'ã':
                szFixed[iPos] = 154;
            case 'ç': szFixed[iPos] = 156;
            case 'è': szFixed[iPos] = 157;
            case 'é': szFixed[iPos] = 158;
            case 'ê': szFixed[iPos] = 159;
            case 'ë': szFixed[iPos] = 160;
            case 'ì': szFixed[iPos] = 161;
            case 'í': szFixed[iPos] = 162;
            case 'î': szFixed[iPos] = 163;
            case 'ï': szFixed[iPos] = 164;
            case 'ò': szFixed[iPos] = 165;
            case 'ó': szFixed[iPos] = 166;
            case 'ô': szFixed[iPos] = 167;
            case 'ö', 'õ':
                szFixed[iPos] = 168;
            case 'ù': szFixed[iPos] = 169;
            case 'ú': szFixed[iPos] = 170;
            case 'û': szFixed[iPos] = 171;
            case 'ü': szFixed[iPos] = 172;
            case 'Ñ': szFixed[iPos] = 173;
            case 'ñ': szFixed[iPos] = 174;
            case '¿': szFixed[iPos] = 175;
            case '`': szFixed[iPos] = 177;
            default:
                szFixed[iPos] = string[iPos];
        }
    return szFixed;
}

hook OnPlayerDisconnect(playerid, reason)
{
    if (Player[playerid][pLoggedIn] == true && reason >= 0)
    {
        SaveSQLAccount(playerid);
        WipeDataSQL(playerid);
    }
    return 1;
}

stock WipeDataSQL(playerid)
{
    Player[playerid][pID] = 0;
    Player[playerid][pPassword] = 0;
    Player[playerid][pMoney] = 0;
    Player[playerid][pScore] = 0;
    Player[playerid][pSkin] = 0;
    Player[playerid][pLoggedIn] = false;
    Player[playerid][pPosX] = 0;
    Player[playerid][pPosY] = 0;
    Player[playerid][pPosZ] = 0;
    Player[playerid][pAngles] = 0;
    return 1;
}

forward SaveSQLAccount(playerid);
public SaveSQLAccount(playerid)
{
    if (Player[playerid][pLoggedIn] == false)
        return 0;

    new Query[250];

    Player[playerid][pMoney] = GetPlayerMoney(playerid);
    Player[playerid][pScore] = GetPlayerScore(playerid);
    Player[playerid][pSkin] = GetPlayerSkin(playerid);
    GetPlayerPos(playerid, Player[playerid][pPosX], Player[playerid][pPosY], Player[playerid][pPosZ]);
    GetPlayerFacingAngle(playerid, Player[playerid][pAngles]);

    mysql_format(DBConnection, Query, sizeof(Query), "UPDATE `players` SET\
    `money`='%i',\
    `score`='%i',\
    `skin`='%i',\
    `posX`='%f',\
    `posY`='%f',\
    `posZ`='%f',\
    `angles`='%f' WHERE `id`='%i'", Player[playerid][pMoney], Player[playerid][pScore], Player[playerid][pSkin], Player[playerid][pPosX], Player[playerid][pPosY], Player[playerid][pPosZ], Player[playerid][pAngles], Player[playerid][pID]);
    mysql_query(DBConnection, Query);
    printf("[MYSQL] Dados do Jogador %s ID %d salvo com sucesso", GetPlayerNameEx(playerid), Player[playerid][pID]);
    return 1;
}

forward InsertSQLData(playerid);
public InsertSQLData(playerid)
{
    new Query[90];

    Player[playerid][pID] = cache_insert_id();
    printf("[MYSQL] Jogador %s registrado na DB com o ID: %d", GetPlayerNameEx(playerid), Player[playerid][pID]);

    mysql_format(DBConnection, Query, sizeof(Query), "SELECT * FROM `players` WHERE `id`='%i'", Player[playerid][pID]);
    mysql_query(DBConnection, Query);
    LoadMYSQLAccounts(playerid);

    return 1;
}

forward LoadMYSQLAccounts(playerid);
public LoadMYSQLAccounts(playerid)
{
    for (new i = 0; i < 3; i++)
    {
        PlayerTextDrawDestroy(playerid, PlayerTD[playerid][i]);
        PlayerTextDrawDestroy(playerid, loginBox[playerid]);
    }

    Player[playerid][pLoggedIn] = true;

    cache_get_value_int(0, "id", Player[playerid][pID]);
    cache_get_value_int(0, "money", Player[playerid][pMoney]);
    cache_get_value_int(0, "score", Player[playerid][pScore]);
    cache_get_value_int(0, "skin", Player[playerid][pSkin]);
    cache_get_value_float(0, "posX", Player[playerid][pPosX]);
    cache_get_value_float(0, "posY", Player[playerid][pPosY]);
    cache_get_value_float(0, "posZ", Player[playerid][pPosZ]);
    cache_get_value_float(0, "angles", Player[playerid][pAngles]);
    cache_get_value_bool(0, "admin", Player[playerid][pAdmin]);

    SetPlayerSkin(playerid, Player[playerid][pSkin]);
    SetPlayerScore(playerid, Player[playerid][pScore]);
    GivePlayerMoney(playerid, Player[playerid][pMoney]);
    SetSpawnInfo(playerid, NO_TEAM, Player[playerid][pSkin], Player[playerid][pPosX], Player[playerid][pPosY], Player[playerid][pPosZ], Player[playerid][pAngles], 0, 0, 0, 0, 0, 0);
    SetTimerEx("SpawnPlayerInTime", 1, false, "i", playerid);
    return 1;
}

// fix cj skin on login
forward SpawnPlayerInTime(playerid);
public SpawnPlayerInTime(playerid)
{
    TogglePlayerSpectating(playerid, false);
    SpawnPlayer(playerid);
    return 1;
}

forward VerifyAccountSQL(playerid);
public VerifyAccountSQL(playerid)
{
    if (cache_num_rows() > 0)
    {
        TogglePlayerSpectating(playerid, true);

        InterpolateCameraPos(playerid, 379.492889, -1640.225463, 71.191413, 1542.325195, -897.575622, 165.667221, 10000);
        InterpolateCameraLookAt(playerid, 382.213653, -1636.101196, 70.424919, 1538.709838, -900.795959, 164.418853, 10000);

        PlayerTextDrawShow(playerid, PlayerTD[playerid][0]);
        PlayerTextDrawShow(playerid, PlayerTD[playerid][1]);
        PlayerTextDrawShow(playerid, PlayerTD[playerid][2]);
        PlayerTextDrawShow(playerid, loginBox[playerid]);

        cache_get_value_name(0, "password", Player[playerid][pPassword], 255);

        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login", "Olá %s, bem vindo de volta.\n digite sua {03fc39}senha abaixo", "Entrar", "{fc1c03}Sair", GetPlayerNameEx(playerid));
    }
    else
    {
        TogglePlayerSpectating(playerid, true);

        InterpolateCameraPos(playerid, 379.492889, -1640.225463, 71.191413, 1542.325195, -897.575622, 165.667221, 10000);
        InterpolateCameraLookAt(playerid, 382.213653, -1636.101196, 70.424919, 1538.709838, -900.795959, 164.418853, 10000);

        PlayerTextDrawShow(playerid, PlayerTD[playerid][0]);
        PlayerTextDrawShow(playerid, PlayerTD[playerid][1]);
        PlayerTextDrawShow(playerid, PlayerTD[playerid][2]);
        PlayerTextDrawShow(playerid, loginBox[playerid]);
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "Registro", "Ops, parece que você não tem conta.\n digite uma {03fc39}senha abaixo", "Criar", "{fc1c03}Sair");
    }

    return 1;
}

stock GetPlayerNameEx(playerid)
{
    static pname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pname, MAX_PLAYER_NAME);
    return pname;
}