@ECHO OFF

IF "%1%" NEQ "" (
	clearbin.bat %1%
	clearobj.bat %1%
) ELSE (
	clearbin.bat
	clearobj.bat
)