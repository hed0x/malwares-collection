Attribute VB_Name = "FileManagerClient"
' *********************************************
' * File Manager created by SkBeta            *
' * ICQ UIN : 51964739                        *
' * skbeta@uol.com.br - http://skbeta.cjb.net *
' *********************************************


Global hFileUploadDownload As Long
Global lUploadDownload As Boolean

Global cBytesRecebidos As Long
Global ItemListaDownload As Long

Global bDadosEnviados As Boolean
Global lDownloadUpload As Boolean

Global BytesToRead As Long

Dim nTamanhoTransferencia As Long

Public Sub Pausa(nSegundos As Long)
   Dim Start!

   Start! = Timer
   Do While Timer < Start! + nSegundos
      DoEvents
   Loop
End Sub

Function VerificaDados(cDados As String)
      On Error Resume Next

      Dim cComando As String
      Dim cResto As String
      Dim cArquivo As String
      Dim cByteUploadDownload As String
      Dim nLoop As Integer
      Dim bGravaTudo As Boolean
      Dim Text$, ChunkSize: ChunkSize = 16384
      Dim lNumeroPacotes As Long

      cComando = Mid(cDados, 1, 3)
      cResto = Mid(cDados, 4, Len(cDados))

      Select Case cComando
         Case ANSWER_START_DOWNLOAD_FILE 
            cArquivo = Trim(Mid(cResto, 1, InStr(cResto, "|") - 1))

            nTamanhoTransferencia = Val(Mid(cResto, InStr(cResto, "|") + 1, Len(cResto)))

            SetAttr cArquivo, vbNormal
            Kill cArquivo

            If hFileUploadDownload <> 0 Then
               Close #hFileUploadDownload
            End If

            hFileUploadDownload = FreeFile
            Open cArquivo For Binary Access Write As #hFileUploadDownload

            FormClient.LabelStatus.Caption = "Starting Download - "+ cArquivo
            lUploadDownload = True

            Call FormClient.DownloadFile

         Case ANSWER_BINARY_DOWNLOAD_FILE

GravaDownload:
            If hFileUploadDownload <> 0 Then

               If Not bGravaTudo Then
                  cByteUploadDownload = cResto

               Else
                  cByteUploadDownload = cDados

               End If

               cBytesRecebidos = cBytesRecebidos + Len(cByteUploadDownload)

               If Not cBytesRecebidos > nTamanhoTransferencia Then
                    Put #hFileUploadDownload, , cByteUploadDownload

               Else
                    GoTo FechaArquivo

               End If

               FormClient.LabelStatus.Caption = "Bytes Received: " & LOF(hFileUploadDownload)

               cResto = Empty

               DoEvents

            End If

         Case ANSWER_END_DOWNLOAD_FILE
FechaArquivo:
            On Error Resume Next

            Call FechaArquivo

            FormClient.ListUploadDownload.RemoveItem ItemListaDownload

            If FormClient.ListUploadDownload.ListCount = 0 Then
                FormClient.LabelStatus.Caption = "Download Finished !"

            End If

            Call FormClient.NextUploadDownload

      Case ANSWER_READ_UPLOAD_FILE
            On Error Resume Next

            Do While Val(BytesToRead) > 0
               If BytesToRead < Val(ChunkSize) Then
                  Text$ = Input(BytesToRead, hFileUploadDownload)
                  BytesToRead = 0
               Else
                  Text$ = Input(ChunkSize, hFileUploadDownload)
                  BytesToRead = BytesToRead - ChunkSize
               End If

               bDadosEnviados = False

               lNumeroPacotes = lNumeroPacotes + Len(Text$)

               FormClient.WinsockTransfer.SendData COMMAND_BINARY_UPLOAD_FILE & Text$
               FormClient.LabelStatus = "Sending File : " & lNumeroPacotes

               Do While Not bDadosEnviados
                  DoEvents
               Loop

            Loop

            FormClient.WinsockTransfer.Close

            FormClient.LabelStatus = "Upload Finished !"

            Call FechaArquivo

            FormClient.ListUploadDownload.RemoveItem ItemListaDownload
            Call FormClient.NextUploadDownload

      Case Else
         If lUploadDownload Then
            bGravaTudo = True
            GoTo GravaDownload

         End If

      End Select

      cByteUploadDownload = Empty
End Function

Function FechaArquivo()

   Dim nLoop As Long

   For nLoop = 0 To FreeFile()
      Close #nLoop
   Next

   lUploadDownload = False

End Function
