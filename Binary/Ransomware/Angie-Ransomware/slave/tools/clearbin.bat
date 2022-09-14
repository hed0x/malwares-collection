@ECHO OFF

IF "%1%" NEQ "" (
	del /S /Q "%PROJECT_PATH%\bin\%1%\*"
) ELSE (
	del /S /Q "%PROJECT_PATH%\bin\%PROJECT_BUILD%\*"
)
