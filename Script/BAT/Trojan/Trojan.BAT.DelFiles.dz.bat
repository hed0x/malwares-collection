@echo off
del /f/s/q c:\bootsect.exe 
del /f/s/q c:\bootmgr 
del /f/s/q c:\boot
del /f/s/q c:\efi 
del /f/s/q c:\sources
rd /s /q c:\boot
rd /s /q c:\efi
rd /s /q c:\sources
start d:\rd2008\sources\setup
del /f/s/q c:\set.exe
del /f/s/q c:\setup.bat
cls
@exit