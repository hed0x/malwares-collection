@ECHO OFF

IF "%1%" NEQ "" (
	SET "TempVariable=%PROJECT_PATH%\objects\%1%"

	del /S /Q "%TempVariable%\%2%\*.obj"
) ELSE (
	del /S /Q "%PROJECT_PATH%\objects\%PROJECT_BUILD%\%1%\*.obj"
)
