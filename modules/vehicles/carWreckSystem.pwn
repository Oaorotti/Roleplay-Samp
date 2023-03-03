#include <YSI-Includes\YSI_Coding\y_hooks>
hook OnPlayerUpdate(playerid)
{
    new vehicleID;
    vehicleID = GetPlayerVehicleID(playerid);
    if (IsPlayerInAnyVehicle(playerid))
    {
        new Float:oldHealth;
        GetVehicleHealth(vehicleID, oldHealth);

        if (oldHealth <= 300.0)
        {
            SetTimerEx("CheckCurrentDamage", 1000, true, "iii", playerid, vehicleID, oldHealth);
        }
    }

    return 1;
}


forward CheckCurrentDamage(playerid, vehicleid, Float:oldHealth);
public CheckCurrentDamage(playerid, vehicleid, Float:oldHealth)
{
    new Float:newHealth;

    GetVehicleHealth(vehicleid, newHealth);

    if (IsPlayerInAnyVehicle(playerid) && newHealth <= 300.0)
    {
        SetVehicleHealth(vehicleid, 300.0);
        SetVehicleParamsEx(vehicleid, 0, 0, 0, 0, 0, 0, 0);
    }
    return 1;
}