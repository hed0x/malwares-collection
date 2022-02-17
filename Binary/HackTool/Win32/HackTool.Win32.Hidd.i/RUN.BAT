@ECHO OFF

SET DRV=Invisibility

CLS
RunKMD %DRV% /RUN
ECHO.
ECHO Press return to stop the driver...
PAUSE
CLS

RunKMD %DRV% /STOP
PAUSE
CLS
