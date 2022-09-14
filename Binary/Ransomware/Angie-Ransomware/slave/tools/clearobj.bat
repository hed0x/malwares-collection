@ECHO OFF

IF "%1%" NEQ "" (
	del /S /Q "%PROJECT_PATH%\objects\%1%\*.obj"
) ELSE (
	del /S /Q "%PROJECT_PATH%\objects\%PROJECT_BUILD%\*.obj"
)
