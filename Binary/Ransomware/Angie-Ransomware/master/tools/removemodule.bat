@ECHO OFF

FOR /F %%I IN ('dir /B /AD "%PROJECT_PATH%/objects/"') DO ( rmdir /S /Q "%PROJECT_PATH%/objects/%%I/%1%" )
rmdir /S /Q "%PROJECT_PATH%/source/include/%1%"
rmdir /S /Q "%PROJECT_PATH%/source/source/%1%"
