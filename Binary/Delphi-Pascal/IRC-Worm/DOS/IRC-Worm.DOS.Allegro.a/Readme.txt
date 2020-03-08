   Win21 README
   ------------
   Features :

   Author                       : Benny T.
   Type                         : mIRC Worm
   Date created                 : 2 February 2000
   Updated                      : 28 August 2000
   Size                         : 13360 bytes (14 KB)
   Executable filename          : Random
   Platform                     : Win16/Dos
   OS supported                 : Windows 95/98
   Language                     : Pascal
   Compiled                     : Borland Turbo Pascal 7.0
   Primary transport            : mIRC chat client
   Secondary transport          : none
   Detection                    : Undetected by Antivirus programs
   Variants                     : None
   Risk assessment              : Medium
   Installs into system         : No
   API Hooks                    : No
   Memory resident              : No
   Polymorphic                  : No
   Stealth                      : No
   E-mail propagation           : No
   IRC propagation              : Yes
   Password grabber             : No
   FTP server                   : No
   Keystroke logger             : No
   Direct action                : No
   Encrypted                    : No
   Infects PE executables       : No
   Infects DOS executables      : No
   Payload                      : Yes
   Date triggered               : Yes
   Event triggered              : Partly (Only in mIRC)
   Destructive                  : Partially
   Remote Access Trojan         : No
   Runs everytime Windows start : Yes


   Win21 is an MIRC worm that propagates via DCC (Direct Client Connection)
   in an MIRC session. Win21 only runs on Windows 95/98 platform and not
   on any Windows NT, MS DOS, Linux, Unix, Solaris, Windows 3.x or Macintosh
   platforms. The worm itself is a 14 Kb DOS executable file which may
   arrive as one of the following filenames:

   FunPics.exe
   video.exe
   party.exe
   Funlove.exe
   pics.exe
   Funny.exe
   Jokes.exe
   pics4you.exe
   Bunny.exe
   Game.exe
   girls.exe
   sexy.exe

   These filenames are randomly generated each time the worm is executed


   What Win21 does :
   1. Checks if computer already infected.
   2. If not infected, copies itself to c:\windows\system\ using a randomly
      generated filename from the above list
   3. Copies itself to c:\windows\ as sysmapi.exe
   3. Drops Winsys.bat in c:\windows\. This file contains instructions to load
      the worm from c:\windows\.
   4. Sets Winsys.bat to ReadOnly.
   5. Modifies c:\Autoexec.bat so that Winsys.bat is run everytime the computer
      reboots.
   6. Sets Autoexec.bat to ReadOnly.
   7. Checks if MIRC chat client is installed in computer.
   8. If MIRC is installed, drops Options.ini in MIRC directory. This file
      contains settings for MIRC to DCC send everyone in the current channel
      during an MIRC session.
      Options.ini also contains settings to message everyone in current mIRC
      channel to persuade them to run Win21.
   9. Patches mirc.ini in c:\mirc\ to execute Options.ini file
   10. Checks current date of system.
   11. If day is on the 16th of the month, executes payload to erase c:\windows\win.com, making
       Windows unable to load the next time the computer reboots.
   12. After executing the payload, it displays a blue screen of death containing
       an error message. Note that this is a fake message and it is only to
       fool the user. At the bottom of the blue screen, it displays the text
       "WIN THE 21st CENTURY !!......by B.T. >>>>>" in changing colors.
   13. Checks current system time.
   14. If current day is Wednesday and time is between 4.00 to 5.00 pm (finish working hours),
       Win21 will overwrite all Word Documents (*.doc) in c:\ and c:\mydocu~1 folders
       with ASCII characters. This erases all data in all Word Documents.

   When Win21 is executed, it automatically runs in fullscreen mode and it will display 80
   smiling faces graphics in white color. This is only to cover or disguise its malicious
   background activities. When any key is pressed, the screen terminates and returns to the
   operating system.

   **********Win21 is just for educational purpose, DO NOT RELEASE !!***********
