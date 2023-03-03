#include <YSI-Includes\YSI_Coding\y_hooks>

CMD:motor(playerid, params[])
{
    if (IsPlayerInAnyVehicle(playerid))
    {
        new engine, lights, alarm, doors, bonnet, boot, objective;
        new vehicleID = GetPlayerVehicleID(playerid);
        new string[128];

        GetVehicleParamsEx(vehicleID, engine, lights, alarm, doors, bonnet, boot, objective);

        if (engine == VEHICLE_PARAMS_OFF || engine == VEHICLE_PARAMS_UNSET)
        {
            SetVehicleParamsEx(vehicleID, VEHICLE_PARAMS_ON, lights, alarm, doors, bonnet, boot, objective);
            Notificacao(playerid, "Ligado", "Veiculo ligado com sucesso.");

            format(string, sizeof(string), "* %s ligou o motor do seu veiculo.", GetPlayerNameEx(playerid));
            ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);

        }
        else
        {
            SetVehicleParamsEx(vehicleID, VEHICLE_PARAMS_OFF, lights, alarm, doors, bonnet, boot, objective);
            Notificacao(playerid, "Desligado", "Veiculo desligado com sucesso.");
            format(string, sizeof(string), "* %s desligou o motor do seu veiculo.", GetPlayerNameEx(playerid));
            ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        }
    }
    return 1;
}

CMD:luzes(playerid, params[])
{
    if (IsPlayerInAnyVehicle(playerid))
    {
        new engine, lights, alarm, doors, bonnet, boot, objective;
        new string[128];
        new vehicleID = GetPlayerVehicleID(playerid);

        GetVehicleParamsEx(vehicleID, engine, lights, alarm, doors, bonnet, boot, objective);

        if (lights == VEHICLE_PARAMS_OFF || lights == VEHICLE_PARAMS_UNSET)
        {
            SetVehicleParamsEx(vehicleID, engine, VEHICLE_PARAMS_ON, alarm, doors, bonnet, boot, objective);

            format(string, sizeof(string), "* %s ligou as luzes do seu veiculo.", GetPlayerNameEx(playerid));
            ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        }
        else
        {
            SetVehicleParamsEx(vehicleID, engine, VEHICLE_PARAMS_OFF, alarm, doors, bonnet, boot, objective);

            format(string, sizeof(string), "* %s desligou as luzes do seu veiculo.", GetPlayerNameEx(playerid));
            ProxDetector(10.0, playerid, string, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE, COLOR_PURPLE);
        }
    }
    return 1;
}