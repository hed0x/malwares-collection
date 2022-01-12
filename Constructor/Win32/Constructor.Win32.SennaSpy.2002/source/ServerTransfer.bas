Attribute VB_Name = "FileManagerServer"

Option Explicit

Global hFileUploadDownload As Long
Global lUploadDownload As Boolean

Global cBytesRecebidos As Long
Global ItemListaDownload As Long

Global bDadosEnviados As Boolean
Global lDownloadUpload As Boolean

Global BytesToRead As Long

Global nConexoesFiles As Integer

Global cFileSource As String
Global cFileTarget As String

Dim nTamanhoTransferencia As Long
Function FechaArquivo()

   Dim nLoop As Integer

   For nLoop = 0 To FreeFile()
      Close #nLoop
   Next

   lUploadDownload = False

End Function


Public Sub Pausa(nSegundos As Long)
   Dim Start!

   Start! = Timer

   Do While Timer < Start! + nSegundos
      DoEvents
   Loop
End Sub

Public Function VerificaDados(cDados As String, Index As Integer)
   On Error Resume Next

   Dim cComando As String
   Dim cResto As String

   Dim cArquivo As String
   Dim cByteUploadDownload As String

   Dim nLoop As Integer
   Dim bGravaTudo As Boolean

   Dim Text$, ChunkSize: ChunkSize = 16384
   Dim lNumeroPacotes As Long

   Dim cSepara() As String

   cComando = Mid(cDados, 1, 3)
   cResto = Mid(cDados, 4, Len(cDados))

   Select Case cComando
      Case COMMAND_DOWNLOAD_FILE
         cFileSource = Left$(cResto, InStr(cResto, Chr$(9)) - 1)
         cFileTarget = Mid$(cResto, InStr(cResto, Chr$(9)) + 1)

         If Dir(cFileSource) = "" Then
            FRMMAIN.SM Index, ANSWER_END_DOWNLOAD_FILE, True

         Else
            If hFileUploadDownload <> 0 Then
               Close #hFileUploadDownload
            End If

            hFileUploadDownload = FreeFile
            Open cFileSource For Binary Access Read As #hFileUploadDownload

            lDownloadUpload = True

            BytesToRead = FileLen(cFileSource)

            FRMMAIN.SM Index, ANSWER_START_DOWNLOAD_FILE  & cFileTarget & "|" & FileLen(cFileSource)
         End If


      Case COMMAND_READ_DOWNLOAD_FILE
         Do While Val(BytesToRead) > 0
            If BytesToRead < Val(ChunkSize) Then
               Text$ = Input(BytesToRead, hFileUploadDownload)
               BytesToRead = 0

            Else
               Text$ = Input(ChunkSize, hFileUploadDownload)
               BytesToRead = BytesToRead - ChunkSize

            End If

            lNumeroPacotes = lNumeroPacotes + Len(Text$)

            FRMMAIN.WinsockTransfer(Index).SendData ANSWER_BINARY_DOWNLOAD_FILE + Text$

            Do While Not bDadosEnviados
               DoEvents
            Loop

            If Not lDownloadUpload Then Exit Do

            DoEvents
         Loop

         Call FRMMAIN.SM(Index, ANSWER_END_DOWNLOAD_FILE, True)

         Call FechaArquivo


      Case COMMAND_END_DOWNLOAD_FILE
         Call FechaArquivo


      Case COMMAND_START_UPLOAD_FILE

         cArquivo = Mid(cResto, 1, Len(cResto))

         SetAttr cArquivo, vbNormal
         Kill cArquivo

         If hFileUploadDownload <> 0 Then
            Close #hFileUploadDownload
         End If

         hFileUploadDownload = FreeFile
         Open cArquivo For Binary Access Write As #hFileUploadDownload

         lUploadDownload = True

         FRMMAIN.WinSockServer(Index).SendData ANSWER_READ_UPLOAD_FILE


      Case COMMAND_BINARY_UPLOAD_FILE

GravaUpload:
            If hFileUploadDownload <> 0 Then
               If Not bGravaTudo Then
                  cByteUploadDownload = cResto

               Else
                  cByteUploadDownload = cDados

               End If

               cBytesRecebidos = cBytesRecebidos + Len(cByteUploadDownload)

               Put #hFileUploadDownload, , cByteUploadDownload

               cResto = Empty
               cDados = Empty

               DoEvents
            End If


      Case COMMAND_END_UPLOAD_FILE


      Case Else
            If lUploadDownload Then
               bGravaTudo = True

               GoTo GravaUpload

            End If

      End Select
End Function
