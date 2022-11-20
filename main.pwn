#include <a_samp>
#include <Pawn.CMD>

#define  COLOR_ERROR  0xFF4500FF

new GPS[MAX_PLAYERS];

#if defined FILTERSCRIPT

CMD:celular(playerid)
{
    if(!IsPlayerConnected(playerid)) return SendClientMessage(playerid, COLOR_ERROR, "No estas conectado");
    {
        ShowPlayerDialog(playerid, 1, DIALOG_STYLE_LIST, "Mi Celular", "PlayStore\nGoogle Maps\nSpotify", "Seleccionar","Cancelar");
        return 1;
    }
}

public OnPlayerEnterCheckpoint(playerid)
{
    if(GPS[playerid] <= 1)
    {
        GPS[playerid] = 0;
        DisablePlayerCheckpoint(playerid);
    }
    return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    if(dialogid == 1)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, 1, DIALOG_STYLE_INPUT, "Pawn Code Discord", "Entra y envia un mensaje", "Enviar", "Cerrar");
            }
            if(listitem == 1)
            {
                ShowPlayerDialog(playerid, 2, DIALOG_STYLE_LIST, "Google Maps", "Los Santos\nLas Venturas", "Seleccionar", "Cancelar");
            }
            if(listitem == 2)
            {
                ShowPlayerDialog(playerid, 5, DIALOG_STYLE_LIST, "Play List", "{FFFFFF}POP\n{FFFFFF}Reguuetonsito\n{FFFFFF}Electronica\n{FFFFFF}Rock\n{FFFFFF}Gay\n{FFFFFF}Baladas y Romanticas\n{FFFFFF}HipHop\n{FFFFFF}Trap", "OK", "Cancelar");
            }
        }
    }
    if(dialogid == 1)
    {
        if(response)
        if(strlen(inputtext))
        {
            format(MegaString, sizeof(MegaString), ">> {0000FF}Discord: {FFFFFF}%s{C0C0C0}#%i {FFFFFF}dice:{0000FF}%s", Name(playerid), playerid, inputtext);
            SendClientMessageToAll(-1, MegaString);
        }
    }
    if(dialogid == 2)
    {
        if(response)
        {
            if(listitem == 0)
            {
                ShowPlayerDialog(playerid, 3, DIALOG_STYLE_LIST, "Google Maps", "Gobierno", "Seleccionar", "Cancelar");

            }
        }
    }
    if(dialogid == 5)
    {
        if(response)
        {
            switch(listitem)
            {
                case 0:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"http://locafm02.we4stream.com:8015/live");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 1:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://radio.grupoelixir.es:9006/stream");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 2:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://icepool.silvacast.com/GAYFM.mp3");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 3:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://16903.live.streamtheworld.com/977_JAMZ.mp3");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 4:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://radiorock.stream.laut.fm/radiorock?ref=radiode&t302=2022-01-16_23-09-00&uuid=3545d99d-0cd2-43bd-bc0b-49b13057de34");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 5:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://topradio-stream21.radiohost.de/kissfm-hiphop_aac-64?ref=radiode&amsparams=radiode");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 6:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://kappa.radioplayer.com.ar:9130/lanet947");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
                case 7:
                {
                    StopAudioStreamForPlayer(playerid);
                    PlayAudioStreamForPlayer(playerid,"https://live.hunter.fm/smash_high");
                    SendClientMessage(playerid, 0x33CCFFAA, "{33CCFF}Radio Online {FFFFFF}Establecida!{BCBCBC}Espere un momento mientras sintonizamos con tu radio ^^!");
                }
            }
        }
    }
    if(dialogid == 4)
    {
        if(response)
        {
            if(listitem == 0)
            {
                DisablePlayerCheckpoint(playerid);
                SetPlayerCheckpoint(playerid, 246.375991,109.245994,1003.218750, 8.0);
                SendClientMessage(playerid, 0xFFFFFFAA, "Sigue el checkpoint que creamos en el mapa.");
                GPS[playerid] = 1;
            }
        }
    }
    return 1;
}

stock Name(playerid)
{
    new pi_Name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pi_Name, 24);
    return pi_Name;
}
#endif