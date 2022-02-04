@ECHO OFF

SET DRV=Invisibility

CLS
KMD\RunKMD %DRV% /RUN
ECHO.
ECHO Press return to stop the driver...
PAUSE
CLS

KMD\RunKMD %DRV% /STOP
PAUSE
CLS
