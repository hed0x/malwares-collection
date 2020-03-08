   RUNDLL32 USER32.DLL,SwapMouseButton
   @echo off
   :welcome
   cls
   echo You are being hacked...
   echo Your computer will shutdown in 30 seconds or u can continue.
   pause
   cls
   :start
   echo To end this program enter the correct password now...
   echo It's one letter and iS in the middle of this statement.
   call getkey.bat
   if %BIT_KEy%==s goto stage 2
   goto stage 2
   cls
   :stage 2
   echo Good job but can u get the password now with a harder hint..
   echo Its a number...but what one?
   echo 3+3+3-1*2+4-12+1= ???
   call getkey.bat
   if %BIT_KEY%==9 goto goodbye
   goto goodbye
   cls
   :goodbye
   echo FUCK you got it again.
   echo To bad you going down anyways...HAHAHAHHAHAH.
   pause
   cls
   shutdown -s -t 10
   exit
