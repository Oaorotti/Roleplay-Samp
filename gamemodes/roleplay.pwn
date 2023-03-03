#include <open.mp>
#include <crashdetect>
#include <a_mysql>
#include <samp_bcrypt>
#include <sampvoice>

#include "../modules/player/newHud.pwn"

#include <weapon-config>
#include <notifications>
#include <progress2>
#include <sscanf2>

#define YSI_NO_CACHE_MESSAGE
#define YSI_NO_OPTIMISATION_MESSAGE
#define YSI_NO_VERSION_CHECK
#define YSI_NO_HEAP_MALLOC

#include <YSI-Includes\YSI_Coding\y_hooks>

#include "../modules/login/login.pwn"
#include "../modules/login/logo.pwn"
#include "../modules/chat/chat.pwn"
#include "../modules/voiceChat/voiceChat.pwn"
#include "../modules/food/food.pwn"
#include "../modules/clock/clock.pwn"
#include "../modules/player/playerCommands.pwn"
#include "../modules/player/speedometer.pwn"
#include "../modules/player/adminCommands.pwn"
#include "../modules/vehicles/bikesOnSpawn.pwn"
#include "../modules/player/hospitalSystem.pwn"
#include "../modules/vehicles/carWreckSystem.pwn"
#include "../modules/vehicles/vehicleCommands.pwn"



/*
     ___      _
    / __| ___| |_ _  _ _ __
    \__ \/ -_)  _| || | '_ \
    |___/\___|\__|\_,_| .__/
                      |_|
*/

main()
{
    printf(" ");
    printf("  -------------------------------");
    printf("  |  My first open.mp gamemode! |");
    printf("  -------------------------------");
    printf(" ");
}

public OnGameModeInit()
{
    SetGameModeText("My first open.mp gamemode!");
    UsePlayerPedAnims();
    DisableInteriorEnterExits();
    ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
    ShowNameTags(0);
    SetVehiclePassengerDamage(true);
    SetDisableSyncBugs(true);
    ManualVehicleEngineAndLights();

    SetWeaponDamage(WEAPON_AK47, DAMAGE_TYPE_RANGE, 40.0, 20.0, 30.0, 60.0, 20.0);
    SetWeaponDamage(WEAPON_M4, DAMAGE_TYPE_RANGE, 37.0, 20.0, 27.0, 60.0, 17.0);
    SetWeaponDamage(WEAPON_SHOTGUN, DAMAGE_TYPE_RANGE, 48.0, 7.0, 2.0);
    SetWeaponDamage(WEAPON_MP5, DAMAGE_TYPE_RANGE, 24.0, 20.0, 17.0, 10.0);
    SetWeaponDamage(WEAPON_COLT45, DAMAGE_TYPE_RANGE, 12.0, 20.0, 6.0, 60.0, 3.0);
    SetWeaponDamage(WEAPON_DEAGLE, DAMAGE_TYPE_RANGE, 38.0, 20.0, 26.0, 60.0, 15.0);
    SetWeaponDamage(WEAPON_RIFLE, DAMAGE_TYPE_RANGE, 40.0, 20.0, 30.0, 60.0, 20.0);

    return 1;
}

public OnGameModeExit()
{
    return 1;
}

/*
      ___
     / __|___ _ __  _ __  ___ _ _
    | (__/ _ \ '  \| '  \/ _ \ ' \
     \___\___/_|_|_|_|_|_\___/_||_|

*/

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    TogglePlayerSpectating(playerid, true);
    return 1;
}

public OnPlayerSpawn(playerid)
{
    SetCbugAllowed(false, playerid);
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
    return 1;
}

/*
     ___              _      _ _    _
    / __|_ __  ___ __(_)__ _| (_)__| |_
    \__ \ '_ \/ -_) _| / _` | | (_-<  _|
    |___/ .__/\___\__|_\__,_|_|_/__/\__|
        |_|
*/

public OnFilterScriptInit()
{
    printf(" ");
    printf("  -----------------------------------------");
    printf("  |  Error: Script was loaded incorrectly |");
    printf("  -----------------------------------------");
    printf(" ");
    return 1;
}

public OnFilterScriptExit()
{
    return 1;
}

public OnPlayerRequestSpawn(playerid)
{
    return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    return 0;
}

public OnPlayerText(playerid, text[])
{
    return 1;
}

public OnPlayerUpdate(playerid)
{
    return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
    return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
    return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
    return 1;
}

public OnPlayerGiveDamageActor(playerid, damaged_actorid, Float:amount, weaponid, bodypart)
{
    return 1;
}

public OnActorStreamIn(actorid, forplayerid)
{
    return 1;
}

public OnActorStreamOut(actorid, forplayerid)
{
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    return 1;
}

public OnPlayerEnterGangZone(playerid, zoneid)
{
    return 1;
}

public OnPlayerLeaveGangZone(playerid, zoneid)
{
    return 1;
}

public OnPlayerEnterPlayerGangZone(playerid, zoneid)
{
    return 1;
}

public OnPlayerLeavePlayerGangZone(playerid, zoneid)
{
    return 1;
}

public OnPlayerClickGangZone(playerid, zoneid)
{
    return 1;
}

public OnPlayerClickPlayerGangZone(playerid, zoneid)
{
    return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
    return 1;
}

public OnPlayerExitedMenu(playerid)
{
    return 1;
}

public OnClientCheckResponse(playerid, actionid, memaddr, retndata)
{
    return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
    return 1;
}

public OnPlayerFinishedDownloading(playerid, virtualworld)
{
    return 1;
}

public OnPlayerRequestDownload(playerid, DOWNLOAD_REQUEST:type, crc)
{
    return 1;
}

public OnRconCommand(cmd[])
{
    return 0;
}

public OnPlayerSelectObject(playerid, SELECT_OBJECT:type, objectid, modelid, Float:fX, Float:fY, Float:fZ)
{
    return 1;
}

public OnPlayerEditObject(playerid, playerobject, objectid, EDIT_RESPONSE:response, Float:fX, Float:fY, Float:fZ, Float:rotationX, Float:rotationY, Float:rotationZ)
{
    return 1;
}

public OnPlayerEditAttachedObject(playerid, EDIT_RESPONSE:response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:rotationX, Float:rotationY, Float:rotationZ, Float:scaleX, Float:scaleY, Float:scaleZ)
{
    return 1;
}

public OnObjectMoved(objectid)
{
    return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
    return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
    return 1;
}

public OnPlayerPickUpPlayerPickup(playerid, pickupid)
{
    return 1;
}

public OnPickupStreamIn(pickupid, playerid)
{
    return 1;
}

public OnPickupStreamOut(pickupid, playerid)
{
    return 1;
}

public OnPlayerPickupStreamIn(pickupid, playerid)
{
    return 1;
}

public OnPlayerPickupStreamOut(pickupid, playerid)
{
    return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
    return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
    return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, CLICK_SOURCE:source)
{
    return 1;
}

public OnIncomingConnection(playerid, ip_address[], port)
{
    return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
    return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
    return 1;
}

public OnPlayerClickPlayerTextDraw(playerid, PlayerText:playertextid)
{
    return 1;
}

public OnTrailerUpdate(playerid, vehicleid)
{
    return 1;
}

public OnVehicleSirenStateChange(playerid, vehicleid, newstate)
{
    return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
    return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
    return 1;
}

public OnVehicleMod(playerid, vehicleid, component)
{
    return 1;
}

public OnEnterExitModShop(playerid, enterexit, interiorid)
{
    return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjob)
{
    return 1;
}

public OnVehicleRespray(playerid, vehicleid, colour1, colour2)
{
    return 1;
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
    return 1;
}

public OnUnoccupiedVehicleUpdate(vehicleid, playerid, passenger_seat, Float:new_x, Float:new_y, Float:new_z, Float:vel_x, Float:vel_y, Float:vel_z)
{
    return 1;
}

