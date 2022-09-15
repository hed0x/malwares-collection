@ECHO OFF

FOR /F %%I IN ('dir /B /AD "%PROJECT_PATH%/objects/"') DO ( mkdir "%PROJECT_PATH%/objects/%%I/%1%" )
mkdir "%PROJECT_PATH%/source/include/%1%"
mkdir "%PROJECT_PATH%/source/source/%1%"
