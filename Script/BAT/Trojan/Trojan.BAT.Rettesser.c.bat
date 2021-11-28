Title 2010   
@echo off   
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\SPC /f   
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\KasperskyLab\LicStorage /f   
   
echo data > "%SystemDrive%\Documents and Settings\All Users\Application Data\Kaspersky Lab\AVP9\Data:extended"   
   
if errorlevel 0 goto k   
echo data > "%SystemDrive%\ProgramData\Kaspersky Lab\AVP9\Data:extended"   
if errorlevel 0 goto k else quit   
      
:k   
echo Trial reset OK!   
   
rem pause   
exit   
    
:quit   
echo Trial reset ERROR!   
rem pause   
exit